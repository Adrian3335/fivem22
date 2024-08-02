ESX = exports['es_extended']:getSharedObject()
RSE = RegisterServerEvent
AEH = AddEventHandler
RSC = ESX.RegisterServerCallback

local lastrob = 0

RSC('x-atmheist:PoliceCount', function(source, cb)
    local src = source
    local players = ESX.GetPlayers()
    local policeCount = 0

    for i = 1, #players do
        local player = ESX.GetPlayerFromId(players[i])
        if player['job']['name'] == 'police' then
            policeCount = policeCount + 1
        end
    end

    if policeCount >= Config.RequiredCops then
        cb(true)
    else
        cb(false)
        TriggerClientEvent('esx:showNotification', source, 'Brak funkcjonariuszy na służbie!')
    end
end)

RSC('x-atmheist:CheckTime', function(source, cb)
    local src = source
    local player = ESX.GetPlayerFromId(src)
    
    if (os.time() - lastrob) < Config.Cooldown and lastrob ~= 0 then
        local seconds = Config.Cooldown - (os.time() - lastrob)
        TriggerClientEvent('esx:showNotification', source, 'Ktoś już obrabował bankomat (cooldown 10 minut)!')
        cb(false)
    else
        lastrob = os.time()
        --exports['x-logs']:SendLog(source, 'Rozpoczął rabunek bankomatu!', 'crime')
        cb(true)
    end
end)

RSE('x-atmheist:Reward')
AEH('x-atmheist:Reward', function(type)
    local xPlayer = ESX.GetPlayerFromId(source)
    local random = math.random(Config.MinReward, Config.MaxReward)
    if type == 'full' then
    xPlayer.addInventoryItem('money', random)
    elseif type == 'half' then
        xPlayer.addInventoryItem('money', random/2)
    end
end)

RegisterServerEvent('bankomat')
AddEventHandler('bankomat', function(coords, str, type)
    TriggerClientEvent('bankomat', -1, source, coords, str, type, os.date("%H:%M"))
end)