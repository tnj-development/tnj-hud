local QBCore = exports['qb-core']:GetCoreObject()

function Notify(source, text, type)
    local src = source
    if Config.Notify == 'qb' then
        TriggerClientEvent("QBCore:Notify", src, text, type)
    elseif Config.Notify == 'ox' then
        lib.notify(src, { title = text, type = type})
    elseif Config.Notify == 'ps' then
        TriggerClientEvent('ps-hud:server:Notify', src, text, type)
    else
        print"^1 SCRIPT ERROR: ps-hud Invalid Option For Config.Notify"
    end
end

function getPlayer(source)
    if Config.Framework == 'qbx' then
        local Player = exports.qbx_core:GetPlayer(source)
        return Player
    elseif Config.Framework == 'qb' then
        local Player = QBCore.Functions.GetPlayer(source)
        return Player
    end
end

