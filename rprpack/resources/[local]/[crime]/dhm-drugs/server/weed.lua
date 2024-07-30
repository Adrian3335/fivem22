weeds = {}

RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(playerId, xPlayer)
    local src = playerId
    TriggerClientEvent('dhm-drugs:synchronizeweed',-1,weeds)
end)


Citizen.CreateThread(function()
    Citizen.Wait(1000)
    TriggerClientEvent('dhm-drugs:synchronizeweed',-1,weeds)
end)


MySQL.ready(function()
    local result = MySQL.Sync.fetchAll('SELECT * FROM dhm_weed')
    for i = 1, #result do
        result[i].coords = json.decode(result[i].coords)
        weeds[result[i].weedid] = result[i]
    end
end)


ESX.RegisterUsableItem("dhm-weedseed", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local kordinates = GetEntityCoords(GetPlayerPed(source))
    if CheckCoord(kordinates, weeds) then
        local wid = genid(weeds)
        weeds[wid] = {
            pressed = 0,
            progress = 0,
            coords = kordinates,
            weedid = wid,    
        }
        xPlayer.removeInventoryItem("dhm-weedseed", 1)
        TriggerClientEvent('dhm-drugs:synchronizeweed',-1,weeds)

        MySQL.Async.execute('INSERT INTO dhm_weed (weedid, coords, progress) VALUES (@weedid, @coords, @progress)', {
            ['@weedid']   =  wid,
            ['@coords']   = json.encode(kordinates),
            ['@progress'] = 0
        }, function(rowsChanged)
        end)
    else
      TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.tooclose)
    end
end)

RegisterServerEvent('dhm-drugs:updategrowth')
AddEventHandler('dhm-drugs:updategrowth',function(weed, item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local stat = math.random(5, 15)
    if weeds[weed].pressed == 0 or weeds[weed].pressed == nil then
        if weeds[weed].progress >= 100 then
            local weedamount = math.random(Config.MinWeed, Config.MaxWeed)
            xPlayer.addInventoryItem('dhm-weed', weedamount)
            TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.leavesharvested)
                
            MySQL.Async.execute('DELETE FROM dhm_weed WHERE weedid = @weedid', {
                ['@weedid'] = weeds[weed].weedid
            })

            TriggerClientEvent('dhm-drugs:deleteweed',-1,weed, weeds[weed].weedid)
            weeds[weed] = nil
            return
        else
            if xPlayer.getInventoryItem(item).count >= 1 then
                weeds[weed].pressed = math.random(Config.MinWeedGrowTime, Config.MaxWeedGrowTime)
                weeds[weed].progress = weeds[weed].progress + stat
                MySQL.Async.execute("UPDATE dhm_weed SET progress = '"..weeds[weed].progress.. "' WHERE weedid = '" ..weed.. "'")
                xPlayer.removeInventoryItem(item, 1)
                Citizen.Wait(1000)
                TriggerClientEvent('dhm-drugs:updategrowthcweed',-1,weed,weeds[weed].progress)         
            else
                TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.noitem)
            end
        end
    else
        TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.waittogrow)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k,v in pairs(weeds) do
            if k ~= nil then
                if v.pressed ~= nil then
                    TriggerClientEvent('dhm-drugs:updatetimeweed',-1,k,v.pressed)
                    if v.pressed > 0 then
                        v.pressed = v.pressed - 1
                    end
                end
            end
        end
    end
end)
