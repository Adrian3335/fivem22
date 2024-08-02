handcuffs = {}
bellused = {}

if GetResourceState("esx_society") ~= 'missing' then
    TriggerEvent('esx_society:registerSociety', 'police', 'Policja', 'society_police', 'society_police', 'society_police', {type = 'public'})
end

if GetResourceState("ox_inventory") ~= 'missing' then
    exports.ox_inventory:RegisterStash("society_police_armory", 'Zbrojownia ', 200, 5000000, nil, {['police'] = 0}, vector3(461.79, -998.21, 31.74))
    exports.ox_inventory:RegisterStash("society_police_armory_2", 'Zbrojownia', 500, 5000000, nil, {['police'] = 0}, vector3(458.843, -979.079, 29.7393))
end

AddEventHandler("esx:playerLoaded", function(playerId, xPlayer)
    for k,v in pairs(handcuffs) do
        if v == xPlayer.getIdentifier() then
            TriggerClientEvent("fumoPolice:handcuffs", playerId)
            break
        end
    end
end)

RegisterServerEvent("fumoPolice:handcuffs", function(player, numHandcuffs)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(player)
    local info = {state = false, key = nil}

    if xPlayer.getJob().name == "police" then
        local me, ped = GetPlayerPed(source), GetPlayerPed(player)
        local meCoords, pedCoords = GetEntityCoords(me), GetEntityCoords(ped)

        for k,v in pairs(handcuffs) do
            if v == xTarget.getIdentifier() then
                info = {state = true, key = k}
                break
            end
        end
    
        if #(meCoords - pedCoords) <= 3.0 then
            if info.state then
                if numHandcuffs > 0 then
                    table.remove(handcuffs, info.key)
                    -- local sound = exports["high_3dsounds"]:Play3DPos(-1, "uncuff"..ped, pedCoords, 10.0, "uncuff", 1.5, false)
                    -- sound.modify("destroyOnFinish", true)
                    TriggerClientEvent("fumoPolice:handcuffs", player)
                else
                    xPlayer.showNotification("Nie posiadasz kajdanek")
                end
            else
                if numHandcuffs > 0 then
                    -- local sound = exports["high_3dsounds"]:Play3DPos(-1, "cuff"..ped, pedCoords, 10.0, "cuff", 1.5, false)
                    -- sound.modify("destroyOnFinish", true)
                    table.insert(handcuffs, xTarget.getIdentifier())
                    TriggerClientEvent("fumoPolice:handcuffs", player)
                else
                    xPlayer.showNotification("Nie posiadasz kajdanek")
                end
            end
        else
            print('[fumoPolice]: Potencjalny cheater ID: '..source)
        end
    end
end)

RegisterServerEvent("fumoPolice:getItemFromGround", function(item, netId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local entity = NetworkGetEntityFromNetworkId(netId)
    DeleteEntity(entity)
    xPlayer.addInventoryItem(item, 1)
end)

RegisterNetEvent("fumoPolice:bell", function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if bellused[xPlayer.getIdentifier()] then
        xPlayer.showNotification("Musisz odczekac chwilę")
    else
        xPlayer.showNotification("Dyżurny przekazał policjantom że oczekujesz")
        local xPlayers = ESX.GetExtendedPlayers('job', 'police')
        for _, police in pairs(xPlayers) do
            police.showNotification("Obywatel oczekuje przy dyżurce")
        end
        bellused[xPlayer.getIdentifier()] = true
        SetTimeout(cfg.bell, function()
            bellused[xPlayer.getIdentifier()] = nil
        end)
    end
end)

lib.callback.register('fumoPolice:setBadge', function(source, pId, badge)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(pId)

    if xPlayer.getJob().grade_name == 'boss' then
        if xTarget then
            local jobname = xTarget.getJob().name
            if jobname == 'police' or jobname == 'ambulance' or jobname == 'mechanic' or jobname == 'lssd' then
                local updateBadge = MySQL.update.await('UPDATE users SET badge = ? WHERE identifier = ?', {
                    badge, xTarget.getIdentifier()
                })
                if updateBadge then
                    return true
                end
            end
        else
            return false
        end
    else
        return false
    end
end)

lib.callback.register('fumoPolice:getLicenses', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    local response = MySQL.query.await('SELECT user_licenses.type, licenses.label FROM user_licenses LEFT JOIN licenses ON user_licenses.type = licenses.type WHERE owner = ?', {identifier})

    if #response > 0 then
        return response
    end
end)

lib.callback.register('fumoPolice:getEmployees', function()
	local p = promise.new()
    local employees = {}
    local xPlayers = ESX.GetExtendedPlayers('job', "police")
   
	for i=1, #(xPlayers) do 
		local xPlayer = xPlayers[i]
        local name = xPlayer.get('firstName') .. ' ' .. xPlayer.get('lastName')
        table.insert(employees, {
            data = {identifier = xPlayer.identifier},
            cols = {
                name,
                "{{Zarządzaj Licencjami|manage}}"
            }
        })
    end

    MySQL.query("SELECT identifier, firstname, lastname FROM `users` WHERE `job`= ?", {"police"}, function(result)
		for i = 1, #(result) do
            local row = result[i]
            local alreadyInTable
            local identifier = row.identifier

            for j = 1, #(employees) do
                if employees[j].data.identifier == identifier then
                    alreadyInTable = true
                end
            end

            if not alreadyInTable then
                table.insert(employees, {
                    data = {identifier = identifier},
                    cols = {
                        row.firstname .. " " .. row.lastname,
                        "{{Zarządzaj Licencjami|manage}}"
                    }
                })
            end
        end

        p:resolve(employees)
    end)

    return Citizen.Await(p)
end)

-- lib.callback.register('fumoPolice:getEmployeesLSSD', function()
--     local employees = {}
--     local xPlayers = ESX.GetExtendedPlayers('job', "lssd")

-- 	for i=1, #(xPlayers) do 
-- 		local xPlayer = xPlayers[i]
--         local name = xPlayer.get('firstName') .. ' ' .. xPlayer.get('lastName')
--         table.insert(employees, {
--             data = {identifier = xPlayer.identifier},
--             cols = {
--                 name,
--                 "{{Zarządzaj Licencjami|manage}}"
--             }
--         })
--     end

--     return employees
-- end)


lib.callback.register('fumoPolice:getEmployeeLicenses', function(source, identifier)
    local playerLicenses = {}
    local result2 = MySQL.query.await('SELECT * FROM `user_licenses` WHERE owner = ? AND type LIKE "%police_%"', {identifier})
    for i = 1, #(result2) do
        playerLicenses[result2[i].type] = true
    end

    local licenses = {}
    local result1 = MySQL.query.await('SELECT * FROM `licenses` WHERE type LIKE "%police_%"', {identifier})
    for i = 1, #(result1) do
        local status = "❌"
        local button = "{{Nadaj Licencje|give}}"
        if playerLicenses[result1[i].type] then
            status = "✔️"
            button = "{{Zabierz Licencje|remove}}"
        end
        licenses[i] = {
            data = {type = result1[i].type},
            cols = {
                result1[i].label,
                status,
                button
            }
        }
    end
    return licenses
end)


lib.callback.register('fumoPolice:getPoliceLicenses', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerLicenses = {}
    local result2 = MySQL.query.await('SELECT * FROM `user_licenses` WHERE owner = ? AND type LIKE "%police_%"', {xPlayer.identifier})
    for i = 1, #(result2) do
        playerLicenses[result2[i].type] = true
    end
    return playerLicenses
end)

lib.callback.register("fumoPolice:giveLicense", function(source, identifier, type)
    MySQL.insert('INSERT INTO user_licenses (type, owner) VALUES (?, ?)', {type, identifier})
    return
end)
lib.callback.register("fumoPolice:removeLicense", function(source, identifier, type)
    MySQL.insert('DELETE FROM user_licenses WHERE type = ? AND owner = ?', {type, identifier})
    return
end)

RegisterNetEvent('fumoPolice:addCarToPoliceParking', function(vehicleProps)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
        ['@owner'] = identifier
    }, function(result2) 
        local foundVehicleId = nil 
        for i=1, #result2, 1 do 				
            local vehicle = json.decode(result2[i].vehicle)
            if vehicle.plate == vehicleProps.plate then
                foundVehiclePlate = result2[i].plate
                break
            end
        end
        if foundVehiclePlate ~= nil then
            MySQL.Async.execute('UPDATE owned_vehicles SET vehicle = @vehicle, vehicleid = NULL, state = 2 WHERE plate = @plate', {
                ['@vehicle'] 	= json.encode(vehicleProps),
                ['@plate']      = vehicleProps.plate
            }) 
        end
    end)
end)