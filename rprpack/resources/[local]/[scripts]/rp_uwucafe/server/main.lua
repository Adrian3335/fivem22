TriggerEvent('esx_society:registerSociety', 'kawiarnia', 'Kawiarnia', 'society_kawiarnia', 'society_kawiarnia', 'society_kawiarnia', {type = 'private'})
local ox_inventory = exports.ox_inventory

local uwucafe = {
    id = 'uwu_cafe',
    label = 'Lodówka',
    slots = 25,
    weight = 100000,
    owner = false,
}

AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
        ox_inventory:RegisterStash(uwucafe.id, uwucafe.label, uwucafe.slots, uwucafe.weight, uwucafe.owner)
    end
end)

RegisterServerEvent('dbl_uwucafe:serverTrigger', function(name)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
 
    if not xPlayer then return end
    if xPlayer.job.name ~= 'kawiarnia' then 
        return exports["vProtection"]:fg_BanPlayer(source, "NRP_UWUCAFE(ZJEB)", true) 
    end
    functions[name](xPlayer)
end)
 
functions = {
    zrobkawe = function(xPlayer)
        if xPlayer.getInventoryItem('coffee').count >= 3 then
            exports["rp_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz wolnych rąk na 3 kawy")
        else
            xPlayer.addInventoryItem('coffee', '1')
            exports["rp_notify"]:notify(source, "success", "Powiadomienie!", "Zrobiłeś kawę")
        end
    end,
    zbieranieskladnikow = function(xPlayer)
        if xPlayer.getInventoryItem('uwucafe_skladniki').count >= 1 then
            exports["rp_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz miejsca na więcej składników")
        else
            xPlayer.addInventoryItem('uwucafe_skladniki', '1')
            exports["rp_notify"]:notify(source, "success", "Powiadomienie!", "Przygotowałeś/aś składniki")
        end
    end,
    robiszciasto = function(xPlayer)
        if xPlayer.getInventoryItem('uwucafe_zestaw').count >= 5 then
            exports["rp_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz miejsca na więcej ciasta")
        else
            xPlayer.removeInventoryItem('uwucafe_skladniki', '1')
            xPlayer.addInventoryItem('uwucafe_zestaw', '1')
        end
    end, 
    zabierasztowar = function(xPlayer)
        if xPlayer.getInventoryItem('towar').count >= 100 then
            exports["rp_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz miejsca na towar.")
        else
            xPlayer.addInventoryItem('towar', '100')
            exports["rp_notify"]:notify(source, "success", "Powiadomienie!", "Odebrałeś towar, wróc na firmę i odłoż na magazynie")
        end
    end,
    towarzabierz = function(xPlayer)
        if xPlayer.getInventoryItem('towar').count >= 100 then
           xPlayer.removeInventoryItem('towar', '100')
           xPlayer.addInventoryItem('fakturauwu')
           dajpieniadze()
           dajpieniadzebossmenu()
           exports["rp_notify"]:notify(source, "success", "Powiadomienie!", "Odłożyłeś towar")
        else
           exports["rp_notify"]:notify(source, "warning", "Powiadomienie!", "Nie masz towaru")
        end
    end 
}

RegisterNetEvent('dbl_uwucafe:propozycja', function(target, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name ~= 'kawiarnia' then return
    end
        TriggerClientEvent("dbl_uwucafe:rachunek", target, source, amount)
end)
 
RegisterNetEvent('dbl_uwucafe:wystawrachunek', function(target, amount, pay)
    amount = tonumber(amount)
    local xTarget = ESX.GetPlayerFromId(target)
    if xTarget.job.name ~= 'kawiarnia' then 
        return
    end
    if not pay then 
        return xTarget.showNotification("Klient odmówił zapłaty")
    end 
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= amount then
        xPlayer.removeInventoryItem("money", amount)
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kawiarnia', function(account)
            account.addMoney(amount)
        end)
        xTarget.showNotification("Klient zapłacił rachunek")
    else
        xPlayer.showNotification("Nie posiadasz tyle gotówki")
        xTarget.showNotification("Ta osoba nie posiada tyle gotówki")
    end
end)

function dajpieniadze()
    local xPlayer = ESX.GetPlayerFromId(source)
    recrue = math.random(12000, 14000)
    novice = math.random(14000, 17000)
    cdisenior = math.random(17000, 20000)
    boss = math.random(20000, 25000)
    if xPlayer.job.grade_name == 'recrue' then
       xPlayer.addMoney(recrue)
    else
       if xPlayer.job.grade_name == 'novice' then
          xPlayer.addMoney(novice)
       else
          if xPlayer.job.grade_name == 'cdisenior' then
             xPlayer.addMoney(cdisenior)
          else
                if xPlayer.job.grade_name == 'boss' then
                   xPlayer.addMoney(boss)
                end
            end
         end
      end
 end
 
 function dajpieniadzebossmenu()
     TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kawiarnia', function(account)
        kwity = math.random(4500, 6000)
        account.addMoney(kwity)
    end)
 end
  