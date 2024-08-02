ESX = exports["es_extended"]:getSharedObject()

Config = {
	GunshotAlert = true,
	ThieftAlert = true,

	GunshotOnlyCities = false,
	MeleeOnlyCities = false,

	AlertFade = 180,
	GunpowderTimer = 10,
    
	AllowedWeapons = {
		["WEAPON_STUNGUN"] = true,
		["WEAPON_SNOWBALL"] = true,
		["WEAPON_BALL"] = true,
		["WEAPON_FLARE"] = true,
		["WEAPON_STICKYBOMB"] = true,
		["WEAPON_FIREEXTINGUISHER"] = true,
		["WEAPON_PETROLCAN"] = true,
		["GADGET_PARACHUTE"] = true,
		["WEAPON_SNSPISTOL_MK2"] = "COMPONENT_AT_PI_SUPP_02",
		["WEAPON_VINTAGEPISTOL"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_PISTOL"] = "COMPONENT_AT_PI_SUPP_02",
		["WEAPON_PISTOL_MK2"] = "COMPONENT_AT_PI_SUPP_02",
		["WEAPON_COMBATPISTOL"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_HEAVYPISTOL"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_PUMPSHOTGUN"] = "COMPONENT_AT_SR_SUPP",
		["WEAPON_PUMPSHOTGUN_MK2"] = "COMPONENT_AT_SR_SUPP_03",
		["WEAPON_BULLPUPSHOTGUN"] = "COMPONENT_AT_AR_SUPP_02",
		["WEAPON_MICROSMG"] = "COMPONENT_AT_AR_SUPP_02",
		["WEAPON_SMG"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_SMG_MK2"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_COMBATPDW"] = true,
		["WEAPON_ASSAULTSMG"] = "COMPONENT_AT_AR_SUPP_02",
		["WEAPON_ASSAULTRIFLE"] = "COMPONENT_AT_AR_SUPP_02",
		["WEAPON_CARBINERIFLE"] = "COMPONENT_AT_AR_SUPP",
		["WEAPON_MARKSMANRIFLE"] = "COMPONENT_AT_AR_SUPP",
		["WEAPON_SNIPERRIFLE"] = "COMPONENT_AT_AR_SUPP_02",
		["WEAPON_1911PISTOL"] = "COMPONENT_AT_PI_SUPP"
	}
}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

-- STRZAŁY 
local WeaponType = {
	[416676503] = "Handguns",
	[-957766203] = "Submachine Guns",
	[860033945] = "Shotguns",
	[970310034] = "Assault Rifles"
}
RegisterNetEvent('esx_jb_outlawalert:notifyShots')
AddEventHandler('esx_jb_outlawalert:notifyShots', function(target, coords, location, type, hour)
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'lssd' then
		exports["goat_notifications"]:policeNotify({
			playerId = target,
			coords = coords,
			textColor = "#fff",
			bgColor = "#06a5ff",
			title1 = "10-71",
			title2 = "Zgłoszenie",
			blip = {
				name = "Strzały",
				sprite = 432,
				scale = 0.9,
				colour = 76,
				timeToDelete = 20000
			},
			sound = {
				file = "POLGunshot",
				volume = 0.3
			},
			content = {
				{
					type = "location",
					text = location
				},
				{
					type = "gun",
					text = WeaponType[type]
				},
				{
					type = "msg",
					text = "Strzały! Godzina zgłoszenia: " .. hour
				}
			}
		})
	end
end)

-- KRADZIEZ POJAZDU 
RegisterNetEvent('esx_jb_outlawalert:notifyThief')
AddEventHandler('esx_jb_outlawalert:notifyThief', function(target, coords, location, model, hour)
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'lssd' then
		exports["goat_notifications"]:policeNotify({
			playerId = target,
			coords = coords,
			textColor = "#fff",
			bgColor = "#06a5ff",
			title1 = "10-37",
			title2 = "Zgłoszenie",
			blip = {
				name = "Kradzież pojazdu",
				sprite = 225,
				scale = 0.9,
				colour = 76,
				timeToDelete = 30000
			},
			sound = {
				file = "POLStolenVehicle",
				volume = 0.3
			},
			content = {
				{
					type = "location",
					text = location
				},
				{
					type = "car",
					text = model
				},
				{
					type = "msg",
					text = "Kradzież pojazdu! Godzina zgłoszenia: " .. hour
				}
			}
		})
	end
end)

local shotTimer = 0
CreateThread(function()
	while true do
		Wait(100)
		if shotTimer > 0 and not IsPedDeadOrDying(PlayerPedId()) then
			shotTimer = shotTimer - 100
			if shotTimer <= 0 then
				DecorSetBool(PlayerPedId(), "Gunpowder", false)
				shotTimer = 0
			end
		end
	end
end)


-- STRZAŁY 
local GunshotAlertWait = false
AddEventHandler('CEventGunShot', function(ftGBYU, ped, ngLYIO)
	if GunshotAlertWait then
		return
	end
	if ped ~= ESX.PlayerData.ped then
		return
	end
	if not DecorIsRegisteredAsType("Gunpowder", 2) then
		DecorRegister("Gunpowder", 2)
		DecorSetBool(ped, "Gunpowder", false)
	end

	if shotTimer == 0 then
		DecorSetBool(ped, "Gunpowder", true)
	end

	local weapon, supress = GetSelectedPedWeapon(ped), nil
	local type = GetWeapontypeGroup(weapon)
	for w, c in pairs(Config.AllowedWeapons) do
		if weapon == GetHashKey(w) then
			if c == true or HasPedGotWeaponComponent(ped, GetHashKey(w), GetHashKey(c)) then
				supress = (c == true)
				break
			end
		end
	end

	if supress ~= true then
		shotTimer = Config.GunpowderTimer * 60000
		if Config.GunshotAlert then
			local coords = GetEntityCoords(ped)
			if CheckArea(coords, Config.GunshotOnlyCities, (supress == false and 10 or 120)) then
				local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
				TriggerServerEvent('esx_jb_outlawalert:notifyShots', {x = coords.x, y = coords.y, z = coords.y}, GetStreetNameFromHashKey(s1), type)
				GunshotAlertWait = true
				Wait(5000)
				GunshotAlertWait = false
			end
		end
	end
end)

-- KRADZIEŻ POJAZDU
local LastJackingVehicle = nil
AddEventHandler("CEventPedJackingMyVehicle", function(ftGBYU, ped, ngLYIO)
	if ped ~= ESX.PlayerData.ped then
		return
	end

	local tick = math.random(4500, 5500)
	Wait(tick)

	local vehicle = GetVehiclePedIsIn(ped, false)
	if not vehicle and not DoesEntityExist(vehicle) then
		return
	end

	if LastJackingVehicle and (LastJackingVehicle == vehicle) then
		return
	end

	print("xd")

	LastJackingVehicle = vehicle
	vehicle = GetEntityModel(vehicle)
	local name = GetDisplayNameFromVehicleModel(vehicle)
	local coords = GetEntityCoords(ESX.PlayerData.ped, true)
	TriggerEvent('esx_vehicleshop:getVehicles', function(base)
		if name ~= 'CARNOTFOUND' then				
			local found = false
			for _, veh in ipairs(base) do
				if (veh.game:len() > 0 and veh.game == name) or veh.model == name then
					name = veh.name
					found = true
					break
				end
			end

			if not found then
				local label = GetLabelText(name)
				if label ~= "NULL" then
					name = label
				end
			end
		end
	end)
	
	local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	TriggerServerEvent('esx_jb_outlawalert:notifyThief', {x = coords.x, y = coords.y, z = coords.y}, GetStreetNameFromHashKey(s1), name)
end)

local list = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)

		list = {}
		for _, pid in ipairs(GetActivePlayers()) do
			table.insert(list, GetPlayerPed(pid))
		end
	end
end)

function CheckArea(coords, should, dist)
	if not should then
		return true
	end

	local found = false
	for _, ped in ipairs(ESX.Game.GetPeds(list)) do
		local pedType = GetPedType(ped)
		if pedType ~= 28 and pedType ~= 27 and pedType ~= 6 then
			local pedCoords = GetEntityCoords(ped)
			if #(coords - pedCoords) < dist then
				return true
			end
		end
	end

	return false
end

RegisterNetEvent('esx_jb_outlawalert:napadjebie')
AddEventHandler('esx_jb_outlawalert:napadjebie', function(target, coords, location, hour)
	local coords = GetEntityCoords(ped)
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'lssd' then
		exports["goat_notifications"]:policeNotify({
			playerId = target,
			coords = coords,
			textColor = "#fff",
			bgColor = "#06a5ff",
			title1 = "10-90",
			title2 = "Zgłoszenie",
			blip = {
				name = "Napad na bank",
				sprite = 432,
				scale = 0.9,
				colour = 76,
				timeToDelete = 30000
			},
			content = {
				{
					type = "location",
					text = location
				},
				{
					type = "msg",
					text = "Napad na bank"
				}
			}
		})
	end
end)