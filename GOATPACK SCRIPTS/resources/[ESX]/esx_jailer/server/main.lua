

-- unjail

RegisterCommand('unjail', function(source, args, user)
	if source == 0 then
		if args[1] then
			if GetPlayerName(args[1]) ~= nil then
				TriggerEvent('sendMessageDiscord',  "Unjail dla ID: "..args[1])
				TriggerEvent('esx_jailer:unjailQuesthype', tonumber(args[1]))
			else
				TriggerEvent('sendMessageDiscord',  "Niema nikogo o takim ID")
			end
		else
			TriggerEvent('sendMessageDiscord',  "Nie podałeś ID gracza")
		end
	else
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.group == 'best' or xPlayer.group == 'admin' or xPlayer.group == 'moderator' then
			if args[1] then
				if GetPlayerName(args[1]) ~= nil then
					TriggerEvent('esx_jailer:unjailQuesthype', tonumber(args[1]))
				else
					TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Invalid player ID!' } } )
				end
			else
				TriggerEvent('esx_jailer:unjailQuesthype', source)
			end
		else
			xPlayer.showNotification('Nie posiadasz permisji')
		end
	end
end, false)

RegisterCommand('jail', function(source, args, user)
	if source == 0 then
		if args[1] then
			if GetPlayerName(args[1]) ~= nil then
				TriggerEvent('sendMessageDiscord',  "Jail dla ID: "..args[1])
				TriggerEvent("esx_jtestailer:sendToJailPanelhype", tonumber(args[1]), tonumber(args[2]) * 60, '')
			else
				TriggerEvent('sendMessageDiscord',  "Niema nikogo o takim ID")
			end
		else
			TriggerEvent('sendMessageDiscord',  "Nie podałeś ID gracza")
		end
	else
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.group == 'best' or xPlayer.group == 'admin' or xPlayer.group == 'moderator' then
			if args[1] and args[2] then
				if GetPlayerName(args[1]) ~= nil then
					TriggerEvent("esx_jtestailer:sendToJailPanelhype", tonumber(args[1]), tonumber(args[2]) * 60, '')
				else
					TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Invalid player ID!' } } )
				end
			end
		else
			xPlayer.showNotification('Nie posiadasz permisji')
		end
	end
end, false)


-- should the player be in jail?
RegisterServerEvent('esx_jailer:checkJailhype')
AddEventHandler('esx_jailer:checkJailhype', function()
	local player = source
	local xPlayer = ESX.GetPlayerFromId(player)
	if xPlayer ~= nil then
		MySQL.Async.fetchAll('SELECT jail_time FROM jail WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier,
		}, function(result)
			if result[1] ~= nil then
				if os.time() > result[1].jail_time then
					TriggerClientEvent('esx_jailer:jailhype', player, 0, false)
				else
					local minus = math.floor(result[1].jail_time - os.time())
					if minus < 0 then
						TriggerClientEvent('esx_jailer:jailhype', player, 0, false)
					else
						TriggerClientEvent('esx_jailer:jailhype', player, minus, false)
					end
				end
			end
		end)
	end
end)

-- unjail via command
RegisterServerEvent('esx_jailer:unjailQuesthype')
AddEventHandler('esx_jailer:unjailQuesthype', function(source)
	if source ~= nil then
		unjail(source)
	end
end)

-- unjail after time served
RegisterServerEvent('esx_jailer:unjailTitestmehype')
AddEventHandler('esx_jailer:unjailTitestmehype', function()
	unjail(source)
end)

function unjail(target)
	local xPlayer = ESX.GetPlayerFromId(target)

	if xPlayer ~= nil then
		MySQL.Async.execute('DELETE FROM jail WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier,
		})
	end
	TriggerClientEvent('esx_jailer:unjailhype', target)
end

RegisterServerEvent('esx_jtestailer:sendToJailPanelhype')
AddEventHandler('esx_jtestailer:sendToJailPanelhype', function(target, jailTime, powod)
	local xPlayer = ESX.GetPlayerFromId(target)
	MySQL.Async.fetchAll('SELECT jail_time FROM jail WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier,
	}, function(result)
	
		if result[1] ~= nil then
			MySQL.Async.execute("UPDATE jail SET jail_time = @jail_time WHERE identifier = @identifier", {
				['@identifier'] = xPlayer.identifier, 
				['@jail_time'] = math.floor(os.time() + jailTime),
			})		
		else
			MySQL.Async.execute("INSERT INTO jail (identifier, jail_time) VALUES (@identifier, @jail_time)", {
				['@identifier'] = xPlayer.identifier,
				['@jail_time'] = math.floor(os.time() + jailTime),
			})
		end
	end)
	
  	-- TriggerClientEvent('xjail:notify', -1, ESX.Round(jailTime / 60), target, powod)
	TriggerClientEvent('esx_jailer:jailhype', target, jailTime, true)
end)




