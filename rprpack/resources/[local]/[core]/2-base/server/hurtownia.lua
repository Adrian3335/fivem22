RegisterServerEvent('very-hurtownia')
AddEventHandler('very-hurtownia', function(itemName, amount)
    FishPrice = {
        fish_szczupak = 33,
        fish_sum = 35,
        fish_okon = 32,
        fish_mintaj = 30,
        fish_losos = 34,
        fish_jesiotr = 36,
		bursztyn = 5,
    }
    
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = FishPrice[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if not price then
		return
	end

	if xItem.count < amount then
		return
	end

	price = ESX.Math.Round(price * amount)

    xPlayer.addMoney(price)

	xPlayer.removeInventoryItem(xItem.name, amount)
    TriggerClientEvent('esx:showNotification', source, 'Pomyślnie sprzedałeś: '..xItem.label.. ' x'..amount..' za: '..ESX.Math.GroupDigits(price)..'$')
end)