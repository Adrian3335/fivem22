ESX = exports['es_extended']:getSharedObject()
Many = exports['many-base']

RegisterServerEvent('many-arcadebar:RemoveMoney')
AddEventHandler('many-arcadebar:RemoveMoney', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('money', amount)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_arcade', function(account)
        print(account)
		account.addMoney(amount)
	end)
end)

RegisterServerEvent('many-arcadebar:AddMoney')
AddEventHandler('many-arcadebar:AddMoney', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('money', amount)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_arcade', function(account)
        print(account)
		account.removeMoney(amount)
	end)
end)

local ox_inventory = exports.ox_inventory

local storage = {
    id = 'arcade_storage',
    label = 'Magazyn Arcade',
    slots = 50,
    weight = 100000,
    owner = false,
}

local tray1 = {
    id = 'arcade_tray',
    label = 'Taca Arcade',
    slots = 5,
    weight = 100000,
    owner = false,
}

AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
        ox_inventory:RegisterStash(storage.id, storage.label, storage.slots, storage.weight, storage.owner)
        ox_inventory:RegisterStash(tray1.id, tray1.label, tray1.slots, tray1.weight, tray1.owner)
    end
end)