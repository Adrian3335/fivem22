SERVER = {
    annoucements = {},
    officers = {},
    statusData = {
        pwc = "",
        pwcIdentifier = "",
        cityStatus = Config.CityStatuses[1]
    },
    s4 = {},
    dispatchData = {},
    lastNotes = {
        vehicles = {},
        citizen = {}
    },
    napadowa1 = {
        statusData = {
            sv = "",
            svIdentifier = "",
            nego = "",
            negoIdentifier = "",
            notatki = "",
            zadania = "",
            miejsce = "",
        },
        unity = {},
    },
    napadowa2 = {
        statusData = {
            sv = "",
            svIdentifier = "",
            nego = "",
            negoIdentifier = "",
            notatki = "",
            zadania = "",
            miejsce = "",
        },
        unity = {},
    },
    napadowa3 = {
        statusData = {
            sv = "",
            svIdentifier = "",
            nego = "",
            negoIdentifier = "",
            notatki = "",
            zadania = "",
            miejsce = "",
        },
        unity = {},
    },

    konwojowa = {
        statusData = {
            sv = "",
            svIdentifier = "",
            trasa = "",
            zatrzymani = 0,
            swat = {},
        },
        unity = {},
    }
}


local doing = false

function sortPoliceList()
    local function sortByUserNumber(a, b)
        return tonumber(a.user_numer) > tonumber(b.user_numer)
    end
    
    local sortedOfficers = {}
    for k, v in pairs(SERVER.officers) do
        table.insert(sortedOfficers, v)
    end

    table.sort(sortedOfficers, sortByUserNumber)

    TriggerClientEvent('qf_mdt:updatePoliceList', -1, sortedOfficers)
end



MySQL.ready(function()
    SERVER.annoucements = MySQL.query.await('SELECT title, content, annid FROM qf_mdt_annoucements ORDER BY time LIMIT 25')

    Citizen.Wait(5000)
    for _, xPlayer in pairs(ESX.GetExtendedPlayers()) do
        if Config.Jobs[xPlayer.job.name] then
            SERVER.officers[tostring(xPlayer.source)] = {
                status = _L("STATUS_AVAILABLE"),
                firstname = xPlayer.getName(),
                lastname = '',
                badge = EDITABLE.GetBadge(xPlayer),
                user_grade = xPlayer.job.grade_label,
                user_numer = xPlayer.job.grade
            }
        end
    end
    sortPoliceList()
end)

AddEventHandler('esx:playerLoaded', function(id, xPlayer)
    if Config.Jobs[xPlayer.job.name] then
        SERVER.officers[tostring(id)] = {
            status = _L("STATUS_AVAILABLE"),
            firstname = xPlayer.getName(),
            lastname = '',
            badge = EDITABLE.GetBadge(xPlayer),
            user_grade = xPlayer.job.grade_label,
            user_numer = xPlayer.job.grade
        }
        sortPoliceList()
    end
end)

AddEventHandler('esx:playerDropped', function(id)
    if SERVER.officers[tostring(id)] then
        local xPlayer = ESX.GetPlayerFromId(id)
        local shouldUpdateDispatch = false
        local shouldUpdateS4 = false
        for i=1, #SERVER.dispatchData, 1 do
            local a = SERVER.dispatchData[i]
            for p=1, #a.officers, 1 do
                if a.officers[p].id == id then
                    shouldUpdateDispatch = true
                    table.remove(SERVER.dispatchData[i].officers, p) 
                    break
                end
            end
            if #a.officers == 0 then
                shouldUpdateDispatch = true
                table.remove(SERVER.dispatchData, i)
            end
        end
        for i=1, #SERVER.s4, 1 do
            if SERVER.s4[i].id == _source then
                table.remove(SERVER.s4, i)
                shouldUpdateS4 = true
                break
            end
        end
        if SERVER.statusData.pwcIdentifier == xPlayer.identifier then
            SERVER.statusData.pwcIdentifier = ""
            SERVER.statusData.pwc = ""
            TriggerClientEvent('qf_mdt:updatePWC', -1, SERVER.statusData.pwc)
        end
        if shouldUpdateDispatch then
            TriggerClientEvent('qf_mdt:updateDispatch', -1, SERVER.dispatchData)
        end
        if shouldUpdateS4 then
            TriggerClientEvent('qf_mdt:updateS4', -1, SERVER.s4)
        end
        SERVER.officers[tostring(id)] = nil
        sortPoliceList()
    end
end)

AddEventHandler('esx:setJob', function(id, newJob, oldJob)
    local xPlayer = ESX.GetPlayerFromId(id)
    local shouldUpdateDispatch = false
    local shouldUpdateS4 = false
    if SERVER.officers[tostring(id)] then
        for i=1, #SERVER.dispatchData, 1 do
            local a = SERVER.dispatchData[i]
            for p=1, #a.officers, 1 do
                if a.officers[p].id == id then
                    shouldUpdateDispatch = true
                    table.remove(SERVER.dispatchData[i].officers, p) 
                    break
                end
            end
            if #a.officers == 0 then
                shouldUpdateDispatch = true
                table.remove(SERVER.dispatchData, i)
            end
        end
        for i=1, #SERVER.s4, 1 do
            if SERVER.s4[i].id == _source then
                table.remove(SERVER.s4, i)
                shouldUpdateS4 = true
                break
            end
        end
        if SERVER.statusData.pwcIdentifier == xPlayer.identifier then
            SERVER.statusData.pwcIdentifier = ""
            SERVER.statusData.pwc = ""
            TriggerClientEvent('qf_mdt:updatePWC', -1, SERVER.statusData.pwc)
        end
        SERVER.officers[tostring(id)] = nil
        sortPoliceList()
    end
    
    if shouldUpdateDispatch then
        TriggerClientEvent('qf_mdt:updateDispatch', -1, SERVER.dispatchData)
    end
    if shouldUpdateS4 then
        TriggerClientEvent('qf_mdt:updateS4', -1, SERVER.s4)
    end
    if Config.Jobs[xPlayer.job.name] then
        SERVER.officers[tostring(id)] = {
            status = _L("STATUS_AVAILABLE"),
            firstname = xPlayer.getName(),
            lastname = '',
            badge = EDITABLE.GetBadge(xPlayer),
            user_grade = xPlayer.job.grade_label,
            user_numer = xPlayer.job.grade
        }
        sortPoliceList()
    end
end)

ESX.RegisterServerCallback('qf_mdt:getDispatchData', function(source, cb)
    cb({
        statusData = SERVER.statusData,
        s4 = SERVER.s4,
        dispatchData = SERVER.dispatchData,
    })
end)

RegisterServerEvent('qf_mdt:setPWC', function(pwc)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if Config.Jobs[xPlayer.job.name] then
        SERVER.statusData.pwc = pwc
        if pwc:len() > 0 then
            SERVER.statusData.pwcIdentifier = xPlayer.identifier
        else
            SERVER.statusData.pwcIdentifier = ""
        end
        TriggerClientEvent('qf_mdt:updatePWC', -1, pwc)
    end
end)

AddEventHandler('qf_mdt:updateCityStatus', function(stat)
    local i = 1
    if stat == 'zielony' then
        i = 1
    elseif stat == 'pomarancz' then
        i = 2
    elseif stat == 'czerwony' then
        i = 3
    elseif stat == 'czarny' then
        i = 4
    end
    SERVER.statusData.cityStatus = Config.CityStatuses[i]
    TriggerClientEvent('qf_mdt:cityStatus', -1, SERVER.statusData.cityStatus)
end)

RegisterServerEvent('qf_mdt:setStatus', function(status)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if Config.Jobs[xPlayer.job.name] then
        if SERVER.officers[tostring(_source)] then
            if _L("STATUS_" .. status:upper()) ~= SERVER.officers[tostring(_source)].status then
                SERVER.officers[tostring(_source)].status = _L("STATUS_" .. status:upper())
                TriggerClientEvent('qf_mdt:updateStatus', -1, SERVER.officers)
            end
        end
        local shouldUpdate = false
        for i=1, #SERVER.s4, 1 do
            if SERVER.s4[i].id == _source then
                table.remove(SERVER.s4, i)
                shouldUpdate = true
                break
            end
        end
        if status == 's4' then
            table.insert(SERVER.s4, {
                id = _source,
                badge = EDITABLE.GetBadge(xPlayer),
                firstname = xPlayer.getName(),
                lastname = xPlayer.get('lastname'),
                user_grade = xPlayer.job.grade_label,
                user_numer = xPlayer.job.grade
            })
            shouldUpdate = true
        end
        if shouldUpdate then
            TriggerClientEvent('qf_mdt:updateS4', -1, SERVER.s4)
        end
    end
    sortPoliceList()
end)

RegisterServerEvent('qf_mdt:editPatrol', function(index, unit, vehicle)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not Config.Jobs[xPlayer.job.name] then
        return
    end
    if not SERVER.dispatchData[index] then
        return
    end
    SERVER.dispatchData[index].unit = unit
    SERVER.dispatchData[index].vehicle = vehicle
    TriggerClientEvent('qf_mdt:updateDispatch', -1, SERVER.dispatchData)
end)

RegisterServerEvent('qf_mdt:createPatrol', function(unit, vehicle)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not Config.Jobs[xPlayer.job.name] then
        return
    end
    local data = {
        status = "-",
        vehicle = vehicle,
        unit = unit,
        officers = {
            {
                id = _source,
                firstname = xPlayer.getName(),
                lastname = '',
                badge = EDITABLE.GetBadge(xPlayer)
            }
        }
    }
    table.insert(SERVER.dispatchData, data)
    TriggerClientEvent('qf_mdt:updateDispatch', -1, SERVER.dispatchData)
end)

RegisterServerEvent('qf_mdt:joinPatrol', function(index)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not Config.Jobs[xPlayer.job.name] then
        return
    end
    if not SERVER.dispatchData[index] then
        return
    end
    table.insert(SERVER.dispatchData[index].officers, {
        id = _source,
        firstname = xPlayer.getName(),
        lastname = '',
        badge = EDITABLE.GetBadge(xPlayer)
    })
    TriggerClientEvent('qf_mdt:updateDispatch', -1, SERVER.dispatchData)
end)

RegisterServerEvent('qf_mdt:quitPatrol', function(index)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not Config.Jobs[xPlayer.job.name] then
        return
    end
    if not SERVER.dispatchData[index] then
        return
    end
    for i=1, #SERVER.dispatchData[index].officers, 1 do
        if SERVER.dispatchData[index].officers[i].id == _source then
            table.remove(SERVER.dispatchData[index].officers, i)
            break
        end
    end
    if #SERVER.dispatchData[index].officers == 0 then
        table.remove(SERVER.dispatchData, index)
    end
    TriggerClientEvent('qf_mdt:updateDispatch', -1, SERVER.dispatchData)
end)

RegisterServerEvent('qf_mdt:clearDispatch', function()
    local _source = source
    SERVER.dispatchData = {}
    TriggerClientEvent('qf_mdt:updateDispatch', -1, SERVER.dispatchData)
end)

RegisterServerEvent('qf_mdt:changePatrolStatus', function(index, status)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not Config.Jobs[xPlayer.job.name] then
        return
    end
    if not SERVER.dispatchData[index] then
        return
    end
    SERVER.dispatchData[index].status = status
    TriggerClientEvent('qf_mdt:updateDispatch', -1, SERVER.dispatchData)
end)


RegisterNetEvent('qf_mdt:removeAnn', function(index)
    MySQL.query('DELETE FROM qf_mdt_annoucements WHERE annid = ?', {index})
    
    local announs = MySQL.query.await('SELECT title, content, annid FROM qf_mdt_annoucements ORDER BY time LIMIT 25')
    SERVER.annoucements = announs
    TriggerClientEvent('qf_mdt:updateAnnoucements', -1, announs)
end)