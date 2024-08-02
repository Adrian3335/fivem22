Config.Zones = {}

local pokazuj = true

RegisterCommand('opis2', function(source, args)
	local text = table.concat(args, " ", 1)	
	local coords = GetEntityCoords(PlayerPedId(), true)
	if text == nil then
		ESX.ShowNotification("Podaj opis")
	else
		local ped = PlayerPedId()
		local inVehicle = IsPedInAnyVehicle(ped, false)
		if inVehicle then
			local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(ped, true))
			TriggerServerEvent('addopis2', coords, text, GetVehiclePedIsIn(ped, true), plate)
		else
			TriggerServerEvent('addopis2', coords, text)
		end
	end
end, false) 

RegisterCommand('opis2toggle', function(source, args)
	pokazuj = not pokazuj
	ESX.ShowNotification(pokazuj and "Włączyłeś opis2!" or "Wyłączyłes opis2!")
end, false)

RegisterCommand('opis2usun', function(source, args)
	local id = tonumber(args[1])
	if id == nil then
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
		local distance = 3
		local idopisu = 1
		for k,v in pairs(Config.Zones) do		
		local distancenew = #(coords - vec3(v.Pos.x,v.Pos.y,v.Pos.z))
			if distancenew < distance then 	
				distance = distancenew
				idopisu = v.idopisu
			end
		end		
		if idopisu ~= 1 then
			TriggerServerEvent('addopis2usun', idopisu, true)	
		end
	else
		TriggerServerEvent('addopis2usun', id)
	end
end, false) 


RegisterCommand('opis2lista', function(source, args)
	local text = table.concat(args, " ", 1)	
	local coords = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('addopis2lista')
end, false) 

RegisterNetEvent('addopis2')
AddEventHandler('addopis2', function(coords, text, source, ide, veh, plate)
	if veh then
		Config.Zones[#Config.Zones + 1] = {text = text, Pos = coords, id = source, idopisu = ide, vehicle = veh, plate = plate}
	else
		Config.Zones[#Config.Zones + 1] = {text = text, Pos = coords, id = source, idopisu = ide}
	end
end)

RegisterNetEvent('addopis2usun')
AddEventHandler('addopis2usun', function(ide)
	for k,v in pairs(Config.Zones) do
		if v.idopisu == ide then	
			table.remove(Config.Zones, tonumber(k))
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local letsleep = true
		if pokazuj then
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			for k,v in pairs(Config.Zones) do	
				if v.vehicle then
					local vehicles = ESX.Game.GetVehiclesInArea(coords, 25.0)
					local vehicle 
					for kk,vv in pairs(vehicles) do 
						local plate = GetVehicleNumberPlateText(vv, true)
						if plate == v.plate then
							vehicle = vv
							v.coords = GetEntityCoords(vehicle, true)
						end	
					end
					
					local entitycoords= GetEntityCoords(vehicle, true)
					local distance = #(coords - entitycoords)
					if distance < 6 then						
						letsleep = false
						DrawText3D(entitycoords.x, entitycoords.y, entitycoords.z, v.text)		
					end
				else
					local distance = #(coords - vec3(v.Pos.x,v.Pos.y,v.Pos.z))
					if distance < 6 then
						
						local Texcik5 = {
							["x"] = v.Pos.x,
							["y"] = v.Pos.y,
							["z"] = v.Pos.z
						}	
						letsleep = false
						DrawText3D(v.Pos.x, v.Pos.y, v.Pos.z, v.text)			
					end					
				end
			end
		end
		if letsleep then
			Citizen.Wait(1000)
		end
	end
end)

DrawText3D = function(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local factor = #text / 370
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
end