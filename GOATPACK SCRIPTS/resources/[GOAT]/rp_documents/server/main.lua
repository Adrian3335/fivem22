local cooldown = {}


RegisterCommand("dowod", function(source)
    
    local xPlayer = ESX.GetPlayerFromId(source)

    if cooldown[source] == true then
        return
    end

    cooldown[source] = true
    CreateThread(function()
        Wait(1000*5)
        cooldown[source] = false
    end)
    
    local playerLicenses = {}
    local result2 = MySQL.query.await('SELECT * FROM `user_licenses` WHERE owner = ?', {xPlayer.identifier})
    for i = 1, #(result2) do
        playerLicenses[result2[i].type] = true
    end

    local sex = "Twoja stara"
    if xPlayer.get('sex') == "m" then 
        sex = "Mężczyzna"
    else
        sex = "Kobieta" 
    end

    local driveLicenses = ""

    if playerLicenses["drive_a"] then
        driveLicenses = "<span class='green'>A</span>"
    else
        driveLicenses = "<span class='red'>A</span>"
    end

    if playerLicenses["drive_b"] then
        driveLicenses = driveLicenses .. " <span class='green'>B</span>"
    else
        driveLicenses = driveLicenses .. " <span class='red'>B</span>"
    end

    if playerLicenses["drive_c"] then
        driveLicenses = driveLicenses .. " <span class='green'>C</span>"
    else
        driveLicenses = driveLicenses .. " <span class='red'>C</span>"
    end

    local licenses = ""
    
    if playerLicenses["nnw"] then
        licenses = licenses .. " <span class='green'>NW</span>"
    else
        licenses = licenses .. " <span class='red'>NW</span>"
    end

    if playerLicenses["oc"] then
        licenses = licenses .. " <span class='green'>OC</span>"
    else
        licenses = licenses .. " <span class='red'>OC</span>"
    end

    local playerData = {
        fullName = xPlayer.getName(),
        date = xPlayer.get('dateofbirth'),
        sex = sex,
        weapon = (playerLicenses["weapon"] and "<span class='green'>TAK</span>" or "<span class='red'>NIE</span>"),
        licence = licenses,
        drive = driveLicenses,
    }

    TriggerClientEvent("goat_documents:playAnim", source, 'dowod')
    Wait(2000)

    local coords = GetEntityCoords(GetPlayerPed(source))
    for _, id in pairs(ESX.GetPlayers()) do
        if #(coords - GetEntityCoords(GetPlayerPed(id))) < 7 then
            TriggerClientEvent('goat_documents:showDocument', id, 'dowod', playerData)
        end
    end
end)

RegisterCommand("wizytowka", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if cooldown[source] == true then
        return
    end
    
    cooldown[source] = true
    CreateThread(function()
        Wait(1000*5)
        cooldown[source] = false
    end)

    local job = xPlayer.getJob()

    local playerData = {
        firstname = xPlayer.get('firstName'),
        phone = exports["lb-phone"]:GetEquippedPhoneNumber(source),
        account = xPlayer.get("iban"),
        jobLabel = job.label,
        gradeLabel = job.grade_label,
    }

    TriggerClientEvent("goat_documents:playAnim", source, 'wizytowka')
    Wait(2000)

    local coords = GetEntityCoords(GetPlayerPed(source))
    for _, id in pairs(ESX.GetPlayers()) do
        if #(coords - GetEntityCoords(GetPlayerPed(id))) < 7 then
            TriggerClientEvent('goat_documents:showDocument', id, 'wizytowka', playerData)
        end
    end
end) 

RegisterCommand("odznaka", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

  
    if cooldown[source] == true then
        return
    end
    
    cooldown[source] = true
    CreateThread(function()
        Wait(1000*5)
        cooldown[source] = false
    end)

    local job = xPlayer.getJob()
    if job.name == 'police' or job.name == 'lssd' then
        
        local playerLicenses = {}
        local jobLicense = ""
        local badge = MySQL.scalar.await('SELECT badge FROM users WHERE identifier = ?', {xPlayer.identifier})
        local result1 = MySQL.query.await('SELECT * FROM `licenses` WHERE type LIKE "%police_%"', {identifier})
        local result2 = MySQL.query.await('SELECT * FROM `user_licenses` WHERE owner = ? AND type LIKE "%police_%"', {xPlayer.identifier})
        for i = 1, #(result2) do
            playerLicenses[result2[i].type] = true
        end
        for i = 1, #(result1) do
            if playerLicenses[result1[i].type] then
                jobLicense = jobLicense .. " <span class='green'>" .. result1[i].label .. "</span>"
            else
                jobLicense = jobLicense .. " <span class='red'>" .. result1[i].label .. "</span>"
            end
        end

        local playerData = {
            fullName = xPlayer.getName(),
            odznaka = badge,
            gradeLabel = job.grade_label,
            jobLicence = jobLicense,
        }

        TriggerClientEvent("goat_documents:playAnim", source, 'odznaka')
        Wait(1500)

        local coords = GetEntityCoords(GetPlayerPed(source))
        for _, id in pairs(ESX.GetPlayers()) do
            if #(coords - GetEntityCoords(GetPlayerPed(id))) < 7 then
                if job.name == 'police' then
                    TriggerClientEvent('goat_documents:showDocument', id, 'odznaka', playerData)
                else
                    TriggerClientEvent('goat_documents:showDocument', id, 'odznakaLSSD', playerData)
                end
            end
        end
    else
        return
    end
end) 


RegisterCommand("legitymacja", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if cooldown[source] == true then
        return
    end
    
    cooldown[source] = true
    CreateThread(function()
        Wait(1000*5)
        cooldown[source] = false
    end)

    local job = xPlayer.getJob()
    if (job.name == 'ambulance' or job.name == 'doj' or job.name == 'mechanic') == false then
        return
    end

    local badge = MySQL.scalar.await('SELECT badge FROM users WHERE identifier = ?', {xPlayer.identifier})
    local playerData = {
        fullName = xPlayer.getName(),
        odznaka = badge,
        gradeLabel = job.grade_label
    }
    
    TriggerClientEvent("goat_documents:playAnim", source, 'odznaka')
    Wait(1500)

    local coords = GetEntityCoords(GetPlayerPed(source))
    for _, id in pairs(ESX.GetPlayers()) do
        if #(coords - GetEntityCoords(GetPlayerPed(id))) < 7 then
            TriggerClientEvent('goat_documents:showDocument', id, job.name, playerData)
        end
    end
end) 