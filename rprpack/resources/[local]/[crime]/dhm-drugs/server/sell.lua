ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("reputation", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT reputation FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		if result[1] ~= nil then
			TriggerClientEvent('dhm-drugs:notif', xPlayer.source, Config.Translations.reputation..(result[1].reputation/2)..'%')
		end
	end)
end, false)

RegisterServerEvent('dhm-drugs:selldrug')
AddEventHandler('dhm-drugs:selldrug', function(item, zone)
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem(item).count
	local amount = 0
	local cops = ESX.GetExtendedPlayers('job', 'police')
	local copbonus = 0
	local points = 0
	local finalprice = 0
	local rep = 0
	local price = 0

	if #cops > 0 and #cops < 6 then
		copbonus = 25
	elseif #cops > 5 then
		copbonus = 35
	end

	if quantity > 0 then
		if quantity > 5 then
			amount = math.random(1,5)
		else
			amount = math.random(1,quantity)
		end
		price = (Config.Price[item] + copbonus) * amount
		if zone then
			price = (price*Config.HotSpotBonus) + price
		end

		MySQL.Async.fetchAll('SELECT reputation FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			if result[1] ~= nil then
				if result[1].reputation > 200 then
					rep = 100
				else
					rep = result[1].reputation / 2
				end
				points = math.floor((rep / 10)+0.5)
				repbonus = (points*0.05)
				finalprice = math.floor((price*repbonus+price)+0.5)

				xPlayer.removeInventoryItem(item, amount)
				xPlayer.addAccountMoney(Config.MoneyAccount, finalprice)
				if rep == 100 then
					TriggerClientEvent('dhm-drugs:notif', xPlayer.source, Config.Translations.sold..finalprice..'$')
					TriggerClientEvent('dhm-drugs:notif', xPlayer.source, Config.Translations.reputation..rep..'%')
				else
					TriggerClientEvent('dhm-drugs:notif', xPlayer.source, Config.Translations.sold..finalprice..'$')
					TriggerClientEvent('dhm-drugs:notif', xPlayer.source, Config.Translations.reputation..'+0.5%')
				end

				if rep < 100 then
					MySQL.Async.execute('UPDATE users SET reputation = @reputation WHERE identifier = @identifier', {
						['@identifier'] = xPlayer.identifier,
						['@reputation'] = rep * 2 + 1
					}, function(rowsChanged)
					end)
				elseif rep > 100 then
					MySQL.Async.execute('UPDATE users SET reputation = @reputation WHERE identifier = @identifier', {
						['@identifier'] = xPlayer.identifier,
						['@reputation'] = 200
					}, function(rowsChanged)
					end)
				end
			end
		end)
	end
end)

RegisterServerEvent('dhm-drugs:removerep')
AddEventHandler('dhm-drugs:removerep', function(player)
	local dealer = ESX.GetPlayerFromId(player)

	MySQL.Async.fetchAll('SELECT reputation FROM users WHERE identifier = @identifier', {
		['@identifier'] = dealer.identifier
	}, function(result)
		if result[1] ~= nil then
			MySQL.Async.execute('UPDATE users SET reputation = @reputation WHERE identifier = @identifier', {
				['@identifier'] = dealer.identifier,
				['@reputation'] = 0
			}, function(rowsChanged)
			end)
		end
	end)
end)

--TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))
--TriggerServerEvent('dhm-drugs:removerep', GetPlayerServerId(closestPlayer))

RegisterServerEvent('dhm-drugs:playerinventorydata')
AddEventHandler('dhm-drugs:playerinventorydata', function()
	local _source = source
  	local xPlayer  = ESX.GetPlayerFromId(_source)
  	TriggerClientEvent('dhm-drugs:clientinventory', _source, xPlayer.getInventoryItem('dhm-pcoke').count, xPlayer.getInventoryItem('dhm-pmeth').count, xPlayer.getInventoryItem('dhm-weedjoint').count, xPlayer.getInventoryItem('dhm-heroin').count)
end)
