--[[ ===================================================== ]]--
--[[           MH Poly Creator Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--
Framework = nil

if GetResourceState("es_extended") ~= 'missing' then
    Framework = exports['es_extended']:getSharedObject()

    function GetPlayer(source)
        return Framework.GetPlayerFromId(source)
    end

    function Notify(src, message, type, length)
        TriggerClientEvent("mh-fuel:client:notify", src, message, type, length)
    end

elseif GetResourceState("qb-core") ~= 'missing' then
    Framework = exports['qb-core']:GetCoreObject()

    function GetPlayer(source)
        return Framework.Functions.GetPlayer(source)
    end

    function Notify(src, message, type, length)
        TriggerClientEvent("mh-fuel:client:notify", src, message, type, length)
    end
end