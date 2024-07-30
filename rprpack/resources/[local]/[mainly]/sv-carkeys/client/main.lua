local vehicles = {}
local engineAction = false
CreateThread(function()
    while true do
        if not engineAction then
            if GetSeatPedIsTryingToEnter(ESX.PlayerData.ped) == -1 and not vehicles[GetVehiclePedIsTryingToEnter(ESX.PlayerData.ped)] then
                local veh = GetVehiclePedIsTryingToEnter(ESX.PlayerData.ped)
                vehicles[veh] = IsVehicleEngineOn(veh)
            elseif IsPedInAnyVehicle(ESX.PlayerData.ped, false) and not vehicles[GetVehiclePedIsIn(ESX.PlayerData.ped, false)] then
                local veh = GetVehiclePedIsIn(ESX.PlayerData.ped, false)
                vehicles[veh] = IsVehicleEngineOn(veh)
            end
        end

        for vehicle, EngineStatus in pairs(vehicles) do
			if DoesEntityExist(vehicle) then
				if (GetPedInVehicleSeat(vehicle, -1) == ESX.PlayerData.ped) or IsVehicleSeatFree(vehicle, -1) then
                    SetVehicleEngineOn(vehicle, EngineStatus, true, false)
                    SetVehicleJetEngineOn(vehicle, EngineStatus)

                    local veh = GetVehiclePedIsIn(ESX.PlayerData.ped, false)
                    if veh == 0 or (veh ~= 0 and vehicle ~= veh) then
                        if IsThisModelAHeli(GetEntityModel(vehicle)) or IsThisModelAPlane(GetEntityModel(vehicle)) then
                            if EngineStatus then
                                SetHeliBladesFullSpeed(vehicle)
                            end
                        end
                    end
				end
			else
				table.remove(vehicles, i)
			end
		end

        if not GetPedConfigFlag(ESX.PlayerData.ped, 429) then
            SetPedConfigFlag(ESX.PlayerData.ped, 429, true)
        end
        Wait(500)
    end
end)

EngineToggle = function(vehicle)
    local lockStatus = GetVehicleDoorLockStatus(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle, true)
    if type(plate) == "string" then
        plate = plate:gsub("%s$", "")
    end

    print(plate)
    local hasKey = exports.ox_inventory:Search("count", "carkey", plate)
    if hasKey > 0 then
        vehicles[vehicle] = not IsVehicleEngineOn(vehicle)
		if vehicles[vehicle] then
            SetVehicleEngineOn(vehicle, true, false, true)
            SetVehicleJetEngineOn(vehicle, true)
            lib.notify({
                title = "Powiadomienie",
                description = "Silnik włączony"
            })
        else
            SetVehicleEngineOn(vehicle, false, false, true)
            SetVehicleJetEngineOn(vehicle, false)
            lib.notify({
                title = "Powiadomienie",
                description = "Silnik wyłączony"
            })
        end
    end

    local wytrych = exports.ox_inventory:Search("count", "lockpick")

    if hasKey == 0 and wytrych > 0 and GetIsVehicleEngineRunning(vehicle) == false then
        if IsControlJustPressed(0, 246) then
            local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'w', 'a', 's', 'd'})

            if success then
                vehicles[vehicle] = not IsVehicleEngineOn(vehicle)
                if vehicles[vehicle] then
                    SetVehicleEngineOn(vehicle, true, false, true)
                    SetVehicleJetEngineOn(vehicle, true)
                    lib.notify({
                        title = "Powiadomienie",
                        description = "Silnik włączony"
                    })
                end
            end
        end
    end
end

LockToggle = function(vehicle)
    local lockStatus = GetVehicleDoorLockStatus(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle, true)
    local wytrych = exports.ox_inventory:Search("count", "lockpick")
    local hasKey = exports.ox_inventory:Search("count", "carkey", plate)

    if type(plate) == "string" then
        plate = plate:gsub("%s$", "")
    end

    if hasKey > 0 then
        local InVehicle = IsPedInAnyVehicle(ESX.PlayerData.ped, true)

        Citizen.CreateThreadNow(function()
            local id = NetworkGetNetworkIdFromEntity(vehicle)
            SetNetworkIdCanMigrate(id, true)

            local tries = 0
            while not NetworkHasControlOfNetworkId(id) and tries < 10 do
                tries = tries + 1
                NetworkRequestControlOfNetworkId(id)
                Citizen.Wait(100)
            end

            SetNetworkIdCanMigrate(id, false)

            if lockStatus < 2 then
                SetVehicleDoorsLocked(vehicle, 4)
                SetVehicleDoorsLockedForAllPlayers(vehicle, true)

                SetVehicleAlarm(vehicle, true)
                if not InVehicle then
                    SetVehicleInteriorlight(vehicle, false)
                end

                lib.notify({
                    title = "Powiadomienie",
                    description = "Pojazd zamknięty"
                })

                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10.0, "carlock", 0.25)
            elseif lockStatus > 1 then
                SetVehicleDoorsLocked(vehicle, 1)
                SetVehicleDoorsLockedForAllPlayers(vehicle, false)

                SetVehicleAlarm(vehicle, false)
                if not InVehicle then
                    SetVehicleInteriorlight(vehicle, true)
                end

                lib.notify({
                    title = "Powiadomienie",
                    description = "Pojazd otwarty!"
                })

                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10.0, "carunlock", 0.5)
            end

            if not InVehicle then
                RequestAnimDict("gestures@m@standing@casual")
                while not HasAnimDictLoaded("gestures@m@standing@casual") do
                    Citizen.Wait(0)
                end

                TaskPlayAnim(ESX.PlayerData.ped, "gestures@m@standing@casual", "gesture_you_soft", 3.0, 1.0, -1, 48, 0, 0, 0, 0)
            end

            StartVehicleHorn(vehicle, 50, 'HELDDOWN')
            SetVehicleLights(vehicle, 2)
            SetVehicleBrakeLights(vehicle, true)
            Citizen.Wait(200)
            
            StartVehicleHorn(vehicle, 50, 'HELDDOWN')
            SetVehicleLights(vehicle, 0)
            SetVehicleBrakeLights(vehicle, false)
            Citizen.Wait(200)
            
            SetVehicleLights(vehicle, 2)
            SetVehicleBrakeLights(vehicle, true)
            Citizen.Wait(200)

            SetVehicleLights(vehicle, 0)
            SetVehicleBrakeLights(vehicle, false)

            SetNetworkIdCanMigrate(id, true)
        end)
    end
end

RegisterCommand("engineToggle", function()
    local vehicle = GetVehiclePedIsIn(ESX.PlayerData.ped, false)
    if vehicle == 0 then
        return
    end
    if GetPedInVehicleSeat(vehicle, -1) ~= ESX.PlayerData.ped then
        return
    end
    EngineToggle(vehicle)
end)
RegisterCommand("lockToggle", function()
    local vehicle = GetVehiclePedIsIn(ESX.PlayerData.ped, false)
    if vehicle == 0 then
        vehicle = ESX.Game.GetClosestVehicle()
    end
    LockToggle(vehicle)
end)
RegisterKeyMapping("engineToggle", "Uruchom/Zgaś silnik w pojeździe", "keyboard", "Y")
RegisterKeyMapping("lockToggle", "Otwórz/Zamknij pojazd", "keyboard", "U")
CreateThread(function()
    TriggerEvent("chat:removeSuggestion", "/engineToggle")
    TriggerEvent("chat:removeSuggestion", "/lockToggle")
end)

exports("useKey", function(data)
    local vehicles = ESX.Game.GetVehicles()
    for _, vehicle in pairs(vehicles) do
        local find = false
        local plate = GetVehicleNumberPlateText(vehicle, true)
        if type(plate) == "string" then
            plate = plate:gsub("%s$", "")
        end

        local keys = exports.ox_inventory:Search('slots', 'carkey')
        for k, v in pairs(keys) do
            if v.slot == data.slot and plate == v.metadata.type then
                LockToggle(vehicle)
                find = true
                break
            end
        end

        if find then
            break
        end
    end
end)

local AddKey = function(plate)
    if type(plate) == "string" then
        plate = plate:gsub("%s$", "")
    end

    local hasKey = exports.ox_inventory:Search("count", "carkey", plate)
    if hasKey > 0 then
        return
    end

    TriggerServerEvent("sv-carkeys:addKey", plate)
end
exports("addKey", AddKey)
RegisterNetEvent("sv-carkeys:addKey", AddKey)

local RemoveKey = function(plate)
    if type(plate) == "string" then
        plate = plate:gsub("%s$", "")
    end

    TriggerServerEvent("sv-carkeys:removeKey", plate)
end
exports("removeKey", RemoveKey)
RegisterNetEvent("sv-carkeys:removeKey", RemoveKey)

function table.contains(table, element)
    for _, value in pairs(table) do
        if value[1] == element then
            return true
        end
    end
    return false
end