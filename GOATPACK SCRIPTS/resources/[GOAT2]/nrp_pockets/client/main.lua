local hasWeapon = false
local cooldown = false

lib.onCache('weapon', function(value)
    if value then
        hasWeapon = true
        Citizen.CreateThread(function()
            while hasWeapon do
                Wait(100)
                if not cooldown then
                    local closestPed, closestDist = ESX.Game.GetClosestPed()
                    if IsPlayerFreeAimingAtEntity(PlayerId(), closestPed) and CheckPed(closestPed) and closestDist <= 10 then
                        if GlobalState.robbedPeds[closestPed] then
                            ESX.ShowNotification('Ten przechodzień już został okradziony')
                        else
                            cooldown = true
                            Citizen.SetTimeout(30000, function()
                                cooldown = false
                            end)
                            ESX.TriggerServerCallback('goat_pockets:CheckPolice', function(enoughPolice)
                                if enoughPolice then
                                    local random = math.random(1, 4)
                                    TriggerServerEvent('goat_pockets:addPed', closestPed)
                                    if random <= 3 then
                                        SetBlockingOfNonTemporaryEvents(closestPed, true)
                                        FreezeEntityPosition(closestPed, true)
                                        ClearPedTasks(closestPed)
                                        TaskTurnPedToFaceEntity(closestPed, cache.ped, -1)
                                        playAnim(closestPed, "random@mugging3", "handsup_standing_base", -1, true)
                                        Wait(2000)
                                        TriggerServerEvent('goat_pockets:PoliceNotify')
                                        local success = StartGame()
                                        if success and success > 0 then
                                            ESX.TriggerServerCallback('goat_pockets:Reward', function(rewarded)
                                                if rewarded then
                                                    FreezeEntityPosition(closestPed, false)
                                                    Wait(100)
                                                    StopAnimTask(closestPed, "random@mugging3", "handsup_standing_base", 10.0)
                                                    Wait(100)
                                                    TaskSmartFleePed(closestPed, cache.ped, 1000.0, -1, true, true)
                                                end
                                            end, success)
                                        else
                                            FreezeEntityPosition(closestPed, false)
                                            Wait(100)
                                            StopAnimTask(closestPed, "random@mugging3", "handsup_standing_base", 10.0)
                                            Wait(100)
                                            TaskSmartFleePed(closestPed, cache.ped, 1000.0, -1, true, true)
                                        end
                                    else
                                        TaskSmartFleePed(closestPed, cache.ped, 1000.0, -1, true, true)
                                    end
                                end
                            end)
                        end
                    end
                end
            end
        end)
    else
        hasWeapon = false
    end
end)

RegisterNetEvent('goat_pockets:PoliceNotify', function(data)
    exports["goat_notifications"]:policeNotify({
        playerId = data.playerId,
        coords = data.coords,
        textColor = "#fff",
        bgColor = "#06a5ff",
        title1 = "10-90",
        title2 = "Zgłoszenie",
        blip = {
            name = "Kradzież w toku",
            sprite = 161,
            scale = 2.0,
            colour = 3,
            timeToDelete = 15000
        },
        sound = {
            file = "POLICERobbery",
            volume = 0.3
        },
        content = {
            {
                type = "location",
                text = GetStreetNameFromHashKey(GetStreetNameAtCoord(data.coords.x, data.coords.y, data.coords.z))
            },
            {
                type = "msg",
                text = "Kradzież w toku! Godzina zgłoszenia: " .. data.hour
            }
        }
    })
end)

function CheckPed(ped)
    if GetPedType(ped) == 28 or IsPedFleeing(ped) or IsPedAPlayer(ped) or IsPedInAnyVehicle(ped, false) or IsPedDeadOrDying(ped, 1) then
        return false
    end

    if IsPedInCombat(ped, playerPed) or IsEntityAMissionEntity(ped) or IsPedRunningRagdollTask(ped) then
        return false
    end

    return true
end

function playAnim(ped, animDict, animName, duration, emoteMoving, playbackRate)
	local movingType = 49
	if (emoteMoving == false) then 
		movingType = 0
	end
    
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
        Citizen.Wait(100) 
    end

	TaskPlayAnim(ped, animDict, animName, 2.0, 2.0, duration, movingType, playbackRate or 0, false, false, false)
    RemoveAnimDict(animDict)
end