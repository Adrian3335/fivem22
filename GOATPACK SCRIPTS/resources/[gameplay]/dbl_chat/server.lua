GlobalState.narrative = {}
GlobalState.narrative2 = {}
GlobalState.descriptions = {}
RegisterNetEvent("_chat:messageEntered", function(name, a2, message, a3)
    local _source = source
    TriggerClientEvent("dbl_chat:sendMessage", -1, _source, message, name)
   -- exports['dbl_logs']:SendLog(source, "OOC: " ..message, 'ooc')
end)

RegisterCommand("me", function(source, args, raw)
    if source == 0 then
        return
    end
    local message = table.concat(args, " ")
    local name = GetPlayerName(source)
    TriggerClientEvent("dbl_chat:sendMessage2", -1, source, name, message, "fa-solid fa-user", "51, 136, 255")
   -- exports['dbl_logs']:SendLog(source, "ME: " ..message, 'me')

    local narrative = GlobalState.narrative
    if not narrative[source] then
        narrative[source] = {}
    end
    GlobalState.narrative = narrative
    
    narrative = GlobalState.narrative

    local narrative2 = GlobalState.narrative2

    if not narrative2[source] then
        narrative2[source] = 0
    end

    narrative2[source] = narrative2[source] + 1

    local id = "mes-" .. narrative2[source]
    narrative[source][id] = {message = message, color = {51, 136, 255}}
    GlobalState.narrative = narrative
    GlobalState.narrative2 = narrative2

    Wait(5000)
    narrative = GlobalState.narrative
    narrative[source][id] = nil
    GlobalState.narrative = narrative
end)

RegisterCommand("do", function(source, args, raw)
    if source == 0 then
        return
    end
    local message = table.concat(args, " ")
    local name = GetPlayerName(source)
    TriggerClientEvent("dbl_chat:sendMessage2", -1, source, name, message, "fa-solid fa-user", "238, 102, 255")
   -- exports['dbl_logs']:SendLog(source, "DO: " ..message, 'do')
        
    local narrative = GlobalState.narrative
    if not narrative[source] then
        narrative[source] = {}
    end
    GlobalState.narrative = narrative
    
    narrative = GlobalState.narrative

    local narrative2 = GlobalState.narrative2

    if not narrative2[source] then
        narrative2[source] = 0
    end

    narrative2[source] = narrative2[source] + 1

    local id = "mes-" .. narrative2[source]
    narrative[source][id] = {message = message, color = {238, 102, 255}}
    GlobalState.narrative = narrative
    GlobalState.narrative2 = narrative2

    Wait(5000)
    narrative = GlobalState.narrative
    narrative[source][id] = nil
    GlobalState.narrative = narrative
end)

RegisterCommand("try", function(source, args, raw)
    if source == 0 then
        return
    end
    local name = GetPlayerName(source)
    local random = math.random(#Config.Try)
    local message = Config.Try[random].label
    if args[1] then
        message = message .. " | " .. table.concat(args, " ")
    end
    TriggerClientEvent("dbl_chat:sendMessage2", -1, source, name, message, "fa-solid fa-dice", Config.Try[random].color)
   -- exports['dbl_logs']:SendLog(source, "TRY: " ..message, 'try')
            
    local narrative = GlobalState.narrative
    if not narrative[source] then
        narrative[source] = {}
    end
    GlobalState.narrative = narrative
    
    narrative = GlobalState.narrative

    local narrative2 = GlobalState.narrative2

    if not narrative2[source] then
        narrative2[source] = 0
    end

    narrative2[source] = narrative2[source] + 1

    local id = "mes-" .. narrative2[source]
    narrative[source][id] = {message = message, color = Config.Try[random].color2}
    GlobalState.narrative = narrative
    GlobalState.narrative2 = narrative2

    Wait(5000)
    narrative = GlobalState.narrative
    narrative[source][id] = nil
    GlobalState.narrative = narrative
end)

RegisterCommand("dice", function(source, args, raw)
    if source == 0 then
        return
    end
    local diceIcon = {
        "fa-solid fa-dice-one",
        "fa-solid fa-dice-two",
        "fa-solid fa-dice-three",
        "fa-solid fa-dice-four",
        "fa-solid fa-dice-five",
        "fa-solid fa-dice-six",
    }
    local name = GetPlayerName(source)
    local random = math.random(1, 6)
    local message = "Wylosowana ilość to: " .. random
    TriggerClientEvent("dbl_chat:sendMessage2", -1, source, name, message, diceIcon[random], "200, 0, 255")
end)

RegisterCommand("opis", function(source, args, raw)
    if source == 0 then
        return
    end

    local descriptions = GlobalState.descriptions
    if args[1] then
        descriptions[source] = table.concat(args, " ")
     --   exports['dbl_logs']:SendLog(source, "USTAWIŁ OPIS: " ..descriptions[source], 'opis')
    else
        descriptions[source] = nil
       -- exports['dbl_logs']:SendLog(source, "USUNAŁ OPIS", 'opis')
    end
    GlobalState.descriptions = descriptions

end)

RegisterCommand("report", function(source, args, raw)
    if source == 0 then
        return
    end
    if not args[1] then
        TriggerClientEvent("chat:addMessage", source, {
            templateId = "message",
            multiline = true,
            args = {"255, 0, 0", "fa-solid fa-exclamation", "SYSTEM", "Podaj treść wiadomości!"},
        })
        return
    end
    if Player(source).state.ReportCooldown then
        TriggerClientEvent("chat:addMessage", source, {
            templateId = "message",
            multiline = true,
            args = {"255, 0, 0", "fa-solid fa-exclamation", "SYSTEM", "Odczekaj chwilę przed wysłaniem następnej wiadomości!"},
        })
        return
    end
    local message = table.concat(args, " ")
    local name = GetPlayerName(source)
    local xPlayers = ESX.GetExtendedPlayers()
    local count = 0
    local text = "administratorów"
    for i = 1, #(xPlayers) do
        if Config.AdminGroups[xPlayers[i].group] then
            TriggerClientEvent("chat:addMessage", xPlayers[i].source, {
                templateId = "message",
                multiline = true,
                args = {"255, 100, 0", "fa-solid fa-bug", "[" .. source .. "] " .. name, message},
            })
            
            count = count + 1
        end
    end
    if count == 1 then
        text = "administratora"
    end
    TriggerClientEvent("chat:addMessage", source, {
        templateId = "message",
        multiline = true,
        args = {"50, 50, 50", "fa-solid fa-laptop", "SYSTEM", "Wiadomość została wysłana do " .. count .. " " .. text .. " online!"},
    })
  --  exports['dbl_logs']:SendLog(source, "Report: " ..message, 'report')
    Player(source).state.ReportCooldown = true
    Wait(10000)
    Player(source).state.ReportCooldown = false
end)

RegisterCommand("ac", function(source, args, raw)
    if source == 0 then
        return
    end
    if not args[1] then
        TriggerClientEvent("chat:addMessage", source, {
            templateId = "message",
            multiline = true,
            args = {"255, 0, 0", "fa-solid fa-exclamation", "SYSTEM", "Podaj treść wiadomości!"},
        })
        return
    end
    local xPlayer = ESX.GetPlayerFromId(source)
    if not Config.AdminGroups[xPlayer.group] then
        return
    end
    local message = table.concat(args, " ")
    local name = GetPlayerName(source)
    local xPlayers = ESX.GetExtendedPlayers()
    for i = 1, #(xPlayers) do
        if Config.AdminGroups[xPlayers[i].group] then
            TriggerClientEvent("chat:addMessage", xPlayers[i].source, {
                templateId = "message",
                multiline = true,
                args = {"255, 200, 0", "fa-solid fa-hammer", "[" .. source .. "] " .. name, message},
            })
           -- exports['dbl_logs']:SendLog(source, "ADMINCHAT: " ..message, 'adminchat')
        end
    end
end)

RegisterCommand("w", function(source, args, raw)
    if source == 0 then
        return
    end
    if not args[1] then
        TriggerClientEvent("chat:addMessage", source, {
            templateId = "message",
            multiline = true,
            args = {"255, 0, 0", "fa-solid fa-exclamation", "SYSTEM", "Podaj id gracza!"},
        })
        return
    end
    if not args[2] then
        TriggerClientEvent("chat:addMessage", source, {
            templateId = "message",
            multiline = true,
            args = {"255, 0, 0", "fa-solid fa-exclamation", "SYSTEM", "Podaj treść wiadomości!"},
        })
        return
    end
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = GetPlayerName(source)
    local target = tonumber(args[1])
    local targetName = GetPlayerName(target)
    local message = table.concat(args, " ", 2)
    if not targetName then
        TriggerClientEvent("chat:addMessage", source, {
            templateId = "message",
            multiline = true,
            args = {"255, 0, 0", "fa-solid fa-exclamation", "SYSTEM", "Grasz jest offline!"},
        })
        return
    end

    local color = "0, 200, 255"
    if Config.AdminGroups[xPlayer.group] then
        color = "0, 150, 255"
    end

   -- exports['dbl_logs']:SendLog(source, "WIADOMOŚĆ PRYWATNA DO: [" ..target .. "] ".. targetName ..": o treści: " ..message, 'w')
    TriggerClientEvent("chat:addMessage", source, {
        templateId = "message",
        multiline = true,
        args = {color, "fa-solid fa-exclamation", string.format("WIADOMOŚĆ PRYWATNA DO - [%s] %s", target, targetName), message}
    })
    TriggerClientEvent("chat:addMessage", target, {
        templateId = "message",
        multiline = true,
        args = {color, "fa-solid fa-exclamation", string.format("WIADOMOŚĆ PRYWATNA OD - [%s] %s", source, name), message},
    })
end)

RegisterCommand("twt", function(source, args, raw)
    if source == 0 then
        return
    end

    if exports.ox_inventory:Search(source, 'count', 'phone') <= 0 then
        return TriggerClientEvent("esx:showNotification", source, "Nie posiadasz telefonu!")
    end

    if not args[1] then
        return TriggerClientEvent("esx:showNotification", source, "Podaj treść wiadomości!")
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.get("firstName") .. " " .. xPlayer.get("lastName")
    local message = table.concat(args, " ")
    local xPlayers = ESX.GetExtendedPlayers()
    for i = 1, #(xPlayers) do
        local xTarget = xPlayers[i]
        if xTarget.getGroup() ~= "user" then
            TriggerClientEvent("chat:addMessage", xTarget.source, {
                templateId = "message",
                multiline = true,
                args = {"30, 160, 240", "fa-brands fa-twitter", "[" .. source .. "] " .. name, message}
            })
        else
            TriggerClientEvent("chat:addMessage", xTarget.source, {
                templateId = "message",
                multiline = true,
                args = {"30, 160, 240", "fa-brands fa-twitter", name, message}
            })
        end
    end
end)

RegisterCommand("dw", function(source, args, raw)
    if source == 0 then
        return
    end

    if exports.ox_inventory:Search(source, 'count', 'phone') <= 0 then
        return TriggerClientEvent("esx:showNotification", source, "Nie posiadasz telefonu!")
    end

    if not args[1] then
        return TriggerClientEvent("esx:showNotification", source, "Podaj treść wiadomości!")
    end

    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.job.name == "police" or xPlayer.job.name == "ambulance" then
        return TriggerClientEvent("esx:showNotification", source, "Nie masz dostępu!")
    end

    local message = table.concat(args, " ")
    local xPlayers = ESX.GetExtendedPlayers()
    for i = 1, #(xPlayers) do
        local xTarget = xPlayers[i]
        if xTarget.job.name ~= "police" and xTarget.job.name ~= "ambulance" then
            if xTarget.getGroup() ~= "user" then
                TriggerClientEvent("chat:addMessage", xTarget.source, {
                    templateId = "message",
                    multiline = true,
                    args = {"30, 30, 30", "fa-solid fa-user-secret", "[" .. source .. "] DARKWEB", message}
                })
            else
                TriggerClientEvent("chat:addMessage", xTarget.source, {
                    templateId = "message",
                    multiline = true,
                    args = {"30, 30, 30", "fa-solid fa-user-secret", "DARKWEB", message}
                })
            end
        end
    end
end)