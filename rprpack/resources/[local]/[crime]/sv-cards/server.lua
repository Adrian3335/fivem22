ESX = exports.es_extended.getSharedObject()

ESX.RegisterServerCallback("sv-cards:stacgo", function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item = xPlayer.getInventoryItem("money")
	local hasItem = false
	if item.count >= 3500 then
		hasItem = true
	end
	cb(hasItem)
end)

RegisterServerEvent('sv-cards:additem', function(nazwa, ilosc)
    local ox_inventory = exports.ox_inventory

    if ox_inventory:CanCarryItem(source, nazwa, ilosc) then
        ox_inventory:AddItem(source, nazwa, ilosc)
    else
        TriggerClientEvent('esx:showNotification', source, 'Nie masz miejsca na to')
    end
end)

RegisterServerEvent('sv-cards:removeitem', function(nazwa, ilosc)
    local ox_inventory = exports.ox_inventory

    if ox_inventory:GetItem(source, nazwa, nil, false) then
        ox_inventory:RemoveItem(source, nazwa, ilosc)
    else
        TriggerClientEvent('esx:showNotification', source, 'Nie masz tego itemu')
    end
end)

ESX.RegisterServerCallback('sv-cards:itemylaptok', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item1 = xPlayer.getInventoryItem('pustakarta')
    local item2 = xPlayer.getInventoryItem('danekarta')
    local hasItem = false

    if item1.count >= 1 and item2.count >= 1 then
        hasItem = true
    end
    cb(hasItem)
end)