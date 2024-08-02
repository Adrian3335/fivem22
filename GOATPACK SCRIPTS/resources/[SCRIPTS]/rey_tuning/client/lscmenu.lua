firstVehicleProperties = nil
currentVehicle = nil
currentSeat = nil
playerPed = PlayerPedId()
playerId = PlayerId()

currentVehiclePrice = nil

local isDiagnoseStation = false
local menuIsOpen = false
local lscMenu = {}
local vehicleData = {}
local shoppingCart = {}

lib.onCache("vehicle", function(value)
	currentVehicle = value
	if currentVehicle == false then
		if menuIsOpen then
			reloadVehicleState(vehicleData.backup)
			closeMenu()
		end
		currentVehiclePrice = nil
	end
end)
lib.onCache("seat", function(value)
	currentSeat = value
	if LocalPlayer.state.TuningMenu then
		if currentSeat ~= -1 then
			reloadVehicleState(vehicleData.backup)
			closeMenu()
		end
	end
end)

lib.onCache("ped", function(value) playerPed = value end)


Citizen.CreateThread(function()
	LocalPlayer.state.InvBinds = true
end)

local customMod = {
	Chassis 				= 1000,
	Engine 					= 1001,
	Interior 				= 1002,
	Plates 					= 1003,
	LicensePlates			= 1004,
	Bumpers					= 1005,
	Lights					= 1006,
	LightsNeonKits			= 1007,
	LightsNeonLayout		= 1008,
	LightsNeonColor 		= 1009,
	Wheels					= 1010,
	WheelsType				= 1011,
	WheelsSport				= 1012,
	WheelsMuscle			= 1013,
	WheelsLowrider			= 1014,
	WheelsSuv				= 1015,
	WheelsOffroad			= 1016,
	WheelsTuner				= 1017,
	WheelsHighend			= 1018,
	Windows					= 1019,
	WheelsFront				= 1020,
	WheelsBack				= 1021,
	WheelsColor				= 1022,
	WheelsSmoke				= 1023,
	Respary					= 1025,
	PrimaryColor			= 1026,
	PrimaryChromeColor		= 1027,
	PrimaryClassicColor		= 1028,
	PrimaryMatteColor		= 1029,
	PrimaryMetallicColor	= 1030,
	PrimaryMetalsColor		= 1031,
	SecondColor				= 1032,
	SecondChromeColor		= 1033,
	SecondClassicColor		= 1034,
	SecondMatteColor		= 1035,
	SecondMetallicColor		= 1036,
	SecondMetalsColor		= 1037,
	VehicleFix				= 1039,
	VehicleWash				= 1040,

	WheelsBennys			= 1041,
	WheelsBennyMods			= 1042,
	WheelsOpenWheels		= 1043,
	StreetWheels			= 1044,

	Dashbcol				= 1045,
	Intercol				= 1046,
	Pearlescent				= 1047,
	Extras					= 1048,
	Liverys					= 1049,
	TrackWheels			    = 1050,
	PrimaryChameleonColor   = 1051,
	SecondChameleonColor    = 1052
}

local keyToucheCloseEvent = {
	{ code = 181, event = 'ArrowUp' },
	{ code = 180, event = 'ArrowDown' },
	{ code = 172, event = 'ArrowUp' },
	{ code = 173, event = 'ArrowDown' },
	{ code = 174, event = 'ArrowLeft' },
	{ code = 175, event = 'ArrowRight' },
	{ code = 191, event = 'Enter' },
	{ code = 69, event  = "Enter"},
	{ code = 177, event = 'Backspace' },
}

local canFinzalize = true
local isMainThreadWorking = false

function mainThread()
	if not isMainThreadWorking then
		isMainThreadWorking = true
		Citizen.CreateThread(function()
			while menuIsOpen do
				if IsControlJustReleased(0, 21) then
					if not isDiagnoseStation then
						finalizeShoppings()
					else
						ESX.ShowNotification("W stacji diagnostycznej nie można dokonywać zakupów. Udaj się do najbliższego mechanika")
					end
				elseif canFinzalize then
					for _, value in ipairs(keyToucheCloseEvent) do
						if IsControlJustPressed(0, value.code) or IsDisabledControlJustPressed(0, value.code) then
							SendNUIMessage({
								type = "keyUsage",
								key = value.code
							})
						end
					end
				end
				
				if IsControlJustPressed(0, 22) then
					local open = GetVehicleDoorAngleRatio(vehicleData.vehicle, 0) > 0.1
					if open then
						for i = 0, 8 do
							SetVehicleDoorShut(vehicleData.vehicle, i, false)
						end
					else
						for i = 0, 8 do
							SetVehicleDoorOpen(vehicleData.vehicle, i, false, false)
						end
					end
				end

				DisableControlAction(0, 177, true)
				DisableControlAction(0, 200, true)
				DisableControlAction(0, 202, true)
				DisableControlAction(0, 322, true)

				DisableControlAction(0, 81, true)
				DisableControlAction(0, 82, true)
				DisableControlAction(0, 83, true)
				DisableControlAction(0, 84, true)
				DisableControlAction(0, 85, true)
				DisableControlAction(0, 332, true)
				DisableControlAction(0, 333, true)

				if GetVehicleNumberOfPassengers(vehicleData.vehicle) > 0 then
					reloadVehicleState(vehicleData.backup)
					closeMenu()
				end

				Citizen.Wait(0)
		  	end
			isMainThreadWorking = false

			local times = 0
			while times < 30 do
				times = times + 1
				DisableControlAction(0, 177, true)
				DisableControlAction(0, 200, true)
				DisableControlAction(0, 202, true)
				DisableControlAction(0, 322, true)
				Citizen.Wait(0)
			end

		end)
	end
end

function finalizeShoppings()
	local price = 0
	local labour = 0
	local cartCount = 0
	for k,v in pairs(shoppingCart) do
		cartCount = cartCount + 1
		if v.price then
			price = price + v.price
		end
		if v.labour and v.labour ~= 'undefined' then
			labour = labour + v.labour
		end
	end

	if cartCount == 0 then
		return
	end

	if price ~= nil then
		local players = getClosestPlayers(10.0)
		canFinzalize = false
		
		if #players > 0 then
			local elements = {}
			for k,v in ipairs(players) do
				if playerId == v.p then
					elements[#elements + 1] = {
						label = string.format("%s (TY)", tostring(GetPlayerServerId(v.p))),
						value = GetPlayerServerId(v.p)
					}
				else
					elements[#elements + 1] = {
						label = tostring(GetPlayerServerId(v.p)),
						value = GetPlayerServerId(v.p)
					}
				end
			end

			
			local playerServerId = openMenuAwait("Kto ma zapłacić?", elements)

			if playerServerId then
				ESX.TriggerServerCallback('rey_tuning:payForShopping', function(status, message)
					if status then
						local fixMod = resolveMod(customMod.VehicleFix)
						local fixModFromCart = shoppingCart[fixMod]
						local veh = GetVehiclePedIsIn(playerPed, false)
						local netId = NetworkGetNetworkIdFromEntity(veh)
						Citizen.SetTimeout(200, function()
							TriggerServerEvent("rey_tuning:shoppingLog", shoppingCart, netId)
						end)
						if fixModFromCart then
							SetVehicleFixed(vehicleData.vehicle)
						end

						fixMod = resolveMod(customMod.VehicleWash)
						fixModFromCart = shoppingCart[fixMod]
						if fixModFromCart then
							SetVehicleDirtLevel(vehicleData.vehicle, 0.0)
						end

						reloadVehicleState(vehicleData.future)
						closeMenu()
						local v = ESX.Game.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId()))
						TriggerServerEvent('rey_tuning:saveVehProps', netId, v)
					else
						canFinzalize = true
					end
					
					ESX.ShowNotification(message)
				end, NetworkGetNetworkIdFromEntity(vehicleData.vehicle), playerServerId, price, labour)
			else
				local fixMod = resolveMod(customMod.VehicleFix)
				local fixModFromCart = shoppingCart[fixMod]
				if fixModFromCart then
					shoppingCart[fixMod] = nil
					SendNUIMessage({
						name = lscMenu.name,
						type = "loadMenuData",
						data = lscMenu.elements,
					})
					reloadShoppingCart()
				end

				fixMod = resolveMod(customMod.VehicleWash)
				fixModFromCart = shoppingCart[fixMod]
				if fixModFromCart then
					shoppingCart[fixMod] = nil
					SendNUIMessage({
						name = lscMenu.name,
						type = "loadMenuData",
						data = lscMenu.elements,
					})
					reloadShoppingCart()
				end

				SetVehicleHandbrake(vehicleData.vehicle, true)
				canFinzalize = true
			end
		else
			ESX.ShowNotification('Nikogo nie ma w pobliżu')
		end
	end
end

function getClosestPlayers(radius)
	local a = GetActivePlayers()
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)

	local ret = {}
	table.insert(ret, { p = playerId, d = 0.01 })
	for k,v in ipairs(a) do
		local dist = #(playerCoords - GetEntityCoords(GetPlayerPed(v)))
		if playerId ~= v and dist <= radius then
			table.insert(ret, { p = v, d = dist })
		end
	end

	table.sort(ret, function(a, b)
		return a.d < b.d
	end)

	return ret
end

function reloadShoppingCart()
	SendNUIMessage({
		type = "loadShoppingCart",
		data = mapToArray(shoppingCart),
	})
end

MechZones = {
	{ coords = vector3(154.0, -3011.36, 7.04), maxDist = 50.0 },
	{ coords = vector3(940.8331, -969.7648, 39.4999), maxDist = 50.0 },
	{ coords = vector3(110.0122, 6626.752, 31.78723), maxDist = 50.0 },
	{ coords = vector3(450.48, -976.96, 25.32), maxDist = 10.0 }
}

RegisterNetEvent('rey_tuning:TuningMenu', function(state)
	local ped = PlayerPedId()
	local playerCoords = GetEntityCoords(ped)
	local tempVeh = GetVehiclePedIsIn(ped, false)
	local vehicle = DoesEntityExist(tempVeh) and tempVeh or false
	local modelName = GetEntityModel(vehicle)
	local markerType = "tuning"
	local isClose = false

	if DoesEntityExist(tempVeh) then
		if GetPedInVehicleSeat(tempVeh, -1) ~= ped then
			return
		end
	else
		return
	end

	-- for _, zone in ipairs(MechZones) do
	-- 	if(#(playerCoords - zone.coords) <= zone.maxDist) then
	-- 		isClose = true
	-- 		break
	-- 	end
	-- end
	-- if(not isClose) then
	-- 	ESX.ShowNotification("Nie jesteś w pobliżu warsztatu")
	-- 	--return
	-- end
	if state == true then
		isDiagnoseStation = true
	else
		isDiagnoseStation = false
	end 
	if menuIsOpen then
		closeMenu()
		-- exports['notify']:ShowBasicNotification('danger', 'Katalog jest aktualnie otwarty.')
	elseif DoesEntityExist(vehicle) then
		--SetVehicleAutoRepairDisabled(vehicle, true)
		menuIsOpen = true
		LocalPlayer.state.TuningMenu = true
		if isDiagnoseStation then
			Citizen.CreateThread(function()
				while menuIsOpen do
					Citizen.Wait(200)
					if GetVehicleNumberOfPassengers(vehicle) > 0 then
						reloadVehicleState(vehicleData.backup)
						closeMenu()
					end
				end
			end)
		end

		if GetVehicleNumberOfPassengers(vehicleData.vehicle) > 0 then
			ESX.ShowNotification("W pojeździe może znajdować się tylko jedna osoba")
			return
		end

		ESX.ShowNotification("Naciśnij SPACE aby otworzyć lub zamknąć drzwi pojazdu")
		ESX.TriggerServerCallback('rey_tuning:getVehicleModelPrice', function(cenka)
			if cenka ~= nil then
				SetVehicleHandbrake(vehicle, true)
	
				setupLscMenu({ price = cenka })
				menuIsOpen = true
				LocalPlayer.state.TuningMenu = true
	
				SendNUIMessage({ type = "show" })
				local m = buildMenuData(markerType)
	
				SendNUIMessage({
					name = m.name,
					type = "loadMenuData",
					data = m.elements,
				})
				reloadShoppingCart()
				canFinzalize = true
				LocalPlayer.state.InvBinds = false
	
				mainThread()
			else
				closeMenu()
			end
		end, GetEntityModel(vehicle))
	else
		ESX.ShowNotification('Musisz być w pojeździe żeby otworzyć katalog.')
	end
end)

RegisterNUICallback("backspaceMenu", function(data, cb)
	cb(1)

	local pathLength = #lscMenu.path
	local menu = lscMenu

	local m = backToMenu(menu, 1)
	if m ~= nil then
		reloadVehicleState(vehicleData.future)
		SendNUIMessage({
			name = m.name,
			type = "loadMenuData",
			data = m.elements,
		})
		SetVehicleHandbrake(vehicleData.vehicle, true)
	else
		reloadVehicleState(vehicleData.backup)
		closeMenu()
	end
end)

function setupLscMenu(vehicleData2)
	local ped = PlayerPedId()
	shoppingCart = {}
	vehicleData = {}
	vehicleData.vehicle = GetVehiclePedIsIn(ped, false)
	if vehicleData2 ~= nil then
		vehicleData.price = vehicleData2.price
	else
		vehicleData.price = 0
	end
	backupVehicleState()
	lscMenu = {
		name = 'Kategorie',
		path = {},
		elements = {}
	}

	SetVehicleHandbrake(vehicleData.vehicle, true)
end

function closeMenu()
	SendNUIMessage({
		type = "close"
	})
	menuIsOpen = false
	LocalPlayer.state.TuningMenu = false
	canFinzalize = true
	LocalPlayer.state.InvBinds = true

	SetVehicleHandbrake(vehicleData.vehicle, false)
	for i = 0, 8 do
		SetVehicleDoorShut(vehicleData.vehicle, i, false)
	end
end

AddEventHandler("Global:NuiFocusFix", function()
	if menuIsOpen then
		reloadVehicleState(vehicleData.backup)
	end
	closeMenu()
end)

RegisterNUICallback("selectMenu", function(data, cb)
	cb(1)

	local dataMod = tonumber(data.mod)

	if dataMod then
		if data.type == 'submenu' then
			local pathLength = #lscMenu.path
			if lscMenu.path[pathLength] ~= dataMod then
				table.insert(lscMenu.path, dataMod)
			end
			local menu = findMenu(lscMenu, 1)
			for k,v in pairs(menu.elements) do
				if v.mod == dataMod then
					SendNUIMessage({
						name = v.name,
						type = "loadMenuData",
						data = v.elements,
					})
				end
			end
		elseif dataMod == customMod.VehicleFix then
			shoppingCart[resolveMod(customMod.VehicleFix)] = {
				catname = 'Naprawa pojazdu',
				name = 'Naprawa pojazdu',
				price = data.price,
				labour = data.labour,
			}
			reloadShoppingCart()
			finalizeShoppings()
		elseif dataMod == customMod.VehicleWash then
			shoppingCart[resolveMod(customMod.VehicleWash)] = {
				catname = 'Wyczyszczenie pojazdu',
				name = 'Wyczyszczenie pojazdu',
				price = data.price,
				labour = data.labour,
			}
			reloadShoppingCart()
			finalizeShoppings()
		elseif dataMod == customMod.Extras then
			if IsVehicleExtraTurnedOn(vehicleData.vehicle, tonumber(data.modtype)) == 1 then
				SetVehicleExtra(vehicleData.vehicle, tonumber(data.modtype), true)
				shoppingCart[resolveMod(customMod.Extras) + data.modtype ] = nil
				vehicleData.future.extras[tostring(data.modtype)] = false
			else
				SetVehicleExtra(vehicleData.vehicle, tonumber(data.modtype), false)
				shoppingCart[resolveMod(customMod.Extras) + data.modtype ] = {
					catname = 'Extras',
					name = data.name,
					price = data.price,
					labour = data.labour,
				}
				vehicleData.future.extras[tostring(data.modtype)] = true
			end

			reloadShoppingCart()
		elseif dataMod == customMod.Liverys then
			if GetVehicleLivery(vehicleData.vehicle) == data.modtype then
				return;
			end
			
			SetVehicleLivery(vehicleData.vehicle, tonumber(data.modtype))
			vehicleData.future.livery = tonumber(data.modtype)
			shoppingCart[resolveMod(customMod.Liverys)] = {
				catname = 'Liveries',
				name = data.name,
				price = data.price,
				labour = data.labour,
			}
			reloadShoppingCart()

			local menu = findMenu(lscMenu, 1)
			for k, v in pairs(menu.elements) do
				if v.mod == dataMod then
					for ek, ev in pairs(v.elements) do
						local owned =  GetVehicleLivery(vehicleData.vehicle) == ev.modtype;
						ev.isOwned = owned;
						ev.isInstalled = owned;
					end
					SendNUIMessage({
						name = v.name,
						type = "loadMenuData",
						data = v.elements,
						isItemSelect = true,
					})
					break;
				end
			end
		else	
			local menu = findMenu(lscMenu, 1)
			local isWheelsType = isWheelsMod(dataMod)
			for k,v in pairs(menu.elements) do
				if isWheelsMod and isWheelsMod(v.mod) then
					for ek, ev in pairs(v.elements) do
						ev.isInstalled = false
					end
				end
				if v.mod == dataMod then
					for ek, ev in pairs(v.elements) do
						ev.isInstalled = tonumber(ev.modtype) == tonumber(data.modtype)
					end
					injectVehicleMod(vehicleData.future, data.mod, data.modtype)
					SendNUIMessage({
						name = v.name,
						type = "loadMenuData",
						data = v.elements,
						isItemSelect = true,
					})
					data.catname = v.name
					data.owned = json.decode(data.owned)
					if data.owned then
						shoppingCart[resolveMod(dataMod)] = nil
					else
						shoppingCart[resolveMod(dataMod)] = data
					end
					reloadShoppingCart()
				end
			end
		end
	end
end)

function mapToArray(map)
	local arr = {}
	for k,v in pairs(map) do
		table.insert(arr, v)
	end
	return arr
end

RegisterNUICallback("changeVehicleUpgrade", function(data, cb)
	cb(1)
	local dataMod = resolveMod(data.mod)
	local dataModType = tonumber(data.modtype)

	if dataMod and dataModType then
		SetVehicleModKit(vehicleData.vehicle,0)
		if dataMod == customMod.LicensePlates then
			SetVehicleNumberPlateTextIndex(vehicleData.vehicle, dataModType)
		elseif dataMod == customMod.Windows then
			SetVehicleWindowTint(vehicleData.vehicle, dataModType)
		elseif dataMod == customMod.WheelsColor then
			SetVehicleExtraColours(vehicleData.vehicle, vehicleData.future.extracolor[1], dataModType)
		elseif dataMod == customMod.WheelsSmoke then
			local s = resolveWheelsSmokeByIndex(dataModType)
			if s then
				ToggleVehicleMod(vehicleData.vehicle,20,true)
				SetVehicleTyreSmokeColor(vehicleData.vehicle,s.smokecolor[1],s.smokecolor[2],s.smokecolor[3])
			end
		elseif dataMod == customMod.LightsNeonColor then
			local n = resolveNeonColorByIndex(dataModType)
			if n then
				SetVehicleNeonLightsColour(vehicleData.vehicle, n.neon[1], n.neon[2], n.neon[3])
			end
		elseif dataMod == customMod.LightsNeonLayout then
			installVehicleNeonLayout(vehicleData.future, dataModType)
		elseif isVehiclePrimaryColorMod(data.mod) then
			ClearVehicleCustomPrimaryColour(vehicleData.vehicle)
			SetVehicleColours(vehicleData.vehicle,dataModType,vehicleData.future.color[2])
			if tonumber(data.mod) == customMod.PrimaryMetallicColor then
				SetVehicleExtraColours(vehicleData.vehicle, vehicleData.future.color[2], vehicleData.future.extracolor[2])
			end
		elseif isVehicleSecondaryColorMod(data.mod) then
			ClearVehicleCustomSecondaryColour(vehicleData.vehicle)
			SetVehicleColours(vehicleData.vehicle, vehicleData.future.color[1], dataModType)
			if tonumber(data.mod) == customMod.SecondMetallicColor then
				SetVehicleExtraColours(vehicleData.vehicle, dataModType, vehicleData.future.extracolor[2])
			end
		elseif tonumber(data.mod) == customMod.Dashbcol then
			SetVehicleDashboardColour(vehicleData.vehicle, dataModType)
		elseif tonumber(data.mod) == customMod.Intercol then
			SetVehicleInteriorColour(vehicleData.vehicle, dataModType)
		elseif tonumber(data.mod) == customMod.Pearlescent then
			SetVehicleExtraColours(vehicleData.vehicle, dataModType, vehicleData.future.extracolor[2])
		elseif dataMod == 18 then
			ToggleVehicleMod(vehicleData.vehicle, dataMod, dataModType)
		elseif dataMod == 22 then
			ToggleVehicleMod(vehicleData.vehicle, dataMod, dataModType)
			SetVehicleXenonLightsColor(vehicleData.vehicle, dataModType)
		else
			local wheeltype = resolveWheelTypeByMod(data.mod)
			if wheeltype then
				SetVehicleWheelType(vehicleData.vehicle, tonumber(wheeltype))
			end
			SetVehicleMod(vehicleData.vehicle, dataMod, dataModType)
			if dataMod == 14 then -- horn
				OverrideVehHorn(vehicleData.vehicle,false,0)
				if IsHornActive(vehicleData.vehicle) or IsControlPressed(1,86) then
					StartVehicleHorn(vehicleData.vehicle, 10000, "HELDDOWN", 1)
				end
			end
		end
	end
end)

function isVehiclePrimaryColorMod(mod)
	mod = tonumber(mod)
	return customMod.PrimaryChromeColor == mod 
		or customMod.PrimaryClassicColor == mod
		or customMod.PrimaryMatteColor == mod
		or customMod.PrimaryMetallicColor == mod
		or customMod.PrimaryMetalsColor == mod
		or customMod.PrimaryChameleonColor == mod
end

function isVehicleSecondaryColorMod(mod)
	mod = tonumber(mod)
	return customMod.SecondChromeColor == mod 
		or customMod.SecondClassicColor == mod
		or customMod.SecondMatteColor == mod
		or customMod.SecondMetallicColor == mod
		or customMod.SecondMetalsColor == mod
		or customMod.SecondChameleonColor == mod
end

function isWheelsMod(mod)
	return resolveMod(mod) == 23 or resolveMod(mod) == 24
end

function resolveMod(mod)
	mod = tonumber(mod)
	if mod == customMod.WheelsBack then
		return 24
	elseif resolveWheelTypeByMod(mod) then
		return 23
	end
	return tonumber(mod)
end

function resolveWheelTypeByMod(mod)
	mod = tonumber(mod)
	if mod == customMod.WheelsSport then
		return 0
	elseif mod == customMod.WheelsMuscle then
		return 1
	elseif mod == customMod.WheelsLowrider then
		return 2
	elseif mod == customMod.WheelsSuv then
		return 3
	elseif mod == customMod.WheelsOffroad then
		return 4
	elseif mod == customMod.WheelsTuner then
		return 5
	elseif mod == customMod.WheelsFront or mod == customMod.WheelsBack then
		return 6
	elseif mod == customMod.WheelsHighend then
		return 7
	elseif mod == customMod.WheelsBennys then
		return 8
	elseif mod == customMod.WheelsBennyMods then
		return 9
	elseif mod == customMod.WheelsOpenWheels then
		return 10
	elseif mod == customMod.StreetWheels then
		return 11
	end
	return nil
end

function backToMenu(menu, modIndex)
	local pathLength = #lscMenu.path
	if pathLength > 0 then
		if pathLength == modIndex then
			table.remove(lscMenu.path, pathLength)
			return menu
		end
		for k,v in pairs(menu.elements) do
			if v.mod == lscMenu.path[modIndex] then
				return backToMenu(v, modIndex + 1)
			end
		end
	end
	return nil
end

function findMenu(menu, modIndex)
	local pathLength = #lscMenu.path
	if pathLength > 0 then
		if pathLength == modIndex then
			return menu
		end
		for k,v in pairs(menu.elements) do
			if v.mod == lscMenu.path[modIndex] then
				return findMenu(v, modIndex + 1)
			end
		end
	end
	return lscMenu
end

function backupVehicleState()
	--Setup table for vehicle with all mods, colors etc.
	SetVehicleModKit(vehicleData.vehicle, 0)	
	vehicleData.backup = {}
	vehicleData.backup.bodyHealth = GetVehicleBodyHealth(vehicleData.vehicle)
	vehicleData.backup.engineHealth = GetVehicleEngineHealth(vehicleData.vehicle)
	vehicleData.backup.model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicleData.vehicle)):lower()
	vehicleData.backup.color =  table.pack(GetVehicleColours(vehicleData.vehicle))
	vehicleData.backup.color[3] = GetVehicleDashboardColour(vehicleData.vehicle)
	vehicleData.backup.color[4] = GetVehicleInteriorColour(vehicleData.vehicle)
	vehicleData.backup.extracolor = table.pack(GetVehicleExtraColours(vehicleData.vehicle))
	vehicleData.backup.neoncolor = table.pack(GetVehicleNeonLightsColour(vehicleData.vehicle))
	vehicleData.backup.smokecolor = table.pack(GetVehicleTyreSmokeColor(vehicleData.vehicle))
	vehicleData.backup.plateindex = GetVehicleNumberPlateTextIndex(vehicleData.vehicle)
	vehicleData.backup.neonlayout = resolveNeonLayoutIndex()
	vehicleData.backup.livery 	  = GetVehicleLivery(vehicleData.vehicle)
	vehicleData.backup.mods = {}
	for i = 0, 48 do
		vehicleData.backup.mods[i] = {mod = nil}
	end
	for i,t in pairs(vehicleData.backup.mods) do 
		injectVehicleMod(vehicleData.backup, i)
	end

	vehicleData.backup.extras = {}
	for ExtraID = 0, 20 do
		if DoesExtraExist(vehicleData.vehicle, ExtraID) then
			if IsVehicleExtraTurnedOn(vehicleData.vehicle, ExtraID) == 1 then 
				vehicleData.backup.extras[tostring(ExtraID)] = true
			else
				vehicleData.backup.extras[tostring(ExtraID)] = false
			end
		end
	end

	if GetVehicleWindowTint(vehicleData.vehicle) == -1 or GetVehicleWindowTint(vehicleData.vehicle) == 0 then
		vehicleData.backup.windowtint = 0
	else
		vehicleData.backup.windowtint = GetVehicleWindowTint(vehicleData.vehicle)
	end
	vehicleData.backup.wheeltype = GetVehicleWheelType(vehicleData.vehicle)
	vehicleData.backup.bulletProofTyres = GetVehicleTyresCanBurst(vehicleData.vehicle)
	vehicleData.future = deepcopy(vehicleData.backup)
end

function injectVehicleMod(vehicleState, mod, modtype, variation)
	local rMod = resolveMod(mod)
	modtype = tonumber(modtype)
	if rMod == customMod.LicensePlates then
		vehicleState.plateindex = modtype
	elseif rMod == customMod.Windows then
		vehicleState.windowtint = modtype
	elseif rMod == customMod.WheelsColor then
		vehicleState.extracolor[2] = modtype
	elseif rMod == customMod.WheelsSmoke then
		local s = resolveWheelsSmokeByIndex(modtype)
		if s then
			vehicleState.smokecolor = s.smokecolor
		end
	elseif rMod == customMod.LightsNeonColor then
		local n = resolveNeonColorByIndex(modtype)
		if n then
			vehicleState.neoncolor = n.neon
		end
	elseif rMod == customMod.LightsNeonLayout then
		vehicleState.neonlayout = modtype
	elseif isVehiclePrimaryColorMod(mod) then
		vehicleState.color[1] = modtype
		if tonumber(mod) == customMod.PrimaryMetallicColor then
			vehicleState.extracolor[2] = vehicleState.color[1]
		end
	elseif isVehicleSecondaryColorMod(mod) then
		vehicleState.color[2] = modtype
		if tonumber(mod) == customMod.SecondMetallicColor then
			vehicleState.extracolor[1] = modtype
		end
	elseif tonumber(mod) == customMod.Dashbcol then
		vehicleState.color[3] = modtype
	elseif tonumber(mod) == customMod.Extras then
		if IsVehicleExtraTurnedOn(vehicleData.vehicle, modtype) == 1 then
			vehicleState.extras[tostring(modtype)] = false
		else
			vehicleState.extras[tostring(modtype)] = true
		end
	elseif tonumber(mod) == customMod.Intercol then
		vehicleState.color[4] = modtype
	elseif tonumber(mod) == customMod.Pearlescent then
		vehicleState.extracolor[1] = modtype
	else
		local t = vehicleState.mods[rMod]
		if not t then
			t = vehicleState.mods[tostring(rMod)]
		end
		if rMod == 22 then
			if modtype then
				t.mod = modtype
			else
				if IsToggleModOn(vehicleData.vehicle,rMod) then
					t.mod = GetVehicleXenonLightsColor(vehicleData.vehicle)
				else
					t.mod = 0
				end
			end
		elseif rMod == 18 then
			if modtype then
				t.mod = modtype
			else
				if IsToggleModOn(vehicleData.vehicle,rMod) then
					t.mod = 1
				else
					t.mod = 0
				end
			end
		elseif rMod == 23 or rMod == 24 then
			vehicleState.wheeltype = resolveWheelTypeByMod(mod)
			if modtype then
				t.mod = modtype
			else
				t.mod = GetVehicleMod(vehicleData.vehicle,rMod)
			end
			if variation then
				t.variation = variation
			else
				t.variation = GetVehicleModVariation(vehicleData.vehicle, rMod)
			end
		else
			if modtype then
				t.mod = modtype
			else
				t.mod = GetVehicleMod(vehicleData.vehicle,rMod)
			end
		end
	end
end

function buildMenuData(markerType)
	if DoesEntityExist(vehicleData.vehicle) then
		local options = {}
		
		for i = 0,48 do
			if GetNumVehicleMods(vehicleData.vehicle,i) ~= nil and GetNumVehicleMods(vehicleData.vehicle,i) ~= false and GetNumVehicleMods(vehicleData.vehicle,i) > 0 then
				if i == 1 then
					options.bumper = true
					options.fbumper = true
				elseif i == 2 then
					options.bumper = true
					options.rbumper = true
				elseif (i >= 42 and i <= 46) or i == 5 then --If any chassis mod exist then add chassis menu
					options.chassis = true
				elseif i >= 27 and i <= 37 then --If any interior mod exist then add interior menu
					options.interior = true
				end
			end
		end

		if GetVehicleLiveryCount(vehicleData.vehicle) > 0 then
			options.livery = true;
		end

		local maxvehhp = 1000
		local damage = (maxvehhp - GetVehicleBodyHealth(vehicleData.vehicle))/100
		local basefixprice = 250
		if damage < 0.03 then
			basefixprice = 1
		end
		-- table.insert(lscMenu.elements, {
		-- 	name = 'Naprawa pojazdu',
		-- 	mod = customMod.VehicleFix,
		-- 	modtype = 0,
		-- 	isEmpty = false,
		-- 	isInstalled = false,
		-- 	isOwned = false,
		-- 	price = ESX.Math.Round(basefixprice+150*damage,0),
		-- 	labour = Config.FixLabour,
		-- })
		-- table.insert(lscMenu.elements, {
		-- 	name = 'Wyczyść pojazd',
		-- 	mod = customMod.VehicleWash,
		-- 	modtype = 0,
		-- 	isEmpty = false,
		-- 	isInstalled = false,
		-- 	isOwned = false,
		-- 	price = 1,
		-- 	labour = 0,
		-- })
		
		if markerType == 'tuning' then
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 0, "Spoiler", "", true)
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 3, "Listwy boczne", "", true)
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 4, "Wydech", "",true)
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 6, "Grill", "",true)
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 7, "Maska", "",true)
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 8, "Błotniki", "",true)
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 9, "Błotniki 2", "",true)
			
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 10, "Dach", "",true)
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 12, "Hamulce", "",true)
			
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 13, "Skrzynia Biegów", "",true)
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 14, "Klakson", "",true)
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 15, "Zawieszenie","",true)
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 18, "Turbo", "",false)
			
			if options.chassis then loadChassisMenuElement() end
			loadEngineMenuElement()
			if options.interior then loadInteriorMenuElement() end
			if options.livery then loadLiveryMenuElement() end
			loadPlatesMenuElement()
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 38, "Hydraulika","",true)
			loadMenuElement(lscMenu.elements, vehicleData.vehicle, 48, "Naklejki", "",true)
			loadExtrasMenuElement()
			loadBumpersMenuElement(options)
			loadLightsMenuElement()
			loadWheelsMenuElement()
			loadWindowsMenuElement()
			loadResprayMenuElement()
		end
		if markerType == 'respray' then
			loadResprayMenuElement()
		end
	end
	
	return lscMenu
end

function loadResprayMenuElement()
	local subResparyMenu = initSubMenu('Malowania', customMod.Respary)
	local installedPrimaryColor = vehicleData.backup.color[1]
	local subPrimaryColorMenu = initSubMenu('Kolor główny', customMod.PrimaryColor)
	createColorMenu(subPrimaryColorMenu, 'Chrom', customMod.PrimaryChromeColor, LSCConfig.prices.chrome, installedPrimaryColor)
	createColorMenu(subPrimaryColorMenu, 'Klasyczny', customMod.PrimaryClassicColor, LSCConfig.prices.classic, installedPrimaryColor)
	createColorMenu(subPrimaryColorMenu, 'Matowy', customMod.PrimaryMatteColor, LSCConfig.prices.matte, installedPrimaryColor)
	createColorMenu(subPrimaryColorMenu, 'Metaliczny', customMod.PrimaryMetallicColor, LSCConfig.prices.metallic, installedPrimaryColor)
	createColorMenu(subPrimaryColorMenu, 'Odcienie metali', customMod.PrimaryMetalsColor, LSCConfig.prices.metal, installedPrimaryColor)
	createColorMenu(subPrimaryColorMenu, 'Chameleon', customMod.PrimaryChameleonColor, LSCConfig.prices.chameleon, installedPrimaryColor)

	local installedSecondaryColor = vehicleData.backup.color[2]
	local subSecondColorMenu = initSubMenu('Kolor dodatkowy', customMod.SecondColor)
	createColorMenu(subSecondColorMenu, 'Perła', customMod.Pearlescent, LSCConfig.prices.pearlescent, installedSecondaryColor)
	createColorMenu(subSecondColorMenu, 'Chrom', customMod.SecondChromeColor, LSCConfig.prices.chrome2, installedSecondaryColor)
	createColorMenu(subSecondColorMenu, 'Klasyczny', customMod.SecondClassicColor, LSCConfig.prices.classic2, installedSecondaryColor)
	createColorMenu(subSecondColorMenu, 'Matowy', customMod.SecondMatteColor, LSCConfig.prices.matte2, installedSecondaryColor)
	createColorMenu(subSecondColorMenu, 'Metaliczny', customMod.SecondMetallicColor, LSCConfig.prices.metallic2, installedSecondaryColor)
	createColorMenu(subSecondColorMenu, 'Odcienie metali', customMod.SecondMetalsColor, LSCConfig.prices.metal2, installedSecondaryColor)
	createColorMenu(subSecondColorMenu, 'Chameleon', customMod.SecondChameleonColor, LSCConfig.prices.chameleon2, installedSecondaryColor)

	table.insert(subResparyMenu.elements, subPrimaryColorMenu)
	table.insert(subResparyMenu.elements, subSecondColorMenu)

	createColorMenu(subResparyMenu, 'Kolor deski rozdzielczej', customMod.Dashbcol, LSCConfig.prices.intcol, vehicleData.backup.color[3])
	createColorMenu(subResparyMenu, 'Kolor wnętrza', customMod.Intercol, LSCConfig.prices.dashcol, vehicleData.backup.color[4])
	
	table.insert(lscMenu.elements, subResparyMenu)
end

function createColorMenu(parentMenu, name, modLabel, colorsConfig, installedColorIndex)
	local subMenu = initSubMenu(name, modLabel)
	for n, w in pairs(colorsConfig.colors) do
		if isNotLabour(n) then
			table.insert(subMenu.elements, {
				name = w.name,
				mod = subMenu.mod,
				modtype = w.colorindex,
				isEmpty = false,
				isInstalled = false,
				isOwned = w.colorindex == installedColorIndex,
				price = colorsConfig.price,
				labour = resolveLabour(colorsConfig.labour),
			});
		end
	end
	table.insert(parentMenu.elements, subMenu)
end

function loadWindowsMenuElement()
	local subMenu = initSubMenu('Szyby', customMod.Windows)
	local installedModType = GetVehicleWindowTint(vehicleData.vehicle)
	table.insert(subMenu.elements, {
		name = 'None',
		mod = customMod.Windows,
		modtype = 0,
		isEmpty = false,
		isInstalled = false,
		isOwned = installedModType == 0,
		price = 1,
	});
	for n, w in pairs(LSCConfig.prices.windowtint) do
		if isNotLabour(n) then
			table.insert(subMenu.elements, {
				name = w.name,
				mod = customMod.Windows,
				modtype = w.tint,
				isEmpty = false,
				isInstalled = false,
				isOwned = installedModType == w.tint,
				price = w.price,
				labour = resolveLabour(LSCConfig.prices.windowtint.labour),
			});
		end
	end
	table.insert(lscMenu.elements, subMenu)
end

function loadExtrasMenuElement()
	local subMenu = initSubMenu('Extrasy', customMod.Extras)
	local ExtrasBought = {}

	for ExtraID = 0, 20 do
		if DoesExtraExist(vehicleData.vehicle, ExtraID) then
			if IsVehicleExtraTurnedOn(vehicleData.vehicle, ExtraID) == 1 then 
				table.insert(ExtrasBought, { e = ExtraID, state = true })
			else
				table.insert(ExtrasBought, { e = ExtraID, state = false })
			end
		end
	end

	if #ExtrasBought == 0 then
		table.insert(subMenu.elements, {
			name = 'None',
			mod = customMod.Extras,
			modtype = 0,
			isEmpty = false,
			isInstalled = true,
			isOwned = true,
			price = 0,
		})
	end

	for k, v in ipairs(ExtrasBought) do
		table.insert(subMenu.elements, {
			name = "Extra #" .. tostring(v.e),
			mod = customMod.Extras,
			modtype = v.e,
			isEmpty = false,
			isInstalled = IsVehicleExtraTurnedOn(vehicleData.vehicle, v.e) == 1 ,
			isOwned = v.state,
			price = LSCConfig.prices.extras.price,
			labour = resolveLabour(LSCConfig.prices.extras.labour),
		})
	end
	table.insert(lscMenu.elements, subMenu)
end

function loadLiveryMenuElement()
	local subMenu = initSubMenu('Livery', customMod.Liverys)
	for id = 0, GetVehicleLiveryCount(vehicleData.vehicle) - 1 do
		local name = GetLabelText(GetLiveryName(vehicleData.vehicle, id));
		if name == "NULL" then
			name = "Livery #"..id;
		end
		local owned = GetVehicleLivery(vehicleData.vehicle) == id;
		table.insert(subMenu.elements, {
			name = name,
			mod = customMod.Liverys,
			modtype = id,
			isEmpty = false,
			isInstalled = owned,
			isOwned = owned,
			price = LSCConfig.prices.liverys.price,
			labour = resolveLabour(LSCConfig.prices.liverys.labour),
		})
	end
	table.insert(lscMenu.elements, subMenu)
end

function loadWheelsMenuElement()
	local subWheelsMenu = initSubMenu('Koła', customMod.Wheels)
	local subWheelsTypeMenu = initSubMenu('Typ', customMod.WheelsType)
	if IsThisModelABike(GetEntityModel(vehicleData.vehicle)) then
		local installed23ModType = getInstalledMod(vehicleData.vehicle, 23)
		local installed24ModType = getInstalledMod(vehicleData.vehicle, 24)
		local installedWheelType = tonumber(GetVehicleWheelType(vehicleData.vehicle))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Przednie koło', LSCConfig.prices.frontwheel, customMod.WheelsFront, installed23ModType, installedWheelType))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Tylnie koło', LSCConfig.prices.backwheel, customMod.WheelsBack, installed24ModType, installedWheelType))
	else
		local installedModType = getInstalledMod(vehicleData.vehicle, 23)
		local installedWheelType = tonumber(GetVehicleWheelType(vehicleData.vehicle))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Sport (koła)', LSCConfig.prices.sportwheels, customMod.WheelsSport, installedModType, installedWheelType))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Muscle (koła)', LSCConfig.prices.musclewheels, customMod.WheelsMuscle, installedModType, installedWheelType))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Lowrider (koła)', LSCConfig.prices.lowriderwheels, customMod.WheelsLowrider, installedModType, installedWheelType))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Suv (koła)', LSCConfig.prices.suvwheels, customMod.WheelsSuv, installedModType, installedWheelType))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Offroad (koła)', LSCConfig.prices.offroadwheels, customMod.WheelsOffroad, installedModType, installedWheelType))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Tuner (koła)', LSCConfig.prices.tunerwheels, customMod.WheelsTuner, installedModType, installedWheelType))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Highend (koła)', LSCConfig.prices.highendwheels, customMod.WheelsHighend, installedModType, installedWheelType))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Bennys (koła)', LSCConfig.prices.bennys, customMod.WheelsBennys, installedModType, installedWheelType))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Benny Mods (koła)', LSCConfig.prices.bennymods, customMod.WheelsBennyMods, installedModType, installedWheelType))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Open Wheels (koła)', LSCConfig.prices.openwheels, customMod.WheelsOpenWheels, installedModType, installedWheelType))
		table.insert(subWheelsTypeMenu.elements, 
			createWheelMenuElement('Street Wheels (koła)', LSCConfig.prices.streetwheels, customMod.StreetWheels, installedModType, installedWheelType))
	end

	local installedWheelsColor = vehicleData.future.extracolor[2]
	local subWheelsColorTypeMenu = initSubMenu('Kolor Felg', customMod.WheelsColor)
	for n, c in pairs(LSCConfig.prices.wheelcolor.colors) do
		if isNotLabour(n) then
			table.insert(subWheelsColorTypeMenu.elements, {
				name = c.name,
				mod = customMod.WheelsColor,
				modtype = c.colorindex,
				isEmpty = false,
				isInstalled = false,
				isOwned = installedWheelsColor == c.colorindex,
				price = LSCConfig.prices.wheelcolor.price,
				labour = resolveLabour(LSCConfig.prices.wheelcolor.labour),
			})
		end
	end
	local installedWheelsSmoke = resolveWheelsSmokeIndexByColor(vehicleData.future.smokecolor)
	local subWheelsSmokeMenu = initSubMenu('Kolor Dymu', customMod.WheelsSmoke)
	for n, mod in pairs(LSCConfig.prices.wheelaccessories) do
		if isNotLabour(n) then
			table.insert(subWheelsSmokeMenu.elements, {
				name = mod.name,
				mod = customMod.WheelsSmoke,
				modtype = n,
				isEmpty = false,
				isInstalled = false,
				isOwned = n == installedWheelsSmoke,
				price = mod.price,
				labour = resolveLabour(LSCConfig.prices.wheelaccessories.labour),
			})
		end
	end
		
	table.insert(subWheelsMenu.elements, subWheelsTypeMenu)
	table.insert(subWheelsMenu.elements, subWheelsColorTypeMenu)
	table.insert(subWheelsMenu.elements, subWheelsSmokeMenu)
	table.insert(lscMenu.elements, subWheelsMenu)
end

function resolveWheelsSmokeIndexByColor(smokecolor)
	for n, mod in pairs(LSCConfig.prices.wheelaccessories) do
		if isNotLabour(n) then
			if mod.smokecolor and smokecolor[1] == mod.smokecolor[1] and smokecolor[2] == mod.smokecolor[2] and smokecolor[3] == mod.smokecolor[3] then
				return n
			end
		end
	end
	return 1
end

function resolveWheelsSmokeByIndex(index)
	index = tonumber(index)
	for n, mod in pairs(LSCConfig.prices.wheelaccessories) do
		if n == index then
			return mod
		end
	end
	for n, mod in pairs(LSCConfig.prices.wheelaccessories) do
		return mod
	end
end

function resolveNeonColorIndexByColor(neoncolor)
	for n, mod in pairs(LSCConfig.prices.neoncolor) do
		if isNotLabour(n) then
			if mod.neon and neoncolor[1] == mod.neon[1] and neoncolor[2] == mod.neon[2] and neoncolor[3] == mod.neon[3] then
				return n
			end
		end
	end
	return 1
end

function resolveNeonColorByIndex(index)
	index = tonumber(index)
	for n, mod in pairs(LSCConfig.prices.neoncolor) do
		if n == index then
			return mod
		end
	end
	for n, mod in pairs(LSCConfig.prices.neoncolor) do
		return mod
	end
end

function resolveNeonLayoutIndex()
	for n, mod in pairs(LSCConfig.prices.neonlayout) do
		local allOk = true
		if isNotLabour(n) then
			for k,l in pairs(mod.layout) do
				if IsVehicleNeonLightEnabled(vehicleData.vehicle, k-1) ~= l then
					allOk = false
				end
			end
			if allOk then
				return n
			end
		end
	end
	return 1
end

function resolveNeonLayoutByIndex(index)
	index = tonumber(index)
	for n, mod in pairs(LSCConfig.prices.neonlayout) do
		if n == index then
			return mod
		end
	end
	for n, mod in pairs(LSCConfig.prices.neonlayout) do
		return mod
	end
end

function createWheelMenuElement(name, wheelsConfig, mod, installedMod, installedWheelType)
	local wheeltype = resolveWheelTypeByMod(mod)
	local subWheelsMenu = initSubMenu(name, mod)
	for n, w in pairs(wheelsConfig) do
		if isNotLabour(n) then
			table.insert(subWheelsMenu.elements, {
				name = w.name,
				mod = mod,
				modtype = w.mod,
				isEmpty = false,
				isInstalled = false,
				isOwned = installedMod == w.mod and installedWheelType == wheeltype,
				price = w.price,
				labour = resolveLabour(wheelsConfig.labour)
			});
		end
	end
	return subWheelsMenu
end

function loadChassisMenuElement()
	local subMenu = initSubMenu('Podwozie', customMod.Chassis)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 42, "Arch cover", "",true) --headlight trim
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 43, "Aerials", "",true) --foglights
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 44, "Roof Scoops", "",true) --roof scoops
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 45, "Tank", "",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 46, "Doors", "",true)-- windows
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 5, "Roll cage", "Stiffen your chassis with a rollcage.",true)
	table.insert(lscMenu.elements, subMenu)
end

function loadEngineMenuElement()
	local subMenu = initSubMenu('Silnik', customMod.Engine)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 39, "Blok silnika", "",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 40, "Cam Cover", "",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 41, "Strut Brace", "",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 11, "Engine Tunes", "",true)
	table.insert(lscMenu.elements, subMenu)
end

function loadInteriorMenuElement()
	local subMenu = initSubMenu('Wnętrze', customMod.Interior)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 27, "Trim Design", "",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 28, "Ornaments", "Add decorative items to your dash.",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 29, "Dashboard", "Custom control panel designs.",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 30, "Dials", "Customize the look of your dials.",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 31, "Doors", "Install door upgrades.",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 32, "Seats", "Options where style meets comfort.",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 33, "Steering Wheels", "Customize the link between you and your vehicle.",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 34, "Shifter leavers", "",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 35, "Plaques", "",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 36, "Speakers", "",true)
	loadMenuElement(subMenu.elements, vehicleData.vehicle, 37, "Trunk", "",true)
	table.insert(lscMenu.elements, subMenu)
end

function loadPlatesMenuElement()
	local subPlatesMenu = initSubMenu('Tablice rejestracyjne', customMod.Plates)
	local subPlatesLicenseMenu = initSubMenu('Tablice', customMod.LicensePlates)
	for n, mod in pairs(LSCConfig.prices.plates) do
		if isNotLabour(n) then
			table.insert(subPlatesLicenseMenu.elements, {
				name = mod.name,
				mod = subPlatesLicenseMenu.mod,
				modtype = mod.plateindex,
				isEmpty = false,
				isInstalled = false,
				isOwned = mod.plateindex == vehicleData.future.plateindex,
				price = mod.price,
				labour = resolveLabour(LSCConfig.prices.plates.labour),
			});
		end
	end
	table.insert(subPlatesMenu.elements, subPlatesLicenseMenu)	
	loadMenuElement(subPlatesMenu.elements, vehicleData.vehicle, 25, "Plate holder", "",true) --
	loadMenuElement(subPlatesMenu.elements, vehicleData.vehicle, 26, "Vanity plates", "",true) --
	table.insert(lscMenu.elements, subPlatesMenu)	
end

function loadBumpersMenuElement(options)
	if options.bumper then 
		local subBumpersMenu = initSubMenu('Zderzaki', customMod.Bumpers)
		if options.fbumper then
			loadMenuElement(subBumpersMenu.elements, vehicleData.vehicle, 1, "Przedni zderzak", "",true)
		end
		if options.rbumper then
			loadMenuElement(subBumpersMenu.elements, vehicleData.vehicle, 2, "Tylny zderzak", "",true)
		end
		table.insert(lscMenu.elements, subBumpersMenu)
	end
end

function loadLightsMenuElement()
	local subLightsMenu = initSubMenu('Światła', customMod.Lights)
	loadMenuElement(subLightsMenu.elements, vehicleData.vehicle, 22, "Reflektory", "", false)
	if not IsThisModelABike(GetEntityModel(vehicleData.vehicle)) then
		local installedNeonColor = resolveNeonColorIndexByColor(vehicleData.backup.neoncolor)
		local installedNeonLayout = resolveNeonLayoutIndex()
		local subNeonKitsMenu = initSubMenu('Zestawy neonów', customMod.LightsNeonKits)
		local subNeonLayoutMenu = initSubMenu('Układ neonów', customMod.LightsNeonLayout)
		local subNeonColorMenu = initSubMenu('Kolor neonów', customMod.LightsNeonColor)

		for n, mod in pairs(LSCConfig.prices.neonlayout) do
			if isNotLabour(n) then
				table.insert(subNeonLayoutMenu.elements, {
					name = mod.name,
					mod = subNeonLayoutMenu.mod,
					modtype = n,
					isEmpty = false,
					isInstalled = false,
					isOwned = installedNeonLayout == n,
					price = mod.price,
					labour = resolveLabour(LSCConfig.prices.neonlayout.labour),
				});
			end
		end
		table.insert(subNeonKitsMenu.elements, subNeonLayoutMenu)

		for n, mod in pairs(LSCConfig.prices.neoncolor) do
			if isNotLabour(n) then
				table.insert(subNeonColorMenu.elements, {
					name = mod.name,
					mod = subNeonColorMenu.mod,
					modtype = n,
					isEmpty = false,
					isInstalled = false,
					IsOwned = n == installedNeonColor,
					price = mod.price,
					labour = resolveLabour(LSCConfig.prices.neoncolor.labour),
				});
			end
		end
		table.insert(subNeonKitsMenu.elements, subNeonColorMenu)
		table.insert(subLightsMenu.elements, subNeonKitsMenu)
	end
	table.insert(lscMenu.elements, subLightsMenu)
end

function initSubMenu(subMenuName, mod)
	local subMenu = {
		type = 'submenu',
		mod = mod,
		name = subMenuName,
		isEmpty = false,
		isInstalled = false,
		isOwned = false,
		elements = {},
	}
	return subMenu
end

function loadMenuElement(parent, vehicle, mod, name, info, stock)
	SetVehicleModKit(vehicle,0)	
	local subMenu = {
		type = 'submenu',
		mod = mod,
		name = name,
		isEmpty = false,
		isInstalled = false,
		isOwned = false,
		elements = {},
	}
	if (GetNumVehicleMods(vehicle,mod) ~= nil and GetNumVehicleMods(vehicle,mod) > 0) or mod == 18 or mod == 22 then
		local installedMod = getInstalledMod(vehicle, mod)
		if stock then
			table.insert(subMenu.elements, {
				name = "Stock",
				mod = mod,
				modtype = -1,
				isEmpty = false,
				isInstalled = false,
				isOwned = installedMod == -1,
				price = 1,
				labour = 0,
			});
		end
		if LSCConfig.prices.mods[mod].startprice then
			local price = LSCConfig.prices.mods[mod].startprice
			local entry = GetModSlotName(vehicle, mod)
			for i = 0, tonumber(GetNumVehicleMods(vehicle,mod)) -1 do
				local lbl = GetModTextLabel(vehicle,mod,i) 
				if lbl ~= nil then
                    mname = tostring(GetLabelText(lbl))
					mname = mname ~= "NULL" and manme or (entry.." #"..i+1);
                    local price2 = LSCConfig.prices.mods[mod].startprice
					price2 = math.floor(price2 * 0.5)

                    table.insert(subMenu.elements, {
                        name = mname,
                        mod = mod,
                        modtype = i,
                        isEmpty = false,
                        isInstalled = false,
                        isOwned = installedMod == i,
                        price = price2 + LSCConfig.prices.mods[mod].increaseby,
                        labour = resolveLabour(LSCConfig.prices.mods[mod].labour),
                    });
				end
			end		
		else
			if mod < 49 then
				for n, v in pairs(LSCConfig.prices.mods[mod]) do
					if isNotLabour(n) then
						local can = true
						--if mod == 15 then

							can = GetNumVehicleMods(vehicle, mod) > v.mod
							if mod == 18 or mod == 22 then -- jeśli to turbo to ma mieć do niego mechanik dostęp
								can = true
							end
						--end
						
						if can then
							local price = nil
							if v.staticPrice ~= nil then
								price = v.staticPrice
							else
								price = resolvePrice(v.price, v.increaseby, v.increasebyPercent, nil)
							end

							if not string.match(v.name, "wiat") and v.price ~= 4000 then
								table.insert(subMenu.elements, {
									name = v.name,
									mod = mod,
									modtype = v.mod,
									isEmpty = false,
									isInstalled = false,
									isOwned = installedMod == v.mod,
									price = price,
									labour = resolveLabour(LSCConfig.prices.mods[mod].labour),
								})
							else
								table.insert(subMenu.elements, {
									name = v.name,
									mod = mod,
									modtype = v.mod,
									isEmpty = false,
									isInstalled = false,
									isOwned = installedMod == v.mod,
									price = v.price,
									labour = resolveLabour(LSCConfig.prices.mods[mod].labour),
								})
							end
						end
					end
				end
			else
				for n, v in pairs(LSCConfig.prices.mods[mod]) do
					if isNotLabour(n) then
						if not string.match(v.name, "wiat") and v.price ~= 4000 then
							local price = nil
							if v.staticPrice ~= nil then
								price = v.staticPrice
							else
								price = resolvePrice(v.price, v.increaseby, v.increasebyPercent, nil)
							end

							table.insert(subMenu.elements, {
								name = v.name,
								mod = mod,
								modtype = v.mod,
								isEmpty = false,
								isInstalled = false,
								isOwned = installedMod == v.mod,
								price = price,
								labour = resolveLabour(LSCConfig.prices.mods[mod].labour),
							})
						else
							local price = nil
							if v.staticPrice ~= nil then
								price = v.staticPrice
							else
								price = v.price
							end

							table.insert(subMenu.elements, {
								name = v.name,
								mod = mod,
								modtype = v.mod,
								isEmpty = false,
								isInstalled = false,
								isOwned = installedMod == v.mod,
								price = v.price,
								labour = resolveLabour(LSCConfig.prices.mods[mod].labour),
							})
						end
					end
				end
			end
		end

		table.insert(parent, subMenu)
	else
		subMenu.name = subMenu.name .. ' (brak części)'
		subMenu.isEmpty = true
	end
end

function resolvePrice(price, increaseby, increasebyPercent, index)
	if currentVehiclePrice == nil then
		local waicik = true
		ESX.TriggerServerCallback('rey_tuning:getVehicleModelPrice', function(cenka)
			currentVehiclePrice = cenka
			waicik = false
		end, GetEntityModel(vehicleData.vehicle))
		while waicik do
			Wait(0)
		end
	end
	
	local cenka = currentVehiclePrice and currentVehiclePrice or 2500000
	return ESX.Math.Round(price * cenka)
end

RegisterNetEvent("rey_tuning:reload", function(state, netId)
	__r_state(NetworkGetEntityFromNetworkId(netId), state)
end)

function reloadVehicleState(state)
	TriggerServerEvent("rey_tuning:reload", VehToNet(vehicleData.vehicle), state)
	__r_state(vehicleData.vehicle, state)
end

function __r_state(veh, state)
	SetVehicleModKit(veh, 0)
	SetVehicleWheelType(veh, state.wheeltype)
	SetVehicleExtraColours(veh, state.extracolor[1], state.extracolor[2])
	SetVehicleTyreSmokeColor(veh, state.smokecolor[1], state.smokecolor[2], state.smokecolor[3])
	for i,m in pairs(state.mods) do
		if i == 22 then
			if m.mod then 
				installVehicleMod(veh, i, m.mod, m.variation)
			end
		else
			installVehicleMod(veh, i, m.mod, m.variation)
		end
	end

	ClearVehicleCustomSecondaryColour(veh)
	ClearVehicleCustomPrimaryColour(veh)
	SetVehicleColours(veh,state.color[1], state.color[2])
	SetVehicleWindowTint(veh, state.windowtint)
	SetVehicleNumberPlateTextIndex(veh, state.plateindex)
	SetVehicleNeonLightsColour(veh, state.neoncolor[1], state.neoncolor[2], state.neoncolor[3])

	SetVehicleAutoRepairDisabled(veh, true)

	for ExtraID = 0, 20 do
		if DoesExtraExist(veh, ExtraID) then
			if state.extras[tostring(ExtraID)] then
				SetVehicleExtra(veh, ExtraID, false)
			else
				SetVehicleExtra(veh, ExtraID, true)
			end
		end
	end
	
	SetVehicleDashboardColour(veh, state.color[3])
	SetVehicleInteriorColour(veh, state.color[4])
	SetVehicleLivery(veh, state.livery)
	installVehicleNeonLayout(state, veh)

	SetVehicleBodyHealth(veh, state.bodyHealth + 0.0)
	SetVehicleEngineHealth(veh, state.engineHealth + 0.0)
end

function installVehicleMod(vehicle, mod, modtype, variation)
	mod = tonumber(mod)
	modtype = tonumber(modtype)

	if mod == 22 then
		ToggleVehicleMod(vehicle, mod, modtype) 
		SetVehicleXenonLightsColor(vehicle, modtype)
	elseif mod == 18 then
		ToggleVehicleMod(vehicle, mod, modtype)
	elseif mod == 23 or mod == 24 then
		SetVehicleMod(vehicle,mod,modtype,variation)
	else
		SetVehicleMod(vehicle,mod,modtype)
	end
end

function installVehicleNeonLayout(state, veh)
	if veh == nil then
		veh = vehicleData.vehicle
	end
	local n = resolveNeonLayoutByIndex(state.neonlayout)
	if n then
		if not state.neoncolor[1] then
			state.neoncolor[1] = 255
			state.neoncolor[2] = 255
			state.neoncolor[3] = 255
		end
		SetVehicleNeonLightsColour(veh, state.neoncolor[1], state.neoncolor[2], state.neoncolor[3])
		SetVehicleNeonLightEnabled(veh, 0, n.layout[1])
		SetVehicleNeonLightEnabled(veh, 1, n.layout[2])
		SetVehicleNeonLightEnabled(veh, 2, n.layout[3])
		SetVehicleNeonLightEnabled(veh, 3, n.layout[4])
	end
end

function getInstalledMod(vehicle, mod)
	if mod == 22 then
		if IsToggleModOn(vehicle,mod) then
			return GetVehicleXenonLightsColor(vehicle)
		else
			return 0
		end
	elseif mod == 18 then
		if IsToggleModOn(vehicle,mod) then
			return 1
		else
			return 0
		end
	elseif mod == 23 or mod == 24 then
		return GetVehicleMod(vehicle,mod)
	else
		return GetVehicleMod(vehicle,mod)
	end
end

function isNotLabour(k)
	return k ~= 'labour'
end

function resolveLabour(labour)
	if not labour then
		return 0
	end
	return labour
end

function openMenuAwait(title, elements)
	local p = promise.new()
	table.sort(elements, function(a, b) return a.label < b.label end)

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'await_menu', {
		title = title,	
		align = "center",
		elements = elements
	}, function(data, menu)
		p:resolve(data.current.value)
		menu.close()
	end, function(data, menu)
		p:resolve(nil)
		menu.close()
	end)
	return Citizen.Await(p)
end

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

exports('menuIsOpen', function()
	return menuIsOpen
end)