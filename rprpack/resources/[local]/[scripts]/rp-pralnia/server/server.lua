ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('norp-moneywash:notifiPolice')
AddEventHandler('norp-moneywash:notifiPolice', function()
    TriggerClientEvent("norp-moneywash:policenotify", -1)
end)

RegisterServerEvent('norp-moneywash:canWashMoney')
AddEventHandler('norp-moneywash:canWashMoney',function(amountToWash)
    local xPlayer = ESX.GetPlayerFromId(source)
    local bm = xPlayer.getAccount('black_money').money
    if bm >= Config.MinAmountToWash and xPlayer.getAccount('black_money').money >= bm then
        xPlayer.removeAccountMoney('black_money', amountToWash)
        TriggerClientEvent("norp-moneywash:MoneyWashFunc", source, amountToWash)
    else
        xPlayer.showNotification('Nie masz wystarczająco brudnej gotówki!')

    end
end)

RegisterServerEvent('norp-moneywash:washMoney')
AddEventHandler('norp-moneywash:washMoney',function(amountToWash)
	local xPlayer = ESX.GetPlayerFromId(source)
    if Config.EnableTax then
        local tax = Config.TaxRate
        local delete = amountToWash / 100 * tax
        local clean = amountToWash - delete
        xPlayer.addMoney(clean)
        xPlayer.showNotification('Wyprałeś pieniądze, otrzymałeś $' ..clean.. '!')
    else
        xPlayer.addMoney(amountToWash)
        xPlayer.showNotification('Wyprałeś pieniądze, otrzymałeś $' ..amountToWash.. '!')
    end
end)

ESX.RegisterServerCallback("norp-moneywash:checkIDCard", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem("moneywash_card")
    if item.count >= 1 then
        cb(true)
    else
        cb(false)
    end
end)