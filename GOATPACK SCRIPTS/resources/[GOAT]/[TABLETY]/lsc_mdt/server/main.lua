SERVER = {
    annoucements = {},
    medics = {},
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

function sortMedicList()
    local function sortByUserNumber(a, b)
        return tonumber(a.user_numer) > tonumber(b.user_numer)
    end
    
    local sortedmedics = {}
    for k, v in pairs(SERVER.medics) do
        table.insert(sortedmedics, v)
    end

    table.sort(sortedmedics, sortByUserNumber)

    TriggerClientEvent('qf_mdt:updateMedicList', -1, sortedmedics)
end

AddEventHandler('esx:playerLoaded', function(id, xPlayer)
    if Config.Jobs[xPlayer.job.name] then
        SERVER.medics[tostring(id)] = {
            status = _L("STATUS_AVAILABLE"),
            firstname = xPlayer.getName(),
            lastname = '',
            badge = EDITABLE.GetBadge(xPlayer),
            user_grade = xPlayer.job.grade_label,
            user_numer = xPlayer.job.grade
        }
        sortMedicList()
    end
end)

AddEventHandler('esx:playerDropped', function(id)
    if SERVER.medics[tostring(id)] then
        local xPlayer = ESX.GetPlayerFromId(id)
        local shouldUpdateDispatch = false
        local shouldUpdateS4 = false
        for i=1, #SERVER.dispatchData, 1 do
            local a = SERVER.dispatchData[i]
            for p=1, #a.medics, 1 do
                if a.medics[p].id == id then
                    shouldUpdateDispatch = true
                    table.remove(SERVER.dispatchData[i].medics, p) 
                    break
                end
            end
            if #a.medics == 0 then
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
        SERVER.medics[tostring(id)] = nil
        sortMedicList()
    end
end)

AddEventHandler('esx:setJob', function(id, newJob, oldJob)
    local xPlayer = ESX.GetPlayerFromId(id)
    local shouldUpdateDispatch = false
    local shouldUpdateS4 = false
    if SERVER.medics[tostring(id)] then
        for i=1, #SERVER.dispatchData, 1 do
            local a = SERVER.dispatchData[i]
            for p=1, #a.medics, 1 do
                if a.medics[p].id == id then
                    shouldUpdateDispatch = true
                    table.remove(SERVER.dispatchData[i].medics, p) 
                    break
                end
            end
            if #a.medics == 0 then
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
        SERVER.medics[tostring(id)] = nil
        sortMedicList()
    end
    
    if shouldUpdateDispatch then
        TriggerClientEvent('qf_mdt:updateDispatch', -1, SERVER.dispatchData)
    end
    if shouldUpdateS4 then
        TriggerClientEvent('qf_mdt:updateS4', -1, SERVER.s4)
    end
    if Config.Jobs[xPlayer.job.name] then
        SERVER.medics[tostring(id)] = {
            status = _L("STATUS_AVAILABLE"),
            firstname = xPlayer.getName(),
            lastname = '',
            badge = EDITABLE.GetBadge(xPlayer),
            user_grade = xPlayer.job.grade_label,
            user_numer = xPlayer.job.grade
        }
        sortMedicList()
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
        if SERVER.medics[tostring(_source)] then
            if _L("STATUS_" .. status:upper()) ~= SERVER.medics[tostring(_source)].status then
                SERVER.medics[tostring(_source)].status = _L("STATUS_" .. status:upper())
                TriggerClientEvent('qf_mdt:updateStatus', -1, SERVER.medics)
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
    sortMedicList()
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
        medics = {
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
    table.insert(SERVER.dispatchData[index].medics, {
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
    for i=1, #SERVER.dispatchData[index].medics, 1 do
        if SERVER.dispatchData[index].medics[i].id == _source then
            table.remove(SERVER.dispatchData[index].medics, i)
            break
        end
    end
    if #SERVER.dispatchData[index].medics == 0 then
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