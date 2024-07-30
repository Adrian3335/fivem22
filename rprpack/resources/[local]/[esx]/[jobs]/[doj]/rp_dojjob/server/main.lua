TriggerEvent('esx_society:registerSociety', 'doj', 'doj', 'society_doj', 'society_doj','society_doj', { type = 'private' })

if GetResourceState("ox_inventory") ~= 'missing' then
    exports.ox_inventory:RegisterStash("society_doj_dokumenty", 'Dokumenty', 50, 50000, nil, {['doj'] = 0}, vec3(-511.7125, -182.5372, 41.8866))
end


RegisterServerEvent('dbl_dojjob:call', function()
    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'doj' then
            TriggerClientEvent('esx:showNotification', xPlayers[i], 'Ktoś oczekuję w Departamencie na Pracownika')
        end
    end
end)
