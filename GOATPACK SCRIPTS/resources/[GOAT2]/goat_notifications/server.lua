local allowedJobs = {
    "police",
    "ambulance",
    "lssd",
    "mechanic"
}

local CheckBodyCam = function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.get("firstName") .. " " .. xPlayer.get("lastName")
    local allow = false
    for i = 1, #allowedJobs do
        if xPlayer.job.name == allowedJobs[i] then
            allow = true
            break
        end
    end
    if allow then
        TriggerClientEvent("diablohub_notifications:ToggleBodyCam", source, true, name, xPlayer.job.label .. " - " .. xPlayer.job.grade_label)
    else
        TriggerClientEvent("diablohub_notifications:ToggleBodyCam", source, false, name, xPlayer.job.label .. " - " .. xPlayer.job.grade_label)
    end
end

RegisterNetEvent("esx:playerLoaded", CheckBodyCam)
RegisterNetEvent("esx:setJob", CheckBodyCam)

RegisterNetEvent("diablohub_notifications:notifyAccept", function(playerId)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name == "ambulance" then
        TriggerClientEvent("esx:showNotification", playerId, "Twoje zgłoszenie zostało zaakceptowane!")

        local xPlayers = ESX.GetExtendedPlayers("job", "ambulance")
        local name = xPlayer.get("firstName") .. " " .. xPlayer.get("lastName")
        for i = 1, #(xPlayers) do
            TriggerClientEvent("esx:showNotification", xPlayers[i].source, name .. " zaakceptował zgłoszenie!")
        end
    else
        TriggerClientEvent("esx:showNotification", source, "Zaakceptowałeś zgłoszenie!")
    end
end)

GlobalState.ActiveGPS = {}
ESX.RegisterUsableItem("gps", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not Config.GPS[xPlayer.job.name] then
        xPlayer.showNotification("Nie posiadasz autoryzacji do użycia GPS'a")
        return
    end

    local ActiveBlips = GlobalState.ActiveGPS
    if ActiveBlips[source] then
        ActiveBlips[source] = nil
        xPlayer.showNotification("Wyłączyłeś GPS")
        GlobalState.ActiveGPS = ActiveBlips
    else
        local BlipBadge = MySQL.scalar.await('SELECT badge FROM users WHERE identifier = ?', {xPlayer.identifier})
        local BlipLabel = "[" .. BlipBadge .. "] " .. xPlayer.get("firstName") .. " " .. xPlayer.get("lastName")
        local BlipColor = Config.GPS[xPlayer.job.name].color
        local ped = GetPlayerPed(source)
        ActiveBlips = GlobalState.ActiveGPS
        ActiveBlips[source] = {coords = GetEntityCoords(ped), heading = GetEntityHeading(ped), badge = BlipBadge, label = BlipLabel, color = BlipColor}
        GlobalState.ActiveGPS = ActiveBlips
        xPlayer.showNotification("Włączyłeś GPS")
    end

    TriggerClientEvent("goat_gps:off", -1, source)
end)

CreateThread(function()
    while true do
        local ActiveGPS = GlobalState.ActiveGPS
        for source, _ in pairs(ActiveGPS) do
            local ped = GetPlayerPed(source)
            ActiveGPS[source].coords = GetEntityCoords(ped)
            ActiveGPS[source].heading = GetEntityHeading(ped)
        end
        GlobalState.ActiveGPS = ActiveGPS
        Wait(250)
    end
end)

AddEventHandler('esx:playerDropped', function(playerId)
    local ActiveBlips = GlobalState.ActiveGPS
    if not ActiveBlips[playerId] then
        return
    end
    
    ActiveBlips[playerId] = nil
    GlobalState.ActiveGPS = ActiveBlips

    TriggerClientEvent("goat_gps:off", -1, playerId)
end)

RegisterNetEvent("goat_gps:lost", function(coords, str)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local ActiveBlips = GlobalState.ActiveGPS
    if not ActiveBlips[playerId] then
        return
    end
    
    ActiveBlips[playerId] = nil
    GlobalState.ActiveGPS = ActiveBlips

    TriggerClientEvent("goat_gps:off", -1, playerId)
    TriggerClientEvent("goat_gps:lost", -1, playerId, coords, str, xPlayer.get("firstName") .. " " .. xPlayer.get("lastName"), os.date("%H:%M"))
end)

RegisterNetEvent("frp_jobutils:10-13", function()
    local xPlayer = ESX.GetPlayerFromId(source)
	local hasJob = false
    for i = 1, #(Config.AuthorizedJobs["10-13"]) do
        if xPlayer.job.name == Config.AuthorizedJobs["10-13"][i] then
            hasJob = true
            break
        end
    end

	if not hasJob then
		return
	end

	local name = xPlayer.get("firstName") .. " " .. xPlayer.get("lastName")
	local coords = GetEntityCoords(GetPlayerPed(source))

	TriggerClientEvent("frp_jobutils:10-13", -1, source, coords, name, os.date("%H:%M"))
end)


RegisterNetEvent("frp_jobutils:bk", function(num)
    local xPlayer = ESX.GetPlayerFromId(source)
	local hasJob = false
    for i = 1, #(Config.AuthorizedJobs["bk" .. num]) do
        if xPlayer.job.name == Config.AuthorizedJobs["bk" .. num][i] then
            hasJob = true
            break
        end
    end

	if not hasJob then
		return
	end

	local name = xPlayer.get("firstName") .. " " .. xPlayer.get("lastName")
	local coords = GetEntityCoords(GetPlayerPed(source))

	TriggerClientEvent("frp_jobutils:bk" .. num, -1, source, coords, name, os.date("%H:%M"))
end)