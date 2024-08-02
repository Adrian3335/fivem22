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



local fontId
local allPeds = {}
local tiempo = 4000
local isTaz = false
local Ped = {
	P = PlayerId(),
	Id = ESX.PlayerData.ped,
	InVehicle = IsPedInAnyVehicle(ESX.PlayerData.ped, true),
	Vehicle = GetVehiclePedIsIn(ESX.PlayerData.ped, true),
	PhoneVisible = false,
	HudStatus = false,
	HudDisplay = true,
	Minimap = nil,
	Blip = nil,
	LastCam = GetFollowPedCamViewMode(),
	CamSet = false
}

Citizen.CreateThread(function()
    RegisterFontFile('Poppins-Medium')
    fontId = RegisterFontId('Poppins-Medium') 
end)

exports("getPoppinsFontId", function()
    return fontId
end)

-- Relacje Ped/Gracz
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_HILLBILLY"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_BALLAS"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MEXICAN"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_FAMILY"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MARABUNTE"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_SALVA"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_LOST"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("LOST"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("GANG_1"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("GANG_2"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("GANG_9"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("GANG_10"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("FIREMAN"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("MEDIC"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(1, GetHashKey("COP"), GetHashKey('PLAYER'))
SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey('PLAYER'))

-- Tazer

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		
		if IsPedBeingStunned(GetPlayerPed(-1)) then
			
			SetPedToRagdoll(GetPlayerPed(-1), 5000, 5000, 0, 0, 0, 0)
			
		end
		
		if IsPedBeingStunned(GetPlayerPed(-1)) and not isTaz then
			
			isTaz = true
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
			
		elseif not IsPedBeingStunned(GetPlayerPed(-1)) and isTaz then
			isTaz = false
			Wait(6000)
			
			SetTimecycleModifier("hud_def_desat_Trevor")
			
			Wait(20000)
			
			SetTimecycleModifier("")
			SetTransitionTimecycleModifier("")
			StopGameplayCamShaking()
		end
	end
end)

CreateThread(function()
    exports.qtarget:Player({
        options = {
            {
                event = "przenies",
                icon = "fas fa-hands",
                label = "Podnies",
            },
        }, 
        distance = 1.0
    })
end)

RegisterNetEvent('przenies', function()
    ExecuteCommand("podnies")
end)

-- Minimapka

CreateThread(function()
	Ped.Minimap = RequestScaleformMovie("minimap")
	SetBlipAlpha(GetMainPlayerBlipId(), 0)
	SetBlipAlpha(GetNorthRadarBlip(), 0)
	SetRadarBigmapEnabled(true, false)
    Wait(250)
    SetRadarBigmapEnabled(false, false)

	CreateThread(function()
		while true do
			Wait(250)
			BeginScaleformMovieMethod(Ped.Minimap, "SETUP_HEALTH_ARMOUR")
			ScaleformMovieMethodAddParamInt(3)
			EndScaleformMovieMethod()
		end
	end)

	local lastPed = nil
	CreateThread(function()
		while true do
			SetRadarZoom(1100)
			Ped.P = PlayerId()
			Ped.Id = ESX.PlayerData.ped
			Ped.InVehicle = IsPedInAnyVehicle(Ped.Id, true)
			Ped.PhoneVisible = false			
			if Ped.InVehicle then
				Ped.Vehicle = GetVehiclePedIsIn(Ped.Id, true)
			elseif Ped.PhoneVisible then
				Ped.Vehicle = false

			else
				Ped.Vehicle = false
			end

			if IsBigmapActive() then
				SetRadarBigmapEnabled(false, false)
			end
			
			ped = ESX.PlayerData.ped
			if lastPed ~= ped then
				if Ped.Blip and DoesBlipExist(Ped.Blip) then
					RemoveBlip(Ped.Blip)
				end

				Ped.Blip = AddBlipForEntity(ped)
				SetBlipSprite(Ped.Blip, (Ped.Vehicle and 545 or 1))

				SetBlipScale(Ped.Blip, 1.0)
				SetBlipCategory(Ped.Blip, 1)
				SetBlipPriority(Ped.Blip, 10)
				SetBlipColour(Ped.Blip, 55)
				SetBlipAsShortRange(Ped.Blip, true)

				SetBlipRotation(Ped.Blip, math.ceil(GetEntityHeading(ped)))
				ShowHeadingIndicatorOnBlip(Ped.Blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString("<font face='Poppins-Medium' size= '11'>Twoja pozycja</font>" )
				EndTextCommandSetBlipName(Ped.Blip)
				
				lastPed = ped
			end
			Wait(500)
		end
	end)
end)

-- DENSITY
CreateThread(function()
	while true do
		SetParkedVehicleDensityMultiplierThisFrame(Config.DensityMultiplier['parked'])
		SetVehicleDensityMultiplierThisFrame(Config.DensityMultiplier['vehicle'])
		SetRandomVehicleDensityMultiplierThisFrame(Config.DensityMultiplier['multiplier'])
		SetPedDensityMultiplierThisFrame(Config.DensityMultiplier['peds'])
		SetScenarioPedDensityMultiplierThisFrame(Config.DensityMultiplier['scenario'], Config.DensityMultiplier['scenario'])
		Wait(0)
	end
end)

-- IGNORE
AddEventHandler("populationPedCreating", function(x, y, z, model)
	Wait(500)
	local found, handle = GetClosestPed(x, y, z, 1.0)
	SetPedDropsWeaponsWhenDead(handle, false)
end)

CreateThread(function()
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    SetAudioFlag("PoliceScannerDisabled", true)
	SetGarbageTrucks(false)
	SetCreateRandomCops(false)
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCopsOnScenarios(false)
	DistantCopCarSirens(false)
	RemoveVehiclesFromGeneratorsInArea(335.2616 - 300.0, -1432.455 - 300.0, 46.51 - 300.0, 335.2616 + 300.0, -1432.455 + 300.0, 46.51 + 300.0)
	RemoveVehiclesFromGeneratorsInArea(441.8465 - 500.0, -987.99 - 500.0, 30.68 -500.0, 441.8465 + 500.0, -987.99 + 500.0, 30.68 + 500.0)
	RemoveVehiclesFromGeneratorsInArea(316.79 - 300.0, -592.36 - 300.0, 43.28 - 300.0, 316.79 + 300.0, -592.36 + 300.0, 43.28 + 300.0)
	RemoveVehiclesFromGeneratorsInArea(-2150.44 - 500.0, 3075.99 - 500.0, 32.8 - 500.0, -2150.44 + 500.0, -3075.99 + 500.0, 32.8 + 500.0)
	RemoveVehiclesFromGeneratorsInArea(-1108.35 - 300.0, 4920.64 - 300.0, 217.2 - 300.0, -1108.35 + 300.0, 4920.64 + 300.0, 217.2 + 300.0)
	RemoveVehiclesFromGeneratorsInArea(-458.24 - 300.0, 6019.81 - 300.0, 31.34 - 300.0, -458.24 + 300.0, 6019.81 + 300.0, 31.34 + 300.0)
	RemoveVehiclesFromGeneratorsInArea(1854.82 - 300.0, 3679.4 - 300.0, 33.82 - 300.0, 1854.82 + 300.0, 3679.4 + 300.0, 33.82 + 300.0)
	RemoveVehiclesFromGeneratorsInArea(-724.46 - 300.0, -1444.03 - 300.0, 5.0 - 300.0, -724.46 + 300.0, -1444.03 + 300.0, 5.0 + 300.0)
end)

CreateThread(function()
	while true do
		Wait(1)
		local ped = ESX.PlayerData.ped
		if IsPedBeingStunned(ped) then
			SetPedMinGroundTimeForStungun(ped, math.random(Config.StungunTime[1], Config.StungunTime[2]))
		else
			Wait(1000)
		end
	end
end)

CreateThread(function()
	for i = 1, 15 do
		EnableDispatchService(i, false)
	end

	SetMaxWantedLevel(0)
end)

if Config.IdleCamera then
	DisableIdleCamera(true)
end

CreateThread(function()
    while true do
        local ped = ESX.PlayerData.ped
        local weapon = GetSelectedPedWeapon(ped)
		if weapon ~= `WEAPON_UNARMED` then
			if IsPedArmed(ped, 6) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end
		else
			Wait(500)
		end
        Wait(7)
    end
end)

CreateThread(function()
    local pedPool = GetGamePool('CPed')
    for k,v in pairs(pedPool) do
        SetPedDropsWeaponsWhenDead(v, false)
    end
    Wait(500)
end)

-- SHUFF
CreateThread(function()
    while true do
		if Config.DisableShuffle then
			local ped = ESX.PlayerData.ped
			local veh = GetVehiclePedIsIn(ped)
			if IsPedInAnyVehicle(ped, false) then
				if GetPedInVehicleSeat(veh, false, 0) == ped then
					if GetIsTaskActive(ped, 165) then
						SetPedIntoVehicle(ped, veh, 0)
						SetPedConfigFlag(ped, 184, true)
					end
				end
			end
		end
        Wait(5)
	end
end)

RegisterNetEvent('goat_base:adminlist')
AddEventHandler('goat_base:adminlist', function(list)
	ESX.UI.Menu.Open('default',GetCurrentResourceName(),"adminlist",
	{ 
	title = "Administratorzy online ("..#list..")", 
	align = "center", 
	elements = list 
	}, function(data, menu)
		
	end, function(data, menu) 
	menu.close() 
	end)
end)

RegisterCommand("seat", function(a, args)
	local veh = GetVehiclePedIsIn(ped)
	if veh ~= 0 then
		SetPedIntoVehicle(ESX.PlayerData.ped, veh, ESX.Math.Round(args[1] - 2))
	end
end)
for i = -1, 10 do
	RegisterCommand("seat" .. (i + 2), function()
		local veh = GetVehiclePedIsIn(ped)
		if veh ~= 0 then
			SetPedIntoVehicle(ESX.PlayerData.ped, veh, i)
		end
	end)
end

-- DRIVEBY
CreateThread(function()
    while true do
		if Ped.InVehicle then
			local CanDoDriveBy = false
			local SpeedMultiplier = 1

			if Config.DriveByUnit == "kph" then
				SpeedMultiplier = 3.6
			elseif Config.DriveByUnit == "mph" then
				SpeedMultiplier = 2.236936
			end

			if (GetEntitySpeed(Ped.Vehicle) * SpeedMultiplier) < Config.DriveBySpeed then
				CanDoDriveBy = true
			end

			SetPlayerCanDoDriveBy(Ped.P, CanDoDriveBy)
		end
		Wait(500)
	end
end)

-- Strzelanie

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for _, iter in ipairs({1, 2, 3, 4, 6, 7, 8, 9, 13, 17, 18}) do
			HideHudComponentThisFrame(iter)
		end

		local ped = PlayerPedId()

		local inVehicle = IsPedInAnyVehicle(ped, false)
		if not show then
			-- ShowHudComponentThisFrame(14)

			local aiming, shooting = IsControlPressed(0, 25), IsPedShooting(ped)
			local nothing, weapon = GetCurrentPedWeapon(ped, true)
			if aiming or shooting then
				if shooting and not aiming then
					isShooting = true
					aimTimer = 0
				else
					isShooting = false
				end

				if not isAiming then
					isAiming = true

					lastCamera = GetFollowPedCamViewMode()
					if lastCamera ~= 4 then
						if weapon == GetHashKey('WEAPON_UNARMED') or weapon == GetHashKey('WEAPON_MACHETE') or weapon == GetHashKey('WEAPON_KNIFE') or weapon == GetHashKey('WEAPON_SWITCHBLADE') or weapon == GetHashKey('WEAPON_BATTLEAXE') or weapon == GetHashKey('WEAPON_NIGHTSTICK') or weapon == GetHashKey('WEAPON_BAT') then
							SetFollowPedCamViewMode(4)
						else
							SetFollowPedCamViewMode(2)
						end
						
					end
				elseif GetFollowPedCamViewMode() ~= 4 then
						if weapon == GetHashKey('WEAPON_UNARMED') or weapon == GetHashKey('WEAPON_MACHETE') or weapon == GetHashKey('WEAPON_KNIFE') or weapon == GetHashKey('WEAPON_SWITCHBLADE') or weapon == GetHashKey('WEAPON_BATTLEAXE') or weapon == GetHashKey('WEAPON_NIGHTSTICK') or weapon == GetHashKey('WEAPON_BAT') then
						SetFollowPedCamViewMode(4)
					else
						SetFollowPedCamViewMode(2)
					end
				end
			elseif isAiming then
				local off = true
				if isShooting then
					off = false
					aimTimer = aimTimer + 20
					if aimTimer == 3000 then
						isShooting = false
						aimTimer = 0
						off = true
					end
				end

				if off then
					isAiming = false
					if lastCamera ~= 4 then
						SetFollowPedCamViewMode(lastCamera)
					end
				end
			elseif not inVehicle then
				DisableControlAction(0, 24, true)
				DisableControlAction(0, 140, true)
				DisableControlAction(0, 141, true)
				DisableControlAction(0, 142, true)
				DisableControlAction(0, 257, true)
				DisableControlAction(0, 263, true)
				DisableControlAction(0, 264, true)
			end
		end

		if inVehicle then
			local vehicle = GetVehiclePedIsIn(ped, false)
			if DoesVehicleHaveWeapons(vehicle) == 1 then
				local vehicleWeapon, vehicleWeaponHash = GetCurrentPedVehicleWeapon(playerped)
				if vehicleWeapon == 1 then
					DisableVehicleWeapon(true, vehicleWeaponHash, vehicle, playerPed)
					SetCurrentPedVehicleWeapon(playerPed, `WEAPON_UNARMED`)
				end
			end

			DisableControlAction(0, 354, true)
			DisableControlAction(0, 351, true)
			DisableControlAction(0, 350, true)
			DisableControlAction(0, 357, true)
		end
	end
end)

-- WEAPON DROP
CreateThread(function()
    for _, hash in pairs(Config.DisabledPickups) do
        ToggleUsePickupsForPlayer(PlayerId(), hash, false)
    end
end)

-- RICH PRESENCE | PAUSE MENU TITLE
CreateThread(function()
    AddTextEntry('FE_THDR_GTAO', Config.PauseMenuTitle)
    while ESX == nil do
        Wait(0)
    end

    SetDiscordAppId(Config.AppId)
    SetDiscordRichPresenceAsset(Config.Asset)
    SetDiscordRichPresenceAssetText(Config.AssetText)
    while true do
        ESX.TriggerServerCallback("goat_base:GetCurrentPlayers", function(players)

            local text = Config.PresenceText
            text = string.gsub(text, "<name>", tostring(GetPlayerName(PlayerId())))
            text = string.gsub(text, "<pid>", tostring(GetPlayerServerId(PlayerId())))
            text = string.gsub(text, "<players>", tostring(players))
            text = string.gsub(text, "<maxplayers>", tostring(GetConvarInt("sv_maxclients", 80)))
            SetRichPresence(text)
            SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/goatpack")
            SetDiscordRichPresenceAction(1, "GOATPACK BETA", "")

        end)
        Wait(Config.PresenceTimer * 1000)
    end
end)

local hour, minute = 12, 00
RegisterNetEvent("goat_base:UpdateTime", function(hour2, minute2)
	hour, minute = hour2, minute2
end)
CreateThread(function()
	while true do
		NetworkOverrideClockTime(hour, minute, 0)
		Wait(100)
	end
end)

RegisterNetEvent('goat:coords_vec3')
AddEventHandler('goat:coords_vec3', function(args)
	
	local cfg = {
		heading = false,
		json = false,
		head = false,
		vector = false,
	}

	for _, arg in ipairs(args) do
		if cfg[arg] ~= nil then
			cfg[arg] = true
		end
	end

	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped, true)

	coords = {x = tonumber(string.format("%.4f", coords.x)), y = tonumber(string.format("%.4f", coords.y)), z = tonumber(string.format("%.4f", (coords.z - (cfg.head and 0.0 or 0.95))))}
	if cfg.heading then

		coords.heading = tonumber(string.format("%.2f", GetEntityHeading(ped)))
	end

	if cfg.vector then

		coords = "vec3("..coords.x..", "..coords.y..", "..coords.z..")"
	elseif cfg.json then

		coords = json.encode(coords)
	else
		coords = "vec3(".. coords.x .. ", " .. coords.y .. ", " .. coords.z .. (cfg.heading and ", heading = " .. coords.heading or "") .. ")"
	end

	Clipboard(coords)
end)

RegisterNetEvent('goat:coords_vec4')
AddEventHandler('goat:coords_vec4', function(args)
	
	local cfg = {
		heading = false,
		json = false,
		head = false,
		vector = false,
	}

	for _, arg in ipairs(args) do
		if cfg[arg] ~= nil then
			cfg[arg] = true
		end
	end

	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped, true)

	coords = {x = tonumber(string.format("%.4f", coords.x)), y = tonumber(string.format("%.4f", coords.y)), z = tonumber(string.format("%.4f", (coords.z - (cfg.head and 0.0 or 0.95))))}
	if cfg.heading then

		coords.heading = tonumber(string.format("%.2f", GetEntityHeading(ped)))
	end

	if cfg.vector then		coords = "vec4("..coords.x..", "..coords.y..", "..coords.z..")"
	elseif cfg.json then

		coords = json.encode(coords)
	else
		coords = "vec4(".. coords.x .. ", " .. coords.y .. ", " .. coords.z .. ", "..GetEntityHeading(PlayerPedId())..")"
	end

	Clipboard(coords)
end)

function Clipboard(data)
	
	SendNUIMessage({
		type = 'clipboard',
		data =  data,
	})
end

-- Kucanie

local crouched = false

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 1 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, 36, true ) 

            if ( not IsPauseMenuActive() ) then 
                if ( IsDisabledControlJustPressed( 0, 36 ) ) then 
                    RequestAnimSet( "move_ped_crouched" )

                    while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                        Citizen.Wait(100)
                    end 

                    if ( crouched == true ) then 
                        ResetPedMovementClipset( ped, 0 )
                        crouched = false 
                    elseif ( crouched == false ) then
                        SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                        crouched = true 
                    end 
                end
            end 
        end 
    end
end )

-- Animacja BW



RegisterNetEvent("esx_ambulancejob:revive", function()
	isDead = false
end)

-- Fix / Clean

RegisterNetEvent('goat:fix')
AddEventHandler('goat:fix', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
		SetVehicleDirtLevel(vehicle, 0)
		exports["goat_notify"]:Notify('caron', 'Powiadomienie', "Naprawiłeś pojazd.")
	else
		exports["goat_notify"]:Notify('caroff', 'Powiadomienie', "Nie jesteś w pojezdzie!")	
	end
end)

-- Watercooler

RegisterNetEvent('goat_epicdesk:animacja', function()
    animka1()
    Wait(3500)
    FreezeEntityPosition(PlayerPedId(), false)
    ClearPedTasks(PlayerPedId())
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function animka1()
    local ad = "mini@repair"
    local anim = "fixing_a_ped"
    local player = PlayerPedId()


    if (DoesEntityExist(player) and not IsEntityDead(player)) then
        loadAnimDict(ad)
        if (IsEntityPlayingAnim(player, ad, anim, 8)) then
            TaskPlayAnim(player, ad, "exit", 8.0, -8.0, 0.2, 1, 0, 0, 0, 0)
            ClearPedSecondaryTask(player)
        else
            SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), equipNow)
            Citizen.Wait(50)
            TaskPlayAnim(player, ad, anim, 8.0, -8.0, 0.2, 1, 0, 0, 0, 0)
            FreezeEntityPosition(player, true)
        end
    end
end



Citizen.CreateThread(function()
	exports['qtarget']:AddTargetModel(GetHashKey("prop_watercooler"), {
		options = {
			{
				event = "goat_watercooler:kup",
				icon = "fas fa-tint",
				label = "Zakup wodę",
			},
		},
		distance = 1

	})
end)

RegisterNetEvent('goat_use:dildo', function()
    ExecuteCommand("e używaniedildo")

end)

RegisterNetEvent('goat_use:wheelchair', function(source)
	local playerPed = GetPlayerPed(source)
	local coords = GetEntityCoords(playerPed)
	ESX.Game.SpawnVehicle('wheelchair', coords, 181.41, function(vehicle)
		plate = "1123 " .. math.random(100, 999)
		SetVehicleNumberPlateText(vehicle, plate)
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
	end)
end)

RegisterNetEvent("goat_watercooler:kup", function()
	TriggerEvent("goat_epicdesk:animacja")
	exports['forge-progress']:StartProg('Nalewasz wody do kubeczka.', 3500)
	-- Citizen.Wait(3500)
	TriggerServerEvent("goat_watercooler:buywater")
end)

-- PEDS

function SpawnPed(pedIndex, ped, coords, pedSettings, animation, weapon)

    Citizen.CreateThread(function()
        
        if allPeds[pedIndex] ~= nil then
            DeletePed(allPeds[pedIndex])
        end

        RequestModel(GetHashKey(ped))
        
        while not HasModelLoaded(GetHashKey(ped)) do
            Wait(1)
        end

        local npc = CreatePed(4, GetHashKey(ped), coords.x, coords.y, coords.z, false, false)
		
        allPeds[pedIndex] = npc
        
        FreezeEntityPosition(npc, pedSettings.FreezeEntityPosition or false)	
        SetEntityHeading(npc, coords.w)
        SetEntityInvincible(npc, pedSettings.SetEntityInvincible or false)
        SetBlockingOfNonTemporaryEvents(npc, pedSettings.SetBlockingOfNonTemporaryEvents or false)

        if animation ~= false then
			RequestAnimDict(animation.AnimationPack)
			while not HasAnimDictLoaded(animation.AnimationPack) do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc, animation.AnimationPack, animation.Animation, 1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
        end
        if weapon ~= false then
            for i=1, #weapon.weapons do
                GiveWeaponToPed(npc, GetHashKey(weapon.weapons[i].Wepon), 0, true, false)
                SetPedAmmo(npc, GetHashKey(weapon.weapons[i].Wepon), weapon.weapons[i].Ammo)
                SetCurrentPedWeapon(npc, GetHashKey(weapon.weapons[i].Wepon), true)
            end
        end 
    end)
end



-- Tempomat

local Player, tempomat          = nil, false
local CruisedSpeed    = 0
local CruisedSpeedKm  = 0

RegisterCommand("tempomat", function()
	Player = PlayerPedId()
	if IsDriver() and GetIsVehicleEngineRunning(GetVehicle()) then
		TriggerCruiseControl()
	end
end)

RegisterKeyMapping("tempomat", "Tempomat", "KEYBOARD", "GRAVE")



function TriggerCruiseControl()
	if CruisedSpeed == 0 and IsDriving() then
		if GetVehicleSpeed() > 0 then
			CruisedSpeed = GetVehicleSpeed()
			CruisedSpeedKm = TransformToKm(CruisedSpeed)

			ESX.ShowNotification('Tempomat włączony: ~p~' .. CruisedSpeedKm .. ' km/h')
			tempomat = true
			CreateThread(function ()
				while CruisedSpeed > 0 and IsInVehicle() == Player do
					Citizen.Wait(0)
					if not GetIsVehicleEngineRunning(GetVehicle()) then
						CruisedSpeed = 0
						break
					end

					if not IsTurningOrHandBraking() and GetVehicleSpeed() > (CruisedSpeed + 1.0) then
						CruisedSpeed = 0
						ESX.ShowNotification('Tempomat wyłączony')
						tempomat = false
						Citizen.Wait(2000)
						break
					end

					if not IsTurningOrHandBraking() and IsVehicleOnAllWheels(GetVehicle()) and GetVehicleSpeed() < CruisedSpeed then
						SetEntityMaxSpeed(GetVehicle(), CruisedSpeed)
						--SetVehicleForwardSpeed(GetVehicle(), CruisedSpeed)
					end

					if IsControlJustPressed(0, Keys["~"]) then
						CruisedSpeed = GetVehicleSpeed()
						CruisedSpeedKm = TransformToKm(CruisedSpeed)
					end

					if IsControlJustPressed(2, 72) then
						CruisedSpeed = 0
						ESX.ShowNotification('Tempomat wyłączony')
						resetspeed = 99999.9
						SetEntityMaxSpeed(GetVehicle(), resetspeed)
						tempomat = false
						Citizen.Wait(2000)
						break
					end
				end
			end)
		end
	end
end

-- PASY
local seatbelts = false
CreateThread(function()
	TriggerEvent("es_extended:updateBeltStatus", false)
	SetFlyThroughWindscreenParams((130 / 3.6), (140 / 3.6), 17.0, 2000.0)
end)
RegisterCommand("+belt", function()
	if not IsPedInAnyVehicle(ESX.PlayerData.ped, false) then return end
	
	seatbelts = not seatbelts
	TriggerEvent("es_extended:updateBeltStatus", seatbelts)

	if seatbelts then
		
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 2.0, "belton", 0.3)
		SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0)
	else
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 2.0, "beltoff", 0.3)
		SetFlyThroughWindscreenParams((130 / 3.6), (140 / 3.6), 17.0, 2000.0)
	end

	CreateThread(function()
		while seatbelts do
			Wait(0) 
			DisableControlAction(0, 75, true)
		end
	end)

	while seatbelts do
		if not IsPedInAnyVehicle(ESX.PlayerData.ped, false) then
			seatbelts = false
			TriggerEvent("es_extended:updateBeltStatus", false)
		end
		Wait(100)
	end
end)
RegisterCommand("-belt", function() end)
RegisterKeyMapping("+belt", "Pasy", "KEYBOARD", "B")


function angle(veh)
	if not veh then return false end
	local vx,vy,vz = table.unpack(GetEntityVelocity(veh))
	local modV = math.sqrt(vx*vx + vy*vy)
	
	
	local rx,ry,rz = table.unpack(GetEntityRotation(veh,0))
	local sn,cs = -math.sin(math.rad(rz)), math.cos(math.rad(rz))
	
	if GetEntitySpeed(veh)* 3.6 < 30 or GetVehicleCurrentGear(veh) == 0 then return 0,modV end --speed over 30 km/h
	
	local cosX = (sn*vx + cs*vy)/modV
	if cosX > 0.966 or cosX < 0 then return 0,modV end
	return math.deg(math.acos(cosX))*0.5, modV
end
	

function IsTurningOrHandBraking ()
	return IsControlPressed(2, 76) or IsControlPressed(2, 63) or IsControlPressed(2, 64) or IsControlPressed(2, 71) or angle(GetVehicle()) > 2.5
end

function IsDriving ()
  return IsPedInAnyVehicle(Player, false)
end

function GetVehicle ()
  local vehicle = GetVehiclePedIsIn(Player, false)
  if (GetVehicleClass(vehicle) >= 0 and GetVehicleClass(vehicle) <= 12) or GetVehicleClass(vehicle) == 17 or GetVehicleClass(vehicle) == 18 or GetVehicleClass(vehicle) == 20 then
	return vehicle
  end
end

function IsInVehicle ()
  return GetPedInVehicleSeat(GetVehicle(), -1)
end

function IsDriver ()
  return GetPedInVehicleSeat(GetVehiclePedIsIn(Player, false), -1) == Player
end

function GetVehicleSpeed ()
  local vehicle = GetVehicle()
  local speed = GetEntitySpeed(vehicle)
  return GetVehicleCurrentGear(vehicle) > 0 and speed or (speed * -1)
end

function TransformToKm (speed)
  return math.floor(speed * 3.6 + 0.5)
end

exports("TempomatEnabled", function()
  return CruisedSpeed ~= 0
end)

exports['goat_base']:SpawnPed("goat_vanillajob1", 'a_f_y_topless_01', vec4(108.5723, -1289.4388, 28.2997, 303.54864501953), {
    FreezeEntityPosition = true,
    SetEntityInvincible = true,
    SetBlockingOfNonTemporaryEvents = true,
}, {
    AnimationPack = "mp_safehouse",
    Animation = 'lap_dance_girl',
}, false, false)

exports['goat_base']:SpawnPed("goat_vanillajob2", 'a_f_y_topless_01', vec4(104.6553, -1294.3994, 28.2997, 270.01794433594), {
    FreezeEntityPosition = true,
    SetEntityInvincible = true,
    SetBlockingOfNonTemporaryEvents = true,
}, {
    AnimationPack = "mini@strip_club@private_dance@part1",
    Animation = 'priv_dance_p1',
}, false, false)

exports['goat_base']:SpawnPed("goat_vanillajob3", 'a_f_y_topless_01', vec4(102.1142, -1290.1742, 28.2997, 290.55752563477), {
    FreezeEntityPosition = true,
    SetEntityInvincible = true,
    SetBlockingOfNonTemporaryEvents = true,
}, {
    AnimationPack = "mini@strip_club@lap_dance@ld_girl_a_song_a_p1",
    Animation = 'ld_girl_a_song_a_p1_f',
}, false, false)

exports['goat_base']:SpawnPed("kasyno", 'a_m_y_business_02', vec4(-1822.4615478516, -1201.6965332031, 13.308928489685, 1.23706054688), {
    FreezeEntityPosition = true,
    SetEntityInvincible = true,
    SetBlockingOfNonTemporaryEvents = true,
}, {
    AnimationPack = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@",
    Animation = 'low_center',
}, false, false)

exports['goat_base']:SpawnPed("goat_vanillajob4", 'cs_paper', vec4(103.4547, -1284.7019, 27.3102, 222.859375), {
    FreezeEntityPosition = true,
    SetEntityInvincible = true,
    SetBlockingOfNonTemporaryEvents = true,
}, {
    AnimationPack = "airforce@attention",
    Animation = 'animation',
}, {
    weapons = {
        {
            Wepon = "WEAPON_PISTOL",
            Ammo = 1,
        }
    },
    SetCurrentPedWeapon = "WEAPON_PISTOL",
}, false, false)


RegisterNetEvent('goat:wozek', function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    ESX.Game.SpawnVehicle('iak_wheelchair', coords, heading, function(vehicle)
        SetPedIntoVehicle(ped, vehicle, -1)
        SetVehicleEngineOn(vehicle, true, true, false)
    end)
end)

RegisterCommand('wozek', function()
	local ped = PlayerPedId()
    local wozek = GetVehiclePedIsIn(ped, false)

    if IsVehicleModel(wozek, GetHashKey("iak_wheelchair")) then
        DeleteVehicle(GetVehiclePedIsUsing(ped))
        TriggerServerEvent('goat:dodajwozek')
    else
        ESX.ShowNotification('Nie możesz tego zrobić')
    end
end)

RegisterCommand('propfix', function()
    local objects = GetGamePool('CObject')
    local playerPed = PlayerPedId()

    for i = 1, #objects do
        local object = objects[i]
        if IsEntityAttachedToEntity(playerPed, object) then
            SetEntityAsMissionEntity(object, true, true)
            DeleteObject(object)
            DeleteEntity(object)
        end
    end
end)



RegisterNetEvent('esx:updateDecor')
AddEventHandler('esx:updateDecor', function(what, entity, key, value)
    entity = NetworkGetEntityFromNetworkId(entity)
    if not entity or entity < 1 then
      --nil
    elseif what == 'DEL' then
        DecorRemove(entity, key)
    elseif what == 'BOOL' then
        DecorSetBool(entity, key, value == true)
    else
        value = tonumber(value)
        if value then
            DecorSetInt(entity, key, value)
        end
    end 
end)