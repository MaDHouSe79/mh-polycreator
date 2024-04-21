--[[ ===================================================== ]]--
--[[           MH Poly Creator Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--
local isCreateMode = false 
local zoneName = nil
local blipName = nil

RegisterCommand(Config.Commands.createzone, function(source, args, rawCommand)
    local src = source
    if args[1] and tostring(args[1]) ~= nil then
        zoneName = tostring(args[1])
        if Config.Zones[zoneName] then
            Notify(src, String('zone_already_exsist'), "error")
        else
            if args[2] and tostring(args[2]) ~= nil then
                blipName = tostring(args[2])
            end
            TriggerClientEvent('mh-polycreator:client:ToggleCreateMode', src, true)
        end       
    else
        Notify(src, String('no_zone_name'), "error")
    end
end, true)

local function addZeroForLessThan10(number)
    if (number < 10) then return 0 .. number else return number end
end

local function generateDateTime()
    local dateTimeTable = os.date('*t')
    local dateTime = ""..dateTimeTable.year .."/".. addZeroForLessThan10(dateTimeTable.month) .."/"..  addZeroForLessThan10(dateTimeTable.day) .." Time: "..  addZeroForLessThan10(dateTimeTable.hour) ..":".. addZeroForLessThan10(dateTimeTable.min) ..":".. addZeroForLessThan10(dateTimeTable.sec)
    return dateTime
end

local function WriteZoneData(id, zones, street)
    local src = source
    local path = GetResourcePath(GetCurrentResourceName())
    path = path:gsub('//', '/')..'/configs/zones.lua'
    local file = io.open(path, 'a+')
    local createDate = generateDateTime()
    local sender = GetPlayerName(src)
    file:write(("-- %s,\n"):format(String('created_zone', zoneName, street)))
    file:write(("-- %s,\n"):format(String('created_by', sender.name, createDate)))
    file:write("Config.Zones['"..('%s'):format(zoneName).."'] = {\n")
    file:write("    ['Zone'] = {\n")
    file:write("        ['Shape'] = {\n")
    for k, v in pairs(zones) do
        for _, point in pairs(v.points) do
            file:write(("            vector2(%s, %s),\n"):format(point.x, point.y))
        end
        file:write("        },\n")
        file:write(("        name = '%s',\n"):format("zone_"..zoneName:lower()))
        file:write(("        minZ = %s,\n"):format(v.minZ - 1))
        file:write(("        maxZ = %s,\n"):format(v.maxZ + 2))
        file:write(("        debugPoly = %s,\n"):format(false))
        file:write("    },\n")
    end
    file:write("}\n")
    file:close()
    Notify(src, String('zone_saved'), "success")
    TriggerClientEvent('mh-polycreator:client:ToggleCreateMode', src, false)
end

RegisterNetEvent('mh-polycreator:server:writezonefile', function(zones, street)
    local src = source
    WriteZoneData(src, zones, street)
end)
