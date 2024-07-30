
-- [ Naprawa i czyszczenia pojazdu ]
RegisterCommand('fix', function(source, args, user)
	if source > 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.group == 'best' or xPlayer.group == 'mod' or xPlayer.group == 'admin' or xPlayer.group == 'superadmin' then
			TriggerClientEvent('dbl:fix', source)
		else
			xPlayer.showNotification("Nie masz uprawnień do wykonania tej komendy.")
		end
	end
end)
-- [ Lista Adminów ]
ESX.RegisterCommand('adminlist', {'mod', 'admin', 'superadmin', 'best'}, function(xPlayer, args, showError)
	local xPlayers = ESX.GetPlayers()
	local admins = {}

	for i=1, #xPlayers, 1 do
		local xTarget = ESX.GetPlayerFromId(xPlayers[i])
		if xTarget.group == "mod" or xTarget.group == "admin" or xTarget.group == "superadmin" or xTarget.group == "best" then
			table.insert(admins, {label="["..xTarget.source.."] "..GetPlayerName(xTarget.source).." ("..xTarget.group..")", value="admin"..i})
		end	
	end

	TriggerClientEvent("dbl_base:adminlist", xPlayer.source, admins)
end, true, {help = "Sprawdź listę administracji"})

-- [ Update rejestracji pojazdu z bazy danych ]
ESX.RegisterCommand('updateplate', {'admin', 'superadmin', 'best'}, function(xPlayer, args, showError)
	if args.oldPlate ~= nil and args.newPlate ~= nil then
		local oldPlate = string.upper(args.oldPlate)
		local newPlate = string.upper(args.newPlate)
		MySQL.Async.execute('UPDATE owned_vehicles SET plate = @newPlate, vehicle = JSON_SET(vehicle, "$.plate", @newPlate) WHERE plate = @plate',{ 
			['@plate'] = oldPlate,
			['@newPlate'] = newPlate
		})
		exports['dbl_logs']:SendLog(xPlayer.source, "Użyto komendy /updateplate " .. oldPlate .. " " .. newPlate, "update-plate")
	end
end, true, {help = "Zmień rejestrację auta", validate = true, arguments = {
    {name = 'oldPlate', help = "Stara rejestracja w cudzysłowiu", type = 'string'},
    {name = 'newPlate', help = "Nowa rejestracja w cudzysłowiu", type = 'string'}
}})


ESX.RegisterCommand('delcar', {'superadmin', 'best'}, function(xPlayer, args, showError)
	if args.Plate ~= nil then
		if xPlayer then
			local Plate = string.upper(args.Plate)
			MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate',{ 
				['@plate'] = Plate
			})
			exports['dbl_logs']:SendLog(xPlayer.source, "Użyto komendy /delcar "..Plate, "delcar")
		else
			local Plate = string.upper(args.Plate)
			MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate',{ 
				['@plate'] = Plate
			})
		end
	end
end, true, {help = "Usun auto", validate = true, arguments = {
    {name = 'Plate', help = "Rejestracja pojazdu", type = 'string'},
}})

-- [ Skopiowanie kordynatów vector3 ]
RegisterCommand('vec3', function(source, args, user)
	if source > 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.group == 'best' or xPlayer.group == 'mod' or xPlayer.group == 'admin' or xPlayer.group == 'superadmin' then
			TriggerClientEvent('dbl:coords_vec3', source, args)
			xPlayer.showNotification("Skopiowałeś kordy! (vec3)")
		else
			xPlayer.showNotification("Nie masz uprawnień do wykonania tej komendy.")
		end
	end
end)

-- [ Skopiowanie kordynatów vector4 ]
RegisterCommand('vec4', function(source, args, user)
	if source > 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.group == 'best' or xPlayer.group == 'mod' or xPlayer.group == 'admin' or xPlayer.group == 'superadmin' then
			TriggerClientEvent('dbl:coords_vec4', source, args)
			xPlayer.showNotification("Skopiowałeś kordy! (vec3)")
		else
			xPlayer.showNotification("Nie masz uprawnień do wykonania tej komendy.")
		end
	end
end)


