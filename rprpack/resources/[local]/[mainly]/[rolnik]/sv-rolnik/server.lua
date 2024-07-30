ESX = exports.es_extended.getSharedObject()

local ox_inventory = exports.ox_inventory

RegisterServerEvent('sv-rolnik:salata', function()
    if ox_inventory:CanCarryItem(source, 'salata', 1) then
        ox_inventory:AddItem(source, 'salata', 1)
        TriggerClientEvent('esx:showNotification', source, 'Zebrałeś sałate')
    else
        TriggerClientEvent('esx:showNotification', source, 'Nie masz miejsca żeby zmieścić sałatę')
    end
end)

RegisterServerEvent('sv-rolnik:ziemniaki', function()
    if ox_inventory:CanCarryItem(source, 'ziemniaki', 1) then
        ox_inventory:AddItem(source, 'ziemniaki', 1)
        TriggerClientEvent('esx:showNotification', source, 'Zebrałeś ziemniaki')
    else
        TriggerClientEvent('esx:showNotification', source, 'Nie masz miejsca żeby zmieścić ziemniaki')
    end
end)

RegisterServerEvent('sv-rolnik:pomidory', function()
    if ox_inventory:CanCarryItem(source, 'pomidory', 1) then
        ox_inventory:AddItem(source, 'pomidory', 1)
        TriggerClientEvent('esx:showNotification', source, 'Zebrałeś pomidory')
    else
        TriggerClientEvent('esx:showNotification', source, 'Nie masz miejsca żeby zmieścić pomidory')
    end
end)

RegisterServerEvent('sv-rolnik:sprzedaj', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local amount = 0
    for k,v in pairs(Config.ItemsSell) do 
        local item = xPlayer.getInventoryItem(k)
        if item and item.count >= 1 then
            amount = amount + (v * item.count)
            xPlayer.removeInventoryItem(k, item.count)
        end
    end
    if amount > 0 then
        ox_inventory:AddItem(source, 'money', amount)
    else
        TriggerClientEvent('esx:showNotification', source, 'Nie masz przy sobie nic na sprzedaż!')
    end
end)