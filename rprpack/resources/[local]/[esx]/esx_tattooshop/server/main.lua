

AddEventHandler('esx:playerLoaded',function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil then
		MySQL.Async.fetchAll('SELECT tattoos FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier,
		}, function(status)
			if status[1] ~= nil then
				if status[1].tattoos ~= nil and status[1].tattoos ~= '' then
					TriggerClientEvent('esx_tattooshop:setTattoos', _source, json.decode(status[1].tattoos))
				else
					TriggerClientEvent('esx_tattooshop:setTattoos', _source, {})
				end			
			else
				TriggerClientEvent('esx_tattooshop:setTattoos', _source, {})
			end
		end)		
	end
end)

ESX.RegisterServerCallback('esx_tattooshop:getTattoos', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil then
		MySQL.Async.fetchAll('SELECT tattoos FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			if result[1].tattoos ~= nil and result[1].tattoos ~= '' then
				cb(json.decode(result[1].tattoos))
			else
				cb({})
			end
		end)	
	end
end)

ESX.RegisterServerCallback('esx_tattooshop:requestPlayerTattoos', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		MySQL.Async.fetchAll('SELECT tattoos FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			if result[1].tattoos ~= nil and result[1].tattoos ~= '' then
				cb(json.decode(result[1].tattoos))		
			else
				cb({})
			end
		end)
	else
		cb({})
	end
end)

ESX.RegisterServerCallback('esx_tattooshop:purchaseTattoo', function(source, cb, tattooList, price, tattoo)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)

		tattooList[#tattooList + 1] = tattoo

		MySQL.Async.execute('UPDATE users SET tattoos = @tattoos WHERE identifier = @identifier', {
			['@tattoos'] = json.encode(tattooList),
			['@identifier'] = xPlayer.identifier
		}, function()
			-- xPlayer.setCharacter('tattoos', json.encode(tattoosList))
			-- TriggerClientEvent('esx:showNotification', source, _U('bought_tattoo', ESX.Math.GroupDigits(price)))
			xPlayer.showNotification("Zakupiłeś tatuaż za " ..ESX.Math.GroupDigits(price).."$")
			cb(true)		
		end)
	else
		local missingMoney = price - xPlayer.getMoney()
		-- TriggerClientEvent('esx:showNotification', source, _U('not_enough_money', ESX.Math.GroupDigits(missingMoney)))
		xPlayer.showNotification("Nie posiadasz wystarczającej ilości pieniędzy, brakuje ci " ..ESX.Math.GroupDigits(missingMoney).."$")
		cb(false)
	end
end)

local carrying = {}
local carried = {}

RegisterNetEvent("CarryPeople:sync")
AddEventHandler("CarryPeople:sync", function(targetSrc)
	local source = source
	local sourcePed = GetPlayerPed(source)
   	local sourceCoords = GetEntityCoords(sourcePed)
	local targetPed = GetPlayerPed(targetSrc)
	local targetCoords = GetEntityCoords(targetPed)
	if #(sourceCoords - targetCoords) <= 3.0 then 
		TriggerClientEvent("CarryPeople:syncTarget", targetSrc, source)
		carrying[source] = targetSrc
		carried[targetSrc] = source
	end
end)

RegisterNetEvent("CarryPeople:stop")
AddEventHandler("CarryPeople:stop", function(targetSrc)
	local source = source
	if carrying[source] then
		TriggerClientEvent("CarryPeople:cl_stop", targetSrc)
		carrying[source] = nil
		carried[targetSrc] = nil
	elseif carried[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carried[source])			
		carrying[carried[source]] = nil
		carried[source] = nil
	end
end)

AddEventHandler('playerDropped', function(reason)
	local source = source
	if carrying[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carrying[source])
		carried[carrying[source]] = nil
		carrying[source] = nil
	end
	if carried[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carried[source])
		carrying[carried[source]] = nil
		carried[source] = nil
	end
end)
