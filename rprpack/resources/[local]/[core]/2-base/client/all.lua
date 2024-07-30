
RegisterCommand('propfix', function()
    for k, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		local playerLoc = GetEntityCoords(GetPlayerPed(-1))
		ClearAreaOfCops(playerLoc.x, playerLoc.y, playerLoc.z, 200.0)
		Citizen.Wait(5000)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		SetCanAttackFriendly(GetPlayerPed(-1), true, false)
		NetworkSetFriendlyFireOption(true)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		id = PlayerId()
		DisablePlayerVehicleRewards(id)	
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		id = PlayerId()
		DisablePlayerVehicleRewards(id)	
	end
end)

DensityMultiplier = 0.0  
DensityMultiplier1 = 0.0  
DensityMultiplier2 = 0.02  
DensityMultiplier111 = 0.0 
DensityPeds = 0.0
local ped = GetPlayerPed(-1)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == ped then
				SetVehicleDensityMultiplierThisFrame(DensityMultiplier2)
				SetPedDensityMultiplierThisFrame(DensityPeds)
				SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier2)
				SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier2)
				SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier2, DensityMultiplier2)
			else
				SetVehicleDensityMultiplierThisFrame(0.0)
				SetPedDensityMultiplierThisFrame(DensityPeds)
				SetRandomVehicleDensityMultiplierThisFrame(0.0)
				SetParkedVehicleDensityMultiplierThisFrame(0.0)
				SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
			end
		else
			SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
			SetPedDensityMultiplierThisFrame(DensityPeds)
			SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
			SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
			SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)
		end
	end
end)

function SetWeaponDrops()
    local handle, ped = FindFirstPed()
    local finished = false 

    repeat 
        if not IsEntityDead(ped) then
            SetPedDropsWeaponsWhenDead(ped, false) 
        end
        finished, ped = FindNextPed(handle)
    until not finished

    EndFindPed(handle)
end

Citizen.CreateThread(function()
    while true do
        SetWeaponDrops()
        Citizen.Wait(10)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		id = PlayerId()
		DisablePlayerVehicleRewards(id)	
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        ClearAreaOfVehicles(915.88, -170.99, 74.06, 2)
        local playerPed = GetPlayerPed(-1)
        local playerLocalisation = GetEntityCoords(playerPed)
        ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
    end
end)

Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) -- Level 1
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) -- Level 2
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0) -- Level 4
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1)
		if IsPedOnFoot(GetPlayerPed(-1)) then 
			SetRadarZoom(1100)
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			SetRadarZoom(1100)
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        HideHudComponentThisFrame(1) -- gwiazdki
        HideHudComponentThisFrame(2) -- ikona broni
        HideHudComponentThisFrame(3) -- siano
        HideHudComponentThisFrame(4) -- 2 siano
        HideHudComponentThisFrame(6) -- nazwa fury (prawy dolny)
        HideHudComponentThisFrame(7) -- nazwa strefy (prawy dolny)
        HideHudComponentThisFrame(8) -- klasa fury (prawy dolny)
        HideHudComponentThisFrame(9) -- ulica (prawy dolny)
        HideHudComponentThisFrame(13) -- cash change
        HideHudComponentThisFrame(17) -- zapisywanie gry
        HideHudComponentThisFrame(19) -- kolo broni
        HideHudComponentThisFrame(20) -- kolo broni staty
    end
end)

-- ANTY KOLBA 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = GetPlayerPed( -1 )
        local weapon = GetSelectedPedWeapon(ped)
        
        if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)


-- PIERWSZA/TRZECIA

-- MNIEJ NPC
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        SetVehicleDensityMultiplierThisFrame(0.10)
        SetPedDensityMultiplierThisFrame(1.10)
        SetRandomVehicleDensityMultiplierThisFrame(0.10)
        SetParkedVehicleDensityMultiplierThisFrame(0.1)
        SetScenarioPedDensityMultiplierThisFrame(1.10)
  end
end)

-- ŁAPY --
local Keys = {
	["~"] = 243,
}

local canHandsUp = true
local handsup = false

AddEventHandler('handsup:toggle', function(param)
	canHandsUp = param
end)

Citizen.CreateThread(function()


	while true do
		Citizen.Wait(5)

		if canHandsUp then
			if IsControlJustReleased(0, Keys['~']) then
				local playerPed = PlayerPedId()

				RequestAnimDict('random@mugging3')
				while not HasAnimDictLoaded('random@mugging3') do
					Citizen.Wait(25)
				end

				if not handsup then
					handsup = true
					TaskPlayAnim(playerPed, 'random@mugging3', 'handsup_standing_base', 3.0, -3.0, -1, 49, 0, 0, 0, 0)
					blokada()
				else
					handsup = false
					ClearPedSecondaryTask(playerPed)
				end
			end
		end
	end
end)

function blokada()
	Citizen.CreateThread(function()
		while handsup do
			Citizen.Wait(5)
           
		end
	end)
end