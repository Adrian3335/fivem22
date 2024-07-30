ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

info = {}
cocaplant = {}

RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(playerId, xPlayer)
	if cocaplant ~= nil then
		TriggerClientEvent('dhm-drugs:cocacoords', -1, cocaplant)
	end
end)

RegisterServerEvent('dhm-coke:table')
AddEventHandler('dhm-coke:table', function()
	local _source = source
    info[_source] = {
			acid = 0,
			mix = 0,
			vicodin = 0,           
    }
    TriggerClientEvent('dhm-coke:tableclient',_source, info)
end)

RegisterServerEvent('dhm-drugs:acidfunction')
AddEventHandler('dhm-drugs:acidfunction', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local coords = xPlayer.getCoords(true)

	local dist = #(coords - Config.AcidCanister.coords)
	if dist < 10 then
		if xPlayer.getInventoryItem('dhm-acid').count > 0 then
			xPlayer.removeInventoryItem('dhm-acid', 1)
			if info[_source].acid < 8 then
				info[_source].acid = info[_source].acid + 1
		  end
			TriggerClientEvent('dhm-coke:tableclient',_source, info)
		end
	end
end)

RegisterServerEvent('dhm-drugs:mixturefunction')
AddEventHandler('dhm-drugs:mixturefunction', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local coords = xPlayer.getCoords(true)

	local dist = #(coords - Config.Mixer.coords)
	if dist < 10 then
		if xPlayer.getInventoryItem('dhm-cocaleaf').count > 0 and xPlayer.getInventoryItem('dhm-vpowder').count > 0 then
			xPlayer.removeInventoryItem('dhm-cocaleaf', 1)
			xPlayer.removeInventoryItem('dhm-vpowder', 1)
			info[_source].mix = info[_source].mix + 1
			TriggerClientEvent('dhm-coke:tableclient',_source, info)
		end
	end
end)

RegisterServerEvent('dhm-coke:makecoke')
AddEventHandler('dhm-coke:makecoke', function(full)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local tbl = info[_source]

	if full then
		xPlayer.addInventoryItem('dhm-pcoke', tbl.mix)
	else
		xPlayer.addInventoryItem('dhm-pcoke', math.random(1,tbl.mix))
	end

	info[_source] = {
		acid = 0,
		mix = 0,
		vicodin = 0,           
	}
	TriggerClientEvent('dhm-coke:tableclient',_source, info)
end)

Citizen.CreateThread(function()
	wait = 1000
	while true do
	  Citizen.Wait(wait)
	  if tablelength(cocaplant) < 12 then
		wait = 1000
		c = Config.CocaPlants.coords
		xp = math.random(-15, 15)
		xy = math.random(-15, 15)
		X, Y, Z = c.x + xp, c.y + xy, c.z
		wc = vector3(X, Y, Z)
  
		if CheckCoord(wc, cocaplant) then
		  id = genid(cocaplant)
		  cocaplant[id] = {coords = wc, busy = false}
		  TriggerClientEvent('dhm-drugs:cocacoords', -1, cocaplant)
		end
	  else
		wait = 5000
	  end
	end
end)

ESX.RegisterServerCallback('dhm-drugs:pickcoca',function(source,cb,k)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if not cocaplant[k].busy then
    if xPlayer.canCarryItem('dhm-cocaleaf', 1) then
      cocaplant[k].busy = true
      cb(true)
    else
      cb(false)
    end
  else
    cb(false)
  end
end)

RegisterServerEvent('dhm-drugs:pickcoca')
AddEventHandler('dhm-drugs:pickcoca',function(k) 
	TriggerClientEvent('dhm-drugs:deletecoca', -1, k)
	cocaplant[k] = nil
end)