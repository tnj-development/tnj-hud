local QBCore = exports['qb-core']:GetCoreObject()

function Notify(text, type)
	if Config.Notify =='ox' then
	    lib.notify({title = text, type = type})
    elseif Config.Notify == 'qb' then
        QBCore.Functions.Notify(text, type)
	elseif Config.Notify == 'ps' then
        exports['ps-ui']:Notify(text, type, 3000)
    else
       	print"^1 SCRIPT ERROR: ps-hud Invalid Option For Config.Notify"
    end
end

RegisterNetEvent('ps-hud:client:notify', function(text, type)
    Notify(text, type)
end)

function isDead()
    if Config.Framework == 'qbx' then
        local isDead = exports.qbx_medical:IsDead()
        local inLaststand = exports.qbx_medical:IsLaststand()
        if isDead or inLaststand then return true end
        return false
    elseif Config.Framework == 'qb' then
        local isDead = QBCore.Functions.GetPlayerData().metadata.isdead
        local inLaststand = QBCore.Functions.GetPlayerData().metadata.inlaststand
        if isDead or inLaststand then return true end
        return false
    end
    return false
end

function fuelCheck(veh)
    if not veh then return false end
    if GetResourceState('ox_fuel') == 'started' then
        local fuel = Entity(veh).state.fuel
        return math.floor(fuel)
    else
        local fuel = exports[Config.FuelScript]:GetFuel(veh)
        return math.floor(fuel)
    end
end

function getHarness() 
  if GetResourceState('qbx_seatbelt') == 'started' then
      local harness = exports.qbx_seatbelt:HasHarness() 
      return harness
  elseif Framework == 'qb' then
      local harness = exports['qb-smallresources']:HasHarness()
      return harness
  end
end

function getData(type)
    if Config.Framework == 'qbx' then
        return QBX.PlayerData.metadata[type]
    elseif Config.Framework == 'qb' then
        return QBCore.Functions.GetPlayerData().metadata[type]
    end
end
