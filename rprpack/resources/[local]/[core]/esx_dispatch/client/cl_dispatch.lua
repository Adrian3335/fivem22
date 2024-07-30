ESX = nil

local disableNotifications = false
local blips = {}
local cachedBlips = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
	Citizen.Wait(100)
    end

    while ESX.GetPlayerData().job == nil do Citizen.Wait(500) end
    ESX.PlayerData = ESX.GetPlayerData()

    SendNUIMessage({
        type = "sendResourceName",
        resource = GetCurrentResourceName()
    })
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer) ESX.PlayerData = xPlayer end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job) ESX.PlayerData.job = job end)


----------------------------------
----------- MAIN EVENT -----------
----------------------------------

RegisterNetEvent('dispatch:clNotify')
AddEventHandler('dispatch:clNotify', function(data)
    if data.priority == 1 then
        TriggerEvent("InteractSound_CL:PlayOnOne", "off", 0.6)

        if data.blipname then
            CreateBlip(data)
        end
    end

    if data.priority == 2 then
        TriggerEvent("InteractSound_CL:PlayOnOne", "beep", 0.6)
        
        if data.blipname then
            CreateBlip(data)
        end
    end

    if data.priority == 3 then
        TriggerEvent("InteractSound_CL:PlayOnOne", "beep", 0.6)
        
        if data.blipname then
            CreateBlip(data)
        end

    end

    if not disableNotifications then
        SendNUIMessage({
            type = "addNewNotification",
            notification = data
        })
    end
end)

----------------------------------------
----------- KEYMAPPING -----------
----------------------------------------

--RegisterKeyMapping("opendispatch", "Open Dispatch UI", 'keyboard', "F9")
RegisterNetEvent('u-dispatch:OpenUI')
AddEventHandler('u-dispatch:OpenUI', function()
ExecuteCommand('opendispatch')
end)

RegisterCommand("opendispatch", function()
    if not showDispatchLog and (Config.EnableWhitelistedJobs and Config.WhitelistedJobs[ESX.PlayerData.job.name] or true) then
        showDispatchLog = true
        -- SetPauseMenuActive(not showDispatchLog)
        SetNuiFocus(showDispatchLog, showDispatchLog)
        SetNuiFocusKeepInput(showDispatchLog)

        SendNUIMessage({ type = "showOldNotifications", show = showDispatchLog })
        StartLoopThread()
    end
end)

---------------------------------
----------- FUNCTIONS -----------
---------------------------------

function StartLoopThread()
    Citizen.CreateThread(function()
        while showDispatchLog do
            --DisableAllControlActions(0)
            --DisableAllControlActions(1)
            --DisableAllControlActions(2)
            DisableControlAction(0, 1, true)
			DisableControlAction(0, 2, true)
            DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
            DisableControlAction(0, 200, true)
            DisableControlAction(0, 177, true)
            DisableControlAction(0, 202, true)
            DisableControlAction(0, 322, true)

            if IsDisabledControlJustPressed(0, 200) or IsDisabledControlJustPressed(0, 194) then
                if showDispatchLog then
                    showDispatchLog = false
                    SetNuiFocus(showDispatchLog, showDispatchLog)
                    SetNuiFocusKeepInput(showDispatchLog)
                    SendNUIMessage({ type = "showOldNotifications", show = showDispatchLog })
                end
            end

            Citizen.Wait(0)
        end
    end)
end

function CreateBlip(data)
    blips[data.id] = AddBlipForCoord(data.position.x, data.position.y, data.position.z)

    SetBlipSprite(blips[data.id], data.sprite)
    SetBlipColour(blips[data.id], data.color)
    SetBlipScale(blips[data.id], 1.2)
    SetBlipAlpha(blips[data.id], 200)
    PulseBlip(blips[data.id])
       
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.blipname)
    EndTextCommandSetBlipName(blips[data.id])

    table.insert(cachedBlips, blips[data.id])

    Citizen.CreateThreadNow(function()
        local storedId = data.id
        Citizen.Wait(data.fadeOut * 1000)

        RemoveBlip(blips[storedId])
    end)
end

-------------------------------------
----------- NUI CALLBACKS -----------
-------------------------------------

RegisterNUICallback('setGPSPosition', function(data, cb)
    SetNewWaypoint(data.position.x, data.position.y)
    exports['u-base']:Notify('inform', 'Zaznaczono lokalizację na GPS!')
    cb("ok")
end)

RegisterNUICallback('close', function(data, cb)
    showDispatchLog = false
    SetNuiFocus(showDispatchLog, showDispatchLog)
    SetNuiFocusKeepInput(showDispatchLog)
    cb("ok")
end)

RegisterNUICallback('disableNotifications', function(data, cb)
    disableNotifications = not disableNotifications
    exports['u-base']:Notify('inform', 'Przełączyłeś powiadomienia!')
    cb("ok")
end)

RegisterNUICallback('clearNotifications', function(data, cb)
    for _, blip in pairs(cachedBlips) do
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    cachedBlips = {}
    exports['u-base']:Notify('inform', 'Wyczyściłeś powiadomienia!')
    cb("ok")
end)

function GetStreetAndZone()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    local street = street1 .. ", " .. zone
    return street
end

exports('GetStreetAndZone', GetStreetAndZone)

function randomId()
    math.randomseed(GetCloudTimeAsInt())
    return string.gsub("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx", "[xy]", function(c)
        return string.format("%x", (c == "x") and math.random(0, 0xf) or math.random(8, 0xb))
    end)
end

exports('randomId', randomId)

RegisterCommand('dispatchtest', function()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local przyklad = {
        code = "10-90",
        street = GetStreetAndZone(),
        id = randomId(),
        priority = 2,
        title = "Rabunek banku Fleeca",
        duration = 10000,
        blipname = "# Rabunek banku Fleeca",
        color = 2,
        sprite = 304,
        fadeOut = 30,
        position = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        job = "police"
    }
    TriggerServerEvent("dispatch:svNotify", przyklad)
end)


RegisterCommand('dispatchtest2', function()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local Jacking = {
        code = "10-73",
        street = exports['esx_dispatch']:GetStreetAndZone(),
        id = exports['esx_dispatch']:randomId(),
        priority = 1,
        title = "Kradzież pojazdu",
        duration = 3500,
        blipname = "# Kradzież",
        color = 76,
        sprite = 229,
        fadeOut = 20,
        position = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        job = "police"
    }
    TriggerServerEvent("dispatch:svNotify", Jacking)
end)


RegisterNetEvent("u-fleeca:alarmbank2")
AddEventHandler("u-fleeca:alarmbank2", function()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local alarmfleeca = {
        code = "10-90",
        street = GetStreetAndZone(),
        id = randomId(),
        priority = 2,
        title = "Rabunek banku Fleeca",
        duration = 10000,
        blipname = "# Rabunek banku Fleeca",
        color = 2,
        sprite = 304,
        fadeOut = 30,
        position = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        job = "police"
    }
    TriggerServerEvent("dispatch:svNotify", alarmfleeca)
end)

RegisterNetEvent("unknown:groby")
AddEventHandler("unknown:groby", function()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local groby = {
        code = "10-90",
        street = GetStreetAndZone(),
        id = randomId(),
        priority = 2,
        title = "Rabowanie grobu",
        duration = 10000,
        blipname = "# Rabowanie grobu",
        color = 2,
        sprite = 304,
        fadeOut = 30,
        position = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        job = "police"
    }
    TriggerServerEvent("dispatch:svNotify", groby)
end)

RegisterNetEvent("unknown:magazyn")
AddEventHandler("unknown:magazyn", function()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local magazyn = {
        code = "10-90",
        street = GetStreetAndZone(),
        id = randomId(),
        priority = 2,
        title = "Rabowanie magazynu",
        duration = 10000,
        blipname = "# Rabowanie magazynu",
        color = 2,
        sprite = 304,
        fadeOut = 30,
        position = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        job = "police"
    }
    TriggerServerEvent("dispatch:svNotify", magazyn)
end)


RegisterCommand('dispatchtest3', function()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local przyklad = {
        code = "10-90",
        street = GetStreetAndZone(),
        id = randomId(),
        priority = 3,
        title = "Rabunek banku Fleeca",
        duration = 10000,
        blipname = "# Rabunek banku Fleeca",
        color = 2,
        sprite = 304,
        fadeOut = 30,
        position = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        job = "police"
    }
    TriggerServerEvent("dispatch:svNotify", przyklad)
end)

Config = {
    GunshotAlert = true,
    GunpowderTimer = 5,
    Delay = 10000, -- 10 SEKUND
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
        ["WEAPON_MUSKET"] = true,
        ["WEAPON_ASSAULTSMG"] = "COMPONENT_AT_AR_SUPP_02",
        ["WEAPON_ASSAULTRIFLE"] = "COMPONENT_AT_AR_SUPP_02",
        ["WEAPON_CARBINERIFLE"] = "COMPONENT_AT_AR_SUPP",
        ["WEAPON_MARKSMANRIFLE"] = "COMPONENT_AT_AR_SUPP",
        ["WEAPON_SNIPERRIFLE"] = "COMPONENT_AT_AR_SUPP_02",
        ["WEAPON_1911PISTOL"] = "COMPONENT_AT_PI_SUPP"
    }
}

local shotTimer = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if shotTimer > 0 and not IsPedDeadOrDying(PlayerPedId()) then
			shotTimer = shotTimer - 100
			if shotTimer <= 0 then
				DecorSetBool(PlayerPedId(), "Gunpowder", false)
				shotTimer = 0
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local ped = PlayerPedId()
		if DoesEntityExist(ped) then
			if not DecorIsRegisteredAsType("Gunpowder", 2) then
				DecorRegister("Gunpowder", 2)
				DecorSetBool(ped, "Gunpowder", false)
			end

			if IsPedShooting(ped) then
				if shotTimer == 0 then
					DecorSetBool(ped, "Gunpowder", true)
				end

				local weapon, supress = GetSelectedPedWeapon(ped), nil
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

						if IsPedSittingInAnyVehicle(ped) then
                            local coords = GetEntityCoords(GetPlayerPed(-1))
                            local car = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                            local carname = GetDisplayNameFromVehicleModel(car)
                            local ShotsCar = {
                                code = "10-71",
                                street = GetStreetAndZone(),
                                id = randomId(),
                                priority = 1,
                                title = "Padły strzały z pojazdu",
                                duration = 7000,
                                blipname = "# Strzały",
                                color = 76,
                                sprite = 119,
                                fadeOut = 100,
                                position = {
                                    x = coords.x,
                                    y = coords.y,
                                    z = coords.z
                                },
                                job = "police"
                            }
                            TriggerServerEvent("dispatch:svNotify", ShotsCar)
							--TriggerServerEvent('esx_jb_outlawalert:notifyShotscar', {x = coords.x, y = coords.y, z = coords.y}, str)
						else
                            local coords = GetEntityCoords(GetPlayerPed(-1))
                            local Shots = {
                                code = "10-71",
                                street = GetStreetAndZone(),
                                id = randomId(),
                                priority = 1,
                                title = "Padły strzały na ulicy",
                                duration = 7500,
                                blipname = "# Strzały",
                                color = 76,
                                sprite = 119,
                                fadeOut = 100,
                                position = {
                                    x = coords.x,
                                    y = coords.y,
                                    z = coords.z
                                },
                                job = "police"
                            }
                            TriggerServerEvent("dispatch:svNotify", Shots)
							--TriggerServerEvent('esx_jb_outlawalert:notifyShots', {x = coords.x, y = coords.y, z = coords.y}, str)
						end

						Citizen.Wait(Config.Delay)
					end
				end
			end
		end
	end
end)