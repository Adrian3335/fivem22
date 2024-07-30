ESX = exports["es_extended"]:getSharedObject()

TriggerEvent('esx_society:registerSociety', 'ambulance', 'Ambulance', 'society_ambulance', 'society_ambulance', 'society_ambulance', {type = 'public'})

local date = os.date('*t')
if date.month < 10 then date.month = '0' .. tostring(date.month) end
if date.day < 10 then date.day = '0' .. tostring(date.day) end
if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
if date.min < 10 then date.min = '0' .. tostring(date.min) end
if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' o godz: ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')

RegisterServerEvent('hypex_ambulancejob:hypexrevive')
AddEventHandler('hypex_ambulancejob:hypexrevive', function(target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		TriggerClientEvent('hypex_ambulancejob:hypexrevive', target)
end)

RegisterServerEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(target, type)
	TriggerClientEvent('esx_ambulancejob:heal', target, type)
end)

ESX.RegisterServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer ~= nil then
		if xPlayer.getAccount('money').money > 0 then
			xPlayer.setAccountMoney('money', 0)
		end

		if xPlayer.getAccount('black_money').money > 0 then
			xPlayer.setAccountMoney('black_money', 0)
		end

		for i=1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].count > 0 then
				if xPlayer.inventory[i].type ~= 'sim' then
					xPlayer.removeInventoryItem(xPlayer.inventory[i].name, xPlayer.inventory[i].count)
				end
			end
		end
	end

	cb()
end)

if Config.EarlyRespawn and Config.EarlyRespawnFine then
	ESX.RegisterServerCallback('esx_ambulancejob:checkBalance', function(source, cb)

		local xPlayer = ESX.GetPlayerFromId(source)
		local bankBalance = xPlayer.getAccount('bank').money
		local finePayable = false

		if bankBalance >= Config.EarlyRespawnFineAmount then
			finePayable = true
		else
			finePayable = false
		end

		cb(finePayable)
	end)

	ESX.RegisterServerCallback('esx_ambulancejob:payFine', function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('respawn_fine', Config.EarlyRespawnFineAmount))
		xPlayer.removeAccountMoney('bank', Config.EarlyRespawnFineAmount)
		cb()
	end)
end

ESX.RegisterServerCallback('esx_ambulancejob:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local inventoryItem = xPlayer.getInventoryItem(item)
        if inventoryItem then
            local qtty = inventoryItem.count
            cb(qtty)
        else
            print("Przedmiot jest nullem lub nie istnieje: ", item)
        end
    else
        print("xPlayer jest nullem")
    end
end)




RegisterServerEvent('esx_ambulancejob:removeItem')
AddEventHandler('esx_ambulancejob:removeItem', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem(item, 1)
	if item == 'bandage' then
		TriggerClientEvent('esx:showNotification', _source, _U('used_bandage'))
	elseif item == 'medikit' then
		TriggerClientEvent('esx:showNotification', _source, _U('used_medikit'))
	end
end)

RegisterServerEvent('esx_ambulancejob:giveItem')
AddEventHandler('esx_ambulancejob:giveItem', function(item, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if item == 'medikit' or item == 'bandage' or item == 'gps' or item == 'bodycam' or item == 'radio' then
		local limit = xPlayer.getInventoryItem(item).limit
		
		local delta = 1
		local qtty = xPlayer.getInventoryItem(item).count
		if limit ~= -1 then
			delta = limit - qtty
		end
		if qtty < limit then
			xPlayer.addInventoryItem(item, count ~= nil and count or delta)
		else
			TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
		end
	end
end)

RegisterCommand('revive', function(source, args, user)
	if source == 0 then
		TriggerClientEvent('hypex_ambulancejob:hypexrevive', tonumber(args[1]), true)
	else
		local xPlayer = ESX.GetPlayerFromId(source)
		if (xPlayer.group == 'best' or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'zarzad' or xPlayer.group == 'superadmin2' or xPlayer.group == 'juniormoderator' or xPlayer.group == 'junioradmin'or xPlayer.group == 'moderator' or xPlayer.group == 'support' or xPlayer.group == 'trialsupport') then
			if args[1] ~= nil then
				if GetPlayerName(tonumber(args[1])) ~= nil then
					-- exports.pNotify:SendNotification({text = " ożywiony przez administratora "..GetPlayerName(xPlayer.source).."!", timeout = 3000})
					TriggerClientEvent('hypex_ambulancejob:hypexrevive', tonumber(args[1]), true)
				end
			else
				-- exports.pNotify:SendNotification({text = "Zostałeś ożywiony przez administratora "..GetPlayerName(xPlayer.source).."!", timeout = 3000})
				TriggerClientEvent('hypex_ambulancejob:hypexrevive', source, true)
			end
		else
			xPlayer.showNotification('Nie posiadasz permisji')
		end
	end
end, false)

ESX.RegisterUsableItem('apteczka', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('apteczka', 1)
	TriggerClientEvent('esx_ambulancejob:healitem', _source, 'bmedium')
	TriggerClientEvent('esx:showNotification', _source, _U('used_medikit'))
end)

ESX.RegisterUsableItem('bandaz', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_ambulancejob:healitem', _source, 'bsmall')
	xPlayer.removeInventoryItem('bandaz', 1)
end)

ESX.RegisterServerCallback('esx_ambulancejob:getDeathStatus', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.scalar('SELECT is_dead FROM users WHERE identifier = ?', {xPlayer.identifier}, function(isDead)
		cb(isDead)
	end)
end)

RegisterServerEvent('esx_ambulancejob:setDeathStatus')
AddEventHandler('esx_ambulancejob:setDeathStatus', function(isDead)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if type(isDead) == 'boolean' then
		MySQL.scalar('SELECT is_dead FROM users WHERE identifier = ?', {xPlayer.identifier}, function(isDead)
	end)
end
end)

RegisterServerEvent('esx:ambulancejob:deathspawn')
AddEventHandler('esx:ambulancejob:deathspawn', function()
	local _source    = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll('SELECT isDead FROM users WHERE identifier= ?', {xPlayer.identifier}, function(result)
		if result[1] ~= nil then
			if result[1].isDead == 1 then
				TriggerClientEvent('esx_ambulancejob:requestDeath', _source)
			end
		end
	end)
end)

RegisterNetEvent('esx:onPlayerSpawn')
AddEventHandler('esx:onPlayerSpawn', function()
	local playerId = source
	local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer ~= nil then
		MySQL.scalar('SELECT isDead FROM users WHERE identifier = ?', {xPlayer.identifier}, function(isDead)
            if not isDead or isDead == 0 then 
                MySQL.Async.fetchAll("SELECT health, armour FROM users WHERE identifier = ?", {xPlayer.identifier}, function(data)
                    if data[1].health ~= nil and data[1].armour ~= nil then
                        TriggerClientEvent('esx_healthnarmour:set', playerId, data[1].health, data[1].armour)
                    end
                end)
            else
                TriggerClientEvent('esx_healthnarmour:set', playerId, 0, 0)
            end
        end)
    end
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
  local xPlayer = ESX.GetPlayerFromId(playerId)
  
  if xPlayer ~= nil then
    local health = GetEntityHealth(GetPlayerPed(xPlayer.source))
    local armour = GetPedArmour(GetPlayerPed(xPlayer.source))
	MySQL.Async.execute('UPDATE users SET health = @health, armour = @armour WHERE identifier = ?', {
		['@health'] = health,
		['@armour'] = armour,
		{xPlayer.identifier}})
  	end
end)