--[[ ===================================================== ]]--
--[[         QBCore Poly Creator Script by MaDHouSe        ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()
local isCreateMode = false 
local zoneName = nil
local blipName = nil

QBCore.Commands.Add(Config.Commands.createzone, Lang:t('data.create_zone'), {{name='name', help=Lang:t('data.type_zone_name')}}, true, function(source, args)
    local src = source
	if args[1] and tostring(args[1]) ~= nil then
        zoneName = tostring(args[1])
        if Config.Zones[zoneName] then
            TriggerClientEvent('QBCore:Notify', src, Lang:t('notify.zone_already_exsist'), "error")
        else
            if args[2] and tostring(args[2]) ~= nil then
                blipName = tostring(args[2])
            end
            TriggerClientEvent('mh-polycreator:client:ToggleCreateMode', src, true)
        end       
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('notify.no_zone_name'), "error")
    end
end, 'admin')

local function addZeroForLessThan10(number)
    if(number < 10) then return 0 .. number else return number end
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
    local sender = QBCore.Functions.GetPlayer(src).PlayerData
    file:write(("-- %s,\n"):format(Lang:t('data.created_zone', {zone = zoneName, street = street})))
    file:write(("-- %s,\n"):format(Lang:t('data.created_by', {name = sender.name, date = createDate})))
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
    TriggerClientEvent('QBCore:Notify', src, Lang:t('notify.zone_saved'), "success")
    TriggerClientEvent('mh-polycreator:client:ToggleCreateMode', src, false)
end

RegisterNetEvent('mh-polycreator:server:writezonefile', function(zones, street)
    local src = source
    WriteZoneData(src, zones, street)
end)
