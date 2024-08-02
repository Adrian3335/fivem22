local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = exports["es_extended"]:getSharedObject()
local jest = nil
local kajdanki = false


local disabledTrunk = {
	[1] = "zentorno",
	[2] = "bdivo",
	[3] = "mini",
	[4] = "trophytruck2",
	[5] = "nova",
	[6] = "pista",
	[7] = "bullet",
	[8] = "gsxb",
	[9] = "ONEFIFTY55",
	[10] = "hs",
	[11] = "c63coupe",
	[12] = "arrinera",
	[13] = "tropos",
	[14] = "charge4",
	[15] = "regera",
	[16] = "ar33",
	[17] = "hermes",
	[18] = "rubi3d",
	[19] = "italigtb2",
	[20] = "jester2",
	[21] = "continental",
	[22] = "GP1",
	[23] = "boss429",
	[24] = "gt3rs",
	[25] = "infernus2",
	[26] = "turismo2",
	[27] = "610lb",
	[28] = "apollos",
	[29] = "e30mt2",
	[30] = "488",
	[31] = "aventadors",
	[32] = "pd458wb",
	[33] = "lp580",
	[34] = "mb300sl",
	[35] = "lp770",
	[36] = "650s",
	[37] = "rmodlp570",
	[38] = "morgan",
	[39] = "lykan",
	[40] = "ts1",
	[41] = "polaventa",
	[42] = "taxi"
}



function isVehicleTrunkInUse(vehicle)
	return Entity(vehicle).state.taken
end

local inTrunk = nil
local cam = 0

function checkTrunk(veh)
	for i = 1, #disabledTrunk do
		if GetEntityModel(veh) == GetHashKey(disabledTrunk[i]) then
			return false
		end
	end

	return true
end

function cameraTrunk()
	local ped = PlayerPedId()
	if not DoesCamExist(cam) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		SetCamActive(cam, true)
		RenderScriptCams(true, false, 0, true, true)
		SetCamCoord(cam, GetEntityCoords(ped))
	end

	AttachCamToEntity(cam, ped, 0.0, -2.0, 1.0, true)
	SetCamRot(cam, -30.0, 0.0, GetEntityHeading(ped))
end

function cameraTrunkDisable()
	RenderScriptCams(false, false, 0, 1, 0)
	DestroyCam(cam, false)
end

function showNotification(msg, me, cop)
	ESX.ShowNotification(msg)
end

function HasPerk_FastTrunk()
	return true
end

RegisterNetEvent("bagaznik:forceIn", function(cop)
	local me = GetPlayerServerId(PlayerId())
	local Ped = PlayerPedId()
	local coords = GetEntityCoords(Ped, true)
	if not IsPedInAnyVehicle(Ped, false) then	
		if not inTrunk then
				local targetVehicle = ESX.Game.GetClosestVehicle(coords)
				if GetDistanceBetweenCoords(GetEntityCoords(targetVehicle, true), coords, true) < 5.0 and not isVehicleTrunkInUse(targetVehicle) then
					local plate = GetVehicleNumberPlateText(targetVehicle)
					if not DoesEntityExist(targetVehicle) then
						showNotification('Zbyt daleko do bagażnika', me, cop)
					elseif IsThisModelACar(GetEntityModel(targetVehicle)) and checkTrunk(targetVehicle) and not DoesVehicleHaveDoor(targetVehicle, 6) and DoesVehicleHaveDoor(targetVehicle, 5) then
						RequestAnimDict("fin_ext_p1-7")
						while not HasAnimDictLoaded("fin_ext_p1-7") do
							Citizen.Wait(0)
						end

						if DoesEntityExist(targetVehicle) then
							local d1, d2 = GetModelDimensions(GetEntityModel(targetVehicle))
							local ped = PlayerPedId()
							local lockStatus = GetVehicleDoorLockStatus(targetVehicle)
							if lockStatus == 1 then						
								local timeEnter = 6
								if HasPerk_FastTrunk() then
									timeEnter = 2.5
								end

										local player = ESX.Game.GetClosestPlayer()
										local playerPed = GetPlayerPed(player)
										if not IsPedBeingStunned(playerPed) and IsPlayerFreeForAmbientTask(PlayerId()) then
											if not IsEntityAttached(playerPed) or GetDistanceBetweenCoords(GetEntityCoords(playerPed), GetEntityCoords(PlayerPedId()), true) >= 3.0 then

												inTrunk = { vehicle = targetVehicle, plate = plate}
												--SetVehicleDoorOpen(targetVehicle, 5, false)
												local id = NetworkGetNetworkIdFromEntity(targetVehicle)
													
												-- --print(id)
												SetNetworkIdCanMigrate(id, true)
												SetEntityAsMissionEntity(targetVehicle, true, false)
												SetVehicleHasBeenOwnedByPlayer(targetVehicle,  true)
												kajdanki = true
												local ped = PlayerPedId()
												ClearPedTasksImmediately(ped)
												TaskPlayAnim(ped, "fin_ext_p1-7", "cs_devin_dual-7", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
												AttachEntityToEntity(ped, targetVehicle, 0, -0.1, d1.y + 0.85, d2.z - 0.87, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
												jest = GetEntityAttachedTo(ped)
												TriggerServerEvent('kaiser_bagaznik:setIn', NetworkGetNetworkIdFromEntity(targetVehicle))
											else
												ESX.ShowNotification('Bagażnik jest zajęty!')
											end	
										end
			
							else
								ESX.ShowNotification('Samochód jest zamknięty!')
							end									
							
						else
							showNotification('Zbyt daleko do bagażnika', me, cop)
						end
					else
						showNotification('W tym aucie nie można umieścić w bagażniku!', me, cop)
					end
				end
		else
			showNotification('Już w bagażniku', me, cop)
		end
	else
	
	end
end)


RegisterNetEvent("bagaznik:forceInFast", function(cop)
	local me = GetPlayerServerId(PlayerId())
	local Ped = PlayerPedId()
	local coords = GetEntityCoords(Ped, true)
	if not IsPedInAnyVehicle(Ped, false) then	
		if not inTrunk then
				local targetVehicle = ESX.Game.GetClosestVehicle(coords)
				if GetDistanceBetweenCoords(GetEntityCoords(targetVehicle, true), coords, true) < 5.0 and not isVehicleTrunkInUse(targetVehicle) then
					local plate = GetVehicleNumberPlateText(targetVehicle)
					if not DoesEntityExist(targetVehicle) then
						showNotification('Zbyt daleko do bagażnika', me, cop)
					elseif IsThisModelACar(GetEntityModel(targetVehicle)) and checkTrunk(targetVehicle) and not DoesVehicleHaveDoor(targetVehicle, 6) and DoesVehicleHaveDoor(targetVehicle, 5) then
						RequestAnimDict("fin_ext_p1-7")
						while not HasAnimDictLoaded("fin_ext_p1-7") do
							Citizen.Wait(0)
						end

						if DoesEntityExist(targetVehicle) then
							local d1, d2 = GetModelDimensions(GetEntityModel(targetVehicle))
							local ped = PlayerPedId()
							local lockStatus = GetVehicleDoorLockStatus(targetVehicle)
							if lockStatus == 1 then						

								local player = ESX.Game.GetClosestPlayer()
								local playerPed = GetPlayerPed(player)
								if (not IsPedBeingStunned(playerPed) and IsPlayerFreeForAmbientTask(PlayerId())) or LocalPlayer.state.IsDead == true then
									if not IsEntityAttached(playerPed) or GetDistanceBetweenCoords(GetEntityCoords(playerPed), GetEntityCoords(PlayerPedId()), true) >= 3.0 then

										inTrunk = { vehicle = targetVehicle, plate = plate}
										--SetVehicleDoorOpen(targetVehicle, 5, false)
										local id = NetworkGetNetworkIdFromEntity(targetVehicle)
											
										-- --print(id)
										SetNetworkIdCanMigrate(id, true)
										SetEntityAsMissionEntity(targetVehicle, true, false)
										SetVehicleHasBeenOwnedByPlayer(targetVehicle,  true)
										kajdanki = true
										local ped = PlayerPedId()
										ClearPedTasksImmediately(ped)
										TaskPlayAnim(ped, "fin_ext_p1-7", "cs_devin_dual-7", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
										AttachEntityToEntity(ped, targetVehicle, 0, -0.1, d1.y + 0.85, d2.z - 0.87, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
										jest = GetEntityAttachedTo(ped)
										TriggerServerEvent('kaiser_bagaznik:setIn', NetworkGetNetworkIdFromEntity(targetVehicle))
									else
										ESX.ShowNotification('Bagażnik jest zajęty!')
									end	
								end
						

							else
								ESX.ShowNotification('Samochód jest zamknięty!')
							end									
							
						else
							showNotification('Zbyt daleko do bagażnika', me, cop)
						end
					else
						showNotification('W tym aucie nie można umieścić w bagażniku!', me, cop)
					end
				end
		else
			showNotification('Już w bagażniku', me, cop)
		end
	else
	
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		--ss
		if inTrunk then
			local me = PlayerPedId()
			local coords = GetEntityCoords(me, true)			
			local ped = PlayerPedId()
			local d1, d2 = GetModelDimensions(GetEntityModel(inTrunk.vehicle))	
			AttachEntityToEntity(ped, inTrunk.vehicle, 0, -0.1, d1.y + 0.85, d2.z - 0.87, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
			if inTrunk.vehicle == nil then
				forceOutFast()
			end
		elseif not inTrunk then
			--targetVehicle2 = nil
			Citizen.Wait(50)
		end
	end
end)

function forceOutFast()
	if inTrunk then	
		local ped = PlayerPedId()
		ClearPedTasks(ped)
		DetachEntity(ped)

		local DropCoords = GetEntityCoords(ped, true)
		SetEntityCoords(ped, DropCoords.x + 1.5, DropCoords.y + 1.5, DropCoords.z)
		SetVehicleDoorOpen(targetVehicle, 5, 1, 1)	
		cameraTrunkDisable()
		TriggerServerEvent('kaiser_bagaznik:setOut', NetworkGetNetworkIdFromEntity(inTrunk.targetVehicle))
		inTrunk = nil
		wsadzono = true
		kajdanki = false
		
	else
		showNotification('Nie jesteś w bagażniku!', GetPlayerServerId(PlayerId()), cop)
	end
end


RegisterNetEvent("bagaznik:forceOut", function(cop)
	if inTrunk then	
		local ped = PlayerPedId()
		ClearPedTasks(ped)
		DetachEntity(ped)

		local DropCoords = GetEntityCoords(ped, true)
		SetEntityCoords(ped, DropCoords.x + 1.5, DropCoords.y + 1.5, DropCoords.z)
		SetVehicleDoorOpen(targetVehicle, 5, 1, 1)	
		cameraTrunkDisable()
		TriggerServerEvent('kaiser_bagaznik:setOut', NetworkGetNetworkIdFromEntity(inTrunk.vehicle))
		inTrunk = nil
		wsadzono = true
		kajdanki = false			
	else
		showNotification('Nie jesteś w bagażniku!', GetPlayerServerId(PlayerId()), cop)
	end
end)

RegisterNetEvent("bagaznik:forceOutFast", function(cop)
	if inTrunk then	
		local ped = PlayerPedId()
		ClearPedTasks(ped)
		DetachEntity(ped)

		local DropCoords = GetEntityCoords(ped, true)
		SetEntityCoords(ped, DropCoords.x + 1.5, DropCoords.y + 1.5, DropCoords.z)
		SetVehicleDoorOpen(targetVehicle, 5, 1, 1)	
		cameraTrunkDisable()
		TriggerServerEvent('kaiser_bagaznik:setOut', NetworkGetNetworkIdFromEntity(inTrunk.vehicle))
		inTrunk = nil
		wsadzono = true
		kajdanki = false			
		--SetEntityCollision(PlayerPedId(), true, true)		
	else
		showNotification('Nie jesteś w bagażniku!', GetPlayerServerId(PlayerId()), cop)
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

        if IsControlJustReleased(0, Keys['X']) and not LocalPlayer.state.IsDead and inTrunk and not LocalPlayer.state.IsHandcuffed then
            local targetVehicle
            if inTrunk then
                targetVehicle = inTrunk.vehicle
            else
                targetVehicle = ESX.Game.GetVehicleInDirection()
            end

            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(targetVehicle), true) >= 0.5 then
                if not inTrunk then
                    TriggerEvent('bagaznik:forceIn', GetPlayerServerId(PlayerId()))
                else
                    TriggerEvent('bagaznik:forceOut', GetPlayerServerId(PlayerId()))
                end
            end
        end

		if inTrunk then
			local out = nil
			
			if not IsEntityPlayingAnim(PlayerPedId(), 'fin_ext_p1-7', 'cs_devin_dual-7',3) then
				RequestAnimDict("fin_ext_p1-7")
				while not HasAnimDictLoaded("fin_ext_p1-7") do
					Citizen.Wait(0)
				end			
				TaskPlayAnim(PlayerPedId(), "fin_ext_p1-7", "cs_devin_dual-7", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
			end
			
			if DoesEntityExist(inTrunk.vehicle) then
				if IsEntityVisible(inTrunk.vehicle) then
					cameraTrunk()
					DisableControlAction(2, 24, true) -- Attack
					DisableControlAction(2, 257, true) -- Attack 2
					DisableControlAction(2, 25, true) -- Aim
					DisableControlAction(2, 263, true) -- Melee Attack 1
					DisableControlAction(2, Keys['R'], true) -- Reload
					DisableControlAction(2, Keys['TOP'], true) -- Open phone (not needed?)
					DisableControlAction(2, Keys['SPACE'], true) -- Jump
					DisableControlAction(2, Keys['Q'], true) -- Cover
					DisableControlAction(2, Keys['~'], true) -- Hands up
					DisableControlAction(2, Keys['B'], true) -- Pointing
					DisableControlAction(2, Keys['TAB'], true) -- Select Weapon
					DisableControlAction(2, Keys['F'], true) -- Also 'enter'?
					DisableControlAction(2, Keys['F3'], true) -- Animations
					DisableControlAction(2, Keys['LEFTSHIFT'], true) -- Running
					DisableControlAction(2, Keys['V'], true) -- Disable changing view
					DisableControlAction(2, 59, true) -- Disable steering in vehicle
					DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
					DisableControlAction(0, 47, true)  -- Disable weapon
					DisableControlAction(0, 264, true) -- Disable melee
					DisableControlAction(0, 257, true) -- Disable melee
					DisableControlAction(0, 140, true) -- Disable melee
					DisableControlAction(0, 141, true) -- Disable melee
					DisableControlAction(0, 142, true) -- Disable melee
					DisableControlAction(0, 143, true) -- Disable melee
					DisableControlAction(0, 75, true)  -- Disable exit vehicle
					DisableControlAction(27, 75, true) -- Disable exit vehicle
					DisableControlAction(0, 11, true)
				else
					out = true
				end
			else
				out = false
			end

			if out ~= nil then
				forceOutFast()
				if out then
					SetEntityVisible(PlayerPedId(), true)
				end
			end
		end
	end
end)

function checkInTrunk()
	return inTrunk ~= nil
end

AddEventHandler('playerSpawned', function()
	if inTrunk then
		forceOutFast()
	end
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		--local playerPed = PlayerPedId()

	if kajdanki then
		DisableControlAction(2, 182, true) -- L
		DisableControlAction(2, 246, true) -- Y

		else
			Citizen.Wait(500)
		end
	end
end)
