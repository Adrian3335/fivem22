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

local GUI                     = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local OnJob                   = false
local TargetCoords            = nil
local CurrentlyTowedVehicle   = nil
local Blips                   = {}
local NPCOnJob                = false
local NPCTargetTowable        = nil
local NPCTargetTowableZone    = nil
local NPCTargetDistance       = 0
local NPCHasSpawnedTowable    = false
local NPCLastCancel           = GetGameTimer() - 5 * 60000
local NPCHasBeenNextToTowable = false
local NPCTargetDeleterZone    = false
local IsDead                  = false
local FirstSpawn              = true
local CurrentTask             = {}
local License                 = nil
local LockFlatbedControl      = false
GUI.Time                      = 0

function SelectRandomTowable()
	local index = GetRandomIntInRange(1,  #Config.Towables)

	for k,v in pairs(Config.Zones) do
		if v.Pos.x == Config.Towables[index].x and v.Pos.y == Config.Towables[index].y and v.Pos.z == Config.Towables[index].z then
			return k
		end
	end
end

function SetVehicleMaxMods(vehicle)
	local t = {
		modEngine       = 3,
		modBrakes       = 2,
		modTransmission = 2,
		modSuspension   = 3,
		modArmor        = 4,
		modXenon        = true,
		modTurbo        = true,
		dirtLevel       = 0
	}

	ESX.Game.SetVehicleProperties(vehicle, t)
end


function OpenGetStocksMenu()
	ESX.TriggerServerCallback('esx_mechanicjob:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = 'Schowek ['..#items..']',
			align    = 'left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_mechanicjob:getStockItem', itemName, count)

					Citizen.Wait(1000)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('esx_mechanicjob:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('inventory'),
			align    = 'left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('invalid_quantity'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_mechanicjob:putStockItems', itemName, count)

					Citizen.Wait(1000)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

RegisterNetEvent('esx_mechanicjob:onHijack')
AddEventHandler('esx_mechanicjob:onHijack', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		local chance = math.random(100)
		local alarm  = math.random(100)

		if DoesEntityExist(vehicle) then
			if alarm <= 33 then
				SetVehicleAlarm(vehicle, true)
				StartVehicleAlarm(vehicle)
			end

			TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)

			CreateThread(function()
				Citizen.Wait(10000)
				if chance <= 66 then
					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
					ESX.ShowNotification(_U('veh_unlocked'))
				else
					ESX.ShowNotification(_U('hijack_failed'))
					Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
				end
			end)
		end
	end
end)


RegisterNetEvent('esx_mechanicjob:onWash')
AddEventHandler('esx_mechanicjob:onWash', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end


		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
			local success = exports['rp_ui']:Progbar('Myjesz auto.', 3500)
			CreateThread(function()
				if success then
				SetVehicleDirtLevel(vehicle, 0)
				Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
				ESX.ShowNotification("Pojazd Umyty")
				TriggerServerEvent("need_mechanics:onWash")
				end
			end)
		end
	end
end)

RegisterNetEvent('esx_mechanicjob:onCarokit')
AddEventHandler('esx_mechanicjob:onCarokit', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end


		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_HAMMERING', 0, true)
			exports['rp_ui']:Progbar('Naprawiasz karoserię.', 30000)
			CreateThread(function()
				-- Citizen.Wait(10000)
				SetVehicleFixed(vehicle)
				SetVehicleDeformationFixed(vehicle)
				Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
				ESX.ShowNotification(_U('body_repaired'))
				TriggerServerEvent("need_mechanics:RemoveCaroKit")
			end)
		end
	end
end)

RegisterNetEvent('esx_mechanicjob:onFixkit')
AddEventHandler('esx_mechanicjob:onFixkit', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		ESX.TriggerServerCallback('esx_mechanicjob:getczesci', function (czesci)
			if czesci >= 3 then
				if IsPedInAnyVehicle(playerPed, false) then
					vehicle = GetVehiclePedIsIn(playerPed, false)
				else
					vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
				end

				if DoesEntityExist(vehicle) then
					TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
					CreateThread(function()
						Citizen.Wait(20000)
						local first = true
						while first or not GetIsVehicleEngineRunning(vehicle) do
							SetVehicleEngineHealth(vehicle, 1000.0)

							SetVehicleUndriveable(vehicle, false)
							SetVehicleEngineOn(vehicle, true, true)
							first = false
							Citizen.Wait(0)
						end
						ESX.ShowNotification(_U('veh_repaired'))
						TriggerServerEvent('inter:forceUpdateOwnedVehicle', ESX.Game.GetVehicleProperties(vehicle))
						TriggerServerEvent('esx_mechanicjob:wezczesci')
					end)
				end
			else
				ESX.ShowNotification('Nie posiadasz części zamiennych (5 sztuk)')
			end
		end)
	end
end)

RegisterNetEvent('esx_mechanicjob:onFixkitFree')
AddEventHandler('esx_mechanicjob:onFixkitFree', function(health)
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	
	if health == nil then
		health = 1000.0
	end

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		end

		if DoesEntityExist(vehicle) then
			TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
   
                  
                onComplete = function()
                 CreateThread(function()
					local first = true
					while first or not GetIsVehicleEngineRunning(vehicle) do
						SetVehicleEngineHealth(vehicle, health)

						SetVehicleUndriveable(vehicle, false)
						SetVehicleEngineOn(vehicle, true, true)
						first = false
						Citizen.Wait(0)
					end
					TriggerServerEvent('inter:forceUpdateOwnedVehicle', ESX.Game.GetVehicleProperties(vehicle))
					ESX.ShowNotification(_U('veh_repaired'))
				end)
				ClearPedTasks(playerPed)
				  end
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(3)
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
		if NPCTargetTowableZone ~= nil and not NPCHasSpawnedTowable then
			local coords = GetEntityCoords(PlayerPedId())
			local zone   = Config.Zones[NPCTargetTowableZone]
			if #(coords - vec3(zone.Pos.x, zone.Pos.y, zone.Pos.z)) < Config.NPCSpawnDistance then
				local model = Config.Vehicles[GetRandomIntInRange(1,  #Config.Vehicles)]
				ESX.Game.SpawnVehicle(model, zone.Pos, 0, function(vehicle)
					SetVehicleHasBeenOwnedByPlayer(vehicle, true)
					NPCTargetTowable = vehicle
				end)

				NPCHasSpawnedTowable = true
			end
		end

		if NPCTargetTowableZone ~= nil and NPCHasSpawnedTowable and not NPCHasBeenNextToTowable then
			local coords = GetEntityCoords(PlayerPedId())
			local zone   = Config.Zones[NPCTargetTowableZone]
			if(#(coords - vec3(zone.Pos.x, zone.Pos.y, zone.Pos.z)) < Config.NPCNextToDistance) then
				ESX.ShowNotification(_U('please_tow'))
				NPCHasBeenNextToTowable = true
			end
		end
	else 
		Citizen.Wait(500)
	end
	end
end)


function OpenVehicleSpawnerMenu()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',{
		title		= ('Garaż mechaników'),
		align		= 'center',
		elements	= Config.AuthorizedVehicles[ESX.PlayerData.job.grade_name]
	}, function(data, menu)
		menu.close()
		ESX.Game.SpawnVehicle(data.current.model, Config.Zones.VehicleSpawnPoint.PosSpawnPoint, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
			local playerPed = PlayerPedId()
			ESX.Game.SetVehicleProperties(vehicle, data.current.model)
			SetVehicleMaxMods(vehicle)
			plate = "MECH " .. math.random(100,999)
			SetVehicleNumberPlateText(vehicle, plate)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			-- TriggerEvent('ls:dodajklucze', GetVehicleNumberPlateText(vehicle))
			exports['sv-carkeys']:addKey(plate)
		end)
	end, function(data, menu)
		menu.close()
		CurrentAction = 'Vehicles'
		CurrentActionMsg = 'Naciśnij ~INPUT_CONTEXT~ aby wejść w ~p~Menu Pojazdów~s~.'
		CurrentActionData = {}
	end)
end

function OpenBossMenu()
	if ESX.PlayerData.job.grade_name == "boss" or ESX.PlayerData.job.grade_name == "chief" then
		TriggerEvent('esx_society:openBossMenu', ESX.PlayerData.job.name, function(data, menu)
			menu.close()
		end, { showmoney = true, withdraw = true, deposit = true, wash = false, employees = true })
	end
end

local blips = {
     {title="Mechanik", colour=5, id=446, x =  135.7673, y = -3029.5696, z = 6.4349}
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentSubstringPlayerName("<font face='Poppins-Medium' size= '11'>Mechanik</font>" ) 
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)


function OpenMobileMecanoActionsMenu()
	local elements = {}

	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' then
		table.insert(elements, {label = ('Interakcje z samochodem'), value = 'car_spawner'})
		table.insert(elements, {label = ('Interakcje z obiektami'), value = 'object_spawner'})
		table.insert(elements, {label = ('Dźwięki'), value = 'dzwieki'})
		table.insert(elements, {label = ('Tablet'), value = 'tablet'})
	end

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_mecano_actions', {
		title    = _U('mechanic'),
		align    = 'center',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'tablet' then
			menu.close()
		elseif data.current.value == 'dzwieki' then
			menu.close()
			soundboard_display()
		elseif data.current.value == 'car_spawner' then
			local elements2 = {}
			if not IsPedInAnyVehicle(PlayerPedId(), false) then
				table.insert(elements2, {label = _U('hijack'), value = 'hijack_vehicle'})
				table.insert(elements2, {label = ('Naprawa silnika'), value = 'fix_vehicle'})
				table.insert(elements2, {label = ('Naprawa karoserii'), value = 'fix_vehicle2'})
				table.insert(elements2, {label = ('Umyj pojazd'), value = 'clean_vehicle'})
				table.insert(elements2, {label = ('Odholuj pojazd'), value = 'impound_vehicle'})
			end
			
			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
		
			local vehicle = GetVehiclePedIsIn(playerPed, true)
			if IsVehicleModel(vehicle, `flatbed`) then
				table.insert(elements2, {label = _U('flat_bed'), value = 'dep_vehicle'})
			end
			
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_mecano_actions_car', {
				title    = 'Interakcje z samochodem',
				align    = 'center',
				elements = elements2
			}, function(data2, menu2)

				if data2.current.value == 'Tuning' then
					menu.close()
					menu2.close()
					local ped = PlayerPedId()
					if IsPedInAnyVehicle(ped, false) then
						local vehicle = GetVehiclePedIsIn(ped, false)
						TriggerEvent('LSC:build', vehicle, true, "Tuning", "shopui_title_carmod", function(obj)
							TriggerEvent('LSC:open', 'categories')
							FreezeEntityPosition(vehicle, true)
						end, function()
							FreezeEntityPosition(vehicle, false)
						end)
					else
						ESX.ShowNotification('Musisz być w pojeździe!')
					end				
				elseif data2.current.value == 'hijack_vehicle' then
					local playerPed = PlayerPedId()
					local coords    = GetEntityCoords(playerPed)

					if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
						local vehicle
						if IsPedInAnyVehicle(playerPed, false) then
							vehicle = GetVehiclePedIsIn(playerPed, false)
						else
							vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
						end

						if DoesEntityExist(vehicle) then
							local model = GetEntityModel(vehicle)
							if not IsThisModelAHeli(model) and not IsThisModelAPlane(model) and not IsThisModelABoat(model) then
								TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
								CreateThread(function()
									Citizen.Wait(20000)
									while GetVehicleDoorsLockedForPlayer(vehicle, PlayerId()) ~= false do
										SetVehicleDoorsLocked(vehicle, 1)
										SetVehicleDoorsLockedForAllPlayers(vehicle, false)
										Citizen.Wait(0)
									end

									Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
									ESX.ShowNotification(_U('vehicle_unlocked'))
								end)
							end
						end
					else
						ESX.ShowNotification('~r~Brak pojazdu w pobliżu')
					end
				elseif data2.current.value == 'fix_vehicle' then
					local playerPed = PlayerPedId()
					local coords    = GetEntityCoords(playerPed)

					if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
						local vehicle = nil
						if IsPedInAnyVehicle(playerPed, false) then
							vehicle = GetVehiclePedIsIn(playerPed, false)
						else
							vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
						end

						if DoesEntityExist(vehicle) then
							TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
							CreateThread(function()
								Citizen.Wait(15000)

								local first = true
								while first or not GetIsVehicleEngineRunning(vehicle) do
									SetVehicleEngineHealth(vehicle, 1000.0)

									SetVehicleUndriveable(vehicle, false)
									SetVehicleEngineOn(vehicle, true, true)
								
									first = false
									Citizen.Wait(0)
								end

								Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
								TriggerServerEvent('inter:forceUpdateOwnedVehicle', ESX.Game.GetVehicleProperties(vehicle))
								ESX.ShowNotification(_U('vehicle_repaired'))
							end)
						end
					else
						ESX.ShowNotification('~r~Brak pojazdu w pobliżu')
					end
				elseif data2.current.value == 'fix_vehicle2' then
					local playerPed = PlayerPedId()
					local coords    = GetEntityCoords(playerPed)

					if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
						local vehicle = nil
						if IsPedInAnyVehicle(playerPed, false) then
							vehicle = GetVehiclePedIsIn(playerPed, false)
						else
							vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
						end

						if DoesEntityExist(vehicle) then
							TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
							CreateThread(function()
								Citizen.Wait(15000)

								local first = true
								while first or not GetIsVehicleEngineRunning(vehicle) do
									SetVehicleFixed(vehicle)
									SetVehicleDeformationFixed(vehicle)
									SetVehicleUndriveable(vehicle)
									SetVehicleEngineOn(vehicle, true, true)
								
									first = false
									Citizen.Wait(0)
								end

								Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
								TriggerServerEvent('inter:forceUpdateOwnedVehicle', ESX.Game.GetVehicleProperties(vehicle))
								ESX.ShowNotification(_U('vehicle_repaired'))
							end)
						end
					else
						ESX.ShowNotification('~r~Brak pojazdu w pobliżu')
					end				
				elseif data2.current.value == 'clean_vehicle' then
					local playerPed = PlayerPedId()
					local coords    = GetEntityCoords(playerPed)

					if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
						local vehicle = nil
						if IsPedInAnyVehicle(playerPed, false) then
							vehicle = GetVehiclePedIsIn(playerPed, false)
						else
							vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
						end

						if DoesEntityExist(vehicle) then
							TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
							CreateThread(function()
								Citizen.Wait(5000)
								WashDecalsFromVehicle(vehicle, 1.0)
								SetVehicleDirtLevel(vehicle)

								Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
								ESX.ShowNotification(_U('vehicle_cleaned'))
							end)
						end
					else
						ESX.ShowNotification('~r~Brak pojazdu w pobliżu')
					end
				elseif data2.current.value == 'impound_vehicle' then
					local playerPed = PlayerPedId()
					local coords    = GetEntityCoords(playerPed)	 
					if CurrentTask.Busy then
						return
					end
				
					if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ żeby unieważnić ~p~zajęcie~s~')
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

						CurrentTask.Busy = true
						CurrentTask.Task = ESX.SetTimeout(10000, function()
							ClearPedTasks(playerPed)
							TriggerEvent("esx_impound")

							CurrentTask.Busy = false
							Citizen.Wait(100)
						end)
					else
						ESX.ShowNotification('~r~Brak pojazdu w pobliżu')
					end
					
					CreateThread(function()
						while CurrentTask.Busy do
							Citizen.Wait(1000)

							vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
							if not DoesEntityExist(vehicle) and CurrentTask.Busy then
								ESX.ShowNotification(_U(action .. '_canceled_moved'))
								ESX.ClearTimeout(CurrentTask.Task)

								ClearPedTasks(playerPed)
								CurrentTask.Busy = false
								break
							end
						end
					end)
				elseif data2.current.value == 'dep_vehicle' then
					OnFlatbedUse(`flatbed`)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'object_spawner' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_mecano_actions_spawn', {
				title    = _U('objects'),
				align    = 'center',
				elements = {
					{label = ('Słupek'),     value = 'slupek'},
					{label = ('Barierka'), value = 'barierka'},
					{label = ('Przybornik'), value = 'przybornik'},
				},
			}, function(data2, menu2)
				local model     = data2.current.value

				if model == 'slupek' then
					TriggerServerEvent("esx_pacholek", '1')
				elseif model == 'barierka' then
					TriggerServerEvent("esx_pacholek", '3')
				elseif model == 'przybornik' then
					TriggerServerEvent("esx_pacholek", '4')
					--prop_toolchest_01
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OnFlatbedUse(model, custom)
	local playerPed = PlayerPedId()
	
	local vehicle = GetVehiclePedIsIn(playerPed, true)
	if IsVehicleModel(vehicle, model) then
		if CurrentlyTowedVehicle == nil then
			local targetVehicle = ESX.Game.GetVehicleInDirection(0.0, -15.0, 1.0)
			if not targetVehicle then
				targetVehicle = ESX.Game.GetVehicleInDirection(0.0, -15.0, -1.0)
				if not targetVehicle then
					targetVehicle = ESX.Game.GetVehicleInDirection(0.0, 7.0, 1.0)
					if not targetVehicle then
						targetVehicle = ESX.Game.GetVehicleInDirection(0.0, 7.0, -1.0)
					end
				end
			end
			
			if targetVehicle then
				if vehicle ~= targetVehicle then
					local offset = {
						[`flatbed`] = {x = 0.0, y = -1.8, z = 0.8},
					}

					AttachEntityToEntity(targetVehicle, vehicle, GetEntityBoneIndexByName(vehicle, 'bodyshell'), offset[model].x, offset[model].y, offset[model].z, 0, 0, 0, 1, 1, 0, 1, 0, 1)
					CurrentlyTowedVehicle = targetVehicle
					ESX.ShowNotification(_U('vehicle_success_attached'))

					if NPCOnJob then
						if NPCTargetTowable == targetVehicle then
							ESX.ShowNotification(_U('please_drop_off'))
							if Blips['NPCTargetTowableZone'] ~= nil then
								RemoveBlip(Blips['NPCTargetTowableZone'])
								Blips['NPCTargetTowableZone'] = nil
							end

							if not custom then
								Config.Zones.VehicleDelivery.Type = 1
								Blips['NPCDelivery'] = AddBlipForCoord(Config.Zones.VehicleDelivery.Pos.x, Config.Zones.VehicleDelivery.Pos.y, Config.Zones.VehicleDelivery.Pos.z)
							else
								Blips['NPCDelivery'] = AddBlipForCoord(custom.coords.x, custom.coords.y, custom.coords.z)
							end

							SetBlipRoute(Blips['NPCDelivery'], true)
						end
					end
				else
					ESX.ShowNotification(_U('cant_attach_own_tt'))
				end
			else
				ESX.ShowNotification(_U('no_veh_att'))
			end
		else
			DetachEntity(CurrentlyTowedVehicle, true, true)
			local vehiclesCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -12.0, 0.0)
			SetEntityCoords(CurrentlyTowedVehicle, vehiclesCoords["x"], vehiclesCoords["y"], vehiclesCoords["z"], 1, 0, 0, 1)

			SetVehicleOnGroundProperly(CurrentlyTowedVehicle)
			if NPCOnJob then
				if CurrentlyTowedVehicle == NPCTargetTowable then
					local scope = function()
						SetVehicleHasBeenOwnedByPlayer(NPCTargetTowable, false)
						ESX.Game.DeleteVehicle(NPCTargetTowable)
						StopNPCJob(false, custom ~= nil)
					end

					if custom then
						if custom.check then
							scope()
							if custom.event then
								TriggerEvent(custom.event)
							end
						else
							ESX.ShowNotification(_U('not_right_place'))
						end
					elseif NPCTargetDeleterZone then
						scope()
					else
						ESX.ShowNotification(_U('not_right_place'))
					end
				elseif custom then
					if custom.check then
						ESX.ShowNotification(_U('not_right_veh'))
					end
				elseif NPCTargetDeleterZone then
					ESX.ShowNotification(_U('not_right_veh'))
				end
			end

			CurrentlyTowedVehicle = nil
			ESX.ShowNotification(_U('veh_det_succ'))
		end
	else
		ESX.ShowNotification(_U('imp_flatbed'))
	end
end

function setUniform(maleConfig, femaleConfig)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if maleConfig ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, maleConfig)
			end
		else
			if femaleConfig ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, femaleConfig)
			end
		end
	end)
end


AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('esx:onPlayerSpawn', function(spawn)
	isDead = false
end)

AddEventHandler("need_mechanics:openJobClothes", function()
    local elements = {}
    for k, v in pairs(Config.Mechanics[ESX.PlayerData.job.name].clothes) do
        local hasDostep = false
        for a, b in pairs(v.grades) do
            if b == ESX.PlayerData.job.grade then
                hasDostep = true
                break
            end
        end
        if hasDostep then
            elements[#elements + 1] = {label = v.title, male = v.male, female = v.female}
        end
    end

    local defaultData = elements[1]
    if defaultData then
        setUniform(defaultData.male, defaultData.female)
		przebrany = true
    end
end)

RegisterNetEvent("need_mechanics:returnLastSkin", function()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		przebrany = false
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
end)


RegisterNetEvent('esx_repairkit:onUse')
AddEventHandler('esx_repairkit:onUse', function()
	local playerPed		= PlayerPedId()
	local coords		= GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.1) then
		local vehicle = nil

		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.1, 0, 71)
		end

		if DoesEntityExist(vehicle) then			
			TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
			exports['rp_ui']:Progbar('Naprawiasz silnik.', 20000)
			CreateThread(function()
				ThreadID = GetIdOfThisThread()
				CurrentAction = 'repair'

				-- Citizen.Wait(30 * 1000)

				if CurrentAction ~= nil then
				
					local first = true
					while first or not GetIsVehicleEngineRunning(vehicle) do
						SetVehicleEngineHealth(vehicle, 800.0)

						SetVehicleUndriveable(vehicle, false)
						SetVehicleEngineOn(vehicle, true, true)
						first = false
						Citizen.Wait(0)
					end
					
					Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
					TriggerServerEvent('inter:forceUpdateOwnedVehicle', ESX.Game.GetVehicleProperties(vehicle))
					ESX.ShowNotification('Silnik zostal naprawiony')
					
				end

					TriggerServerEvent('need_mechanics:RemoveFixKit')

				CurrentAction = nil
				TerminateThisThread()
			end)
		end

		CreateThread(function()
			Citizen.Wait(0)
			sleep = true
			if CurrentAction ~= nil then
				sleep = false
		
				ESX.ShowHelpNotification('Wciśnij ~INPUT_VEH_DUCK~ aby anulować')

				if IsControlJustReleased(0, Keys["X"]) then
					TerminateThread(ThreadID)
					ESX.ShowNotification('Naprawianie zostalo anulowane')
					CurrentAction = nil
				end
			end

		end)
	else
		ESX.ShowNotification('~r~Brak pojazdu w pobliżu')
	end

	if sleep then
		Citizen.Wait(1000)
	end
end)


local Naprawia = false 
local OdliczaneSekundy = 0

CreateThread(function(kwota)
	while true do
		Citizen.Wait(0)
		sleep = true
		local playerPed = PlayerPedId()
		local coords123    = GetEntityCoords(playerPed)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local damage = GetVehicleEngineHealth(vehicle)
		local kwota = 0
		local czas = 0
		local czekanie = 0

		if damage <= 200.0 then
			kwota = 2500.0
			czas = 900
			czekanie = math.floor(czas*100)
		elseif damage <= 500.0 then
			kwota = math.floor(2000-(damage*0.2))
			czas = math.floor(1000-(damage*0.5))
			czekanie = math.floor(czas*100)
		elseif damage > 500.0 then
			kwota = math.floor(1500-damage)
			czas = math.floor(1000-(damage*1))
			czekanie = math.floor(czas*400)
		end
		
		local cena = math.floor(kwota / 2)
		
		for k,v in pairs(Config.naprawy) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local distance = #(playerCoords - vec3(v.x, v.y, v.z)) 
			if distance < 15 then
				sleep = false
				DrawMarker(27, v.x, v.y, v.z - 0.2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.5, 3.5, 1.0, 204, 204, 0, 100, false, true, 2, false, false, false, false)
				if IsPedInAnyVehicle(playerPed, true) then
					if distance < 3 then
						if damage < 1000 then
							if not Naprawia then
					
				
								ESX.ShowHelpNotification("Nacisnij ~INPUT_CONTEXT~ aby, ~p~naprawić ~s~pojazd za ~g~"..cena.." ~s~$")
	
							elseif Naprawia then
				
								ESX.ShowHelpNotification("Nacisnij ~INPUT_CONTEXT~ aby, ~p~anulować~s~ naprawę\nPozostało ~g~"..OdliczaneSekundy.." ~s~sekund")
							end
							if IsControlJustReleased(0, Keys['E']) then
								if not Naprawia then
									autonaprawa(cena, czas, czekanie)
								elseif Naprawia then
									anulujNaprawe()
								end
							end
						else
							SetTextComponentFormat("STRING")
							AddTextComponentString("Pojazd ~r~Nie~s~ jest uszkodzony")
							DisplayHelpTextFromStringLabel(0, 0, 1, -1)
						end
					end
				end
			end
		end
		if sleep then
			Citizen.Wait(1000)
		end
	end
end)

RegisterNetEvent("esx_mechanicjob:faktycznanaprawa")
AddEventHandler("esx_mechanicjob:faktycznanaprawa", function(kwota, czas, czekanie)
	Naprawia = true
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	local damage = GetVehicleEngineHealth(vehicle)
	local sekundy = 0

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 70)
	end

	if IsPedInAnyVehicle(playerPed, false) then
		FreezeEntityPosition(vehicle, true)
		sekundy = math.floor(czekanie*0.001)
		OdliczaneSekundy = sekundy
	else
		FreezeEntityPosition(vehicle, false)
	end
end)


CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if Naprawia then
			OdliczaneSekundy = OdliczaneSekundy - 1
			if OdliczaneSekundy == 0 then
				Naprawia = false
				NaprawAuto()
			end
		end
	end
end)

function NaprawAuto()
	local playerPed = PlayerPedId()
	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 70)
	end
	
	SetVehicleFixed(vehicle)
	SetVehicleDeformationFixed(vehicle)
	SetVehicleUndriveable(vehicle)
	SetVehicleEngineOn(vehicle, true, true)
	FreezeEntityPosition(vehicle, false)
	Naprawia = false
end

RegisterNetEvent("need_mechanics:openStash", function()
	local ox_inventory = exports.ox_inventory

    if ox_inventory:openInventory('stash', {id = ESX.PlayerData.job.name}) == false then
        TriggerServerEvent('need_mechanics:loadStash')
        ox_inventory:openInventory('stash', {id = ESX.PlayerData.job.name})
    end
end)

RegisterNetEvent('szafkaotworz', function()
	OpenMechanicActionsMenu()
end)

RegisterNetEvent('szatniaotworz', function()
	OpenJobWear()
end)

RegisterNetEvent('need_mechanics:createUniform', function()
	exports["dbl_multichar"]:openShopMenu(function()
	end, nil, "clothes", "Konfigurator Mechniaka", "Dostosuj strój swojej postaci.")
end)

RegisterNetEvent('dbl_mechanicjob:openbossmenu', function()
	OpenBossMenu()
end)

RegisterNetEvent('dbl_mechanicjob:client:giveBadge', function()
    if ESX.PlayerData.job.grade_name == 'boss' then
        local input = lib.inputDialog('Nadaj odznake', {
            { type = 'number', label = 'ID Gracza', required = true },
            { type = 'input', label = 'Numer odznaki', required = true }
        })

        if not input or not input[1] or not input[2] then return end
        local success = lib.callback.await('fumoPolice:setBadge', false, input[1], input[2])
        if success then
            ESX.ShowNotification('Nadano nową odznakę')
        else
            ESX.ShowNotification('System padł, spróbuj ponownie później')
        end
    else
        ESX.ShowNotification("Nie posiadasz uprawnień!")
    end
end)

RegisterNetEvent('dbl_mechanicjob:schowajauto', function()
    ESX.ShowNotification("Schowałeś pojazd")
    local vehicle = GetClosestVehicle(-185.0159, -1288.6896, 30.3465, 10.0, 0, 70)
    ESX.Game.DeleteVehicle(vehicle)
	exports['sv-carkeys']:removeKey(plate)
end)

RegisterNetEvent('dbl_mechanicjob:vehiclepspawnermenu', function()
	OpenVehicleSpawnerMenu()
end)

RegisterNetEvent("dbl_mechanicjob:odzyskajwfixkit", function()
	if przebrany and exports.ox_inventory:Search('count', 'toolfixkit') <= 0 and not zbieranie then
		zbieranie = true 
		FreezeEntityPosition(PlayerPedId(), true)
		local status = exports['rp_ui']:Progbar('Odzyskujesz części', 15000)
		FreezeEntityPosition(PlayerPedId(), false)
		zbieranie = false 
		ClearPedTasks(PlayerPedId())
		if status then
			TriggerServerEvent('dbl_mechanicjob:serverTrigger', 'toolfixkit')
		end
	else
		exports["dbl_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
	end
end)

RegisterNetEvent("dbl_mechanicjob:odzyskajwytrych", function()
	if przebrany and exports.ox_inventory:Search('count', 'toolwytrych') <= 0 and not zbieranie then
		zbieranie = true 
		FreezeEntityPosition(PlayerPedId(), true)
		local status = exports['rp_ui']:Progbar('Odzyskujesz części', 15000)
		FreezeEntityPosition(PlayerPedId(), false)
		zbieranie = false 
		ClearPedTasks(PlayerPedId())
		if status then
			TriggerServerEvent('dbl_mechanicjob:serverTrigger', 'toolwytrych')
		end
	else
		exports["dbl_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
	end
end)

RegisterNetEvent("dbl_mechanicjob:sponge", function()
	if przebrany and exports.ox_inventory:Search('count', 'sponge') <= 0 and not zbieranie then
		zbieranie = true 
		FreezeEntityPosition(PlayerPedId(), true)
		local status = exports['rp_ui']:Progbar('Nalewasz wodę', 15000)
		FreezeEntityPosition(PlayerPedId(), false)
		zbieranie = false 
		ClearPedTasks(PlayerPedId())
		if status then
			TriggerServerEvent('dbl_mechanicjob:serverTrigger', 'sponge')
		end
	else
		exports["dbl_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
	end
end)

RegisterNetEvent("dbl_mechanicjob:odzyskajcarokit", function()
	if przebrany and exports.ox_inventory:Search('count', 'toolcarokit') <= 0 and not zbieranie then
		zbieranie = true 
		FreezeEntityPosition(PlayerPedId(), true)
		local status = exports['rp_ui']:Progbar('Odzyskujesz części', 15000)
		FreezeEntityPosition(PlayerPedId(), false)
		zbieranie = false 
		ClearPedTasks(PlayerPedId())
		if status then
			TriggerServerEvent('dbl_mechanicjob:serverTrigger', 'toolcarokit')
		end
	else
		exports["dbl_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
	end
end)

RegisterNetEvent("dbl_mechanicjob:stworzwytrych", function()
	if not przerabianie then
		przerabianie = true 
		FreezeEntityPosition(PlayerPedId(), true)
		local status = exports['rp_ui']:Progbar('Tworzysz wytrych', 15000)
		FreezeEntityPosition(PlayerPedId(), false)
		przerabianie = false 
		ClearPedTasks(PlayerPedId())
		if status then
			TriggerServerEvent('dbl_mechanicjob:serverTrigger', 'lockpick')
		end
	else
		exports["dbl_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
	end
end)

RegisterNetEvent("dbl_mechanicjob:stworznaprawke", function()
	if not przerabianie then
		przerabianie = true 
		FreezeEntityPosition(PlayerPedId(), true)
		local status = exports['rp_ui']:Progbar('Tworzysz zestaw naprawczy', 15000)
		FreezeEntityPosition(PlayerPedId(), false)
		przerabianie = false 
		ClearPedTasks(PlayerPedId())
		if status then
			TriggerServerEvent('dbl_mechanicjob:serverTrigger', 'fixkit')
		end
	else
		exports["dbl_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
	end
end)

RegisterNetEvent("dbl_mechanicjob:stworzkaroserie", function()
	if not przerabianie then
		przerabianie = true 
		FreezeEntityPosition(PlayerPedId(), true)
		local status = exports['rp_ui']:Progbar('Tworzysz zestaw naprawczy karoserii', 15000)
		FreezeEntityPosition(PlayerPedId(), false)
		przerabianie = false 
		ClearPedTasks(PlayerPedId())
		if status then
			TriggerServerEvent('dbl_mechanicjob:serverTrigger', 'carokit')
		end
	else
		exports["dbl_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
	end
end)

RegisterNetEvent("esx_mechanicjob:openTuningMenu", function()
	TriggerEvent("rey_tuning:TuningMenu")
end)

function CanOpenTuningMenu(tuningZones)
    -- Sprawdź, czy ESX.PlayerData.job jest zdefiniowane i czy ma właściwość "name" równą 'mechanic'
    -- Sprawdź, czy gracz jest w jakimś pojeździe
    -- Sprawdź, czy przekazane tuningZones nie są puste
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanic' and IsPedInAnyVehicle(ESX.PlayerData.ped) and tuningZones then
        local playerCoords = GetEntityCoords(ESX.PlayerData.ped)
        -- Sprawdź, czy aktualne współrzędne gracza znajdują się w którymkolwiek z obszarów tuningu
        for _, tuningZoneCoords in ipairs(tuningZones) do
            if #(playerCoords - tuningZoneCoords) < 5.0 then
                return true
            end
        end
    end
    return false
end

-- Obsługa naciśnięcia klawisza "E" (kod klawisza 38)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local tuningZones = {
            vector3(145.3667, -3030.4856, 7.042),  -- Współrzędne pierwszego pola tuningu
            vector3(136.2872, -3030.3000, 7.0422)   -- Współrzędne drugiego pola tuningu
            -- Tutaj możesz dodać więcej pól tuningu, jeśli jest to potrzebne
        }

        -- Sprawdź, czy gracz może otworzyć menu tuningu, przekazując współrzędne obu pól tuningu do funkcji
        if CanOpenTuningMenu(tuningZones) then
            -- Sprawdź, czy gracz nacisnął klawisz "E"
            if IsControlJustPressed(0, 38) then
                -- Tutaj otwórz menu tuningu (dodaj kod otwierający menu)
                -- Przykładowo:
                 TriggerEvent('rey_tuning:TuningMenu')
            end
        end
    end
end)



CreateThread(function()
	while GetResourceState("dbl_base") ~= "started" do
		Wait(0)
	end
		
	exports['dbl_base']:SpawnPed("heniek11", 'a_m_m_indian_01', vec4(-193.1915, -1293.6831, 30.3465, 272.11187744141), {
		FreezeEntityPosition = true,
		SetEntityInvincible = true,
		SetBlockingOfNonTemporaryEvents = true,
	}, false, false)

	Config.TuningZone.Zone = lib.zones.box({
		coords = vector3(Config.TuningZone.coords[1], Config.TuningZone.coords[2], Config.TuningZone.coords[3]),
		size = vector3(Config.TuningZone.width, Config.TuningZone.length, (Config.TuningZone.maxZ - Config.TuningZone.minZ)),
		rotation = Config.TuningZone.coords[4]
	})
end)