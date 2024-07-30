ESX = exports['es_extended']:getSharedObject()

local lastrob = 0

ESX.RegisterServerCallback('sv-storerobbery:PoliceCount', function(source, cb)
    local src = source
    local players = ESX.GetPlayers()
    local policeCount = 0

    for i = 1, #players do
        local player = ESX.GetPlayerFromId(players[i])
        if player['job']['name'] == 'police' then
            policeCount = policeCount + 1
        end
    end

    if policeCount >= 0 then
        cb(true)
    else
        cb(false)
        TriggerClientEvent('esx:showNotification', source, 'Brak funkcjonariuszy na służbie!')
    end
end)

ESX.RegisterServerCallback('sv-storerobbery:CheckTime', function(source, cb)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    
    if (os.time() - lastrob) < 100 and lastrob ~= 0 then
        local seconds = 100 - (os.time() - lastrob)
        TriggerClientEvent('esx:showNotification', source, 'Ta kasa została niedawno obrabowana!')
        cb(false)
    else
        lastrob = os.time()
        cb(true)
    end
end)


function randomId()
    math.randomseed(os.time())
    return string.gsub("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx", "[xy]", function(c)
        return string.format("%x", (c == "x") and math.random(0, 0xf) or math.random(8, 0xb))
    end)
end

-------

RegisterServerEvent('sv-storerobbery:Reward')
AddEventHandler('sv-storerobbery:Reward', function(type)
    local xPlayer = ESX.GetPlayerFromId(source)
    if type == 'cashfull' then
        xPlayer.addInventoryItem('black_money', math.random(200, 800))
    elseif type == 'cashhalf' then
        xPlayer.addInventoryItem('black_money', math.random(200, 800)/2)
    end
end)