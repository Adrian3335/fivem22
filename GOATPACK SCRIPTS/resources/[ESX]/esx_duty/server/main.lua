RegisterServerEvent('duty:police')
AddEventHandler('duty:police', function(job)
    local found = false
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'police' then
        xPlayer.setJob('offpolice', xPlayer.job.grade)
        xPlayer.showNotification("Zakończyłeś/aś pracę Policjant.")
        found = true  
    end

    if xPlayer.job.name == 'offpolice' then
        xPlayer.setJob('police', xPlayer.job.grade)
        xPlayer.showNotification("Rozpoczynasz prace jako Policjant.")
        found = true
    end
    if not found then
        xPlayer.showNotification("Nie jesteś w wymaganej frakcji.")
    end
end)

RegisterServerEvent('duty:lssd')
AddEventHandler('duty:lssd', function(job)
    local found = false
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'lssd' then
        xPlayer.setJob('offlssd', xPlayer.job.grade)
        xPlayer.showNotification("Zakończyłeś/aś pracę.")
        found = true  
    end

    if xPlayer.job.name == 'offlssd' then
        xPlayer.setJob('lssd', xPlayer.job.grade)
        xPlayer.showNotification("Rozpoczynasz prace.")
        found = true
    end
    if not found then
        xPlayer.showNotification("Nie jesteś w wymaganej frakcji.")
    end
end)


RegisterServerEvent('duty:ambulance')
AddEventHandler('duty:ambulance', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'ambulance' then
        xPlayer.setJob('offambulance', xPlayer.job.grade)
        xPlayer.showNotification("Zakończyłeś/aś pracę Medyk.")
            found = true  
        end
    
    if xPlayer.job.name == 'offambulance' then
        xPlayer.setJob('ambulance', xPlayer.job.grade)
        xPlayer.showNotification("Rozpoczynasz prace jako Medyk.")
        found = true
    end
    if not found then
        xPlayer.showNotification("Nie jesteś w wymaganej frakcji.")
    end
end)

RegisterServerEvent('duty:mechanik')
AddEventHandler('duty:mechanik', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    local gradeLabel = xPlayer.job.grade_label

    if xPlayer.job.name == 'mechanic' then
        xPlayer.setJob('offmechanic', xPlayer.job.grade)
        xPlayer.showNotification("Zakończyłeś/aś pracę Mechanika.")
        found = true  
    end
    
    if xPlayer.job.name == 'offmechanic' then
        xPlayer.setJob('mechanic', xPlayer.job.grade)
        xPlayer.showNotification("Rozpoczynasz prace jako Mechanik.")
        found = true
    end
        if not found then
        xPlayer.showNotification("Nie jesteś w wymaganej.")
    end
end)