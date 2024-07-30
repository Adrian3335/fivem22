ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('lockpick2', function(source)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerClientEvent("213-Wytrychy:Start", xPlayer.source)
end)

RegisterServerEvent('lockpick:remove')
AddEventHandler('lockpick:remove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('lockpick2', 1)
end)