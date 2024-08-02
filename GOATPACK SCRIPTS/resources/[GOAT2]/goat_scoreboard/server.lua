local ThreatCode = "green"
local Players = {
    ["police"] = 0,
    ["ambulance"] = 0,
    ["mechanic"] = 0,
    ["lssd"] = 0,
    ["doj"] = 0,

    ["players"] = GetNumPlayerIndices()
}
GlobalState.exiting = {}

MySQL.ready(function()
    local data = MySQL.scalar.await("SELECT code_type FROM kod_zagrozenia", {})

    if data == 1 then
        ThreatCode = "green"
    elseif data == 2 then
        ThreatCode = "orange"
    elseif data == 3 then
        ThreatCode = "red"
    elseif data == 4 then
        ThreatCode = "black"
    end
end)

RegisterNetEvent("goat_scoreboard:server:setCode", function(data)
    MySQL.update('UPDATE kod_zagrozenia SET code_type = ?', {data})

    if data == 1 then
        ThreatCode = "green"
    elseif data == 2 then
        ThreatCode = "orange"
    elseif data == 3 then
        ThreatCode = "red"
    elseif data == 4 then
        ThreatCode = "black"
    end

    TriggerClientEvent("chat:addMessage", -1, { 
        templateId = "message",
        multiline = true,
        args = { "93, 66, 245", "fa-solid fa-tv", "Uwaga Obywatele", "Poziom zagrożenia został zmieniony przez władze miasta obserwuj gazety" }
    })
end)

RegisterNetEvent("esx:playerLoaded", function(playerId, xPlayer)
    Player(playerId).state.streamer = false

    Players["players"] = GetNumPlayerIndices()

    if Players[xPlayer.job.name] then
        local xPlayers = ESX.GetExtendedPlayers("job", xPlayer.job.name)
        Players[xPlayer.job.name] = #xPlayers
    end
end)

RegisterNetEvent("esx:playerDropped", function(playerId, reason)
    local xPlayer = ESX.GetPlayerFromId(playerId)

    Wait(5000)

    if Players[xPlayer.job.name] then
        local xPlayers = ESX.GetExtendedPlayers("job", xPlayer.job.name)
        Players[xPlayer.job.name] = #xPlayers
    end

    Players["players"] = GetNumPlayerIndices()
end)

AddEventHandler('playerDropped', function(reason)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if xPlayer then
        TriggerClientEvent("goat_scoreboard:exit", -1, playerId, GetEntityCoords(GetPlayerPed(playerId)), GetPlayerName(playerId), reason)
    end
end)

RegisterNetEvent("esx:setJob", function(playerId, job, lastjob)
    if Players[job.name] then
        local xPlayers = ESX.GetExtendedPlayers("job", job.name)
      
        Players[job.name] = #xPlayers
    end

    if Players[lastjob.name] then
        local xPlayers = ESX.GetExtendedPlayers("job", lastjob.name)
        Players[lastjob.name] = #xPlayers
    end
end)

ESX.RegisterServerCallback("goat_scoreboard:get", function(source, cb)
    local mod = ESX.GetExtendedPlayers('group', 'mod')
    local admin = ESX.GetExtendedPlayers('group', 'admin')
    local superadmin = ESX.GetExtendedPlayers('group', 'superadmin')
    local best = ESX.GetExtendedPlayers('group', 'best')

    Players["admins"] = #mod + #admin + #superadmin + #best

    cb(Players, ThreatCode)
end)

ESX.RegisterServerCallback("esx_scoreboard:getConnectedCops", function(source, cb)
    cb(Players)
end)

RegisterNetEvent("goat_scoreboard:show", function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.group == "best" then
        return
    end
    TriggerClientEvent("goat_scoreboard:show", -1, source, true)
end)

RegisterNetEvent("goat_scoreboard:hide", function()
    local source = source
    TriggerClientEvent("goat_scoreboard:show", -1, source, nil)
end)

RegisterCommand("streamer", function(source, args, error)
    local state = Player(source).state.streamer

    Player(source).state.streamer = not state

    if not state then
        TriggerClientEvent("esx:showNotification", source, "Włączyłeś tryb streamera!")
    else
        TriggerClientEvent("esx:showNotification", source, "Wyłączyłeś tryb streamera!")
    end
end)