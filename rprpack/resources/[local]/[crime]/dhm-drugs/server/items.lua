ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('dhm-coke', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if (xPlayer ~= nil) then
        if xPlayer.getInventoryItem('dhm-baggie').count >= 1 then
            xPlayer.removeInventoryItem('dhm-baggie', 1)
            xPlayer.removeInventoryItem('dhm-coke', 1)
            xPlayer.addInventoryItem('dhm-pcoke', 1)
        else
            TriggerClientEvent('dhm-drugs:notif', source, "You need at least 1x baggie!")
        end
    end
end)

ESX.RegisterUsableItem('dhm-pcoke', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if (xPlayer ~= nil) then
        xPlayer.removeInventoryItem('dhm-pcoke', 1)
        TriggerClientEvent('dhm_addict:client:drugUsed', playerId, 0)
    end
end)

ESX.RegisterUsableItem('dhm-heroin', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if (xPlayer ~= nil) then
        xPlayer.removeInventoryItem('dhm-heroin', 1)
        TriggerClientEvent('dhm_addict:client:drugUsed', playerId, 1)
    end
end)

ESX.RegisterUsableItem('dhm-weedjoint', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if (xPlayer ~= nil) then
        xPlayer.removeInventoryItem('dhm-weedjoint', 1)
        TriggerClientEvent('dhm_addict:client:drugUsed', playerId, 3)
    end
end)

ESX.RegisterUsableItem('dhm-pmeth', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if (xPlayer ~= nil) then
        xPlayer.removeInventoryItem('dhm-pmeth', 1)
        TriggerClientEvent('dhm_addict:client:drugUsed', playerId, 4)
    end
end)