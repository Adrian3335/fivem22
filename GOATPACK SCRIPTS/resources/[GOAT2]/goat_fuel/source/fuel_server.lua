-- ESX = nil

if Config.UseESX then
	-- TriggerEvent('esx:getShtestaredObjtestect', function(obj) ESX = obj end)
	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)

		if price > 0 then
			xPlayer.removeMoney(amount)
		end
	end)
end

RegisterServerEvent("tankuj")
AddEventHandler("tankuj",function()	
	local xPlayer = ESX.GetPlayerFromId(source)
     if xPlayer.getMoney() >= 500 then
		xPlayer.triggerEvent('zatankujse')
	 else
		xPlayer.showNotification('Nie stać cie na tankowanie!')
	 end
end)

RegisterServerEvent("sekszpedalami")
AddEventHandler("sekszpedalami",function()	
	local xPlayer = ESX.GetPlayerFromId(source)
     if xPlayer.getMoney() >= 200 then
		xPlayer.addInventoryItem('weapon_petrolcan', 1)
		xPlayer.removeMoney(200)
	 else
		xPlayer.showNotification('Nie stać cie nie zakup kanistru!')
	 end
end)
