ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

heroinplants = {}
barrels = {}


RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(playerId, xPlayer)
	if barrels ~= nil then
    TriggerClientEvent('dhm-drugs:heroincoords', -1, barrels)
	end
end)

ESX.RegisterUsableItem("dhm-poppyseed", function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  local kordinates = GetEntityCoords(GetPlayerPed(source))
  
  if CheckCoord(kordinates, heroinplants) then
    if #(xPlayer.getCoords(true)-Config.PoppyPlantZone.coords) < Config.PoppyPlantZone.range then
    local id = genid(heroinplants)
        heroinplants[id] = {
          herointime = 20,
          coords = kordinates,
          heroinid = id,           
        }
        xPlayer.removeInventoryItem("dhm-poppyseed", 1)
        TriggerClientEvent('dhm-drugs:synchronizeheroin',-1,heroinplants)
        Citizen.Wait(100)
        TriggerClientEvent('dhm-drugs:spawnheroin',-1,heroinplants)
    else
      TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.dontgrow)
    end
  else
    TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.tooclose)
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    for k,v in pairs(heroinplants) do
      if k ~= nil then
        if v.herointime ~= nil then
          TriggerClientEvent('dhm-drugs:updatetimeheroin',-1,k,v.herointime)
          if v.herointime > 0 then
            v.herointime = v.herointime - 1
          end
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  wait = 1000
  while true do
    Citizen.Wait(wait)

    if tablelength(barrels) < 12 then
      wait = 1000
      c = Config.HeroinChem.coords
      xp = math.random(-15, 15)
      xy = math.random(-15, 15)
      X, Y, Z = c.x + xp, c.y + xy, c.z
      wc = vector3(X, Y, Z)

      if CheckCoord(wc, barrels) then
        id = genid(barrels)
        barrels[id] = {coords = wc, busy = false}
        TriggerClientEvent('dhm-drugs:heroincoords', -1, barrels)
      end
    else
      wait = 5000
    end
  end
end)

RegisterServerEvent('dhm-drugs:harvestheroin')
AddEventHandler('dhm-drugs:harvestheroin',function(heroindata)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local podamount = math.random(Config.MinPod, Config.MaxPod)
    xPlayer.addInventoryItem('dhm-poppypod', podamount)
    TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.poppycollected)
    TriggerClientEvent('dhm-drugs:harvesth', -1, heroindata)
    heroinplants[heroindata] = nil
end)

RegisterServerEvent('dhm-drugs:pickchem')
AddEventHandler('dhm-drugs:pickchem',function(k)
  barrels[k] = nil
	TriggerClientEvent('dhm-drugs:deletechemh', -1, k)
end)

ESX.RegisterServerCallback('dhm-drugs:pickchem',function(source,cb,k)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if not barrels[k].busy then
    if xPlayer.canCarryItem('dhm-fentanyl', 1) then
      barrels[k].busy = true
      cb(true)
    else
      cb(false)
    end
  else
    cb(false)
  end
end)