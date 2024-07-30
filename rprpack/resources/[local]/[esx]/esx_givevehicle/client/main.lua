ESX = nil

ESX = exports['es_extended']:getSharedObject()

TriggerEvent('chat:addSuggestion', '/givecar', 'Daj graczowi samochód', {
	{ name="id", help="Identyfikator gracza" },
    { name="vehicle", help="Model pojazdu" },
    { name="<plate>", help="Tablica rejestracyjna pojazdu, pomiń, jeśli chcesz losowo wygenerować numer rejestracyjny" }
})

TriggerEvent('chat:addSuggestion', '/giveplane', 'Give an airplane to player', {
	{ name="id", help="Identyfikator gracza" },
    { name="vehicle", help="Model pojazdu" },
    { name="<plate>", help="Tablica rejestracyjna pojazdu, pomiń, jeśli chcesz losowo wygenerować numer rejestracyjny" }
})

TriggerEvent('chat:addSuggestion', '/giveboat', 'Give a boat to player', {
	{ name="id", help="Identyfikator gracza" },
    { name="vehicle", help="Model pojazdu" },
    { name="<plate>", help="Tablica rejestracyjna pojazdu, pomiń, jeśli chcesz losowo wygenerować numer rejestracyjny" }
})

TriggerEvent('chat:addSuggestion', '/giveheli', 'Give a helicopter to player', {
	{ name="id", help="Identyfikator gracza" },
    { name="vehicle", help="Model pojazdu" },
    { name="<plate>", help="Tablica rejestracyjna pojazdu, pomiń, jeśli chcesz losowo wygenerować numer rejestracyjny" }
})

TriggerEvent('chat:addSuggestion', '/delcarplate', 'Delete a owned vehicle by plate number', {
	{ name="plate", help="Vehicle's plate number" }
})

RegisterNetEvent('esx_giveownedcar:spawnVehicle')
AddEventHandler('esx_giveownedcar:spawnVehicle', function(playerID, model, playerName, type, vehicleType)
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local carExist  = false

	ESX.Game.SpawnVehicle(model, coords, 0.0, function(vehicle) --get vehicle info
		if DoesEntityExist(vehicle) then
			carExist = true
			SetEntityVisible(vehicle, false, false)
			SetEntityCollision(vehicle, false)
			
			local newPlate     = exports.esx_vehicleshop:GeneratePlate()
			local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
			vehicleProps.plate = newPlate
			TriggerServerEvent('esx_giveownedcar:setVehicle', vehicleProps, playerID, vehicleType)
			ESX.Game.DeleteVehicle(vehicle)	
			if type ~= 'console' then
				-- ESX.ShowNotification(_U('gived_car', model, newPlate, playerName))
			else
				-- local msg = ('addCar: ' ..model.. ', plate: ' ..newPlate.. ', toPlayer: ' ..playerName)
				TriggerServerEvent('esx_giveownedcar:printToConsole', msg)
			end				
		end		
	end)
	
	Wait(2000)
	if not carExist then
		if type ~= 'console' then
			ESX.ShowNotification(_U('unknown_car', model))
		else
			TriggerServerEvent('esx_giveownedcar:printToConsole', "ERROR: "..model.." is an unknown model pojazdu")
		end		
	end
end)

RegisterNetEvent('esx_giveownedcar:spawnVehiclePlate')
AddEventHandler('esx_giveownedcar:spawnVehiclePlate', function(playerID, model, plate, playerName, type, vehicleType)
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local generatedPlate = string.upper(plate)
	local carExist  = false

	ESX.TriggerServerCallback('esx_vehicleshop:isPlateTaken', function (isPlateTaken)
		if not isPlateTaken then
			ESX.Game.SpawnVehicle(model, coords, 0.0, function(vehicle) --get vehicle info	
				if DoesEntityExist(vehicle) then
					carExist = true
					SetEntityVisible(vehicle, false, false)
					SetEntityCollision(vehicle, false)	
					
					local newPlate     = string.upper(plate)
					local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
					vehicleProps.plate = newPlate
					TriggerServerEvent('esx_giveownedcar:setVehicle', vehicleProps, playerID, vehicleType, job)
					ESX.Game.DeleteVehicle(vehicle)
					if type ~= 'console' then
						-- ESX.ShowNotification(_U('gived_car',  model, newPlate, playerName))
					else
						local msg = ('addCar: ' ..model.. ', plate: ' ..newPlate.. ', toPlayer: ' ..playerName)
						TriggerServerEvent('esx_giveownedcar:printToConsole', msg)
					end				
				end
			end)
		else
			carExist = true
			if type ~= 'console' then
				-- ESX.ShowNotification(_U('plate_already_have'))
			else
				local msg = ('ERROR: this plate is already been used on another vehicle')
				TriggerServerEvent('esx_giveownedcar:printToConsole', msg)
			end					
		end
	end, generatedPlate)
	
	Wait(2000)
	if not carExist then
		if type ~= 'console' then
			-- ESX.ShowNotification(_U('unknown_car', model))
		else
			TriggerServerEvent('esx_giveownedcar:printToConsole', "ERROR: "..model.." is an unknown model pojazdu")
		end		
	end	
end)


RegisterNetEvent('esx_giveownedcar:spawnVehiclemj')
AddEventHandler('esx_giveownedcar:spawnVehiclemj', function(playerID, model, playerName, type, vehicleType)
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local carExist  = false

	ESX.Game.SpawnVehicle(model, coords, 0.0, function(vehicle) --get vehicle info
		if DoesEntityExist(vehicle) then
			carExist = true
			SetEntityVisible(vehicle, false, false)
			SetEntityCollision(vehicle, false)
			
			local newPlate     = exports.esx_vehicleshop:GeneratePlate()
			local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
			vehicleProps.plate = newPlate
			TriggerServerEvent('esx_giveownedcar:setVehicle2', vehicleProps, playerID, vehicleType)
			ESX.Game.DeleteVehicle(vehicle)	
			if type ~= 'console' then
				-- ESX.ShowNotification(_U('gived_car', model, newPlate, playerName))
			else
				-- local msg = ('addCar: ' ..model.. ', plate: ' ..newPlate.. ', toPlayer: ' ..playerName)
				TriggerServerEvent('esx_giveownedcar:printToConsole', msg)
			end				
		end		
	end)
	
	Wait(2000)
	if not carExist then
		if type ~= 'console' then
			ESX.ShowNotification(_U('unknown_car', model))
		else
			TriggerServerEvent('esx_giveownedcar:printToConsole', "ERROR: "..model.." is an unknown model pojazdu")
		end		
	end
end)