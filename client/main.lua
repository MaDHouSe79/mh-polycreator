--[[ ===================================================== ]]--
--[[           MH Poly Creator Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--
local ViewEnabled = false
local FreeAim = false
local vectors = {}
local zones = {}
local height = 2.0
local tmpPoly = nil

local function GetStreetName(entity)
    return GetStreetNameFromHashKey(GetStreetNameAtCoord(GetEntityCoords(entity).x, GetEntityCoords(entity).y, GetEntityCoords(entity).z))
end

local function RotationToDirection(rotation)
    local adjustedRotation = {x = (math.pi / 180) * rotation.x, y = (math.pi / 180) * rotation.y, z = (math.pi / 180) * rotation.z}
    local direction = {x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), z = math.sin(adjustedRotation.x)}
    return direction
end

local function RayCastGamePlayCamera(distance)
    local currentRenderingCam = false
    if not IsGameplayCamRendering() then currentRenderingCam = GetRenderingCam() end
    local cameraRotation = not currentRenderingCam and GetGameplayCamRot() or GetCamRot(currentRenderingCam, 2)
    local cameraCoord = not currentRenderingCam and GetGameplayCamCoord() or GetCamCoord(currentRenderingCam)
    local direction = RotationToDirection(cameraRotation)
    local destination =	{x = cameraCoord.x + direction.x * distance, y = cameraCoord.y + direction.y * distance, z = cameraCoord.z + direction.z * distance}
    local _, b, c, _, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
    return b, c, e
end

local function CreatePolyZone(coords)
    local zone = PolyZone:Create(vectors, {name = "zone", minZ = coords.z - 1, maxZ = coords.z + height, debugPoly = true})
    zones[#zones + 1] = zone
    vectors = {}
    if tmpPoly ~= nil then tmpPoly:destroy() end
    local street = GetStreetName(PlayerPedId())
    TriggerServerEvent('mh-polycreator:server:writezonefile', zones, street)
    zones = {}
    zone:destroy()
end

local function RemovePolyPoint(coords)
    local refreshed = {}
    for i = 1, #vectors do
        local distance = #(vector3(coords.x, coords.y, 0.0) - vector3(vectors[i].x, vectors[i].y, 0.0))
        if distance <= 0.5 then
            if vectors[i] then table.remove(vectors, i) end
            for i = 1, #vectors do
                refreshed[#refreshed + 1] = vectors[i]
            end
            if tmpPoly ~= nil then tmpPoly:destroy() end
            Wait(100)
            tmpPoly = PolyZone:Create(refreshed, {name = "zone", minZ = coords.z - 1, maxZ = coords.z + height, debugPoly = true})
        end
    end
end

local function DrawALine(position, coords, color)
    DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
end

local function RunViewThread()
    ViewEnabled = true
    Citizen.CreateThread(function()
        while ViewEnabled do
            Citizen.Wait(0)
            if FreeAim then
                local color = {r = 255, g = 255, b = 255, a = 200}
                local position = GetEntityCoords(PlayerPedId())
                local hit, coords, entity = RayCastGamePlayCamera(100.0)
                if hit then    
                    if IsControlJustReleased(0, 38) then -- E To Create point
                        vectors[#vectors + 1] = vector2(coords.x, coords.y)
                        if tmpPoly ~= nil then tmpPoly:destroy() end
                        Wait(100)
                        tmpPoly = PolyZone:Create(vectors, {name = "zone", minZ = coords.z - 1, maxZ = coords.z + height, debugPoly = true})
                    elseif IsControlJustReleased(0, 23) then -- F Delete Poly at coord
                        RemovePolyPoint(coords)
                    elseif IsControlJustReleased(0, 47) then -- G Save Poly
                        CreatePolyZone(coords)
                    end
                end
                DrawALine(position, coords, color)
            end
        end
    end)
end

AddEventHandler('playerSpawned', function()
    RunViewThread()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        RunViewThread()
    end
end)

RegisterNetEvent('mh-polycreator:client:ToggleCreateMode')
AddEventHandler('mh-polycreator:client:ToggleCreateMode', function(state)
    FreeAim = state
    vectors = {}
    zones = {}
    if tmpPoly ~= nil then tmpPoly:destroy() end
end)
