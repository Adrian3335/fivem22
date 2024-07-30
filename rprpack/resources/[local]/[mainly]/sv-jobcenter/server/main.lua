ESX = exports.es_extended.getSharedObject()

RegisterNetEvent('sv-urzad:zatrudnijSie')
AddEventHandler('sv-urzad:zatrudnijSie', function(job) 
    if job == 'unemployed' or job == 'rolnik' or job == 'zlomiarz' or job == 'taxi' or job == 'beanmachine' then
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            xPlayer.setJob(job, 0)
            TriggerClientEvent('esx:showNotification', _source, 'Zatrudniłeś się w nowej pracy!')
        end
    else
        DropPlayer(source, 'SETJOB TRIGGER DETECTED')
    end
end)