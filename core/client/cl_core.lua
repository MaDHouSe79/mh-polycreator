--[[ ===================================================== ]]--
--[[           MH Poly Creator Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--
Framework = nil
TriggerCallback = nil
OnPlayerLoaded = nil
OnPlayerUnload = nil
PlayerData = {}

if GetResourceState("es_extended") ~= 'missing' then
    Framework = exports['es_extended']:getSharedObject()
    TriggerCallback = Framework.TriggerServerCallback
    OnPlayerLoaded = 'esx:playerLoaded'
    OnPlayerUnload = 'esx:playerUnLoaded'
    function GetPlayerData()
        TriggerCallback('esx:getPlayerData', function(data)
            PlayerData = data
        end)
        return PlayerData
    end

elseif GetResourceState("qb-core") ~= 'missing' then
    Framework = exports['qb-core']:GetCoreObject()
    TriggerCallback = Framework.Functions.TriggerCallback
    OnPlayerLoaded = 'QBCore:Client:OnPlayerLoaded'
    OnPlayerUnload = 'QBCore:Client:OnPlayerUnload'
    function GetPlayerData()
        return Framework.Functions.GetPlayerData()
    end
end

function Notify(message, type, length)
    lib.notify({title = Config.NotifyTitle, description = message, type = type})
end