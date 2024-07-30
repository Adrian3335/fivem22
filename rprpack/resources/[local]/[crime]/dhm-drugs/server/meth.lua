ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

methamount = 0
methbars = {}


RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(playerId, xPlayer)
	if methbars ~= nil then
		TriggerClientEvent('dhm-drugs:methcoords', -1, methbars)
	end
end)

RegisterServerEvent('dhm-meth:start')
AddEventHandler('dhm-meth:start', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

  local ephedrine = xPlayer.getInventoryItem('dhm-ephedrine').count
  local ammonia = xPlayer.getInventoryItem('dhm-ammonia').count
  local methkit = xPlayer.getInventoryItem('dhm-methkit').count
	
	if ephedrine >= 1 and ammonia >= 1 and methkit >= 1 then
			TriggerClientEvent('dhm-meth:startprod', _source)
	else
		TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.noreqitems)
	end
end)

RegisterServerEvent('dhm-meth:make')
AddEventHandler('dhm-meth:make', function(posx,posy,posz)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.getInventoryItem('dhm-methkit').count >= 1 then
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			TriggerClientEvent('dhm-meth:smoke',xPlayers[i],posx,posy,posz) 
		end
	else
		TriggerClientEvent('dhm-meth:stop', _source)
	end
end)

RegisterServerEvent('dhm-meth:finish')
AddEventHandler('dhm-meth:finish', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local methkit = xPlayer.getInventoryItem('dhm-methkit').count
	local ephedrine = xPlayer.getInventoryItem('dhm-ephedrine').count
  local ammonia = xPlayer.getInventoryItem('dhm-ammonia').count

	if ephedrine >= 1 and ammonia >= 1 and methkit >= 1 then
		xPlayer.removeInventoryItem('dhm-ephedrine', 1)
		xPlayer.removeInventoryItem('dhm-ammonia', 1)
		xPlayer.addInventoryItem('dhm-meth', 1)
	else
		TriggerClientEvent('dhm-meth:stop', _source)
	end
end)


Citizen.CreateThread(function()
	wait = 1000
	while true do
	  Citizen.Wait(wait)
	  if tablelength(methbars) < 12 then
		wait = 1000
		c = Config.MethChem.coords
		xp = math.random(-15, 15)
		xy = math.random(-15, 15)
		X, Y, Z = c.x + xp, c.y + xy, c.z
		wc = vector3(X, Y, Z)
  
		if CheckCoord(wc, methbars) then
		  id = genid(methbars)
		  methbars[id] = {coords = wc, busy = false}
		  TriggerClientEvent('dhm-drugs:methcoords', -1, methbars)
		end
	  else
		wait = 5000
	  end
	end
end)

ESX.RegisterServerCallback('dhm-drugs:pickchemm',function(source,cb,k)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if not methbars[k].busy then
    if xPlayer.canCarryItem('dhm-ephedrine', 1) then
      methbars[k].busy = true
      cb(true)
    else
      cb(false)
    end
  else
    cb(false)
  end
end)

RegisterServerEvent('dhm-drugs:pickchemm')
AddEventHandler('dhm-drugs:pickchemm',function(k)
	TriggerClientEvent('dhm-drugs:deletechemm', -1, k)
	methbars[k] = nil
end)