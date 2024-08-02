RegisterNetEvent("goat_jct:makeIdCard", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local firstName = "Imię: " .. xPlayer.get("firstName")
    local toAdd = 32 - #firstName
    if toAdd > 0 then
        for i = 1, toAdd do
            firstName = firstName .. " "
        end
    end

    local lastName = "Nazwisko: " .. xPlayer.get("lastName")
    toAdd = 32 - #lastName
    if toAdd > 0 then
        for i = 1, toAdd do
            lastName = lastName .. " "
        end
    end

    local dateofbirth = "Data Urodzenia: " .. xPlayer.get("dateofbirth")
    toAdd = 32 - #dateofbirth
    if toAdd > 0 then
        for i = 1, toAdd do
            dateofbirth = dateofbirth .. " "
        end
    end

    local sex = "Płeć: " .. (xPlayer.get("sex") == "m" and "Mężczyzna" or "Kobieta")
    toAdd = 32 - #sex
    if toAdd > 0 then
        for i = 1, toAdd do
            sex = sex .. " "
        end
    end

    local height = "Wzrost: " .. xPlayer.get("height")
    toAdd = 32 - #height
    if toAdd > 0 then
        for i = 1, toAdd do
            height = height .. " "
        end
    end

    exports.ox_inventory:AddItem(_source, "identity_card", 1, {
        description = firstName .. "\n" .. lastName .. "\n" .. dateofbirth .. "\n" .. sex .. "\n" .. height,
        firstName = firstName,
        lastName = lastName,
        dateofbirth = dateofbirth,
        sex = sex,
        height = height
    })
end)

lib.callback.register("goat_jct:getVehicleSubowners", function(source, plate)
    local xPlayer = ESX.GetPlayerFromId(source)
    local result = MySQL.single.await("SELECT `id`, `subowners` FROM `owned_vehicles` WHERE `owner` = @identifier AND `plate` = @plate", {["@identifier"] = xPlayer.identifier, ["@plate"] = plate})
    if not result then
        return false
    end
    if not result.subowners then
        result.subowners = {}
    end

    local subowners = {}
    for k, v in pairs(result.subowners) do
        local result = MySQL.single.await("SELECT `firstname`, `lastname` FROM `users` WHERE `identifier` = ?", {v})
        subowners[tonumber(k)] = {identifier = v, label = result.firstname .. " " .. result.lastname}
    end

    return {id = result.id, subowners = subowners}
end)

lib.callback.register("goat_jct:addVehicleSubowner", function(source, vehId, target)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(target)
    local identifier = xTarget.identifier
    local result = MySQL.single.await("SELECT `plate`, `subowners` FROM `owned_vehicles` WHERE `owner` = @identifier AND `id` = @id", {["@identifier"] = xPlayer.identifier, ["@id"] = vehId})
    if not result then
        return "error"
    end
    if not result.subowners then
        result.subowners = {}
    end
    
    if xPlayer.getAccount("bank").money < Config.AddKeysPrice then
        return "money"
    end
    xPlayer.removeAccountMoney("bank", Config.AddKeysPrice)

    local can = true
    local num = 1
    for k, v in pairs(result.subowners) do
        num = num + 1
        if v == identifier then
            can = false
            break
        end
    end

    if not can then
        return "error"
    end

    result.subowners[tostring(num)] = identifier
    MySQL.update.await("UPDATE owned_vehicles SET subowners = ? WHERE `id` = ?", {json.encode(result.subowners), vehId})
    xTarget.showNotification("Nadano Ci klucze do pojazdu [" .. string.upper(result.plate) .. "]")
    return "success"
end)

lib.callback.register("goat_jct:removeVehicleSubowner", function(source, vehId, identifier)
    local xPlayer = ESX.GetPlayerFromId(source)
    local result = MySQL.single.await("SELECT `subowners` FROM `owned_vehicles` WHERE `owner` = @identifier AND `id` = @id", {["@identifier"] = xPlayer.identifier, ["@id"] = vehId})
    if not result then
        return false
    end
    if not result.subowners then
        result.subowners = {}
    end

    for k, v in pairs(result.subowners) do
        if v == identifier then
            result.subowners[k] = nil
            break
        end
    end
    
    MySQL.update.await("UPDATE owned_vehicles SET subowners = ? WHERE `id` = ?", {json.encode(result.subowners), vehId})
    return true
end)

RegisterNetEvent("goat_jct:setJob", function(job) 
    if job == 'unemployed' or job == 'sadownik' or job == 'winemaker' or job == 'taxi' or job == 'sushi' then
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
        if xPlayer ~= nil then
            xPlayer.setJob(job, 0)
            TriggerClientEvent('esx:showNotification', _source, 'Zatrudniłeś się w nowej pracy!')
        end
    else
        DropPlayer(source, 'Nie musisz sie zatrudniac tutaj!')
    end
end)