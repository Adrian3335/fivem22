local mechanic = 0

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'mechanic', Config.MaxInService)
end

RegisterNetEvent("need_mechanics:loadStash", function()
    local _source = source
    exports.ox_inventory:RegisterStash(ESX.GetPlayerFromId(_source).job.name, ESX.GetPlayerFromId(_source).job.label, 50, 100000, false, false, vec3(836.08905029297, -819.11492919922, 26.332595825195))
end)

TriggerEvent('esx_society:registerSociety', 'mechanic', 'mechanic', 'society_mechanic', 'society_mechanic', 'society_mechanic', {type = 'public'})

RegisterServerEvent('dbl_mechanicjob:serverTrigger', function(name)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
 
	if not xPlayer then return end
	if xPlayer.job.name ~= 'mechanic' then 
 
	   -- return  DropPlayer(source, 'Wypierdalaj smieciu jebany')
	   return exports["dbl_notify"]:notify(source, "warning", "Uwaga!", "Wypierdalasz z serwera!")
	end
 
	functions[name](xPlayer)
 
 end)
 
functions = {
	toolwytrych = function(xPlayer)
	   if xPlayer.getInventoryItem('toolwytrych').count >= 5 then
		  exports["dbl_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz miejsca na wiecej części.")
	   else
		  xPlayer.addInventoryItem('toolwytrych', '5')
	   end
	end,

	sponge = function(xPlayer)
		if xPlayer.getInventoryItem('sponge').count >= 5 then
		   exports["dbl_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz miejsca na wody.")
		else
		   xPlayer.addInventoryItem('sponge', '5')
		end
	 end,

	toolfixkit = function(xPlayer)
		if xPlayer.getInventoryItem('toolfixkit').count >= 5 then
		   exports["dbl_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz miejsca na wiecej części.")
		else
		   xPlayer.addInventoryItem('toolfixkit', '5')
		end
	 end,

	 toolcarokit = function(xPlayer)
		if xPlayer.getInventoryItem('toolcarokit').count >= 5 then
		   exports["dbl_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz miejsca na wiecej części.")
		else
		   xPlayer.addInventoryItem('toolcarokit', '5')
		end
	 end,

	 lockpick = function(xPlayer)
		if xPlayer.getInventoryItem('lockpick').count >= 5 then
		   exports["dbl_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz miejsca na wiecej części.")
		else
		   xPlayer.addInventoryItem('lockpick', '1')
		   xPlayer.removeInventoryItem('toolwytrych', '1')
		end
	 end,

	 fixkit = function(xPlayer)
		if xPlayer.getInventoryItem('fixkit').count >= 5 then
		   exports["dbl_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz miejsca na wiecej części.")
		else
		   xPlayer.addInventoryItem('fixkit', '1')
		   xPlayer.removeInventoryItem('toolfixkit', '1')
		end
	 end,

	 carokit = function(xPlayer)
		if xPlayer.getInventoryItem('carokit').count >= 5 then
		   exports["dbl_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz miejsca na wiecej części.")
		else
		   xPlayer.addInventoryItem('carokit', '1')
		   xPlayer.removeInventoryItem('toolcarokit', '1')
		end
	 end,
 
 
	sprzedaj = function(xPlayer)
	   if xPlayer.getInventoryItem('stol').count >= 10 then
		  xPlayer.removeInventoryItem('stol', '10')
		  xPlayer.addInventoryItem('paragonepicdesk')
		  dajpieniadze()
		  dajpieniadzebossmenu()
	   else
		  exports["dbl_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz gotowych blatow.")
	   end
	end 
}



RegisterNetEvent('esx_mechanicjob:giveweapon')
AddEventHandler('esx_mechanicjob:giveweapon', function(weaponName)

	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, false, false, 250, 1)
end)

ESX.RegisterUsableItem('blowpipe', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('blowpipe', 1)

	TriggerClientEvent('esx_mechanicjob:onHijack', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_blowtorch'))
end)

ESX.RegisterUsableItem('fixkit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fixkit', 1)

	TriggerClientEvent('esx_mechanicjob:onFixkit', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('you_used_repair_kit'))
end)

RegisterNetEvent("need_mechanics:RemoveFixKit", function()
	local _source = source
	exports.ox_inventory:RemoveItem(_source, 'fixkit', 1)
end)


RegisterNetEvent("need_mechanics:onWash", function()
	local _source = source
	exports.ox_inventory:RemoveItem(_source, 'sponge', 1)
end)

RegisterNetEvent("need_mechanics:RemoveCaroKit", function()
	local _source = source
	exports.ox_inventory:RemoveItem(_source, 'carokit', 1)
end)

RegisterServerEvent('esx_mechanicjob:getStockItem')
AddEventHandler('esx_mechanicjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		if inventory ~= nil then
			local item = inventory.getItem(itemName)
			local sourceItem = xPlayer.getInventoryItem(itemName)
			
			if count > 0 and item.count >= count then
				if xPlayer.canCarryItem(itemName, count) then
					inventory.removeItem(itemName, count)
					xPlayer.addInventoryItem(itemName, count)	
						TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn', count, item.label))
				else
					TriggerClientEvent('esx:showNotification', xPlayer.source, _U('player_cannot_hold'))
				end
			else
				TriggerClientEvent('esx:showNotification', _source, "Nieprawidłowa ilość")
			end
		end
	end)
end)

ESX.RegisterServerCallback('esx_mechanicjob:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		if inventory ~= nil then
			cb(inventory.items)
		end
	end)
end)

RegisterServerEvent('esx_mechanicjob:putStockItems')
AddEventHandler('esx_mechanicjob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mechanic', function(inventory)
		if inventory ~= nil then
			local item = inventory.getItem(itemName)
			local playerItemCount = xPlayer.getInventoryItem(itemName).count

			if item.count >= 0 and count <= playerItemCount then
				xPlayer.removeInventoryItem(itemName, count)
				inventory.addItem(itemName, count)
			else
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
			end

			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, item.label))
		end
	end)
end)

ESX.RegisterServerCallback('esx_mechanicjob:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({items = items})
end)


ESX.RegisterUsableItem('fixkit', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fixkit', 1)

	TriggerClientEvent('esx_repairkit:onUse', _source)
	TriggerClientEvent('esx:showNotification', _source, ('Uzyles zestawu naprawczego'))
end)





function sendToDiscord (name,message,color)
	local embeds = {
		{
			["description"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
			["text"]= "trp_logs",
		   },
		}
	}
	if message == nil or message == '' then return FALSE end
	
	
	
end