ESX = exports["es_extended"]:getSharedObject()

local onSamarka = {}


ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)

ESX.RegisterUsableItem('donut', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('donut', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 440000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)

ESX.RegisterUsableItem('meth', function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('meth', 1)
	TriggerClientEvent('need:wciagnijmete', source, 'big')
	TriggerClientEvent('esx:showNotification', source, "~y~Wciągnałeś mete")
end)

ESX.RegisterUsableItem('uwucafe_zestaw', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('uwucafe_zestaw', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1800000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)


ESX.RegisterUsableItem('clip_ammosmg', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('clip_ammosmg', 1)
	xPlayer.addInventoryItem('ammo-45', 50)
end)

ESX.RegisterUsableItem('clip_ammo-9', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('clip_ammo-9', 1)
	xPlayer.addInventoryItem('ammo-9', 50)
end)


ESX.RegisterUsableItem('kamizelka', function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('kamizelka', 1)
	TriggerClientEvent('need:zalozKamizelke', source, 'big')
	TriggerClientEvent('esx:showNotification', source, "~y~Założono dużą kamizelkę")
end)

ESX.RegisterUsableItem('kebabkurczak', function(source)
    TriggerClientEvent('esx_kebab:jedzenie', source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('kebabkurczak', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)

ESX.RegisterUsableItem('hotdog', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hotdog', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)


ESX.RegisterUsableItem('fries', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fries', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)

ESX.RegisterUsableItem('capricciosa', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('capricciosa', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)

ESX.RegisterUsableItem('pizza', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)

ESX.RegisterUsableItem('chipsy', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chipsy', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:crisps', source)
end)

ESX.RegisterUsableItem('cupcake', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cupcake', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEatCupCake', source)
end)

ESX.RegisterUsableItem('hamburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hamburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 450000)
	TriggerClientEvent('esx_basicneeds:hamburger', source)
end)

ESX.RegisterUsableItem('burger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('burger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 450000)
	TriggerClientEvent('esx_basicneeds:hamburger', source)
end)

ESX.RegisterUsableItem('chocolate', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chocolate', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEatChocolate', source)
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
end)


ESX.RegisterUsableItem('coffee', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coffee', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 800000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
end)

ESX.RegisterUsableItem('sprunk', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sprunk', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 600000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
end)

ESX.RegisterUsableItem('redbull', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('redbull', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 600000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx_basicneeds:redbull', source, {[1] = "gbs", [2] = 2})
end)

ESX.RegisterUsableItem('roza', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('itemki-roza', source)
	xPlayer.removeInventoryItem('roza', 1)
end)

ESX.RegisterUsableItem('kocyk', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('itemki-kocyk', source)
	xPlayer.removeInventoryItem('kocyk', 1)
end)

ESX.RegisterUsableItem('cola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('esx_basicneeds:onCola', source)
end)

ESX.RegisterUsableItem('icetea', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('icetea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
end)

ESX.RegisterUsableItem('milk', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('milk', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
end)

ESX.RegisterUsableItem('kawa', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kawa', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('esx_basicneeds:onDrinkKawa', source)
end)

ESX.RegisterUsableItem('ifak', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ifak', 1)

	TriggerClientEvent('esx_basicneeds:onDrinkIFAK', source)
end)

ESX.RegisterUsableItem('pomarancza', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pomarancza', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEatFruit', source)
end)

ESX.RegisterUsableItem('samarka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	onSamarka[source] = true

	xPlayer.removeInventoryItem('samarka', 1)

	TriggerClientEvent('esx_basicneeds:onSamarka', source)
end)

ESX.RegisterUsableItem('jablka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jablka', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onEatFruit', source)
end)

ESX.RegisterUsableItem('cytryna', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cytryna', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 180000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 180000)
	TriggerClientEvent('esx_basicneeds:onEatFruit', source)
end)

ESX.RegisterUsableItem('winogrono', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('winogrono', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onEatFruit', source)
end)

ESX.RegisterUsableItem('pomarancza', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pomarancza', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onEatFruit', source)
end)

ESX.RegisterUsableItem('mandarynka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mandarynka', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onEatFruit', source)
end)

ESX.RegisterUsableItem('brzoskwinia', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('brzoskwinia', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
	TriggerClientEvent('esx_basicneeds:onEatFruit', source)
end)

RegisterServerEvent('esx_basicneeds:offSamarka')
AddEventHandler('esx_basicneeds:offSamarka', function()
	onSamarka[source] = false
end)

RegisterCommand('heal', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		if (xPlayer.group == 'best'  or xPlayer.group == 'superadmin' or xPlayer.group == 'admin' or xPlayer.group == 'mod') then
			if args[1] then
				local target = tonumber(args[1])

				if target ~= nil then

					if GetPlayerName(target) then
						TriggerClientEvent('esx_basicneeds:healPlayer', target)
						local xPlayer2 = ESX.GetPlayerFromId(target)
						xPlayer2.showNotification('~g~Zostałeś uleczony!')
						exports['goat_logs']:SendLog(source, "Użyto komendy /heal " .. target, "heal")
					else
						xPlayer.showNotification('~r~Nie odnaleziono gracza')
					end
				else
					xPlayer.showNotification('~r~Nieprawidłowe ID')
				end
			else
				exports['nrp_logs']:SendLog(source, "Użyto komendy /heal ", "heal")
				TriggerClientEvent('esx_basicneeds:healPlayer', source)
				xPlayer.showNotification('~g~Zostałeś uleczony!')
			end
		else
			xPlayer.showNotification('~r~Nie posiadasz permisji')
		end
	end
end, false)

samarkaStatus = function(_source)
	return onSamarka[_source]
end

for k, v in pairs(Config.Alcohols) do
	if k ~= nil and v ~= nil then
		ESX.RegisterUsableItem(k, function(source)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			if xPlayer ~= nil then
				TriggerClientEvent('esx_basicneeds:useAlcohol', _source, v.time, v.prop, v.level)
				xPlayer.removeInventoryItem(k, 1)
			end
		end)
	end
end


ESX.RegisterUsableItem('cigarett', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local lighter = xPlayer.getInventoryItem('lighter')

	if lighter.count > 0 then

		TriggerClientEvent('esx_cigarette:startSmoke', source, 'ng_proc_cigarette01a', 'cigarett')
	else
		TriggerClientEvent('esx:showNotification', source, '~r~Nie posiadasz zapalniczki!')
	end
end)
