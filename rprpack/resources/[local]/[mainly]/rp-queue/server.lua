Config = {}
Config.MaxClients = 64
Config.JoinToDiscord = "Aby grać na naszym serwerze musisz dołączyć na naszego discorda."
Config.NoDiscord = "Nie wykryto Discord."
Config.NoSteam = "Nie wykryto Steam."
Config.Error = "Error, Sprobuj ponownie."

Config.Roles = {
    [50000] = "Support Team",
    [5000] = "Diamentowy Bilet",
    [2500] = "Złoty Bilet",
    [1250] = "Brązowy Ticket",
    [0] = "Standard"
}

Config.DiscordServerID = "1150168920246984744"
Config.DiscordBotToken = "MTEzMDgxNDY2NTI3NDk3MDIwMw.G6OV2W.t8Z_Ltaj630BTtleWtAvmUdKFJJfpiFjEKNX_8"

Config.WelcomeText = "RP PACK 1.0"
Config.DiscordURL = "https://discord.gg/DH35spbU"
Config.BackgroundImage = ""
Config.ServerIcon = ""

local playersInfo, connectingInfo = {}, {}
local kolejkaff = {
    type = "AdaptiveCard",
    body = {
        {
            type = "ColumnSet",
            columns = {
                {
                    type = "Column",
                    items = {
                        {
                            type = "TextBlock",
                            weight = "Bolder",
                            wrap = true,
                            text = "Not found"
                        },
                        {
                            type = "TextBlock",
                            spacing = "None",
                            isSubtle = true,
                            wrap = true,
                            text = Config.WelcomeText
                        }
                    },
                    width = "stretch"
                }
            }
        },
        {
            type = "FactSet",
            facts = {
                {
                    title = "Pozycja w kolejce:",
                    value = "1"
                },
                {
                    title = "Bilet:",
                    value = "Standard"
                },
                {
                    title = "Czas w kolejce:",
                    value = "00:00"
                }
            }
        } 
    },
    ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
    ["version"] = "1.5"
}

local stageff = {
    ["type"] = "AdaptiveCard",
    ["backgroundImage"] = {
        ["url"] = Config.BackgroundImage
    },
    ["body"] = {
        {
            ["type"] = "Image",
            ["url"] = Config.ServerIcon,
            ["horizontalAlignment"] = "Center",
            ["size"] = "Small"
        },
        {
            ["type"] = "TextBlock",
            ["text"] = "",
            ["fontType"] = "Default",
            ["horizontalAlignment"] = "Center",
            ["weight"] = "bolder",
            ["color"] = "Light",
            ["size"] = "extraLarge"
        },
        {
            ["type"] = "ActionSet",
            ["actions"] = {
                {
                    ["type"] = "Action.OpenUrl",
                    ["title"] = "DISCORD",
                    ["url"] = Config.DiscordURL,
                    ["iconUrl"] = "https://cdn.discordapp.com/attachments/798515212361138197/840846215565410344/discord.png"
                },
            }
        }
    },
    ["actions"] = {},
    ["$schema"] = "http://adaptivecards.io/schemas/adaptive-card.json",
    ["version"] = "1.0"
}

local os_time = os.time

StopResource('hardcap')

AddEventHandler("playerConnecting", function(name, reject, d)
    local _source = source
    local currentSteamID, currentDiscordID = nil, nil
    local stageinfo = stageff
    d.defer()

    Wait(100)
    
    stageinfo.body[2].text = "WCZYTYWANIE KOLEJKI"
    d.presentCard(stageinfo)

    Wait(100)
    
    local playerIdentifiers = GetIdentifiers(_source)
    if playerIdentifiers then
        if playerIdentifiers.discord then
            currentDiscordID = playerIdentifiers.discord
        end
        if playerIdentifiers.steam then
            currentSteamID = playerIdentifiers.steam
        end
    end
    
    if not currentDiscordID then
        stageinfo.body[2].text = Config.NoDiscord
        d.presentCard(stageinfo)
        CancelEvent()
        return
    end
    
    if not currentSteamID then
        stageinfo.body[2].text = Config.NoSteam
        d.presentCard(stageinfo)
        CancelEvent()
        return
    end
    
    if not ProccessQueue(currentSteamID, currentDiscordID, d, _source) then
        CancelEvent()
    end
end)

function ProccessQueue(steamID, discordID, d, _source)
    GetPlayerPoints(steamID, function(UserPoints)
        local data = {name = nil, queuepts = UserPoints, role = Config.Roles[UserPoints], avatar = Config.ServerIcon}
        local connectTime = os_time()
        PerformHttpRequest("https://discordapp.com/api/guilds/" .. Config.DiscordServerID .. "/members/"..discordID, function(err, text, headers)
            if text ~= nil then
                local member = json.decode(text)
                if member.user.avatar ~= nil then
                    if (member.user.avatar:sub(1, 1) and member.user.avatar:sub(2, 2) == "_") then 
                        data.avatar = "https://cdn.discordapp.com/avatars/" .. discordID .. "/" .. member.user.avatar .. ".gif"
                    else
                        data.avatar = "https://cdn.discordapp.com/avatars/" .. discordID .. "/" .. member.user.avatar .. ".png"
                    end
                else
                    data.avatar = Config.ServerIcon
                end

                local localname, localdec = "", ""
                for k, v in pairs(member.user) do
                    if k == "username" then
                        localname = v
                    elseif k == "discriminator" then
                        localdec = tostring(v)
                    end
                end
                data.name = localname .. "#" .. tostring(localdec)

                AddPlayer(steamID, discordID, data.name, data.queuepts, data.role, _source, d)
            else
                local stageinfo = stageff
                stageinfo.body[2].text = Config.JoinToDiscord
                d.presentCard(stageinfo)
                return false
            end
            
            local stop = false
            repeat
                local currentMessage = GetMessage(_source, connectTime, data.avatar, data.queuepts, data.role)
                d.presentCard(currentMessage, function(data, rawData) end)

                for k, v in pairs(connectingInfo) do
                    if v.steamID == steamID then
                        stop = true
                    end
                end

                for k, v in ipairs(playersInfo) do
                    if v.steamID == steamID and (GetPlayerPing(v.source) == 0) then
                        dropPlayerFromQueue(steamID, discordID)
                        d.done(Config.Error)
                        return false
                    end
                end
                Wait(0)
            until stop

            d.done()
            return true
        end, "GET", "", {["Content-type"] = "application/json", ["Authorization"] = "Bot " .. Config.DiscordBotToken})
        for k, v in pairs(connectingInfo) do
            if v.steamID == steamID then
                table.remove(connectingInfo, k)
            end
        end
        return false
    end)
end

AddEventHandler("playerDropped", function(reason)
    local _source = source
    local identifier = GetIdentifiers(_source)
    dropPlayerFromQueue(identifier.steam, identifier.discord)
end)

RegisterServerEvent('bb-queue:removeConnected')
AddEventHandler('bb-queue:removeConnected', function()
    local _source = source
    for k, v in pairs(connectingInfo) do
        if v.steamID == GetIdentifiers(_source).steam then
            table.remove(connectingInfo, k)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3000)
        CheckConnecting()

        if #playersInfo > 0 and #connectingInfo + #GetPlayers() < Config.MaxClients then
            ConnectFirst()
        end
    end
end)

function GetPlayerPoints(identifier, cb)
    local userPoints = MySQLAsyncExecute("SELECT `points` FROM `queue_points` WHERE `identifier` = '"..identifier.."'")
    if userPoints[1] ~= nil and userPoints[1].points ~= nil then
        cb(tonumber(userPoints[1].points))
    else
        cb(0)
    end
end

function dropPlayerFromQueue(steamID, discordID, count)
    if count then
        local queueCount = #playersInfo
        for currentPlayer = count, queueCount do
            playersInfo[currentPlayer] = playersInfo[currentPlayer + 1]
        end
    else
        for k, v in pairs(playersInfo) do
            if v.steamID == steamID or v.discordID == discordID then
                local queueCount = #playersInfo
                local saveCred = nil
                for currentPlayer = k + 1, queueCount do
                    playersInfo[currentPlayer - 1] = playersInfo[currentPlayer]
                end
                playersInfo[queueCount] = nil
                return
            end
        end
    end
end

function AddPlayer(steamID, discordID, discordName, queuePts, queueRole, source, d)
    local _source = source

    if #playersInfo == 0 then
        playersInfo[1] = {
            steamID = steamID,
            steamName = GetPlayerName(_source),
            discordID = discordID,
            discordName = discordName, 
            points = queuePts,
            role = queueRole,
            source = _source
        }
    else
        for k, v in pairs(playersInfo) do
            if v.points < queuePts then
                local queueCount = #playersInfo
                local saveCred = nil
                for currentPlayer = k, queueCount + 1 do
                    if currentPlayer == k then
                        saveCred = playersInfo[currentPlayer + 1]
                        playersInfo[currentPlayer + 1] = playersInfo[currentPlayer]
                    else
                        local currentSaveCred = playersInfo[currentPlayer + 1]
                        playersInfo[currentPlayer + 1] = saveCred
                        saveCred = currentSaveCred
                    end
                end

                playersInfo[k] = {
                    steamID = steamID,
                    steamName = GetPlayerName(_source),
                    discordID = discordID,
                    discordName = discordName, 
                    points = queuePts,
                    role = queueRole,
                    source = _source
                }
                return
            end
        end

        playersInfo[#playersInfo + 1] = {
            steamID = steamID,
            steamName = GetPlayerName(_source),
            discordID = discordID,
            discordName = discordName, 
            points = queuePts,
            role = queueRole,
            source = _source
        }
    end
end

function CheckConnecting()
    for k, v in pairs(playersInfo) do
        if GetPlayerPing(v.source) == 500 then
            dropPlayerFromQueue(nil, nil, k)
        end
    end

    for k, v in pairs(connectingInfo) do
        if GetPlayerPing(v.source) == -1 then
            if v.errorsNum > 1 then
                table.remove(connectingInfo, k)
            end
            v.errorsNum = v.errorsNum + 1
        end
    end
end

function ConnectFirst()
    if #playersInfo == 0 then 
        return 
    end
    
    table.insert(connectingInfo, {steamID = playersInfo[1].steamID, source = playersInfo[1].source, errorsNum = 0})
    dropPlayerFromQueue(nil, nil, 1)
end

function GetMessage(playerId, connectTime, avatarURL, points, ticket)
    local msg = ""
    local cardd = kolejkaff
    local counter = 1
    local queuetime = os_time() - connectTime
    for k, v in pairs(playersInfo) do
        if v.source == playerId then
            cardd.body[1].columns[1].items[1].text = v.discordName
            cardd.body[2].facts[1].value = tostring(k)
        end
        if counter < 5 then
            counter = counter + 1
        elseif counter == 5 then
            msg = msg .. 'i ' .. #playersInfo - counter .. ' Graczy.\n'
            counter = counter + 1
        end
    end

    cardd.body[2].facts[2].value = ticket
    cardd.body[2].facts[3].value = os.date("%M:%S", queuetime)
    return cardd
end

RegisterCommand('bb-resetConnects', function()
    for k, v in pairs(connectingInfo) do
        table.remove(connectingInfo, k)
    end
end)

RegisterCommand("setPoints", function(source, args, rawCommand)
	if source == 0 then
        local _source = args[1]
        local points = args[2]
        local identifier = GetIdentifiers(_source).steam

        if identifier ~= nil then
            MySQL.Async.fetchAll('SELECT points FROM queue_points WHERE identifier = @identifier', {
                ['@identifier'] = identifier
            }, function(result)
                if result[1] ~= nil then
                    MySQL.Async.execute('UPDATE queue_points SET points = @points WHERE identifier = identifier ', {
                        ['@points'] = points,
                        ['@identifier'] = identifier
                    })
                else
                    MySQL.Async.execute('INSERT INTO `queue_points` (`identifier`, `points`) VALUES (@identifier, @points)', {
                        ['@identifier'] = identifier,
                        ['@points'] = points,
                    })
                end
            end)
        end
	end
end, false)

function MySQLAsyncExecute(query)
    local IsBusy = true
    local result = nil
    MySQL.Async.fetchAll(query, {}, function(data)
        result = data
        IsBusy = false
    end)
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end

function GetIdentifiers(player)
	local identifiers = {}
	for i = 0, GetNumPlayerIdentifiers(player) - 1 do
		local raw = GetPlayerIdentifier(player, i)
		local tag, value = raw:match("^([^:]+):(.+)$")
		if tag and value then
			identifiers[tag] = value
		end
	end
	return identifiers
end