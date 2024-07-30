local vehicle = GetVehiclePedIsIn(ESX.PlayerData.ped)

lib.onCache("vehicle", function(value)
    vehicle = value
end)

local SirenControlShowed = false
RegisterCommand("policecodechange", function()
    if not vehicle or GetVehicleClass(vehicle) ~= 18 or GetPedInVehicleSeat(vehicle, -1) ~= ESX.PlayerData.ped then
        return
    end

    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)

    if not IsVehicleSirenOn(vehicle) then
        SetVehicleSiren(vehicle, true)
    elseif IsVehicleSirenOn(vehicle) and Entity(vehicle).state.lxsound == nil then
        Entity(vehicle).state:set("lxsound", 1, true)
        Entity(vehicle).state:set("lxsoundid", GetSoundId(), true)
        PlaySoundFromEntity(Entity(vehicle).state.lxsoundid, "VEHICLES_HORNS_SIREN_1", vehicle, 0, true, 0)
    else
        SetVehicleSiren(vehicle, false)
        StopSound(Entity(vehicle).state.lxsoundid)
        ReleaseSoundId(Entity(vehicle).state.lxsoundid)

        Entity(vehicle).state:set("lxsound", nil, true)
        Entity(vehicle).state:set("lxsoundid", nil, true)

        if Entity(vehicle).state.auxid ~= nil then
            StopSound(Entity(vehicle).state.auxid)
            ReleaseSoundId(Entity(vehicle).state.auxid)
            Entity(vehicle).state:set("auxid", nil, true)
        end
    end
end)
RegisterKeyMapping("policecodechange", "Zmiana trybu sygnałów", "keyboard", "Q")

RegisterCommand("+policesoundchange", function()
    if not vehicle or GetVehicleClass(vehicle) ~= 18 or GetPedInVehicleSeat(vehicle, -1) ~= ESX.PlayerData.ped then
        return
    end

    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)

    if Entity(vehicle).state.lxsound == nil and Entity(vehicle).state.manualid == nil then
        local xd = GetSoundId()
        Entity(vehicle).state:set("manualid", GetSoundId(), true)
        PlaySoundFromEntity(Entity(vehicle).state.manualid, "VEHICLES_HORNS_SIREN_1", vehicle, 0, true, 0)
        return
    end

    local num = Entity(vehicle).state.lxsound + 1
    Entity(vehicle).state:set("lxsound", (num > 3 and 1 or num), true)

    num = Entity(vehicle).state.lxsound
    if num == 1 then
        StopSound(Entity(vehicle).state.lxsoundid)
        ReleaseSoundId(Entity(vehicle).state.lxsoundid)
        Entity(vehicle).state:set("lxsoundid", GetSoundId(), true)
        PlaySoundFromEntity(Entity(vehicle).state.lxsoundid, "VEHICLES_HORNS_SIREN_1", vehicle, 0, true, 0)
    elseif num == 2 then
        StopSound(Entity(vehicle).state.lxsoundid)
        ReleaseSoundId(Entity(vehicle).state.lxsoundid)
        Entity(vehicle).state:set("lxsoundid", GetSoundId(), true)
        PlaySoundFromEntity(Entity(vehicle).state.lxsoundid, "VEHICLES_HORNS_SIREN_2", vehicle, 0, true, 0)
    elseif num == 3 then
        StopSound(Entity(vehicle).state.lxsoundid)
        ReleaseSoundId(Entity(vehicle).state.lxsoundid)
        Entity(vehicle).state:set("lxsoundid", GetSoundId(), true)
        PlaySoundFromEntity(Entity(vehicle).state.lxsoundid, "VEHICLES_HORNS_POLICE_WARNING", vehicle, 0, true, 0)
    end
end)
RegisterCommand("-policesoundchange", function()
    if not vehicle or GetVehicleClass(vehicle) ~= 18 or GetPedInVehicleSeat(vehicle, -1) ~= ESX.PlayerData.ped then
        return
    end
    if Entity(vehicle).state.manualid == nil then
        return
    end

    StopSound(Entity(vehicle).state.manualid)
    ReleaseSoundId(Entity(vehicle).state.manualid)
    Entity(vehicle).state:set("manualid", nil, true)
end)
RegisterKeyMapping("+policesoundchange", "Przełącz sygnały dźwiękowe / Manual", "keyboard", "R")

RegisterCommand("auxonoff", function()
    if not vehicle or GetVehicleClass(vehicle) ~= 18 or GetPedInVehicleSeat(vehicle, -1) ~= ESX.PlayerData.ped or Entity(vehicle).state.lxsound == nil then
        return
    end

    PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)

    if Entity(vehicle).state.auxid == nil then
        local xd = GetSoundId()
        Entity(vehicle).state:set("auxid", GetSoundId(), true)
        PlaySoundFromEntity(Entity(vehicle).state.auxid, "VEHICLES_HORNS_SIREN_1", vehicle, 0, true, 0)
        return
    end
    
    StopSound(Entity(vehicle).state.auxid)
    ReleaseSoundId(Entity(vehicle).state.auxid)
    Entity(vehicle).state:set("auxid", nil, true)
end)
RegisterKeyMapping("auxonoff", "AUX", "keyboard", "LCONTROL")

CreateThread(function()
    while true do
        if vehicle and GetVehicleClass(vehicle) == 18 then
            SendNUIMessage({
                action = "sirenControlHorn",
                state = (Entity(vehicle).state.horn ~= nil and 1 or 0)
            })

            if Entity(vehicle).state.lxsound ~= nil and IsVehicleSirenOn(vehicle) then
                SendNUIMessage({
                    action = "sirenControlCode",
                    state = 3
                })

                SendNUIMessage({
                    action = "sirenControlSiren1",
                    state = Entity(vehicle).state.lxsound
                })
            elseif IsVehicleSirenOn(vehicle) then
                SendNUIMessage({
                    action = "sirenControlCode",
                    state = 2
                })
                SendNUIMessage({
                    action = "sirenControlSiren1",
                    state = 0
                })
            else
                SendNUIMessage({
                    action = "sirenControlCode",
                    state = 1
                })
                SendNUIMessage({
                    action = "sirenControlSiren1",
                    state = 0
                })
            end

            SendNUIMessage({
                action = "sirenControlAux",
                state = (Entity(vehicle).state.auxid ~= nil and 1 or 0)
            })

            SendNUIMessage({
                action = "sirenControlManual",
                state = (Entity(vehicle).state.manualid ~= nil and 1 or 0)
            })

            if not SirenControlShowed then
                SendNUIMessage({
                    action = "toggleSirenControl",
                    state = 1
                })
                SirenControlShowed = true
            end
        elseif SirenControlShowed then
            SendNUIMessage({
                action = "toggleSirenControl",
                state = 0
            })
            SirenControlShowed = false
        end
        Wait(200)
    end
end)

CreateThread(function()
    while true do
        if GetVehicleClass(vehicle) == 18 and vehicle and GetPedInVehicleSeat(vehicle, -1) == ESX.PlayerData.ped then
            SetVehRadioStation(vehicle, "OFF")
            SetVehicleRadioEnabled(vehicle, false)
            SetVehicleHasMutedSirens(vehicle, true)

            DisableControlAction(0, 80, true)
            DisableControlAction(0, 85, true)
            DisableControlAction(0, 86, true)
            if IsDisabledControlJustPressed(0, 86) then
                if Entity(vehicle).state.horn == nil then
                    local xd = GetSoundId()
                    Entity(vehicle).state:set("horn", GetSoundId(), true)
                    PlaySoundFromEntity(Entity(vehicle).state.horn, "SIRENS_AIRHORN", vehicle, 0, true, 0)
                end
            elseif IsDisabledControlJustReleased(0, 86) then
                if Entity(vehicle).state.horn ~= nil then
                    StopSound(Entity(vehicle).state.horn)
                    ReleaseSoundId(Entity(vehicle).state.horn)

                    Entity(vehicle).state:set("horn", nil, true)
                end
            end
        else
            Wait(200)
        end
        Wait(0)
    end
end)