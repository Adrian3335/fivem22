local ox_inventory = exports.ox_inventory

local storage = {
    id = 'storage',
    label = 'Magazyn Mety',
    slots = 5,
    weight = 100000,
    owner = false,
}




AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
        ox_inventory:RegisterStash(storage.id, storage.label, storage.slots, storage.weight, storage.owner)
    end
end)

local jeden = false
local dwa = false
local trzy = false
local cztery = false
local dobratemp = false
local slabatemp = false
local dobrameta = false
local slabameta = false
local gotuje = false

RegisterServerEvent('kriss:wloz:sod', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem('wodorotlenek-sodu').count >= 1 then
        xPlayer.showNotification('Włożono składnik')
        xPlayer.removeInventoryItem('wodorotlenek-sodu', 1)
        jeden = true
    else
        xPlayer.showNotification('Nie masz tego składniku')
    end
end)

RegisterServerEvent('kriss:wloz:aceton', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem('fenyloaceton').count >= 1 then
        xPlayer.showNotification('Włożono składnik')
        xPlayer.removeInventoryItem('fenyloaceton', 1)
        dwa = true
    else
        xPlayer.showNotification('Nie masz tego składniku')
    end
end)

RegisterServerEvent('kriss:wloz:kwasrybo', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem('kwasrybo').count >= 1 then
        xPlayer.showNotification('Włożono składnik')
        xPlayer.removeInventoryItem('kwasrybo', 1)
        trzy = true
    else
        xPlayer.showNotification('Nie masz tego składniku')
    end
end)

RegisterServerEvent('kriss:wloz:chlor', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem('chloroefedryne').count >= 1 then
        xPlayer.showNotification('Włożono składnik')
        xPlayer.removeInventoryItem('chloroefedryne', 1)
        cztery = true
    else
        xPlayer.showNotification('Nie masz tego składniku')
    end
end)

RegisterServerEvent('kriss:temp:slaba', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if slabatemp or dobratemp then
        xPlayer.showNotification('Ustawiłes już temperature')
    else
        slabatemp = true
        xPlayer.showNotification('Ustawiono temperature')
    end
end)

RegisterServerEvent('kriss:temp:dobra', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if slabatemp or dobratemp then
        xPlayer.showNotification('Ustawiłes już temperature')
    else
        dobratemp = true
        xPlayer.showNotification('Ustawiono temperature')
    end
end)

RegisterServerEvent('kriss:gotowanie:start', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if dobratemp and jeden and dwa and trzy and cztery and not gotuje then
        gotuje = true
        xPlayer.showNotification('Rozpoczęto gotowanie')
        xPlayer.triggerEvent('kriss:flara')
        Wait(45000)
        xPlayer.showNotification('Gotowanie zakonczyło się')
        dobrameta = true
        exports.ox_inventory:AddItem('storage', 'krysztal', 3)
        restart()
    else
        if slabatemp and jeden and dwa and trzy and cztery and not gotuje then
            gotuje = true
            xPlayer.showNotification('Rozpoczęto gotowanie')
            xPlayer.triggerEvent('kriss:flara')
            Wait(25000)
            xPlayer.showNotification('Gotowanie zakonczyło się')
            slabameta = true
            restart()
        else
            xPlayer.showNotification('Nie możesz tego zrobić')
        end
    end
end)

-- RegisterServerEvent('kriss:gotowanie:wyciagnij', function()
--     local xPlayer = ESX.GetPlayerFromId(source)
--     if dobrameta and dobratemp then
--         xxx = math.random(2, 6)
--         xPlayer.addInventoryItem('krysztal', xxx)
--         restart()
--     else
--         if slabameta and slabatemp then
--             xPlayer.showNotification('Twoja meta sie rozgotowała ponieważ podałeś błędną temperature')
--             restart()
--         else
--             xPlayer.showNotification('Pojemnik jest pusty')
--         end
--     end
-- end)


function restart()
    jeden = false
    dwa = false
    trzy = false
    cztery = false
    dobratemp = false
    slabatemp = false
    dobrameta = false
    local slabameta = false
    gotuje = false
end
