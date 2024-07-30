ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_property:getPlayerDressing', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerEvent('esx_datastore:getDataStore', 'property', tostring(xPlayer.uid), function(store)
		local count = store.count('dressing')
		local labels = {}
		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end
		cb(labels)
	end)
end)





ESX.RegisterServerCallback('esx_property:getPlayerOutfit', function(source, cb, num)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerEvent('esx_datastore:getDataStore', 'property', tostring(xPlayer.uid), function(store)
		local outfit = store.get('dressing', num)
		cb(outfit.skin)
	end)
end)

RegisterServerEvent('esx_property:removeOutfit')
AddEventHandler('esx_property:removeOutfit', function(label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerEvent('esx_datastore:getDataStore', 'property', tostring(xPlayer.uid), function(store)
		local dressing = store.get('dressing') or {}
		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

RegisterServerEvent('esx_clotheshop:saveOutfit')
AddEventHandler('esx_clotheshop:saveOutfit', function(label, skin)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerEvent('esx_datastore:getDataStore', 'property', tostring(xPlayer.uid), function(store)
		if xPlayer.getDigit() == 1 then
			local dressing = store.get('dressing')
			if dressing == nil then
				dressing = {}
			end
			if #dressing < 20 then
				table.insert(dressing, {
					label = label,
					skin  = skin
				})
				store.set('dressing', dressing)
			else
				xPlayer.showNotification('~r~W szafie nie ma miejsc na więcej ubrań!')		
			end
		else
			local dressing = store.get2('dressing')
			if dressing == nil then
				dressing = {}
			end
			if #dressing < 20 then
				table.insert(dressing, {
					label = label,
					skin  = skin
				})
				store.set2('dressing', dressing)
			else
				xPlayer.showNotification('~r~W szafie nie ma miejsc na więcej ubrań!')		
			end
		end
	end)
end)

ESX.RegisterServerCallback('esx_clotheshop:buyClothes', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= Config.Price or xPlayer.getAccount('bank').money >= Config.Price then
		if xPlayer.getMoney() >= Config.Price then
			xPlayer.removeMoney(Config.Price)
			TriggerClientEvent('esx:showNotification', _source, _U('you_paid', Config.Price))
			cb(true)
		elseif xPlayer.getAccount('bank').money >= Config.Price then
			xPlayer.removeAccountMoney('bank', Config.Price)
			TriggerClientEvent('esx:showNotification', _source, _U('you_paid', Config.Price))
			cb(true)
		end
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_clotheshop:checkPropertyDataStore', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local foundStore = false
	TriggerEvent('esx_datastore:getDataStore', 'property', tostring(xPlayer.uid), function(store)
		foundStore = true
	end)
	cb(foundStore)
end)



