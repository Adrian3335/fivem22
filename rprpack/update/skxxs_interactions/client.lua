Citizen.CreateThread(function()
	LocalPlayer.state:set("Tied", false, true)
	LocalPlayer.state:set("IsHandcuffed", false, true)
	LocalPlayer.state:set("Dragging", false, true)
	LocalPlayer.state:set("IsDragged", false, true)

	RequestAnimDict("missfinale_c2mcs_1")
	while not HasAnimDictLoaded("missfinale_c2mcs_1") do
		Citizen.Wait(0)
	end

	RequestAnimDict("nm")
	while not HasAnimDictLoaded("nm") do
		Citizen.Wait(0)
	end

	RequestAnimDict("mp_arresting")
	while not HasAnimDictLoaded("mp_arresting") do
		Citizen.Wait(0)
	end

    RequestAnimDict("anim@gangops@facility@servers@bodysearch@")
	while not HasAnimDictLoaded("anim@gangops@facility@servers@bodysearch@") do
		Citizen.Wait(0)
	end

    -- KAJDANKI
    exports.qtarget:Player({
        options = {
            {
                action = function(data)
                    TaskPlayAnim(PlayerPedId(), "mp_arresting", "a_uncuff", 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
                    Citizen.Wait(700)
                    local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
                    TriggerServerEvent("xpack_interactions:cuff", id)
                end,
                canInteract = function(entity, distance, data)
                    local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    -- return not Player(id).state.IsHandcuffed

                    if not Player(id).state.IsHandcuffed or Player(id).state.IsDead then
                        if not CanCuff(entity) then
                            return false
                        else
                            return true
                        end
                    else
                        return false
                    end
                end,
                icon = "fas fa-handcuffs",
                label = "Zakuj",
                item = "handcuffs"
            },
            {
                action = function(data)
                    TaskPlayAnim(PlayerPedId(), "mp_arresting", "a_uncuff", 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
                    Citizen.Wait(700)
                    local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
                    TriggerServerEvent("xpack_interactions:uncuff", id)
                end,
                canInteract = function(entity, distance, data)
                    local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    return Player(id).state.IsHandcuffed
                end,
                icon = "fas fa-handcuffs",
                label = "Rozkuj",
                item = "handcuffs"
            },
        },
        distance = 2
    })
    -- LINA
    exports.qtarget:Player({
        options = {
            {
                action = function(data)
                    TaskPlayAnim(PlayerPedId(), "mp_arresting", "a_uncuff", 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
                    Citizen.Wait(700)
                    local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
                    TriggerServerEvent("xpack_interactions:bind", id)
                end,
                canInteract = function(entity, distance, data)
                    local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    --return not Player(id).state.Tied

                    if not Player(id).state.Tied or Player(id).state.IsDead then
                        if not CanCuff(entity) then
                            return false
                        else
                            return true
                        end
                    else
                        return false
                    end
                end,
                icon = "fas fa-indian-rupee-sign",
                label = "Zwiąż",
                item = "rope"
            },
            {
                action = function(data)
                    TaskPlayAnim(PlayerPedId(), "mp_arresting", "a_uncuff", 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
                    Citizen.Wait(700)
                    local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
                    TriggerServerEvent("xpack_interactions:solve", id)

                    if LocalPlayer.state.Dragging == id then
                        LocalPlayer.state:set("Dragging", false, true)
                        Wait(500)
                        ClearPedTasks(PlayerPedId())
                    end
                end,
                canInteract = function(entity, distance, data)
                    local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    return Player(id).state.Tied
                end,
                icon = "fas fa-indian-rupee-sign",
                label = "Rozwiąż"
            },
        },
        distance = 2
    })
    -- SHARED
    exports.qtarget:Player({
        options = {
            {
                action = function(data)
                    TriggerServerEvent("xpack_interactions:drag", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
                    LocalPlayer.state:set("Dragging", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)), true)
                    StartDraggingLoop()
                end,
                canInteract = function(entity, distance, data)
                    local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    local Can = false
                    if Player(id).state.IsHandcuffed or Player(id).state.Tied then
                        Can = true
                    end
                    return Can and not LocalPlayer.state.Dragging and not Player(id).state.IsDragged
                end,
                icon = "fas fa-hand-holding",
                label = "Podnieś"
            },
            {
                action = function(data)
                    TriggerServerEvent("xpack_interactions:drop", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
                    LocalPlayer.state:set("Dragging", false, true)
                    Wait(500)
                    ClearPedTasks(PlayerPedId())
                end,
                canInteract = function(entity, distance, data)
                    return LocalPlayer.state.Dragging == GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                end,
                icon = "fas fa-hand-holding",
                label = "Puść"
            },
            {
                action = function(data)
                    TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@", "player_search", 8.0, -8.0, -1, 49, 0, false, false, false)
                    exports["xpack_core"]:taskBar(2500, "Przeszukiwanie", false, true)
                     
                        exports.ox_inventory:openInventory("player", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
                end,
                canInteract = function(entity, distance, data)
                    return Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.Tied or Player(GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))).state.IsHandcuffed
                end,
                icon = "fas fa-magnifying-glass",
                label = "Przeszukaj"
            },
            {
                action = function(data)
                    TriggerServerEvent("xpack_interactions:putInVehicle", GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
                end,
                canInteract = function(entity, distance, data)
                    local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    local vehInD = false
                    local coords = GetEntityCoords(entity)

                    if IsAnyVehicleNearPoint(coords, 5.0) then
                        local vehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(entity))
                        if DoesEntityExist(vehicle) and #(coords - GetEntityCoords(vehicle)) <= 5.0 then
                            vehInD = true
                        end
                    end
                    if vehInD then
                        return Player(id).state.Tied or Player(id).state.IsHandcuffed
                    else
                        return false
                    end
                end,
                icon = "fas fa-car",
                label = "Wsadź do pojazdu"
            },
        },
        distance = 2
    })

    local DoorName = {
		[-1] = "Lewy Przód",
		[0] = "Prawy Przód",
		[1] = "Lewy Tył",
		[2] = "Prawy Tył",
		[3] = "Miejsce 5"
	}
	local VehicleOptions = {}
	for i=-1, 3, 1 do
		VehicleOptions[i] = {
			action = function(data)
				local ped = GetPedInVehicleSeat(data.entity, data.seat)
                local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped))
                TriggerServerEvent("xpack_interactions:outTheVehicle", id)
            end,
			canInteract = function(entity, distance, data)
				local ped = GetPedInVehicleSeat(entity, data.seat)
                local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped))
				return ped ~= 0 and Player(id).state.Tied or Player(id).state.IsHandcuffed
			end,
			icon = "fas fa-car",
			label = "Wyjmij z siedzenia (" .. (DoorName[i] or i) .. ")",
			seat = i
		}
	end

	exports.qtarget:Vehicle({
		options = VehicleOptions,
		distance = 2
	})
end)

RegisterNetEvent("xpack_interactions:cuff", function(target)
    if LocalPlayer.state.IsHandcuffed then
        return
    end

    TriggerEvent("skinchanger:getSkin", function(skin)
        ESX.ShowNotification((skin.sex == 0 and "Zostałeś" or "Zostałaś") .. " " .. (skin.sex == 0 and "zakuty" or "zakuta") .. " przez " .. target)
    end)

    local playerPed = PlayerPedId()
    if not IsEntityPlayingAnim(playerPed, "mp_arresting", "idle", 3) and not LocalPlayer.state.IsDragged then
        TaskPlayAnim(playerPed, "mp_arresting", "idle", 8.0, -8.0, -1, 49, 0.0, 0, 0, 0)
    end

    ESX.UI.Menu.CloseAll()

    SetPedPathCanUseLadders(playerPed, false)
    SetPedCanPlayGestureAnims(playerPed, false)
    SetEnableHandcuffs(playerPed, true)

    DisablePlayerFiring(PlayerId(), true)

    LocalPlayer.state:set("IsHandcuffed", true, true)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'Cuff', 0.40)
    Wait(500)

    StartCuffLoop("idle")
end)

RegisterNetEvent("xpack_interactions:bind", function(target)
    if LocalPlayer.state.Tied then
        return
    end

    TriggerEvent("skinchanger:getSkin", function(skin)
        ESX.ShowNotification((skin.sex == 0 and "Zostałeś" or "Zostałaś") .. " " .. (skin.sex == 0 and "związany" or "związana") .. " przez " .. target)
    end)

    local playerPed = PlayerPedId()
    if not IsEntityPlayingAnim(playerPed, "mp_arresting", "run", 3) and not LocalPlayer.state.IsDragged then
        TaskPlayAnim(playerPed, "mp_arresting", "run", 8.0, -8.0, -1, 49, 0.0, 0, 0, 0)
    end

    ESX.UI.Menu.CloseAll()

    SetPedPathCanUseLadders(playerPed, false)
    SetPedCanPlayGestureAnims(playerPed, false)
    SetEnableHandcuffs(playerPed, true)

    DisablePlayerFiring(PlayerId(), true)

    LocalPlayer.state:set("Tied", true, true)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'Cuff', 0.40)
    Wait(500)

    StartCuffLoop("run")
end)

RegisterNetEvent("xpack_interactions:uncuff", function(target)
    if not LocalPlayer.state.IsHandcuffed then
        return
    end

    TriggerEvent("skinchanger:getSkin", function(skin)
        ESX.ShowNotification((skin.sex == 0 and "Zostałeś" or "Zostałaś") .. " " .. (skin.sex == 0 and "rozkuty" or "rozkuta") .. " przez " .. target)
    end)

    local playerPed = PlayerPedId()
    SetPedCanPlayGestureAnims(playerPed, true)
    SetPedPathCanUseLadders(playerPed, true)
    SetEnableHandcuffs(playerPed, false)

    ClearPedTasks(playerPed)
    FreezeEntityPosition(playerPed, false)

    DisablePlayerFiring(PlayerId(), false)

    if LocalPlayer.state.IsDragged then
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed, true)
        RequestCollisionAtCoord(coords.x, coords.y, coords.z)
        DetachEntity(playerPed, true, false)
        FreezeEntityPosition(playerPed, false)

        if IsEntityPlayingAnim(playerPed, "nm", "firemans_carry", 3) and not IsPedInAnyVehicle(playerPed, false) then
            ClearPedTasksImmediately(playerPed)
        end
        LocalPlayer.state:set("IsDragged", false, true)
    end
    LocalPlayer.state:set("IsHandcuffed", false, true)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'uncuff', 0.40)
end)

RegisterNetEvent("xpack_interactions:solve", function(target)
    if not LocalPlayer.state.Tied then
        return
    end

    TriggerEvent("skinchanger:getSkin", function(skin)
        ESX.ShowNotification((skin.sex == 0 and "Zostałeś" or "Zostałaś") .. " " .. (skin.sex == 0 and "rozwiązany" or "rozwiązana") .. " przez " .. target)
    end)

    local playerPed = PlayerPedId()
    SetPedCanPlayGestureAnims(playerPed, true)
    SetPedPathCanUseLadders(playerPed, true)
    SetEnableHandcuffs(playerPed, false)

    ClearPedTasks(playerPed)
    FreezeEntityPosition(playerPed, false)

    DisablePlayerFiring(PlayerId(), false)
    
    if LocalPlayer.state.IsDragged then
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed, true)
        RequestCollisionAtCoord(coords.x, coords.y, coords.z)
        DetachEntity(playerPed, true, false)
        FreezeEntityPosition(playerPed, false)

        if IsEntityPlayingAnim(playerPed, "nm", "firemans_carry", 3) and not IsPedInAnyVehicle(playerPed, false) then
            ClearPedTasksImmediately(playerPed)
        end
        LocalPlayer.state:set("IsDragged", false, true)
    end
    LocalPlayer.state:set("Tied", false, true)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'uncuff', 0.40)
end)

RegisterNetEvent("xpack_interactions:drag", function(target)
    TriggerEvent("skinchanger:getSkin", function(skin)
        ESX.ShowNotification((skin.sex == 0 and "Zostałeś" or "Zostałaś") .. " " .. (skin.sex == 0 and "podniesiony" or "podniesiona") .. " przez " .. target)
    end)

    local playerPed = PlayerPedId()

    LocalPlayer.state:set("IsDragged", true, true)

    ClearPedTasksImmediately(playerPed)

    Wait(100)

    TaskPlayAnim(playerPed, "nm", "firemans_carry", 8.0, -8.0, 1.0, 2, 0, false, false, false)
    AttachEntityToEntity(playerPed, GetPlayerPed(GetPlayerFromServerId(target)), 0, 0.15, 0.27, 0.63, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

    Citizen.CreateThread(function()
        while LocalPlayer.state.IsDragged do
            local playerPed = PlayerPedId()
            if not IsPedInAnyVehicle(playerPed, false) then
                if not IsEntityPlayingAnim(playerPed, "nm", "firemans_carry", 3) then
                    TaskPlayAnim(playerPed, "nm", "firemans_carry", 8.0, -8.0, 1.0, 2, 0, false, false, false)
                end
            end
            BlockControls()
            Wait(0)
        end
    end)
end)

RegisterNetEvent("xpack_interactions:drop", function(target)
    if not LocalPlayer.state.IsDragged then
        return
    end

    TriggerEvent("skinchanger:getSkin", function(skin)
        ESX.ShowNotification((skin.sex == 0 and "Zostałeś" or "Zostałaś") .. " " .. (skin.sex == 0 and "puszczony" or "puszczona") .. " przez " .. target)
    end)

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed, true)

    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
    DetachEntity(playerPed, true, false)
    FreezeEntityPosition(playerPed, false)

    if IsEntityPlayingAnim(playerPed, "nm", "firemans_carry", 3) and not IsPedInAnyVehicle(playerPed, false) then
        ClearPedTasksImmediately(playerPed)
    end

    TaskPlayAnim(playerPed, "mp_arresting", "idle", 8.0, -8.0, -1, 49, 0.0, 0, 0, 0)

    LocalPlayer.state:set("IsDragged", false, true)
end)

RegisterNetEvent("xpack_interactions:putInVehicle", function(target)
    if not LocalPlayer.state.IsHandcuffed and not LocalPlayer.state.Tied then
        return
    end

    TriggerEvent("skinchanger:getSkin", function(skin)
        ESX.ShowNotification((skin.sex == 0 and "Zostałeś" or "Zostałaś") .. " " .. (skin.sex == 0 and "wsadzony" or "wsadzona") .. " do pojazdu przez " .. target)
    end)

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed, true)

    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
    DetachEntity(playerPed, true, false)
    FreezeEntityPosition(playerPed, false)

    if IsEntityPlayingAnim(playerPed, "nm", "firemans_carry", 3) and not IsPedInAnyVehicle(playerPed, false) then
        ClearPedTasksImmediately(playerPed)
    end
    
	LocalPlayer.state:set("IsDragged", false, true)

    if IsAnyVehicleNearPoint(coords, 5.0) then
        local vehicle = ESX.Game.GetClosestVehicle(GetEntityCoords(playerPed))
        if DoesEntityExist(vehicle) and #(coords - GetEntityCoords(vehicle)) <= 5.0 then
            local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)
            for i=maxSeats - 1, 0, -1 do
                if IsVehicleSeatFree(vehicle, i) then
                    freeSeat = i
                    break
                end
            end

            if freeSeat then
                TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
            end
        end
    end
end)

RegisterNetEvent("xpack_interactions:outTheVehicle", function(target)
    if not LocalPlayer.state.IsHandcuffed and not LocalPlayer.state.Tied then
        return
    end

    TriggerEvent("skinchanger:getSkin", function(skin)
        ESX.ShowNotification((skin.sex == 0 and "Zostałeś" or "Zostałaś") .. " " .. (skin.sex == 0 and "wysadzony" or "wysadzona") .. " z pojazdu przez " .. target)
    end)

    local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 64)
    end
end)

StartCuffLoop = function(anim)
    Citizen.CreateThread(function()
        while LocalPlayer.state.IsHandcuffed do
            local playerPed = PlayerPedId()
            if not IsEntityPlayingAnim(playerPed, "mp_arresting", anim, 3) and not LocalPlayer.state.IsDragged then
                TaskPlayAnim(playerPed, "mp_arresting", anim, 8.0, -8.0, -1, 49, 0.0, 0, 0, 0)
            end
            BlockControls()
            Wait(0)
        end
    end)
end

StartDraggingLoop = function()
    Citizen.CreateThread(function()
        while LocalPlayer.state.Dragging do
            local playerPed = PlayerPedId()
            if not IsEntityPlayingAnim(playerPed, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 3) then
                TaskPlayAnim(playerPed, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 8.0, -8.0, 1.0, 50, 0, false, false, false)
            end
            BlockControls()
            Wait(0)
        end
    end)
    
    Citizen.CreateThread(function()
        while LocalPlayer.state.Dragging do
            Wait(1000)
            if LocalPlayer.state.Dragging == false then
                break
            end
            if not Player(LocalPlayer.state.Dragging).state.IsDragged then
                LocalPlayer.state:set("Dragging", false, true)
            end
        end
        ClearPedTasks(PlayerPedId())
    end)
end

BlockControls = function()
    DisableControlAction(2, 24, true) -- Attack
    DisableControlAction(2, 257, true) -- Attack 2
    DisableControlAction(2, 25, true) -- Aim
    DisableControlAction(2, 263, true) -- Melee Attack 1
    DisableControlAction(2, 45, true) -- Reload
    DisableControlAction(2, 44, true) -- Cover
    DisableControlAction(2, 246, true) -- Turn off vehicle
    DisableControlAction(2, 59, true) -- Disable steering in vehicle
    DisableControlAction(2, 36, true) -- Disable going stealth
    DisableControlAction(0, 47, true)  -- Disable weapon
    DisableControlAction(0, 264, true) -- Disable melee
    DisableControlAction(0, 257, true) -- Disable melee
    DisableControlAction(0, 140, true) -- Disable melee
    DisableControlAction(0, 141, true) -- Disable melee
    DisableControlAction(0, 142, true) -- Disable melee
    DisableControlAction(0, 143, true) -- Disable melee
    if not IsPedSwimmingUnderWater(PlayerPedId()) then
        DisableControlAction(2, 22, true) -- Jump
        DisableControlAction(2, 21, true) -- Running
        DisableControlAction(2, 0, true) -- Disable changing view
    end
end


Citizen.CreateThread(function()
    while true do
        if LocalPlayer.state.Tied or LocalPlayer.state.IsHandcuffed then
            DisableControlAction(2, 24, true) -- Attack
            DisableControlAction(2, 257, true) -- Attack 2
            DisableControlAction(2, 25, true) -- Aim
            DisableControlAction(2, 263, true) -- Melee Attack 1
            DisableControlAction(2, 45, true) -- Reload
            DisableControlAction(2, 44, true) -- Cover
            DisableControlAction(2, 246, true) -- Turn off vehicle
            DisableControlAction(2, 59, true) -- Disable steering in vehicle
            DisableControlAction(2, 36, true) -- Disable going stealth
            DisableControlAction(0, 47, true)  -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
            if not IsPedSwimmingUnderWater(PlayerPedId()) then
                DisableControlAction(2, 22, true) -- Jump
                DisableControlAction(2, 21, true) -- Running
                DisableControlAction(2, 0, true) -- Disable changing view
            end
        else
            Citizen.Wait(500)
        end

        Citizen.Wait(0)
    end
end)



local animation = { lib = "random@mugging3" , base = "handsup_standing_base", enter = "handsup_standing_enter", exit = "handsup_standing_exit", fade = 1 }

function CanCuff(src,l) 
	local playerPed = src
	if l then
		playerPed = GetPlayerPed(src)
	end
	if not playerPed then return end
	local can = false
	if IsEntityPlayingAnim(playerPed, "dead", "dead_a", 3) or IsEntityPlayingAnim(playerPed, animation.lib, animation.base, 3) or IsEntityPlayingAnim(playerPed, animation.lib, animation.enter, 3) or IsEntityPlayingAnim(playerPed, animation.lib, animation.exit, 3) or IsEntityPlayingAnim(playerPed, "mp_arresting", "idle", 3) or IsEntityPlayingAnim(playerPed, "random@mugging3", "handsup_standing_enter", 3) or IsEntityPlayingAnim(playerPed, "random@mugging3", "handsup_standing_exit", 3) or IsEntityPlayingAnim(playerPed, "mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", 3) or IsEntityDead(playerPed) or IsPedBeingStunned(playerPed) or IsPedSwimming(playerPed) or IsPedSwimmingUnderWater(playerPed) or IsEntityPlayingAnim(playerPed, "missminuteman_1ig_2", "handsup_enter", 3) or IsEntityPlayingAnim(playerPed, "random@arrests@busted", "enter", 3) or IsEntityPlayingAnim(playerPed, "random@mugging3", "handsup_standing_base", 3) then
        can = true
	end
	if not l and IsEntityDead(playerPed) then
		can = false
	end
	return can
end