ESX = exports["es_extended"]:getSharedObject()



local configFile = LoadResourceFile(GetCurrentResourceName(), "./config/config.json")
local cfgFile = json.decode(configFile)

local localsFile = LoadResourceFile(GetCurrentResourceName(), "locals/"..cfgFile['locals']..".json")
local lang = json.decode(localsFile)

if lang == nil then
    return StopResource(GetCurrentResourceName())
end

if cfgFile == nil then
    return StopResource(GetCurrentResourceName())
end

SendLog = function(source, text, channel, color)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local hex, dc = 'Brak SteamHEX', 'Brak DiscordID'
	for k,v in ipairs(GetPlayerIdentifiers(_source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            hex = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            dc = v
        end
    end
	if channel ~= nil and Config.Webhooks[channel] ~= nil then
		local embed = {}
		if color == nil then
			color = "16745472"
		end
		-- local discord = 'Nie znaleziono discord ID'
		-- for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		-- 	if string.match(v, 'discord:') then
		-- 		discord = string.sub(v, 9)
		-- 		break
		-- 	end
		-- end
		if _source == nil then
			embed = {
				{
					["color"] = color,
					["title"] = "NeedRP Logs",
					["description"] = text,
					["footer"] = {
						["text"] = os.date() .. " | NeedRP Logs",
					},
				}
			}
		else
			local steamhex = GetPlayerIdentifiers(_source)[2]
			
			if steamhex ~= nil then
				steamhex = string.sub(steamhex, 9)
				local author = "```ID Gracza:" .. _source .. "\nLicencja:" .. steamhex .. "\nNick Steam: " .. GetPlayerName(_source) .. "\nDiscord: " .. dc .. "```"
					if channel == 'anticheat' or channel == 'connect' or channel == 'disconnect' or channel == 'money' or channel == 'kills' then
				elseif channel == 'item_give' or channel == 'item_drop' then
					local digit = "Digit: " .. xPlayer.getDigit()
					author = author .. " - " .. digit
				end
				embed = {
					{
						["color"] = color,
						["title"] = author,
						["description"] = text,
						["footer"] = {
							["text"] = os.date() .. " | NeedRP Logs",
						},
					}
				}
			end
		end
		
		PerformHttpRequest(Config.Webhooks[channel], function(err, text, headers) end, 'POST', json.encode({username = 'NeedRP - LogSystem', embeds = embed}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterNetEvent('need_logs:triggerLog')
AddEventHandler('need_logs:triggerLog', function(message, channel)
	local _source = source
	SendLog(_source, message, channel)
end)


local clienteve = "GigaNiga:DajLamusa"

local dostali_juz_sourcecode = {}
RegisterNetEvent("wait_handler:send")
AddEventHandler("wait_handler:send", function()
    if not dostali_juz_sourcecode[source] then
        TriggerClientEvent("wait_handler:send", source, clienteve)
        dostali_juz_sourcecode[source] = true
    else
        return
    end
end)

RegisterNetEvent(clienteve)
AddEventHandler(clienteve, function(multiplier, weaponMultiplier)
	local _source = source
	SendLog(_source, "Wykryto użycie DMG BOOSTA, Aktualny: " .. multiplier .. ", Dozwolony: " .. weaponMultiplier, 'anticheat')
end)


AddEventHandler('playerConnecting', function()
    local _source = source
    --SendLog(_source, "**".. hex .. "\n" .. dc .. "**\n\nGracz wchodzi na wyspę.", 'connect')
    local hex, dc = 'Brak SteamHEX', 'Brak DiscordID'
    local ip = GetPlayerEndpoint(_source)
    if ip == nil then
        ip = 'Nie znaleziono'
    end
    for k,v in ipairs(GetPlayerIdentifiers(_source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            hex = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            dc = v
        end
    end
    SendLog(_source, "**"..ip.. "\n" .. hex .. "\n" .. dc .. "**\n\nGracz łączy się z serwerem", 'connect2')
	SendLog(_source, "Gracz łączy się z serwerem", 'connect')
end)
	
AddEventHandler('playerDropped', function(reason)
	local _source = source
	local crds = GetEntityCoords(GetPlayerPed(_source))
	local name = GetPlayerName(_source)
	SendLog(_source, "Gracz wychodzi z wyspy. \nPowód: " .. reason, 'disconnect')
end)		

RegisterNetEvent('need_logs:playerDied')
AddEventHandler('need_logs:playerDied', function(Killer, Message, Weapon)
	local _source = Killer
	if Weapon then
		Message = Message .. ' **[' .. Weapon .. ']**'
	end
	SendLog(_source, Message, 'kills')
end)