local Config = {}
local ClosestDoor = nil
CreateThread(function()
    ESX.TriggerServerCallback("frp_doorlock:getConfig", function(cfg)
        Config.Doors = cfg

        for i = 1, #(Config.Doors) do
            local doorsCfg = Config.Doors[i]
            for j = 1, #(doorsCfg.objects) do
                local doorCfg = doorsCfg.objects[j]
                AddDoorToSystem(doorCfg.hash, (type(doorCfg.object) == "number" and doorCfg.object or GetHashKey(doorCfg.object)), doorCfg.coords[1], doorCfg.coords[2], doorCfg.coords[3], false, false, false)
                DoorSystemSetDoorState(doorCfg.hash, doorsCfg.locked, false, false)
                DoorSystemSetAutomaticRate(doorCfg.hash, (doorsCfg.rate or 10.0), false, false)
            end
        end
    end)
end)

CreateThread(function()
    while not ESX.PlayerData or not ESX.PlayerData.job do
        Wait(0)
    end
    while not Config.Doors do
        Wait(0)
    end
    while true do
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        ClosestDoor = nil
        for i = 1, #(Config.Doors) do
            local doorsCfg = Config.Doors[i]

            local authorizedJob = false
            if doorsCfg.jobs and #doorsCfg.jobs > 0 then
                for d = 1, #(doorsCfg.jobs) do
                    if ESX.PlayerData.job.name == doorsCfg.jobs[d] then
                        authorizedJob = true
                        break
                    end
                end
            else
                authorizedJob = true
            end

            -- local org = exports['goat_organisation']:GetOrg()
            -- print(org.name)
            -- if doorsCfg.orgs and #doorsCfg.orgs > 0 then
            --     for d = 1, #(doorsCfg.orgs) do
            --         if org.name == doorsCfg.orgs[d] then
            --             authorizedJob = true
            --             break
            --         end
            --     end
            -- else
            --     authorizedJob = true
            -- end

            for j = 1, #(doorsCfg.objects) do
                local doorCfg = doorsCfg.objects[j]
                local distance1 = #(vec3(doorCfg.coords[1], doorCfg.coords[2], doorCfg.coords[3]) - coords)
                if distance1 < doorsCfg.distance then
                    if ClosestDoor then
                        local doorsCfg2 = Config.Doors[ClosestDoor.number]
                        local doorCfg2 = doorsCfg2.objects[ClosestDoor.door]
                        local distance2 = #(vec3(doorCfg2.coords[1], doorCfg2.coords[2], doorCfg2.coords[3]) - coords)
                        if distance1 < distance2 then
                            ClosestDoor = {number = i, door = j, canInteract = authorizedJob}
                        end
                    else
                        ClosestDoor = {number = i, door = j, canInteract = authorizedJob}
                    end
                    break
                end
            end
        end
        Wait(250)
    end
end)

CreateThread(function()
    local lastLocked = nil
    local lastInteract = nil
    while true do
        if ClosestDoor then
            local locked = (Config.Doors[ClosestDoor.number].locked == 1 and true or false)
            local canInteract = ClosestDoor.canInteract
            if locked ~= lastLocked or canInteract ~= lastInteract then
                SendNUIMessage({
                    action = "show",
                    locked = locked,
                    canInteract = canInteract
                })
            end
            lastLocked = locked
            lastInteract = canInteract
            Wait(100)
        else
            if lastLocked ~= nil or lastInteract ~= nil then
                SendNUIMessage({
                    action = "hide",
                })
                lastLocked = nil
                lastInteract = nil
            end
            Wait(500)
        end
        Wait(0)
    end
end)

RegisterCommand("+toggleDoor", function()
    if ClosestDoor and ClosestDoor.canInteract then
        TriggerServerEvent("frp_doorlock:stateChange", ClosestDoor.number)
        local locked = Config.Doors[ClosestDoor.number].locked
        if locked == 0 then
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 6.0, 'unlockDoor', 0.2)
        else
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 6.0, 'lockDoor', 0.2)
        end
    end
end)
RegisterCommand("-toggleDoor", function() end)
RegisterKeyMapping("+toggleDoor", "Otwórz/Zamknij drzwi", "keyboard", "E")

RegisterNetEvent("frp_doorlock:stateChange", function(cfg, door)
    Config.Doors = cfg
    local doorsCfg = Config.Doors[door]
    for i = 1, #(doorsCfg.objects) do
        local doorCfg = doorsCfg.objects[i]
        DoorSystemSetDoorState(doorCfg.hash, doorsCfg.locked, false, false)
    end
end)