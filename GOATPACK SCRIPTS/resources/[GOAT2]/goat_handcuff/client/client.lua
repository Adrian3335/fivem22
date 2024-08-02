Keys = {
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


ESX = exports["es_extended"]:getSharedObject()
local PlayerData = {}
local ox_target = exports.ox_target
local IsHandcuffed = false
local IsDragged = false
local draggingPlayer 
local cuffType = nil

RegisterNetEvent('esx:setJob', function(job)
	PlayerData.job = job
end)



function isVehicleTrunkInUse(vehicle)
	return Entity(vehicle).state.taken
end


--Handcuffs


ox_target:addGlobalPlayer({
    {
        name = 'goat_handcuff:handcuff',
        label = 'Zakuj',
		icon = "fa-solid fa-hands-bound",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name, boneId)
			local closestPlayer = NetworkGetPlayerIndexFromPed(entity)	
			local serverId = GetPlayerServerId(closestPlayer)			
			if Player(serverId).state.handcuff == nil and exports.ox_inventory:GetItemCount('handcuffs') > 0 and not IsPedInAnyVehicle(PlayerPedId()) and (IsEntityPlayingAnim(entity, "random@mugging3", "handsup_standing_base", 3) or Player(serverId).state.IsDead or IsPedBeingStunned(entity)) then
				return true
			else
				return false
			end
        end,
        onSelect = function(data)
			local coords = GetEntityCoords(data.entity)
			local coords2 = GetEntityCoords(data.entity)
			if #(coords-coords2) < 2.0 then
				local player = NetworkGetPlayerIndexFromPed(data.entity)	
				local targetSrc = GetPlayerServerId(player)				
				TriggerServerEvent('goat_handcuff:handcuff', targetSrc, 'handcuff')	
			end
        end
    }
})


ox_target:addGlobalPlayer({
    {
        name = 'goat_handcuff:decuff',
        label = 'Odkuj',
		icon = "fa-solid fa-hands-bound",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name, boneId)
			local closestPlayer = NetworkGetPlayerIndexFromPed(entity)	
			local serverId = GetPlayerServerId(closestPlayer)		
			if IsPedCuffed(entity) and (exports.ox_inventory:GetItemCount('handcuffs') > 0) then
				return true
			else
				return false
			end
        end,
        onSelect = function(data)
			local coords = GetEntityCoords(data.entity)			
			local coords2 = GetEntityCoords(data.entity)
			if #(coords-coords2) < 5.0 and exports.ox_inventory:GetItemCount('handcuffs') > 0 then
				handcuff_anim(true)
				local player = NetworkGetPlayerIndexFromPed(data.entity)	
				local targetSrc = GetPlayerServerId(player)				
				TriggerServerEvent('goat_handcuff:handcuff', targetSrc, nil)					
			end
        end
    }
})

-- ox_target:addGlobalPlayer({
--     {
--         name = 'goat_handcuff:line',
--         label = 'Zwiąż',
-- 		icon = "fa-solid fa-hands-bound",
-- 		distance = 2.0,
--         canInteract = function(entity, distance, coords, name, boneId)
-- 			local closestPlayer = NetworkGetPlayerIndexFromPed(entity)	
-- 			local serverId = GetPlayerServerId(closestPlayer)			
-- 			if Player(serverId).state.handcuff == nil and exports.ox_inventory:GetItemCount('handcuffs') > 0 and not IsPedInAnyVehicle(PlayerPedId()) and (IsEntityPlayingAnim(entity, "random@mugging3", "handsup_standing_base", 3) or Player(serverId).state.IsDead or IsPedBeingStunned(entity)) then
-- 				return true
-- 			else
-- 				return false
-- 			end
--         end,
--         onSelect = function(data)
-- 			local coords = GetEntityCoords(data.entity)
-- 			local coords2 = GetEntityCoords(data.entity)
-- 			if #(coords-coords2) < 2.0 then
-- 				local player = NetworkGetPlayerIndexFromPed(data.entity)	
-- 				local targetSrc = GetPlayerServerId(player)				
-- 				TriggerServerEvent('goat_handcuff:handcuff', targetSrc, 'line')	
-- 			end
--         end
--     }
-- })

-- ox_target:addGlobalPlayer({
--     {
--         name = 'goat_handcuff:deline',
--         label = 'Odwiąż',
-- 		icon = "fa-solid fa-hands-bound",
-- 		distance = 2.0,
--         canInteract = function(entity, distance, coords, name, boneId)
-- 			local closestPlayer = NetworkGetPlayerIndexFromPed(entity)	
-- 			local serverId = GetPlayerServerId(closestPlayer)			
-- 			if Player(serverId).state.handcuff == 'line' then
-- 				return true
-- 			else
-- 				return false
-- 			end
--         end,
--         onSelect = function(data)
-- 			local coords = GetEntityCoords(data.entity)
-- 			handcuff_anim()
-- 			local coords2 = GetEntityCoords(data.entity)
-- 			if #(coords-coords2) < 1.0 then
-- 				local player = NetworkGetPlayerIndexFromPed(data.entity)	
-- 				local targetSrc = GetPlayerServerId(player)				
-- 				TriggerServerEvent('goat_handcuff:handcuff', targetSrc, nil)	
-- 			end
--         end
--     }
-- })

--clothes

--clothes

local male = {}
male.tshirt_1 = 15
male.torso_1 = 15
male.shoes_1 = 34
male.pants_1 = 14
male.pants_2 = 1
male.arms_1 = 15
male.arms_2 = 0
male.mask_1 = 0
male.helmet_1 = -1

local female = {}
female.tshirt_1 = 15
female.torso_1 = 15
female.shoes_1 = 34
female.pants_1 = 14
female.pants_2 = 1
female.arms_1 = 15
female.arms_2 = 0
female.mask_1 = 0
female.helmet_1 = -1

RegisterNetEvent('esx_policejob:ubierzciuchydefault', function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        if skin.sex == 0 then
            TriggerEvent('skinchanger:loadClothes', skin, male)
            Wait(200)
            TriggerEvent('skinchanger:change', 'arms', male.arms_1)
        else
            TriggerEvent('skinchanger:loadClothes', skin, female)
            Wait(200)
            TriggerEvent('skinchanger:change', 'arms', female.arms_1)
        end

        Wait(1000)
        
        	TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerEvent('esx_skin:setLastSkin', skin)
            TriggerServerEvent('esx_skin:save', skin)
        end)
    end)
end)


ox_target:addGlobalPlayer({
    {
        name = 'goat_handcuff:getClothes',
        label = 'Przebierz w ciuchy',
		icon = "fa-solid fa-shirt",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name, boneId)
			local dict = 'dead'
			local anim = 'dead_a'
			return IsPedCuffed(entity) or IsEntityPlayingAnim(entity, dict, anim,3)	
        end,
        onSelect = function(data)	
			local player = NetworkGetPlayerIndexFromPed(data.entity)	
			local targetSrc = GetPlayerServerId(player)		
			TriggerServerEvent('goat_handcuff:askForClothes', targetSrc)
        end
    }
})

RegisterNetEvent('goat_handcuff:askForClothes', function(thiefServerId)
	local alert = lib.alertDialog({
		header = thiefServerId .. ' prosi o ubrania',
		content = 'Czy pozwalasz mu się w nie przebrać?',
		centered = true,
		cancel = true
	})

	if alert == "confirm" then
		TriggerServerEvent('goat_handcuff:wearClothes', thiefServerId)
	end
end)


RegisterNetEvent('goat_handcuff:wearClothes', function(targetId)


	ESX.TriggerServerCallback('esx_skin:getPlayerSkintarget', function(clothes)
		if clothes then
			TriggerServerEvent('esx_policejob:ubierzciuchydefault', targetId)

			TriggerEvent('skinchanger:getSkin', function(skin)
				TriggerEvent('skinchanger:loadClothes', skin, clothes)
				
				Wait(1000)

				TriggerEvent('skinchanger:getSkin', function(skin2)
					TriggerEvent('esx_skin:setLastSkin', skin2)
					TriggerServerEvent('esx_skin:save', skin2)
				end)

			end)
		end
	end, targetId)

end)
--search

ox_target:addGlobalPlayer({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Przeszukaj',
		icon = "fa-solid fa-suitcase",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name, boneId)
			local player = NetworkGetPlayerIndexFromPed(entity)	
			local targetSrc = GetPlayerServerId(player)	


			local dict = 'dead'
			local anim = 'dead_a'
			return IsPedCuffed(entity) or IsEntityPlayingAnim(entity, dict, anim,3)	
        end,
        onSelect = function(data)
			loadAnimDict('anim@gangops@facility@servers@bodysearch@')
			TaskPlayAnim(PlayerPedId(), 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 3.0, -1, 56, 0, 0, 0, 0)	
			local player = NetworkGetPlayerIndexFromPed(data.entity)	
			local targetSrc = GetPlayerServerId(player)
			if lib.progressBar({
				duration = 2500,
				label = "Przeszukiwanie",
				canCancel = true
			}) then
				exports.ox_inventory:openInventory('player', targetSrc)
			end
        end
    }
})


ox_target:addGlobalPlayer({
    {
        name = 'goat_handcuff:drag',
        label = 'Przenieś',
		icon = "fa-solid fa-people-robbery",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name, boneId)
			return IsPedCuffed(entity)
        end,
        onSelect = function(data)
			local player = NetworkGetPlayerIndexFromPed(data.entity)	
			local targetSrc = GetPlayerServerId(player)				
			TriggerServerEvent('goat_handcuff:drag', targetSrc)	
        end
    }
})

ox_target:addGlobalPlayer({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Wrzuć do pojazdu',
		icon = "fa-solid fa-car",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name, boneId)
			local dict = 'dead'
			local anim = 'dead_a'
			local coords_p = GetEntityCoords(PlayerPedId())
			local player = NetworkGetPlayerIndexFromPed(entity)	
			local targetSrc = GetPlayerServerId(player)	

			if not IsAnyVehicleNearPoint(coords_p.x, coords_p.y, coords_p.z, 4.8) then
				return false
			end

			return IsPedCuffed(entity) or IsEntityPlayingAnim(entity, dict, anim,3)	 or Player(targetSrc).state.IsDead
        end,
        onSelect = function(data)
			local player = NetworkGetPlayerIndexFromPed(data.entity)	
			local targetSrc = GetPlayerServerId(player)				
			TriggerServerEvent('goat_handcuff:putInVehicle', targetSrc)	
        end
    }
})

ox_target:addGlobalVehicle({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Wyciągnij [kierowca]',
		icon = "fa-solid fa-car",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(entity,-1))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)
			if serverId ~= 0 and IsPedCuffed(playerPed) or IsEntityPlayingAnim(playerPed, dict, anim,3) or Player(serverId).state.IsDead then
				return serverId
			else
				return false
			end
        end,
        onSelect = function(data)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(data.entity,-1))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)			
            TriggerServerEvent('goat_handcuff:OutVehicle', serverId)
        end
    }
})

ox_target:addGlobalVehicle({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Wyciągnij [pasażer przód]',
		icon = "fa-solid fa-car",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(entity,0))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)
			if serverId ~= 0 and IsPedCuffed(playerPed) or IsEntityPlayingAnim(playerPed, dict, anim,3) or Player(serverId).state.IsDead then
				return serverId
			else
				return false
			end
        end,
        onSelect = function(data)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(data.entity,0))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)			
            TriggerServerEvent('goat_handcuff:OutVehicle', serverId)            
        end
    }
})

ox_target:addGlobalVehicle({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Wyciągnij [tył lewo]',
		icon = "fa-solid fa-car",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(entity,1))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)
			if serverId ~= 0 and IsPedCuffed(playerPed) or IsEntityPlayingAnim(playerPed, dict, anim,3) or Player(serverId).state.IsDead then
				return serverId
			else
				return false
			end
        end,
        onSelect = function(data)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(data.entity,1))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)			
            TriggerServerEvent('goat_handcuff:OutVehicle', serverId)           
        end
    }
})

ox_target:addGlobalVehicle({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Wyciągnij [tył prawo]',
		icon = "fa-solid fa-car",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(entity,2))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)
			local dict = "veh@low@front_ps@idle_duck"
			local anim = "sit"
			if serverId ~= 0 and IsPedCuffed(playerPed) or IsEntityPlayingAnim(playerPed, dict, anim,3) or Player(serverId).state.IsDead then
				return serverId
			else
				return false
			end
        end,
        onSelect = function(data)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(data.entity,2))	
			local serverId = GetPlayerServerId(closestPlayer)	
            TriggerServerEvent('goat_handcuff:OutVehicle', serverId)         
        end
    }
})

ox_target:addGlobalVehicle({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Wyciągnij [tył środek]',
		icon = "fa-solid fa-car",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(entity,3))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)
			if serverId ~= 0 and IsPedCuffed(playerPed) or IsEntityPlayingAnim(playerPed, dict, anim,3) or Player(serverId).state.IsDead then
				return serverId
			else
				return false
			end
        end,
        onSelect = function(data)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(data.entity,3))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)			
            TriggerServerEvent('goat_handcuff:OutVehicle', serverId)        
        end
    }
})

ox_target:addGlobalVehicle({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Wyciągnij [miejsce nr 6]',
		icon = "fa-solid fa-car",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(entity,4))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)
			if serverId ~= 0 and IsPedCuffed(playerPed) or IsEntityPlayingAnim(playerPed, dict, anim,3) or Player(serverId).state.IsDead then
				return serverId
			else
				return false
			end
        end,
        onSelect = function(data)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(data.entity,4))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)			
            TriggerServerEvent('goat_handcuff:OutVehicle', serverId)      
        end
    }
})

ox_target:addGlobalVehicle({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Wyciągnij [miejsce nr 7]',
		icon = "fa-solid fa-car",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(entity,5))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)
			if serverId ~= 0 and IsPedCuffed(playerPed) or IsEntityPlayingAnim(playerPed, dict, anim,3) or Player(serverId).state.IsDead then
				return serverId
			else
				return false
			end
        end,
        onSelect = function(data)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(data.entity,5))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)			
            TriggerServerEvent('goat_handcuff:OutVehicle', serverId)        
        end
    }
})


ox_target:addGlobalVehicle({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Wyciągnij [miejsce nr 8]',
		icon = "fa-solid fa-car",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(entity,6))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)
			if serverId ~= 0 and IsPedCuffed(playerPed) or IsEntityPlayingAnim(playerPed, dict, anim,3) or Player(serverId).state.IsDead then
				return serverId
			else
				return false
			end
        end,
        onSelect = function(data)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(data.entity,6))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)			
            TriggerServerEvent('goat_handcuff:OutVehicle', serverId)       
        end
    }
})

ox_target:addGlobalVehicle({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Wyciągnij [miejsce nr 9]',
		icon = "fa-solid fa-car",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(entity, 7))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)
			if serverId ~= 0 and IsPedCuffed(playerPed) or IsEntityPlayingAnim(playerPed, dict, anim,3) or Player(serverId).state.IsDead then
				return serverId
			else
				return false
			end
        end,
        onSelect = function(data)
			local closestPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(data.entity,7))	
			local playerPed = GetPlayerPed(closestPlayer)
			local serverId = GetPlayerServerId(closestPlayer)			
            TriggerServerEvent('goat_handcuff:OutVehicle', serverId)       
        end
    }
})

ox_target:addGlobalPlayer({
    {
        name = 'goat_handcuff:putInTrunk',
        label = 'Wrzuć do bagażnika',
		icon = "fa-solid fa-truck-ramp-box",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name, boneId)
			local dict = 'dead'
			local anim = 'dead_a'
			local player = NetworkGetPlayerIndexFromPed(entity)	
			local targetSrc = GetPlayerServerId(player)		
			
			local coords_p = GetEntityCoords(PlayerPedId())
			if not IsAnyVehicleNearPoint(coords_p.x, coords_p.y, coords_p.z, 4.8) then
				return false
			end

			if IsPedCuffed(entity) or IsEntityPlayingAnim(entity, dict, anim,3)	or Player(targetSrc).state.IsDead then
				return true
			else
				return false
			end
        end,
        onSelect = function(data)
			local player = NetworkGetPlayerIndexFromPed(data.entity)	
			local targetSrc = GetPlayerServerId(player)				
			TriggerServerEvent('goat_handcuff:putInTrunk', targetSrc)	
        end
    }
})

ox_target:addGlobalVehicle({
    {
        name = 'goat_handcuff:putInCar',
        label = 'Wyciągnij bagażnik',
		icon = "fa-solid fa-person-through-window",
		distance = 2.0,
        canInteract = function(entity, distance, coords, name)
			if isVehicleTrunkInUse(entity) and (IsPedCuffed(GetPlayerPed(GetPlayerFromServerId(isVehicleTrunkInUse(entity)))) or Player(isVehicleTrunkInUse(entity)).state.IsDead) then
				return true
			else
				return false
			end
        end,
        onSelect = function(data)		
            TriggerServerEvent('goat_handcuff:putOutTrunk', isVehicleTrunkInUse(data.entity))
        end
    }
})

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(1)
	end
end

function handcuff_anim(sound)
	local ad = "mp_arresting"
	local anim = "a_uncuff"
	local player = PlayerPedId()

	if ( DoesEntityExist(player)) then
		loadAnimDict(ad)
		
		if (IsEntityPlayingAnim(player, ad, anim, 8)) then
			TaskPlayAnim(player, ad, "exit", 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
			ClearPedSecondaryTask(player)
		else
			TaskPlayAnim(player, ad, anim, 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
		end
	end
	Citizen.Wait(2000)
	if sound then
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "cuff", 0.5)
	end
end

local SectionAnimation			= 'mp_arrest_paired'
local AnimationCop 			= 'cop_p2_back_left'	
local AnimationCrook			= 'crook_p2_back_left'	

RegisterNetEvent('goat_handcuff:unhandcuff', function()
	LocalPlayer.state.IsHandcuffed    = false
	local playerPed = PlayerPedId()
	ClearPedSecondaryTask(playerPed)
	SetEnableHandcuffs(playerPed, false)
	DisablePlayerFiring(playerPed, false)
	SetPedCanPlayGestureAnims(playerPed, true)
	DetachEntity(playerPed, true, false)
	Citizen.Wait(500)
	ClearPedSecondaryTask(playerPed)
end)

RegisterNetEvent('goat_handcuff:handcuffAresster', function()
	local playerPed = PlayerPedId()
	RequestAnimDict(SectionAnimation)
	while not HasAnimDictLoaded(SectionAnimation) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(playerPed, SectionAnimation, AnimationCop, 8.0, -8.0, 4000, 33, 0, false, false, false)
	local timeStarted = GetGameTimer() + 2750

	while timeStarted > GetGameTimer() do
		Citizen.Wait(0)
		DisableControlAction(0, 73)
	end	
end)


RegisterNetEvent('goat_handcuff:handcuffAressted', function(target, type)
	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	RequestAnimDict(SectionAnimation)

	while not HasAnimDictLoaded(SectionAnimation) do
		Citizen.Wait(10)
	end

	AttachEntityToEntity(playerPed, targetPed, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
	TaskPlayAnim(playerPed, SectionAnimation, AnimationCrook, 8.0, -8.0, 5500, 33, 0, false, false, false)
	Citizen.Wait(450)
	DetachEntity(playerPed, true, false)
	local success = false

	--TUTAJ JEST SKILLCHECK ZEBY NIE BYC ZAKUTYM
	local speedMultiplier = 2.3
	local areaSize = 25



	success = lib.skillCheck({{areaSize = areaSize, speedMultiplier= speedMultiplier}})


	local timeStarted = GetGameTimer() + 2500
	local cuff = true
	FreezeEntityPosition(playerPed, true)

	while timeStarted > GetGameTimer() do
		Citizen.Wait(0)
		DisableControlAction(0, 24, true)
		if success then
			cuff = false
			break
		end
	end

	FreezeEntityPosition(playerPed, false)
	ClearPedTasksImmediately(playerPed)

	if cuff then
		TriggerServerEvent('goat_handcuff:handcuffForce', type)
	end
end)

RegisterNetEvent('goat_handcuff:handcuff', function(CuffType)

	if CuffType then
		LocalPlayer.state.IsHandcuffed    = true
		cuffType = CuffType
		ExecuteCommand('HideRadial')
	elseif CuffType == nil then
		LocalPlayer.state.IsHandcuffed = false
	end
	local playerPed = PlayerPedId()
    SetCurrentPedWeapon(playerPed, GetHashKey('UNARMED'), true) -- unarm player
	
	ESX.UI.Menu.CloseAll()

	CreateThread(function()
		local cuffTimeStart = GetGameTimer()
		if LocalPlayer.state.IsHandcuffed then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local closestPed = GetPlayerPed(closestPlayer)
			local h1 = GetEntityHeading(GetPlayerPed(-1))
			local h2 = GetEntityHeading(closestPed)
			local dif = math.abs(h1 - h2)

			ClearPedTasks(playerPed)
			loadAnimDict('mp_arresting')
			
  			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, 3.0, -1, 50, 0, 0, 0, 0)
			SetEnableHandcuffs(playerPed, true)
  			DisablePlayerFiring(playerPed, true)
  			SetPedCanPlayGestureAnims(playerPed, true)

			while LocalPlayer.state.IsHandcuffed do
				Citizen.Wait(0)
				DisableControlAction(2, 24, true) -- Attack
				DisableControlAction(2, 257, true) -- Attack 2
				DisableControlAction(2, 25, true) -- Aim
				DisableControlAction(2, 263, true) -- Melee Attack 1
				DisableControlAction(2, Keys['R'], true) -- Reload
				DisableControlAction(2, Keys['TOP'], true) -- Open phone
				DisableControlAction(2, Keys['SPACE'], true) -- Jump
				DisableControlAction(2, Keys['Q'], true) -- Cover
				DisableControlAction(2, Keys['~'], true) -- Hands up
				DisableControlAction(2, Keys['Y'], true) -- Turn off vehicle
				DisableControlAction(2, Keys['PAGEDOWN'], true) -- Crawling
				DisableControlAction(2, Keys['B'], true) -- Pointing
				DisableControlAction(2, Keys['TAB'], true) -- Select Weapon
				DisableControlAction(2, Keys['F1'], true) -- Disable phone
				DisableControlAction(2, Keys['F2'], true) -- Inventory
				DisableControlAction(2, Keys['F3'], true) -- Animations
				DisableControlAction(2, Keys['K'], true) -- Fraction actions
				DisableControlAction(2, Keys['H'], true) -- Fraction actions	
				DisableControlAction(0, Keys['H'], true) -- Fraction actions	
				DisableControlAction(2, Keys['LEFTSHIFT'], true) -- Running
				DisableControlAction(2, Keys['V'], true) -- Disable changing view
				DisableControlAction(2, Keys['P'], true) -- Disable pause screen
				DisableControlAction(2, 59, true) -- Disable steering in vehicle
				DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
				DisableControlAction(0, 47, true)  -- Disable weapon
				DisableControlAction(0, 264, true) -- Disable melee
				DisableControlAction(0, 257, true) -- Disable melee
				DisableControlAction(0, 140, true) -- Disable melee
				DisableControlAction(0, 141, true) -- Disable melee
				DisableControlAction(0, 142, true) -- Disable melee
				DisableControlAction(0, 143, true) -- Disable melee]]
				DisableControlAction(0, 244, true) -- DISALBE RADIO
				DisableControlAction(0, 19, true) -- DISALBE alt
				if not IsEntityPlayingAnim(PlayerPedId(), "mp_arresting", "idle", 3) and not LocalPlayer.state.IsDead and not LocalPlayer.state.IsCarried then
                    loadAnimDict('mp_arresting')
                    TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, 3.0, -1, 50, 0, 0, 0, 0)
                elseif IsEntityPlayingAnim(PlayerPedId(), "mp_arresting", "idle", 3) and (LocalPlayer.state.IsDead or LocalPlayer.state.IsCarried) then
                    ClearPedSecondaryTask(playerPed)
                    ClearPedTasksImmediately(playerPed)
                end    

			end

			LocalPlayer.state.IsHandcuffed = false
		else
			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			DetachEntity(playerPed, true, false)
		end
	end)

	

end)

function HandCuffed()
	return LocalPlayer.state.IsHandcuffed
end

--DRAG HANDCUFFS

RegisterNetEvent('goat_handcuff:drag', function(cop)
	if LocalPlayer.state.IsHandcuffed or LocalPlayer.state.IsDead then

		IsDragged = not IsDragged

		if CopPlayer and IsDragged == false then
			TriggerServerEvent('goat_handcuff:dragUpdate', CopPlayer)
		end

		if IsDragged == false then
			CopPlayer     = nil
		else
			CopPlayer = tonumber(cop)
		end				

		DetachEntity(PlayerPedId(), true, false)
	end
end)

RegisterNetEvent('goat_handcuff:isDragging', function(player)
	if player then

		RequestAnimDict("amb@world_human_drinking@coffee@male@base")
		while not HasAnimDictLoaded("amb@world_human_drinking@coffee@male@base") do
			Wait(0)
		end

		draggingPlayer = player
		
		TaskPlayAnim(PlayerPedId(), "amb@world_human_drinking@coffee@male@base", "base", 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)

		while draggingPlayer do
			Citizen.Wait(0)
			if IsControlJustPressed(0, 73) then	
				TriggerServerEvent('goat_handcuff:drag', player)
				draggingPlayer = false
			end		
		end

	else
		draggingPlayer = false
		
		StopAnimTask(PlayerPedId(), "amb@world_human_drinking@coffee@male@base", "base", 1)
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
			if IsDragged then
				playerPed = PlayerPedId()
				if CopPlayer then
					targetPed = GetPlayerPed(GetPlayerFromServerId(CopPlayer))

					if not IsPedSittingInAnyVehicle(targetPed) then
						AttachEntityToEntity(playerPed, targetPed, 11816, 0.20, 0.45, 0.0, 0.0, 0.0, 0.0, false, true, true, true, 5, true)
					else
						if LocalPlayer.state.IsDead then
							if GetVehicleClass(GetVehiclePedIsIn(targetPed, false)) == 8 then
								IsDragged = false
								DetachEntity(playerPed, true, false)
							end
						else
							IsDragged = false
							DetachEntity(playerPed, true, false)
						end
					end

					if IsPedDeadOrDying(targetPed, true) then
						IsDragged = false
						DetachEntity(playerPed, true, false)
					end

					if IsPedRagdoll(targetPed) then
						IsDragged = false
						DetachEntity(playerPed, true, false)
					end
					
					if not LocalPlayer.state.IsHandcuffed and not LocalPlayer.state.IsDead then
						IsDragged = false
						DetachEntity(playerPed, true, false)
					end
				end	
			else
				Citizen.Wait(600)	
			end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if IsDragged and not LocalPlayer.state.IsDead then
			playerPed = PlayerPedId()
			if CopPlayer then
				targetPed = GetPlayerPed(GetPlayerFromServerId(CopPlayer))
				if IsPedWalking(targetPed) or IsPedSprinting(targetPed) then
					LastWalk = true
					local offset = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 1.0, 0.0)
					TaskGoStraightToCoord(playerPed, offset.x, offset.y, offset.z, 0.2, -1, GetEntityHeading(targetPed), 0.0)
				elseif LastWalk then
					LastWalk = false
					ClearPedTasks(playerPed)
				end
			end
		end
	end
end)


--PUT IN VEHICLE

RegisterNetEvent('goat_handcuff:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if not LocalPlayer.state.IsHandcuffed and not LocalPlayer.state.IsDead then
		return
	end

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle = ESX.Game.GetClosestVehicle(coords)

		if DoesEntityExist(vehicle) then
			local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
			local freeSeat = nil

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat ~= nil then
				IsDragged = false

				local tick = 20
				repeat
					TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
					tick = tick - 1
					Wait(50)
				until IsPedInAnyVehicle(playerPed, false) or tick == 0
				
				TriggerEvent('nrp:belt', true)
			end
		end
	end
end)

RegisterNetEvent('goat_handcuff:OutVehicle', function(coords)
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	if not LocalPlayer.state.IsHandcuffed and not LocalPlayer.state.IsDead then
		return
	end


	SetEntityCoords(playerPed,coords)
end)