CreateThread(function()
    while true do
        local playerPed = ESX.PlayerData.ped
        if not GetPedConfigFlag(playerPed, 429) then
            SetPedConfigFlag(playerPed, 429, true)
        end
        if IsPedJacking(playerPed) then
            Wait(3000)
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local status = IsVehicleEngineOn(vehicle)
            if status then
                SetVehicleEngineOn(vehicle, true, true, true)
                SetVehicleJetEngineOn(vehicle, true)
            end
        end
        Wait(0)
    end
end)

function EngineToggle()
    local vehicle = GetVehiclePedIsIn(ESX.PlayerData.ped, false)
    if not vehicle or vehicle == 0 then
        return
    end

    local plate = GetVehicleNumberPlateText(vehicle, true)
    if type(plate) == "string" then
        plate = plate:gsub("%s$", "")
    end

    local hasKey = exports.ox_inventory:Search("count", "car_keys", plate)
    if hasKey > 0 then
        local status = not IsVehicleEngineOn(vehicle)
        if status then
            SetVehicleEngineOn(vehicle, true, false, true)
            SetVehicleJetEngineOn(vehicle, true)
            ESX.ShowNotification("Silnik włączony")
        else
            SetVehicleEngineOn(vehicle, false, false, true)
            SetVehicleJetEngineOn(vehicle, false)
            ESX.ShowNotification("Silnik wyłączony")
        end
    end
end

function LockToggle(vehicle, InVehicle)
    local id = NetworkGetNetworkIdFromEntity(vehicle)
    SetNetworkIdCanMigrate(id, true)

    local tries = 0
    while not NetworkHasControlOfNetworkId(id) and tries < 10 do
        tries = tries + 1
        NetworkRequestControlOfNetworkId(id)
        Citizen.Wait(100)
    end

    SetNetworkIdCanMigrate(id, false)

    local lockStatus = GetVehicleDoorLockStatus(vehicle)
    if lockStatus < 2 then
        SetVehicleDoorsLocked(vehicle, 4)
        SetVehicleDoorsLockedForAllPlayers(vehicle, true)

        SetVehicleAlarm(vehicle, true)
        if not InVehicle then
            SetVehicleInteriorlight(vehicle, false)
        end

        ESX.ShowNotification("Pojazd zamknięty")
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5.0, "lock", 0.5)
    elseif lockStatus > 1 then
        SetVehicleDoorsLocked(vehicle, 1)
        SetVehicleDoorsLockedForAllPlayers(vehicle, false)

        SetVehicleAlarm(vehicle, false)
        if not InVehicle then
            SetVehicleInteriorlight(vehicle, true)
        end

        ESX.ShowNotification("Pojazd otwarty")
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5.0, "unlock", 0.5)
    end

    if not InVehicle then
        RequestAnimDict("gestures@m@standing@casual")
        while not HasAnimDictLoaded("gestures@m@standing@casual") do
            Wait(0)
        end

        TaskPlayAnim(ESX.PlayerData.ped, "gestures@m@standing@casual", "gesture_you_soft", 3.0, 1.0, -1, 48, 0, 0, 0, 0)
    end

    SetVehicleLights(vehicle, 2)
    SetVehicleBrakeLights(vehicle, true)
    Wait(200)

    SetVehicleLights(vehicle, 0)
    SetVehicleBrakeLights(vehicle, false)
    Wait(200)
    
    SetVehicleLights(vehicle, 2)
    SetVehicleBrakeLights(vehicle, true)
    Wait(200)

    SetVehicleLights(vehicle, 0)
    SetVehicleBrakeLights(vehicle, false)

    SetNetworkIdCanMigrate(id, true)
end

function UseItem(plate)
    local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(ESX.PlayerData.ped), 20.0)
    for i = 1, #(vehicles) do
        local vehicle = vehicles[i]
        local vehiclePlate = GetVehicleNumberPlateText(vehicle, true)
        if type(vehiclePlate) == "string" then
            vehiclePlate = vehiclePlate:gsub("%s$", "")
        end
        
        if vehiclePlate == plate then
            LockToggle(vehicle, false)
            break
        end
    end
end

function AddKey(plate)
    TriggerServerEvent("goat_carkeys:AddKey", plate)
end

function RemoveKey(plate)
    TriggerServerEvent("goat_carkeys:RemoveKey", plate)
end

exports("AddKey", AddKey)
exports("RemoveKey", RemoveKey)
RegisterNetEvent("goat_carkeys:UseItem", UseItem)
RegisterCommand("+NeedRP_EngineToggle", function() end)
RegisterCommand("-NeedRP_EngineToggle", EngineToggle)
RegisterCommand("+NeedRP_LockToggle", function() end)
RegisterCommand("-NeedRP_LockToggle", function()
    local InVehicle = false
    local vehicle = GetVehiclePedIsIn(ESX.PlayerData.ped, false)
    if vehicle == 0 then
        vehicle = ESX.Game.GetClosestVehicle()
    else
        InVehicle = true
    end

    if not vehicle or vehicle == 0 then
        return
    end

    local plate = GetVehicleNumberPlateText(vehicle, true)
    if type(plate) == "string" then
        plate = plate:gsub("%s$", "")
    end

    local hasKey = exports.ox_inventory:Search("count", "car_keys", plate)
    if hasKey > 0 then
        LockToggle(vehicle, InVehicle)
    end
end)
RegisterKeyMapping("+NeedRP_EngineToggle", "Uruchom/Zgaś silnik w pojeździe", "keyboard", "Y")
RegisterKeyMapping("+NeedRP_LockToggle", "Otwórz/Zamknij pojazd", "keyboard", "U")
CreateThread(function()
    TriggerEvent("chat:removeSuggestion", "/+NeedRP_EngineToggle")
    TriggerEvent("chat:removeSuggestion", "/-NeedRP_EngineToggle")
    TriggerEvent("chat:removeSuggestion", "/+NeedRP_LockToggle")
    TriggerEvent("chat:removeSuggestion", "/-NeedRP_LockToggle")
end)

-- LOCKPICK
RegisterNetEvent("goat_carkeys:UseLockPick", function(data)
    local ped = ESX.PlayerData.ped
    local vehicle = GetVehiclePedIsIn(ped, false)
    local InVehicle = true
    if not vehicle or vehicle == 0 then
        vehicle = ESX.Game.GetClosestVehicle()
        InVehicle = false
    end

    if not vehicle or vehicle == 0 or (#(GetEntityCoords(ped) - GetEntityCoords(vehicle)) > 3.0) then
        return
    end

    if not InVehicle then
        RequestAnimDict( "anim@amb@clubhouse@tutorial@bkr_tut_ig3@" )
        while not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@") do 
            Citizen.Wait(100)
        end
        TaskPlayAnim(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, 3.0, -1, 1, 1, 0, 0, 0)
    end
    if lib.skillCheck({
        { areaSize = math.random(20, 50), speedMultiplier = (math.random(10, 20)/10) },
        { areaSize = math.random(20, 50), speedMultiplier = (math.random(10, 20)/10) },
        { areaSize = math.random(20, 50), speedMultiplier = (math.random(10, 20)/10) }
    },{
        tostring(math.random(1, 3)),
        tostring(math.random(1, 3)),
        tostring(math.random(1, 3))
    }) then
        if InVehicle then
            SetVehicleEngineOn(vehicle, true, false, true)
            SetVehicleJetEngineOn(vehicle, true)
            ESX.ShowNotification("Udało Ci się uruchomić silnik pojazdu!")
        elseif not InVehicle then
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            ESX.ShowNotification("Udało Ci się otworzyć pojazd!")
        end
    end

    if not InVehicle then
        StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
    end
    TriggerServerEvent("goat_carkeys:LockPickUsed", data)
end)