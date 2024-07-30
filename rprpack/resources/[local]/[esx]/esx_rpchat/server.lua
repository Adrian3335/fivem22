ESX = exports['es_extended']:getSharedObject()
Descriptions = {}
DarkWebWaits = {}
ReportWaits = {}
FindInString = function(input)
	local tablee = {}
	for str in string.gmatch(input, "([^".."|".."]+)") do
		table.insert(tablee, str)
	end
	return tablee
end
stringSplit = function(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

AddEventHandler('chatMessage', function(source, name, args)
	if string.sub(args, 1, string.len("/")) ~= "/" then
		TriggerClientEvent("esx_rpchat:sendProximityMessage", -1, "ooc", source, Config.Templates["looc"], { source, GetPlayerName(source), args })
		--exports['diablohub_logs']:SendLog(source, "OOC: " ..args, 'nowe-ooc')
	end
	CancelEvent()
end)

RegisterCommand("ac", function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	if xPlayer.group == "best" or xPlayer.group == "superadmin" or xPlayer.group == "admin" or xPlayer.group == "mod" then
		for _, player in ipairs(xPlayers) do
			playerx = ESX.GetPlayerFromId(player)
			if playerx.group == "best" or xPlayer.group == "superadmin" or xPlayer.group == "admin" or xPlayer.group == "mod" then
				TriggerClientEvent('chat:addMessage', player, {
					template = Config.Templates['adminchat'],
					args = { source, GetPlayerName(source), table.concat(args, " ") }
				})
			end
		end
	end
end)

RegisterCommand('ogloszenie', function(source, args)
	if source == 0 then return end

	args = table.concat(args, " ")
	if args == nil or args == "" or args == " " then
		return
	end

	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.group == "best" or xPlayer.group == "superadmin" then
		TriggerClientEvent("esx_rpchat:sendProximityMessage", -1, "ogloszenie", source, Config.Templates["ogloszenie"], { nil, GetPlayerName(source), args})
		--exports['diablohub_logs']:SendLog(source, "OGLOSZENIE: " ..args, 'nowe-ogloszenie')
	end
end)

RegisterNetEvent("esx_rpchat:sendMe", function(args)
	local source = source
	args = table.concat(args, " ")
	if args == nil or args == "" or args == " " then
		return
	end
	TriggerClientEvent("esx_rpchat:sendProximityMessage", -1, "mdt", source, Config.Templates["me"], { source, GetPlayerName(source), args}, Config.Colours["me"])
	--exports['diablohub_logs']:SendLog(source, "ME: " ..args, 'nowe-me')
end)

RegisterNetEvent("esx_rpchat:sendDo", function(args)
	local source = source
	args = table.concat(args, " ")
	if args == nil or args == "" or args == " " then
		return
	end
	TriggerClientEvent("esx_rpchat:sendProximityMessage", -1, "mdt", source, Config.Templates["do"], { source, GetPlayerName(source), args}, Config.Colours["do"])
	--exports['diablohub_logs']:SendLog(source, "DO: " ..args, 'nowe-do')
end)

RegisterNetEvent("esx_rpchat:sendTry", function(args)
	if source == 0 then return end

	local tryLabel = nil
	local tryColor = nil
	local resultTable = {"Nieudane", "Udane"}
	local resultNumber = math.random(#resultTable)
	local resultLabel = resultTable[resultNumber]
	if args[1] then
		args = table.concat(args, " ")
		local resultTableInString = FindInString(args)
		if resultTableInString[2] then
			local resultTableInStringNumber = math.random(#resultTableInString)
			tryLabel = resultTableInString[resultTableInStringNumber]
			tryColor = Config.TryMessageColours[2]
		else
			tryLabel = resultTableInString[1] .. " ( ".. resultLabel .. " )"
			tryColor = Config.TryMessageColours[resultNumber - 1]
		end
	else
		tryLabel = resultLabel
		tryColor = Config.TryMessageColours[resultNumber - 1]
	end

	if tryLabel == nil then return end
	if tryColor == nil then return end

	TriggerClientEvent("esx_rpchat:sendProximityMessage", -1, "mdt", source, string.format(Config.Templates["try"], tryColor), { source, GetPlayerName(source), tryLabel }, Config.Colours["try"])
	--exports['diablohub_logs']:SendLog(source, "TRY: "..tryLabel, 'nowe-try')
end)

RegisterCommand("opis", function(source, args)
	if source == 0 then return end

	args = table.concat(args, " ")
	if args == nil or args == "" or args == " " then
		Descriptions[source] = nil
		TriggerClientEvent("esx_rpchat:sendDescription", -1, Descriptions)
		return
	end

	Descriptions[source] = args
	TriggerClientEvent("esx_rpchat:sendDescription", -1, Descriptions)
	--exports['diablohub_logs']:SendLog(source, "OPIS: "..args, 'nowe-opis')
end)

RegisterNetEvent("esx_rpchat:sendNews", function(args)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("esx_rpchat:sendProximityMessage", -1, "news", source, Config.Templates["news"], { source, xPlayer.job.label, table.concat(args, " ") })
	--exports['diablohub_logs']:SendLog(source, xPlayer.job.label..': '..table.concat(args, " "), 'nowe-newsiki')
end)

RegisterNetEvent("esx_rpchat:sendOgloszenieFrakcyjne", function(args)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("esx_rpchat:sendProximityMessage", -1, xPlayer.job.name, source, Config.Templates[xPlayer.job.name], { source, xPlayer.job.label, table.concat(args, " ") })
	--exports['diablohub_logs']:SendLog(source, xPlayer.job.label..': '..table.concat(args, " "), 'nowe-frakcje')
end)

RegisterNetEvent("esx_rpchat:sendTwitter", function(args)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent("esx_rpchat:sendProximityMessage", -1, "twt", source, Config.Templates["twt"], { source, xPlayer.getName(), table.concat(args, " ") })
	--exports['diablohub_logs']:SendLog(source, "Twitter: "..table.concat(args, " "), 'nowe-twt')
	
end)

RegisterNetEvent("esx_rpchat:sendDarkWeb", function(args)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name ~= "police" and xPlayer.job.name ~= "ambulance" then
		TriggerClientEvent("esx_rpchat:sendProximityMessage", -1, "dw", source, Config.Templates["dw"], { source, nil, table.concat(args, " ") })
		--exports['diablohub_logs']:SendLog(source, "DarkWeb: "..table.concat(args, " "), 'nowe-darkweb')
	else
		TriggerClientEvent('chat:addMessage', source, {
			template = Config.Templates['error'],
			args = { "Brak dostepu", nil, nil }
		})
	end
end)


RegisterNetEvent("esx_rpchat:sendReport", function(args)
	local source = source
	TriggerClientEvent("esx_rpchat:sendProximityMessage", -1, "report", source, Config.Templates['report'], { source, GetPlayerName(source), table.concat(args, " ") })
	--exports['diablohub_logs']:SendLog(source, "REPORT: "..table.concat(args, " "), 'nowe-report')
	TriggerClientEvent('chat:addMessage', source, {
		template = Config.Templates['sent'],
		args = { source, nil, table.concat(args, " ") }
	})
end)

RegisterCommand('w', function(source, args, raw)
	cm = stringSplit(raw, " ")
	if args[1] then
		local tPID = tonumber(args[1])
		if tPID ~= nil then
			local names2 = GetPlayerName(tPID)
			if names2 then
				local names3 = GetPlayerName(source)
				local msgVar = {}
				local textmsg = ""
				for i=1, #cm do
					if i ~= 1 and i ~= 2 then
						textmsg = (textmsg .. " " .. tostring(cm[i]))
					end
				end
				TriggerClientEvent('chat:addMessage', source, {
					template = Config.Templates['privatemessagesend'],
					args = { nil, names2.." ["..tPID.."]", textmsg }
				})
				TriggerClientEvent('chat:addMessage', tPID, {
					template = Config.Templates['privatemessageget'],
					args = { nil, names3.." ["..source.."]", textmsg }
				})
				--exports['diablohub_logs']:SendLog(source, "Wiadomość prywatna do: ["..tPID..']: ' ..textmsg, 'nowe-w')
			else
				TriggerClientEvent('chat:addMessage', source, {
					template = Config.Templates['error'],
					args = { "Gracz jest offline!", nil, nil }
				})
			end
		end
	else
		TriggerClientEvent('chat:addMessage', source, {
			template = Config.Templates['error'],
			args = { "Podaj ID osoby!", nil, nil }
		})
	end
end)

RegisterNetEvent("esx_rpchat:getDescription", function()
	local _source = source
	TriggerClientEvent("esx_rpchat:sendDescription", _source, Descriptions)
end)

RegisterNetEvent("esx:playerDropped")
AddEventHandler("esx:playerDropped", function(source)
	if Descriptions[source] ~= nil then
		Descriptions[source] = nil
		TriggerClientEvent("esx_rpchat:sendDescription", -1, Descriptions)
	end
end)


ESX.RegisterServerCallback("esx_rpchat:getGroup", function(source, cb)
    cb(ESX.GetPlayerFromId(source).getGroup())
end)