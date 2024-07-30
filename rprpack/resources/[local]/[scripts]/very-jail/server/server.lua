ESX = exports['es_extended']:getSharedObject()

RegisterCommand("jail", function(src, args, raw)

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer["job"]["name"] == "police" then

		local jailPlayer = args[1]
		local jailTime = tonumber(args[2])
		local jailReason = args[3]

		if GetPlayerName(jailPlayer) ~= nil then

			if jailTime ~= nil then
				JailPlayer(jailPlayer, jailTime)

				TriggerClientEvent("esx:showNotification", src, GetPlayerName(jailPlayer) .. " został wysłany do więzienia na " .. jailTime .. " miesięcy!")
					exports['very-logs']:SendLog(jailPlayer, "został wysłany do więzienia na "..jailTime..' miesięcy!', 'wiezienie')
				
				if args[3] ~= nil then
					print(args[3])
				end
			else
				TriggerClientEvent("esx:showNotification", src, "Nieprawidłowa ilość miesięcy!")
			end
		else
			TriggerClientEvent("esx:showNotification", src, "Gracz o takim ID nie jest online!")
		end
	else
		TriggerClientEvent("esx:showNotification", src, "Nie jesteś w wymaganej frakcji!")
	end
end)

RegisterCommand("unjail", function(src, args)
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer["job"]["name"] == "police" then
		local jailPlayer = args[1]
		if GetPlayerName(jailPlayer) ~= nil then
			UnJail(jailPlayer)
		else
			TriggerClientEvent("esx:showNotification", src, "Gracz o takim ID nie jest online!")
		end
	else
		TriggerClientEvent("esx:showNotification", src, "Nie jesteś w wymaganej frakcji!")
	end
end)

RegisterServerEvent("very-jail:jailPlayer")
AddEventHandler("very-jail:jailPlayer", function(targetSrc, jailTime, jailReason)
	local src = source
	local targetSrc = tonumber(targetSrc)
	JailPlayer(targetSrc, jailTime)
	TriggerClientEvent("esx:showNotification", src, GetRPName(targetSrc) .. " został wysłany do więzienia na " .. jailTime .. " miesięcy!")
	exports['very-logs']:SendLog(GetPlayerName(targetSrc), "został wysłany do więzienia na "..jailTime..' miesięcy!', 'wiezienie')
end)

RegisterServerEvent("very-jail:unJailPlayer")
AddEventHandler("very-jail:unJailPlayer", function(targetIdentifier)
	local src = source
	local xPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)

	if xPlayer ~= nil then
		UnJail(xPlayer.source)
	else
		MySQL.Async.execute(
			"UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
			{
				['@identifier'] = targetIdentifier,
				['@newJailTime'] = 0
			}
		)
	end

	TriggerClientEvent("esx:showNotification", src, xPlayer.name .. " został wypuszczony z więzienia!")
	exports['very-logs']:SendLog(GetPlayerName(xPlayer.name), "został wypuszczony z więzienia!", 'wiezienie')
end)

RegisterServerEvent("very-jail:updateJailTime")
AddEventHandler("very-jail:updateJailTime", function(newJailTime)
	local src = source
	EditJailTime(src, newJailTime)
end)

RegisterServerEvent("very-jail:prisonWorkReward")
AddEventHandler("very-jail:prisonWorkReward", function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	xPlayer.addMoney(math.random(13, 21))
	TriggerClientEvent("esx:showNotification", src, "Thanks, here you have som cash for food!")
end)

function JailPlayer(jailPlayer, jailTime)
	TriggerClientEvent("very-jail:jailPlayer", jailPlayer, jailTime)
	EditJailTime(jailPlayer, jailTime)
end

function UnJail(jailPlayer)
	TriggerClientEvent("very-jail:unJailPlayer", jailPlayer)
	EditJailTime(jailPlayer, 0)
end

function EditJailTime(source, jailTime)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier
	MySQL.Async.execute(
       "UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newJailTime'] = tonumber(jailTime)
		}
	)
end

function GetRPName(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier
	MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)
		data(result[1].firstname, result[1].lastname)
	end)
end

ESX.RegisterServerCallback("very-jail:retrieveJailedPlayers", function(source, cb)
	local jailedPersons = {}
	MySQL.Async.fetchAll("SELECT firstname, lastname, jail, identifier FROM users WHERE jail > @jail", { ["@jail"] = 0 }, function(result)
		for i = 1, #result, 1 do
			table.insert(jailedPersons, { name = result[i].firstname .. " " .. result[i].lastname, jailTime = result[i].jail, identifier = result[i].identifier })
		end
		cb(jailedPersons)
	end)
end)

ESX.RegisterServerCallback("very-jail:retrieveJailTime", function(source, cb)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT jail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)
		local JailTime = tonumber(result[1].jail)
		if JailTime > 0 then
			cb(true, JailTime)
		else
			cb(false, 0)
		end
	end)
end)