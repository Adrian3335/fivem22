ESX = nil
ESX = exports.es_extended:getSharedObject()
local timer = 0
local setInVehicle = false



local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)


--[[local function drawTxt(text,x,y,scale,r,g,b,a)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, scale)
    SetTextColour(r,g,b,a)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end]]


RegisterNetEvent("esx:setJob", function(PlayerJob)
    PlayerData.job.name = PlayerJob.name
    PlayerData.job.grade = PlayerJob.grade
end)

CreateThread(function()
    while true do
        Wait(1)
        if LocalPlayer.state.xrs_PlayerIsCuffed then
            DisableAllControlActions(0)
            EnableControlAction(0,0,true)
            EnableControlAction(0,1,true)
            EnableControlAction(0,2,true)
            EnableControlAction(0, 30, true) -- w
			EnableControlAction(0, 31, true) -- s
            EnableControlAction(0, 32, true) -- w
			EnableControlAction(0, 33, true) -- s
            EnableControlAction(0, 32, true) -- w
			EnableControlAction(0, 33, true) -- s
			EnableControlAction(0, 34, true) -- a
			EnableControlAction(0, 35, true) -- d
			EnableControlAction(0, 36, true) --ctrl
			EnableControlAction(0, 38, true) -- E
            EnableControlAction(0, 21, true) -- sprint
			EnableControlAction(0, 61, true) -- shift
            EnableControlAction(0, 245, true) -- CHAT
            if not IsEntityPlayingAnim(PlayerPedId(), "mp_arresting", "idle", 3) and not setInVehicle then
                TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
            end
        else
            Wait(500)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1)
        if LocalPlayer.state.xrs_PlayerDraggingSomeone then
          -- drawTxt("Wciśnij [E] aby puścić osobe",0.50,0.80,0.4,255,255,255,180)
            if IsControlJustPressed(0,38) then
                local attachedPed, dist = ESX.Game.GetClosestPlayer(GetEntityCoords(PlayerPedId()))
                attachedPed = GetPlayerPed(attachedPed)
                if attachedPed ~= 0 then
                    DetachEntity(attachedPed, true, true)
                    TriggerServerEvent("xrs_handcuff:unDragPlayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(attachedPed)))
                else
                    TriggerServerEvent("xrs_handcuff:unDragPlayer")
                end
            end
        else
            Wait(500)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        if timer > 0 then
            timer = timer - 1
        end
        if timer == 1 then
            ESX.ShowNotification("Lina się rozluźniła")
            TriggerEvent("xrs_handcuff:uncuffMe")
        end
    end
end)

exports['qtarget']:Player({
    options = {
        {
            icon = "fa-solid fa-handcuffs",
            label = "Zakuj (Lina)",
            item = "rope",
            action = function(entity)
                local playerPed = PlayerPedId()
                local isDead = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_isDead
                if (IsEntityPlayingAnim(entity, "random@mugging3", "handsup_standing_base", 3) or isDead) or (ESX.PlayerData.job.name == "police") then
                    if not Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerIsCuffed and 
                    not Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsCuffed then
                        TriggerServerEvent("xrs_handcuff:cuffPlayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)))
                    end
                else
                    ESX.ShowNotification('Osoba musi podnieść ręce!')
                end
            end,
            canInteract = function(entity)
                if IsPedAPlayer(entity) then
                    local isDead = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_isDead
                    if not Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerIsCuffed and 
                    not Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsCuffed or isDead or ESX.PlayerData.job.name == "police" then
                        return true
                    else
                        return false
                    end
                end
            end
        },
        {
            icon = "fa-solid fa-handcuffs",
            label = "Odkuj (Lina)",
            item = "rope",
            action = function(entity)
                local playerPed = PlayerPedId()
                local isDead = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_isDead
                if IsEntityPlayingAnim(entity, "mp_arresting", "idle", 3) or isDead then
                    local playerheading = GetEntityHeading(playerPed)
                    local playerlocation = GetEntityForwardVector(playerPed)
                    local coords = GetEntityCoords(playerPed)
                    TriggerServerEvent("xrs_handcuff:uncuffPlayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)), playerheading, coords, playerlocation)
                else
                    ESX.ShowNotification("Ten gracz nie jest zakuty")
                end
            end,
            canInteract = function(entity)
                if IsPedAPlayer(entity) then
                    local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    local isDead = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_isDead
                    if Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerIsCuffed or isDead then
                        return false
                    end
                    if Player(target).state.xrs_PlayerIsCuffed then
                        return true
                    else
                        return false
                    end
                end
            end
        },
        {
            icon = "fa-solid fa-handcuffs",
            label = "Zakuj",
            item = "handcuffs",
            action = function(entity)
                local playerPed = PlayerPedId()
                local isDead = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_isDead
                if (IsEntityPlayingAnim(entity, "random@mugging3", "handsup_standing_base", 3) or isDead) or (ESX.PlayerData.job.name == "police") then
                    if ESX.PlayerData.job.name == "police" then
                        local playerheading = GetEntityHeading(playerPed)
                        local playerlocation = GetEntityForwardVector(playerPed)
                        local coords = GetEntityCoords(playerPed)
                        TriggerServerEvent("xrs_handcuff:cuffPlayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)), playerheading, coords, playerlocation)
                    else
                        TriggerServerEvent("xrs_handcuff:cuffPlayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)))
                    end
                else
                    ESX.ShowNotification('Osoba musi podnieść ręce!')
                end
            end,
            canInteract = function(entity)
                if IsPedAPlayer(entity) then
                    local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    local isDead = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_isDead
                    if Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerIsCuffed then
                        return false
                    end
                    if not Player(target).state.xrs_PlayerIsCuffed then
                        return true
                    else
                        return false
                    end
                end
            end
        },
        {
            icon = "fa-solid fa-handcuffs",
            label = "Odkuj",
            item = "handcuffs",
            action = function(entity)
                local playerPed = PlayerPedId()
                if IsEntityPlayingAnim(entity, "mp_arresting", "idle", 3) or not IsPlayerDead(NetworkGetPlayerIndexFromPed(entity)) then
                    local playerheading = GetEntityHeading(playerPed)
                    local playerlocation = GetEntityForwardVector(playerPed)
                    local coords = GetEntityCoords(playerPed)
                    TriggerServerEvent("xrs_handcuff:uncuffPlayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)), playerheading, coords, playerlocation)
                else
                    ESX.ShowNotification("Ten gracz nie jest zakuty")
                end
            end,
            canInteract = function(entity)
                if IsPedAPlayer(entity) then
                    local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    if Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerIsCuffed then
                        return false
                    end
                    if Player(target).state.xrs_PlayerIsCuffed then
                        return true
                    else
                        return false
                    end
                end
            end
        },
        {
            icon = "fa-solid fa-handcuffs",
            label = "Przeszukaj",
            item = "handcuffs",
            action = function(entity)
                local playerPed = PlayerPedId()
                local target = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsCuffed
                if target or ESX.PlayerData.job.name == "police" then
                    TriggerServerEvent("xrs_handcuff:searchInventory", GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)))
                else
                    ESX.ShowNotification("Możesz przeszukać gracza tylko gdy ma podniesione ręce lub ma bw")
                end
            end,
            canInteract = function(entity)
                if IsPedAPlayer(entity) then
                    if Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerIsCuffed then
                        return false
                    end
                    local target = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsCuffed
                    if target or ESX.PlayerData.job.name == "police" then
                        return true
                    else
                        return false
                    end
                end
            end
        },
        {
            icon = "fa-solid fa-handcuffs",
            label = "Przenieś",
            item = "handcuffs",
            action = function(entity)
                local playerPed = PlayerPedId()
                local entityIsDragged = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsDragged
                local entityDraggingSomeone = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerDraggingSomeone
                local playerDraggingSomeone = LocalPlayer.state.xrs_PlayerDraggingSomeone
                if (not entityIsDragged and not entityDraggingSomeone and not playerDraggingSomeone) then
                    ESX.ShowNotification("Wciśnij [E] aby puścić osobe")
                    TriggerServerEvent("xrs_handcuff:dragPlayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)))
                else
                    ESX.ShowNotification("Nie możesz przenieść gracza!")
                end
            end,
            canInteract = function(entity)
                if IsPedAPlayer(entity) then
                    local entityIsDragged = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsDragged
                    local entityDraggingSomeone = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerDraggingSomeone
                    local playerDraggingSomeone = LocalPlayer.state.xrs_PlayerDraggingSomeone
                    if (not entityIsDragged and not entityDraggingSomeone and not playerDraggingSomeone) then
                        return true
                    else
                        return false
                    end
                end
            end
        },
        {
            icon = "fa-solid fa-handcuffs",
            label = "Puść",
            action = function(entity)
                local playerPed = PlayerPedId()
                if ESX.PlayerData.job.name == "police" then
                    TriggerServerEvent("xrs_handcuff:unDragPlayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)))
                else
                    ESX.ShowNotification("Nie możesz puścić gracza!")
                end
            end,
            canInteract = function(entity)
                if IsPedAPlayer(entity) then
                    local target = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsDragged
                    local playerState = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerDraggingSomeone
                    if target and playerState then
                        return true
                    else
                        return false
                    end
                end
            end
        },
        {
            icon = "fa-solid fa-handcuffs",
            label = "Rozkuj (Wytrych)",
            item = "lockpick",
            action = function(entity)
                local playerPed = PlayerPedId()
                local target = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsDragged
                local isCuffed = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsCuffed
                local playerState = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerDraggingSomeone
                local isCuffed2 = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerIsCuffed
                if not playerState and not target and isCuffed and not isCuffed2 then
                    if exports['fc-hud']:startQte({speed = 25, difficulty = 3, rounds = 2}) then
                        local playerheading = GetEntityHeading(playerPed)
                        local playerlocation = GetEntityForwardVector(playerPed)
                        local coords = GetEntityCoords(playerPed)
                        TriggerServerEvent("xrs_handcuff:uncuffPlayer", GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)), playerheading, coords, playerlocation)
                    else
                        local rng = math.random(1,3)
                        if rng == 2 then
                            TriggerServerEvent("xrs_handcuff:lockpickDelete")
                        end
                    end
                else
                    ESX.ShowNotification("Nie możesz puścić gracza!")
                end
            end,
            canInteract = function(entity)
                if IsPedAPlayer(entity) then
                    local target = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsDragged
                    local isCuffed = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsCuffed
                    local playerState = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerDraggingSomeone
                    local isCuffed2 = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerIsCuffed
                    if not playerState and not target and isCuffed and not isCuffed2 then
                        return true
                    else
                        return false
                    end
                end
            end
        },
        {
            icon = "fa-solid fa-handcuffs",
            label = "Wsadź do pojazdu",
            action = function(entity)
                local playerPed = PlayerPedId()
                local target = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsDragged
                local playerState = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerDraggingSomeone
                local cuffed = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsCuffed
                local isDead = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_isDead

                if (cuffed or isDead) and not target and not playerState then
                    local vehicle, distance = ESX.Game.GetClosestVehicle(GetEntityCoords(PlayerPedId()))

                    if GetVehicleDoorLockStatus(vehicle) == 4 then
                        ESX.ShowNotification("Ten pojazd jest zamknięty!")
                        return
                    end

                    if not DoesEntityExist(vehicle) then
                        ESX.ShowNotification("Nie ma pojazdu żadnego")
                        return
                    end

                    if distance > 6.0 then
                        ESX.ShowNotification("Pojazd jest za daleko")
                        return
                    end

                    if not AreAnyVehicleSeatsFree(vehicle) then
                        ESX.ShowNotification("W tym pojeździe nie ma miejsca")
                        return
                    end

                    local seats = GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) -- 4 sedan// 2 normalnie
                    
                    if seats == 4 then
                        for i = 1,2 do
                            if IsVehicleSeatFree(vehicle,i) then
                                TriggerServerEvent("xrs_handcuff:setPedIntoVehicle",GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)),tostring(vehicle),i)
                                return
                            end
                        end
                    else
                        if IsVehicleSeatFree(vehicle,0) then
                            TriggerServerEvent("xrs_handcuff:setPedIntoVehicle",GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity)),tostring(vehicle),0)
                            return
                        end
                    end
                else
                    ESX.ShowNotification("Nie możesz wsadzić gracza do pojazdu")
                end
            end,
            canInteract = function(entity)
                if IsPedAPlayer(entity) then
                    local target = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsDragged
                    local playerState = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))).state.xrs_PlayerDraggingSomeone
                    local cuffed = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.xrs_PlayerIsCuffed
                    if not target and not playerState and cuffed then
                        return true
                    else
                        return false
                    end
                end
            end
        },
    },
    distance = 4.0
})

exports['qtarget']:Vehicle({
    options = {
        {
            icon = "fa-solid fa-handcuffs",
            label = "Wyciągnij z pojazdu",
            action = function(vehicle)
                local getPed = 0
                if (GetVehicleDoorLockStatus(vehicle) == 4) then
                    return
                end
                local seats = GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) -- 4 sedan// 2 normalnie
                for i = -1,seats do
                    local ped = GetPedInVehicleSeat(vehicle,i)
                    if ped ~= 0 then
                        if IsPedAPlayer(ped) then
                            local target = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped))).state.xrs_PlayerIsCuffed
                            if target then
                                TriggerServerEvent("xrs_handcuff:getPedFromVehicle", GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)))
                                return
                            end
                        end
                    end
                end
            end,
            canInteract = function(vehicle)
                if DoesEntityExist(vehicle) then
                    if (GetVehicleDoorLockStatus(vehicle) == 4) then
                        return false
                    end
                    local seats = GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) -- 4 sedan// 2 normalnie
                    for i = -1,seats do
                        local ped = GetPedInVehicleSeat(vehicle,i)
                        if ped ~= 0 then
                            if IsPedAPlayer(ped) then
                                local target = Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped))).state.xrs_PlayerIsCuffed
                                if target then
                                    return true
                                end
                            end
                        end
                    end
                    return false
                end
            end
        }
    }
})

local function loadAnimationDictonary(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
	end
end

RegisterNetEvent("xrs_handcuff:cuffMe", function(playerheading, playercoords, playerlocation, rope)
    local playerPed = PlayerPedId()

    if playerheading then
        local x,y,z = table.unpack(playercoords + playerlocation * 1.0)
        SetEntityCoords(playerPed, x, y, z)
        SetEntityHeading(playerPed, playerheading)
        Citizen.Wait(250)
        loadAnimationDictonary('mp_arrest_paired')
        TaskPlayAnim(playerPed, 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
        Citizen.Wait(3360)
        loadAnimationDictonary('mp_arresting')
        TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)

        loadAnimationDictonary('mp_arresting')

        if not IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) then
            TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 0.0, 0, 0, 0)
        end
        
        ESX.UI.Menu.CloseAll()

        SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
        DisablePlayerFiring(playerPed, true)
        SetEnableHandcuffs(playerPed, true)
        SetPedCanPlayGestureAnims(playerPed, false)
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "Cuff", 0.5)
    else
        loadAnimationDictonary('mp_arresting')
        if not IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) then
            TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 0.0, 0, 0, 0)
        end
        ESX.UI.Menu.CloseAll()
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "Cuff", 0.5)
        SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
        DisablePlayerFiring(playerPed, true)
        SetEnableHandcuffs(playerPed, true)
        SetPedCanPlayGestureAnims(playerPed, false)
    end
    if exports["mycity_radialmenu"]:closeRadial(true) then
        exports["mycity_radialmenu"]:closeRadial(false)
    end
    if rope then
        timer = 900
    end
end)

RegisterNetEvent("xrs_handcuff:cuffHim", function(fastCuff)
    local playerPed = PlayerPedId()

    if fastCuff then
        Wait(250)
        loadAnimationDictonary('mp_arrest_paired')
	    TaskPlayAnim(playerPed, 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
    else
        local animationDictonary = "mp_arresting"
        local animationString = "a_uncuff"
        if (DoesEntityExist(playerPed) and not IsEntityDead(playerPed)) then
            loadAnimationDictonary(animationDictonary)
            if (IsEntityPlayingAnim(playerPed, animationDictonary, animationString, 8)) then
                TaskPlayAnim(playerPed, animationDictonary, "exit", 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
            else
                TaskPlayAnim(playerPed, animationDictonary, animationString, 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
            end
        end
    end
end)

RegisterNetEvent("xrs_handcuff:uncuffMe", function(playerheading, playercoords, playerlocation)
    local playerPed = PlayerPedId()
    if not playerheading then
        ClearPedTasks(playerPed)
        ClearPedTasksImmediately(playerPed)
        SetEnableHandcuffs(playerPed, false)
        DisablePlayerFiring(playerPed, false)
        SetPedCanPlayGestureAnims(playerPed, true)
        FreezeEntityPosition(playerPed, false)
        timer = 0
    else
        local x,y,z = table.unpack(playercoords + playerlocation * 1.0)
        SetEntityCoords(playerPed, x, y, z)
        SetEntityHeading(playerPed, playerheading)
        loadAnimationDictonary('mp_arresting')
        Citizen.Wait(250)
        TaskPlayAnim(playerPed, 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
        Citizen.Wait(2500)
        ClearPedTasks(playerPed)
        ClearPedTasksImmediately(playerPed)
        SetEnableHandcuffs(playerPed, false)
        DisablePlayerFiring(playerPed, false)
        SetPedCanPlayGestureAnims(playerPed, true)
        FreezeEntityPosition(playerPed, false)
        timer = 0
    end
end)

RegisterNetEvent("xrs_handcuff:uncuffMeAfterRevive", function()
    local playerPed = PlayerPedId()
    ClearPedTasks(playerPed)
    ClearPedTasksImmediately(playerPed)
    SetEnableHandcuffs(playerPed, false)
    DisablePlayerFiring(playerPed, false)
    SetPedCanPlayGestureAnims(playerPed, true)
    FreezeEntityPosition(playerPed, false)
    TriggerServerEvent("xrs_handcuff:uncuffed")
end)

RegisterNetEvent("xrs_handcuff:uncuffHim", function()
    local ped = PlayerPedId()
    loadAnimationDictonary('mp_arresting')
    Wait(250)
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "Uncuff", 0.5)
	TaskPlayAnim(ped, 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Wait(2500)
	ClearPedTasks(ped)
end)

RegisterNetEvent("xrs_handcuff:dragMe", function(cop)
    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, true)
    AttachEntityToEntity(playerPed, GetPlayerPed(GetPlayerFromServerId(cop)), 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
end)

RegisterNetEvent("xrs_handcuff:unDrag", function()
    local playerPed = PlayerPedId()
    DetachEntity(playerPed, true, false)
    FreezeEntityPosition(playerPed, false)
end)

RegisterNetEvent("xrs_handcuff:setMeInVehicle", function(vehicle,seatIndex)
    local ped = PlayerPedId()
    local vehicle, distance = ESX.Game.GetClosestVehicle(GetEntityCoords(ped))
    if not DoesEntityExist(tonumber(vehicle)) then
        return
    end
    if distance > 10.0 then
        return
    end
    setInVehicle = true
    ClearPedTasksImmediately(ped)
    ClearPedTasksImmediately(ped)
    ClearPedTasksImmediately(ped)
    Wait(150)
    TaskEnterVehicle(ped,tonumber(vehicle),0,seatIndex,100,16,0)
    TaskWarpPedIntoVehicle(ped,tonumber(vehicle),seatIndex)
    Wait(500)
    setInVehicle = false
end)

RegisterNetEvent("xrs_handcuff:leaveVehicle", function()
    local playerPed = PlayerPedId()
    if IsPedSittingInAnyVehicle(playerPed) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        TaskLeaveVehicle(playerPed, vehicle, 16)
        ClearPedTasksImmediately(playerPed)
    end
end)

RegisterNetEvent("xrs_handcuff:getInventory", function(target)
    exports["ox_inventory"]:openInventory("player", target)
end)

AddEventHandler("xrs_handcuff:closeInventoryHook", function()
    local source = GetPlayerServerId(NetworkGetPlayerIndexFromPed(PlayerPedId()))
    if not Player(source).state.xrs_IsPlayerSearchingInventory then
        return
    end
    if Player(source).state.xrs_IsPlayerSearchingInventory ~= 0 then
        TriggerServerEvent("xrs_handcuff:closeInventory")
    end
end)