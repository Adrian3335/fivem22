EDITABLE = {}

EDITABLE.GetBadge = function(xPlayer)
    if xPlayer.get('badge') then
        local badge = json.decode(xPlayer.get('badge')) 
									
        if badge.badge then 
            badge.badge = badge.badge
            return '['..badge.badge..']'
        else
            badge.badge = 0
            return '['..badge.badge..']'
        end
    else
        return ""
    end
end



EDITABLE.ConvertTime = function(time)
    if not time then
        return "00:00:00"
    end
    local hours = math.floor(time/60)
    remaining = time % 60
    local minutes = math.floor(remaining)
    remaining = remaining % 60
    local seconds = 0
    if (hours < 10) then
        hours = "0" .. tostring(hours)
    end
    if (minutes < 10) then
        minutes = "0" .. tostring(minutes)
    end
    if (seconds < 10) then
        seconds = "0" .. tostring(seconds)
    end
    answer = hours..':'..minutes .. ":00"
    return answer
end

EDITABLE.GetTime = function(xPlayer)
    return EDITABLE.ConvertTime(MySQL.scalar.await('SELECT time FROM user_time_rank_police WHERE identifier = ?', {xPlayer.identifier}))
end


local mmmModel = ''
local gettedModel = false
local inProgress = false
function getVehicleModel(pSource, modelID)
    if inProgress then return end
    inProgress = true
    gettedModel = false

    TriggerClientEvent('qf_mdt:getVehicleModel', pSource, modelID)

    while not gettedModel do
        Wait(200)
    end

    return mmmModel
end

RegisterServerEvent('qf_mdt:backVehicleModel', function(model)
    mmmModel = model
    gettedModel = true
    inProgress = false
end)

RegisterServerEvent('qf_mdt:addNote', function(title, content)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.query('SELECT annid FROM lsc_mdt_notes ORDER BY id DESC LIMIT 1', function(lastIndex)
        local lI = 1
        if #lastIndex > 0 then
            lI = lastIndex[1].annid + 1
        end
            
        MySQL.insert('INSERT INTO lsc_mdt_notes (identifier, title, content, time, annid) VALUES (?, ?, ?, ?, ?)', {xPlayer.identifier, title, content, os.time(), lI})
    end)

    Wait(500)

    local notes = MySQL.query.await('SELECT title, content, annid FROM lsc_mdt_notes WHERE identifier = ? ORDER BY time', {xPlayer.identifier})
    TriggerClientEvent('qf_mdt:updatePersonalNotes', _source, notes)

end)

RegisterServerEvent('qf_mdt:deleteNote', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    MySQL.update('DELETE FROM lsc_mdt_notes WHERE annid = ? AND identifier = ?', {data, xPlayer.identifier})

    local notes = MySQL.query.await('SELECT title, content, annid FROM lsc_mdt_notes WHERE identifier = ? ORDER BY time', {xPlayer.identifier})
    TriggerClientEvent('qf_mdt:updatePersonalNotes', _source, notes)
end)

function updateLastNotes2(src)
    SERVER.lastNotes = {
        vehicles = {},
        citizen = {}
    }

    local getLastCitizenNotes2 = MySQL.query.await('SELECT * FROM lsc_mdt_fines ORDER BY date DESC LIMIT 5')
    local getLastVehicleNotes = MySQL.query.await('SELECT * FROM qf_mdt_vehicle_notes ORDER BY date DESC LIMIT 5')
    
    for i = 1, #getLastCitizenNotes2, 1 do
        local name = MySQL.scalar.await('SELECT CONCAT(firstname, " ", lastname) FROM users WHERE identifier = ?', {getLastCitizenNotes2[i].identifier})


        table.insert(SERVER.lastNotes.citizen, {
            name = name or "",
            fine = getLastCitizenNotes2[i].fine,
            date = getLastCitizenNotes2[i].date,
            reason = getLastCitizenNotes2[i].reason,
            medic = getLastCitizenNotes2[i].medic
        })
    end

    for i = 1, #getLastVehicleNotes, 1 do
        local vehicles = MySQL.query.await('SELECT vehicle, owner FROM owned_vehicles WHERE plate = ?', {getLastVehicleNotes[i].plate})
        local owner = MySQL.query.await('SELECT firstname, lastname FROM users WHERE identifier = ?', {vehicles[1].owner})

        local modelAuta = json.decode(vehicles[1].vehicle).model
        local newModel = getVehicleModel(src, modelAuta)

        table.insert(SERVER.lastNotes.vehicles, {
            model = newModel,
            plate = getLastVehicleNotes[i].plate:upper(),
            reason = getLastVehicleNotes[i].note,
            date = getLastVehicleNotes[i].date,
            owner = owner[1].firstname .. ' ' .. owner[1].lastname,
            medic = getLastVehicleNotes[i].medic
        })
    end

    TriggerClientEvent('qf_mdt:updateLastNotes2', -1, SERVER.lastNotes)
end

ESX.RegisterServerCallback('qf_mdt:getMDTData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local data = {
        firstname = xPlayer.getName(),
        lastname = '',
        badge = EDITABLE.GetBadge(xPlayer),
        dutyTime = EDITABLE.GetTime(xPlayer),
        job = {
            name = xPlayer.job.name,
            grade = xPlayer.job.grade,
            label = xPlayer.job.label,
            grade_label = xPlayer.job.grade_label,
            grade_name = xPlayer.job.grade_name,
            onDuty = true
        }
    }
    local notes = MySQL.query.await('SELECT title, content, annid FROM lsc_mdt_notes WHERE identifier = ? ORDER BY time', {xPlayer.identifier})

    updateLastNotes2(source)

    cb(data, notes, SERVER.annoucements, SERVER.medics)
end)





RegisterServerEvent('qf_mdt:addAnnoucement', function(title, content)
    local _source = source
    MySQL.query('SELECT annid FROM qf_mdt_annoucements ORDER BY id DESC LIMIT 1', function(lastIndex)
        local lI = 1
        if #lastIndex > 0 then
            lI = lastIndex[1].annid + 1
        end

        MySQL.insert('INSERT INTO qf_mdt_annoucements (title, content, time, annid) VALUES (?, ?, ?, ?)', {title, content, os.time(), lI})
    end)

    Wait(200)
    
    local announs = MySQL.query.await('SELECT title, content, annid FROM qf_mdt_annoucements ORDER BY time LIMIT 25')
    SERVER.annoucements = announs
    TriggerClientEvent('qf_mdt:updateAnnoucements', -1, announs)
end)

ESX.RegisterServerCallback('qf_mdt:getCitizenIdentifier', function(source, cb, target)
    local zPlayer = ESX.GetPlayerFromId(target)
    MySQL.query('SELECT identifier, firstname, lastname, dateofbirth, sex FROM users WHERE identifier = ? LIMIT 3', {zPlayer.identifier}, function(results)
        cb(results)
    end)
end)

ESX.RegisterServerCallback('qf_mdt:searchCitizen', function(source, cb, value)
    MySQL.query('SELECT identifier, firstname, lastname, dateofbirth, sex FROM users WHERE LOWER(CONCAT(`firstname`, " " ,`lastname`)) LIKE "%' .. value:lower() .. '%" LIMIT 30', {}, function(results)
        cb(results)
    end)
end)

ESX.RegisterServerCallback('qf_mdt:searchVehicle', function(source, cb, value)
    MySQL.query('SELECT owner, plate, vehicle FROM owned_vehicles WHERE plate = ?', {value:upper()}, function(results)
        for i=1, #results, 1 do
            local x = json.decode(results[i].vehicle)
            results[i].model = x.model
        end
        cb(results)
    end)
end)


ESX.RegisterServerCallback('qf_mdt:getData', function(source, cb, data)
    if data.type == 'vehicle' then
        MySQL.query('SELECT owner, co_owner, plate, vehicle FROM owned_vehicles WHERE plate = ? LIMIT 1', {data.identifier:upper()}, function(results)
            local result = {}
            
            if not results[1] then
                return cb(nil)
            end

            local vehicle = json.decode(results[1].vehicle).model

            result.plate = results[1].plate
            result.type = "vehicle"
            result.model = getVehicleModel(source, vehicle)

            for i=1, #results, 1 do
                local owner = MySQL.single.await('SELECT identifier, firstname, lastname FROM users WHERE identifier = ?', {results[i].owner})
                if not owner then
                    return cb(nil)
                end
                result['owner'] = owner
            end
            
            for i=1, #results, 1 do
                local co_owner = MySQL.single.await('SELECT identifier, firstname, lastname FROM users WHERE identifier = ?', {results[i].co_owner})
                result['subowner'] = co_owner
            end

            if not result.subowner then
                result.subowner = {
                    identifier = "",
                    firstname = "",
                    lastname = ""
                }
            end

            local notes = MySQL.query.await('SELECT * FROM qf_mdt_vehicle_notes WHERE plate = ? ORDER BY date DESC', {data.identifier:upper()})
            result.notes = notes or {}
            cb(result)
        end)
    end
    if data.type == 'citizen' then
        MySQL.single('SELECT identifier, firstname, lastname, dateofbirth, sex, NULL as avatar FROM users WHERE identifier = ? LIMIT 1', {data.identifier}, function(results)
            local result = {}
            if not results then
                return cb(nil)
            end
            result = results
            result.type = "citizen"
            result.licenses = {
                oc_insurance = false,
                nnw_insurance = false,
            }
            local licenses = MySQL.query.await('SELECT type FROM user_licenses WHERE owner = ?', {data.identifier})
            for i=1, #licenses, 1 do
                if results.licenses[licenses[i].type] ~= nil then
                    results.licenses[licenses[i].type] = true
                end
            end
            local fines = MySQL.query.await('SELECT * FROM lsc_mdt_fines WHERE identifier = ? ORDER BY date DESC', {data.identifier})
            result.fines = fines or {}
            local jails = MySQL.query.await('SELECT * FROM qf_mdt_jails WHERE identifier = ? ORDER BY date DESC', {data.identifier})
            result.jails = jails or {}
            local notes = MySQL.query.await('SELECT * FROM qf_mdt_citizen_notes WHERE identifier = ? ORDER BY date DESC', {data.identifier})
            result.notes = notes or {}
            result.vehicles = {}
            local vehicles = MySQL.query.await('SELECT plate, vehicle FROM owned_vehicles WHERE owner = ?', {data.identifier})
            for i=1, #vehicles, 1 do
                local vehicle = json.decode(vehicles[i].vehicle).model
                table.insert(result.vehicles, {
                    plate = vehicles[i].plate,
                    model = getVehicleModel(source, vehicle),
                    status = "-" --// @TODO TAGS IN DB
                })
            end

            cb(result)
        end)
    end
end)

RegisterServerEvent('qf_mdt:addVehicleNote', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not Config.Jobs[xPlayer.job.name] then
        return
    end
    local medic = EDITABLE.GetBadge(xPlayer) .. " " .. xPlayer.getName()
    MySQL.insert('INSERT INTO qf_mdt_vehicle_notes (plate, date, note, medic) VALUES (?, ?, ?, ?)', {data.plate:upper(), os.time(), data.note, medic})
    local model = MySQL.scalar.await('SELECT vehicle FROM owned_vehicles WHERE plate = ?', {data.plate:upper()})
    if #SERVER.lastNotes.vehicles > 5 then
        table.remove(SERVER.lastNotes.vehicles, 1)
    end
    local owner = MySQL.scalar.await('SELECT CONCAT(users.firstname, " ", users.lastname) FROM owned_vehicles INNER JOIN users ON users.identifier = owned_vehicles.owner WHERE plate = ?', {data.plate:upper()})
    local vehicle = json.decode(model[1].vehicle).model

    table.insert(SERVER.lastNotes.vehicles, {
        model = getVehicleModel(_source, vehicle),
        plate = data.plate:upper(),
        reason = data.note,
        date = os.time(),
        owner = owner or "",
        medic = medic
    })
end)

RegisterServerEvent('qf_mdt:deleteVehicleNote', function(data)
    local _source = source
    MySQL.update('DELETE FROM qf_mdt_vehicle_notes WHERE id = ? AND plate = ?', {data.id, data.plate})
    updateLastNotes2(_source)
end)

RegisterServerEvent('qf_mdt:addCitizenNote', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not Config.Jobs[xPlayer.job.name] then
        return
    end
    local medic = EDITABLE.GetBadge(xPlayer) .. " " .. xPlayer.getName()
    MySQL.insert('INSERT INTO qf_mdt_citizen_notes (identifier, date, reason, medic) VALUES (?, ?, ?, ?)', {data.identifier, os.time(), data.note, medic})
    local name = MySQL.scalar.await('SELECT CONCAT(firstname, " ", lastname) FROM users WHERE identifier = ?', {data.identifier})
    if #SERVER.lastNotes.citizen > 5 then
        table.remove(SERVER.lastNotes.citizen, 1)
    end
    table.insert(SERVER.lastNotes.citizen, {
        name = name or "",
        date = os.time(),
        reason = data.note,
        medic = medic
    })
end)


RegisterServerEvent('qf_mdt:deleteCitizenNote', function(data)
    local _source = source
    MySQL.update('DELETE FROM qf_mdt_citizen_notes WHERE id = ? AND identifier = ?', {data.id, data.identifier})
    updateLastNotes2(_source)
end)

RegisterServerEvent('qf_mdt:submitFineLSC', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not Config.Jobs[xPlayer.job.name] then
        return
    end
    if not data.identifier then
        return
    end
    local zPlayer = ESX.GetPlayerFromIdentifier(data.identifier)

    if zPlayer then
        local xCoords = GetEntityCoords(GetPlayerPed(xPlayer.source))
        local zCoords = GetEntityCoords(GetPlayerPed(zPlayer.source))

        if #(xCoords - zCoords) > 15 then
            return xPlayer.showNotification('Taki obywatel jest za daleko')
        end

        if data.fine and data.fine > 0 then
            TriggerEvent('esx_addonaccount:getSharedAccount', 'society_police', function(account)
                if account then
                    local x = xPlayer.getAccount('bank').money
                    
                    account.addMoney(data.fine * 0.80)
                    xPlayer.addAccountMoney('bank', data.fine * 0.20)
                    
                end
            end)
            local z = zPlayer.getAccount('bank').money
            zPlayer.removeAccountMoney('bank', data.fine)
        end

        if data.jail and data.jail > 0 then
            xPlayer.showNotification('Wystawiłeś wyrok dla gracza [' .. zPlayer.source .. '] na ' .. data.fine .. ' $ i ' .. data.jail .. ' miesięcy')
            zPlayer.showNotification('Otrzymałeś wyrok od  [' .. xPlayer.source .. '] na ' .. data.fine .. ' $ i ' .. data.jail .. ' miesięcy')
            TriggerEvent('esx_jail:jailOnNewPlayer', tonumber(zPlayer.source), tonumber(data.jail * 60))
            MySQL.insert('INSERT INTO qf_mdt_jails (identifier, reason, fine, jail, date, medic) VALUES (?, ?, ?, ?, ?, ?)', {data.identifier, data.reason, data.fine, data.jail, os.time(), data.medic})
        else
            xPlayer.showNotification('Wystawiłeś fakture dla gracza [' .. zPlayer.source .. '] na ' .. data.fine .. ' $')
            zPlayer.showNotification('Otrzymałeś fakture od  [' .. xPlayer.source .. '] na ' .. data.fine .. ' $')
            MySQL.insert('INSERT INTO lsc_mdt_fines (identifier, reason, fine, date, medic) VALUES (?, ?, ?, ?, ?)', {data.identifier, data.reason, data.fine, os.time(), data.medic})
        end
    else
        xPlayer.showNotification('Taki obywatel nie jest dostępny')
    end
end)

function updateLastFines2(src)
    SERVER.lastFines2 = {}

    local getLastFines2 = MySQL.query.await('SELECT reason, fine, date, medic FROM lsc_mdt_fines ORDER BY date DESC LIMIT 5')
    
    for i = 1, #getLastFines, 1 do
        table.insert(SERVER.lastFines2, {
            reason = getLastFines2[i].reason,
            fine = getLastFines2[i].fine,
            date = getLastFines2[i].date,
            medic = getLastFines2[i].medic
        })
    end

    TriggerClientEvent('qf_mdt:updateLastFines2', -1, SERVER.lastFines)
end