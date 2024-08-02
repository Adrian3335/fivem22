ESX = exports["es_extended"]:getSharedObject()

OxInventory = true -- ZOSTAW JAK JEST :3

Citizen.CreateThread(function()
	while true do
		InvalidateIdleCam()
		InvalidateVehicleIdleCam()
		Wait(5000)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	while (ESX == nil) do Citizen.Wait(100) end
    PlayerData = xPlayer
	FreezeEntityPosition(PlayerPedId(), false)
	TriggerServerEvent('many-base:RemoveFromInstance', GetPlayerServerId(PlayerId()))
end)

AddEventHandler('esx:onPlayerSpawn', function()
	local playerPed = PlayerPedId()
	if GetEntityHealth(playerPed) ~=  200 then
		SetEntityMaxHealth(playerPed, 200)
		SetEntityHealth(playerPed, 200)
	end
	TriggerServerEvent('many-base:RemoveFromInstance', GetPlayerServerId(PlayerId()))
end)

--[[

# EVENT I FUNKCJA OD NOTIFY

]]

RegisterNetEvent('many-base:Notify')
AddEventHandler('many-base:Notify', function(type, msg, duration)
	Notify(type, msg, duration)
end)

function Notify(type, msg, duration)
	ESX.ShowNotification(msg)
end

--[[

# FUNKCJA OD ANIMACJI

]]

function playAnim(ped, animDict, animName, duration, emoteMoving, playbackRate)
	local movingType = 49
	if (emoteMoving == nil) then 
		movingType = 49
	elseif (emoteMoving == false) then
		movingType = 0
	end
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(100) end

	local playbackSpeed = playbackRate or 0
    -- TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, duration, movingType, 1, false, false, false)
	TaskPlayAnim(ped, animDict, animName, 2.0, 2.0, duration, movingType, playbackSpeed, false, false, false)
    RemoveAnimDict(animDict)
end

function addProp(ped, prop1, bone, off1, off2, off3, rot1, rot2, rot3, timer)
	local x,y,z = table.unpack(GetEntityCoords(ped))
	if not HasModelLoaded(prop1) then LoadPropDict(prop1) end
  
	prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
	SetModelAsNoLongerNeeded(prop1)
	Citizen.Wait(timer)
	DeleteEntity(prop)
end

--[[

# 1 WARIANT TRZECIOOSOBOWEJ KAMERY


--[[

# FUNKCJA OD SPRAWDZANIA ILOSCI ITEMU

]]

function itemCount(item, metadata)
	if (OxInventory) then
		return exports.ox_inventory:Search(2, item, metadata)
	else
		ESX.TriggerServerCallback('many-base:itemCountCb', function(itemCount)
			while (itemCount == nil) do Citizen.Wait(100) end
			return itemCount
		end, item)
	end
end

exports('itemCount', itemCount)

AddEventHandler('many-base:itemCount', function(item, metadata)
	return itemCount(item, metadata)
end)

--[[

# FUNKCJA OD ASPECT RATIO

]]

function isWidescreenAspectRatio()
	local aspectRatio = ESX.Math.Round(GetAspectRatio(true), 2)
	if (aspectRatio == 1.6) then
		-- 16:10
		return true
	elseif (aspectRatio == 2.33) then
		-- 21:9
		return true
	end
	return false
end

exports('isWidescreenAspectRatio', isWidescreenAspectRatio)

--[[

# EVENT OD UBIERANIA (TAK TEN SAM SKRYPT CO W POPRZEDNIEJ PACZCE BO JEST DOBRZE ZROBIONY)

]]

AddEventHandler('many-base:SetClothing', function(Type, Drawable, Texture)
    local playerPed = PlayerPedId()
    Type = string.lower(Type)

    if (Type == 'hats') then -- head
        exports['fivem-appearance']:setPedProp(playerPed, { prop_id = 0, drawable = Drawable, texture = Texture })
    elseif (Type == 'glasses') then -- glasses
        exports['fivem-appearance']:setPedProp(playerPed, { prop_id = 1, drawable = Drawable, texture = Texture })
    elseif (Type == 'mask') then -- masks
        exports['fivem-appearance']:setPedComponent(playerPed, { component_id = 1, drawable = Drawable, texture = Texture })
    elseif (Type == 'jackets') then -- tops
        exports['fivem-appearance']:setPedComponent(playerPed, { component_id = 11, drawable = Drawable, texture = Texture })
    elseif (Type == 'scarfAndChains') then -- accessories
        exports['fivem-appearance']:setPedComponent(playerPed, { component_id = 7, drawable = Drawable, texture = Texture })
    elseif (Type == 'torso') then -- torso
        exports['fivem-appearance']:setPedComponent(playerPed, { component_id = 3, drawable = Drawable, texture = Texture })
    elseif (Type == 'shirt') then -- undershirt
        exports['fivem-appearance']:setPedComponent(playerPed, { component_id = 8, drawable = Drawable, texture = Texture })
    elseif (Type == 'leg') then -- legs
        exports['fivem-appearance']:setPedComponent(playerPed, { component_id = 4, drawable = Drawable, texture = Texture })
    elseif (Type == 'shoes') then -- shoes
        exports['fivem-appearance']:setPedComponent(playerPed, { component_id = 6, drawable = Drawable, texture = Texture })
    elseif (Type == 'armour') then -- body armors
        exports['fivem-appearance']:setPedComponent(playerPed, { component_id = 9, drawable = Drawable, texture = Texture })
	elseif (Type == 'decals') then -- decals
        exports['fivem-appearance']:setPedComponent(playerPed, { component_id = 10, drawable = Drawable, texture = Texture })
    end
end)

--[[

#    EXPORT DO NPWD ;3

]]

exports('canUsePhone', function()
	local p = promise.new()
  
	ESX.TriggerServerCallback('phone_export:canUse', function(canPickUp)
  
		  p:resolve(canPickUp)
  
		  if not canPickUp then
			ESX.ShowNotification('Nie masz przy sobie telefonu!')
		  end
	end)
	return Citizen.Await(p)
end)

--[[

# 1 OSOBA W FURZE ( czasami się budży :c )

]]

local ped = PlayerPedId()
local inVeh = IsPedInAnyVehicle(ped, true)

CreateThread(function()
    while true do
        sleep = 1000
        local bike = IsPedOnAnyBike(ped)
        local _, weapon = GetCurrentPedWeapon(PlayerPedId())
        local unarmed = `WEAPON_UNARMED`
        if IsPedInAnyVehicle(ped) and weapon ~= unarmed then
            sleep = 1
            if IsPedDoingDriveby(PlayerPedId()) then
                SetFollowVehicleCamViewMode(4)
            else
                SetFollowVehicleCamViewMode(0)
            end
        else
            sleep = 1000
        end
        Wait(sleep)
    end
end)


--[[

# WYTRYSZKI ;3

]]

RegisterNetEvent('many-lockpick:Start')
AddEventHandler('many-lockpick:Start', function()
	local ped = PlayerPedId()
	local playerPos = GetEntityCoords(PlayerPedId())
    local vehicle = ESX.Game.GetVehicleInDirection()
	local veh_ner = GetClosestVehicle(playerPos.x , playerPos.y , playerPos.z, 3.5)
	local pedd = GetPedInVehicleSeat(vehicle, -1)

	if DoesEntityExist(vehicle) then

		if GetVehicleDoorLockStatus(vehicle) > 2 or pedd then
	while not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@") do
		Citizen.Wait(100)

		RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
	end


	TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 3.5, 1.0, -1, 11, 0.0, 0, 0, 0)
	local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())

	exports['many_lib']:Circle(function(success)
      Citizen.CreateThread(function()
		local random = math.random(1, 3)
		if random == 2 then
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
		end
        Citizen.Wait(100)
        if success then
			local Locked = GetVehicleDoorLockStatus(vehicle)
			if Locked > 2 then
				ClearPedTasksImmediately(ped)
				SetVehicleDoorsLocked(vehicle, 1)
				SetVehicleDoorsLockedForAllPlayers(veh, false)
				SetVehicleDoorsLockedForAllPlayers(vehicle, false)
				SetVehicleDoorsLocked(veh, 1)
				SetVehicleEngineOn(vehicle, true, false, false)
				ESX.ShowNotification('Otwarto pojazd o numerze rejestracyjnym ' ..string.upper(GetVehicleNumberPlateText(vehicle)))
			elseif pedd then
				ClearPedTasksImmediately(ped)
				SetVehicleDoorsLocked(vehicle, 1)
				SetVehicleDoorsLocked(veh, 1)
				TaskLeaveVehicle(pedd, vehicle, 4160)
				SetVehicleEngineOn(vehicle, false, false, false)
				ESX.ShowNotification('Otwarto pojazd o numerze rejestracyjnym ' ..string.upper(GetVehicleNumberPlateText(vehicle)))
			end
        else
				SetVehicleAlarm(vehicle, true)
				StartVehicleAlarm(vehicle)
				ClearPedTasksImmediately(ped)
				ESX.ShowNotification('Alarm w pojezdzie o numerze rejestracyjnym ' ..string.upper(GetVehicleNumberPlateText(vehicle)).. ' został włączony!')
				local random = math.random(1,10)
				if random <= 3 then
					ESX.ShowNotification('Twój wytrych się zniszczył!')
					TriggerServerEvent('many-base:removeItem', source, 'blowpipe', 1)
                end
            end
        end)
	end, 3, 20)
        else
            ESX.ShowNotification('Drzwi w pojezdzie o numerze rejestracyjnym ' ..string.upper(GetVehicleNumberPlateText(vehicle)).. ' są otwarte!')
        end
	elseif IsPedSittingInAnyVehicle(ped) then
		vehicle = GetVehiclePedIsIn(ped)
		SetVehicleEngineOn(vehicle, false, true, true)

	if not GetIsVehicleEngineRunning(vehicle) then
		TaskStartScenarioInPlace(ped, "prop_human_parking_meter", 0, true)

	exports['many_lib']:Circle(function(success)
      Citizen.CreateThread(function()
        Citizen.Wait(100)
        if success then
						ESX.ShowNotification('Odpalono silnik w pojeździe o numerze rejestracyjnym ' ..string.upper(GetVehicleNumberPlateText(vehicle)))
						SetVehicleEngineOn(vehicle, true, false, false)
						ClearPedTasksImmediately(ped)
						TaskWarpPedIntoVehicle(ped, vehicle, -1)
                    else
						ESX.ShowNotification('Alarm w pojezdzie o numerze rejestracyjnym ' ..string.upper(GetVehicleNumberPlateText(vehicle)).. ' został włączony!')
						SetVehicleAlarm(vehicle, true)
						StartVehicleAlarm(vehicle)
						ClearPedTasksImmediately(ped)
						TaskWarpPedIntoVehicle(ped, vehicle, -1)
						local random = math.random(1,10)
						if random <= 3 then
						ESX.ShowNotification('Twój wytrych się zniszczył!')
						TriggerServerEvent('blowpipe:remove')
                	end
        		end
      		end)
	 end, 3, 20)
  end
end
end)

--[[

ZAMYKA WSZYSTKIE LOKALNE FURY

]]

Citizen.CreateThread(function()
	while true do
		Wait(10)
		local ped = GetPlayerPed(-1)
		if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
			local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
			local lock = GetVehicleDoorLockStatus(veh)
			local vehicle = ESX.Game.GetClosestVehicle()
			local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
			if lock == 7 then
				SetVehicleEngineOn(veh, false, true, true)
				SetVehicleEngineOn(vehicle, false, true, true)
				SetVehicleDoorsLockedForAllPlayers(veh, true)
			end
			local pedd = GetPedInVehicleSeat(veh, -1)
			if pedd then
				--SetVehicleEngineOn(veh, false, true, true)
				SetPedCanBeDraggedOut(pedd, false)
			end
		end
	end
end)

--[[

# rowerki

]]

exports.qtarget:AddTargetModel({'ig_car3guy2'}, {
	options = {
        {
            event = "many-base:TakeBike",
            icon = "fas fa-comments-dollar",
            label = 'Wypożycz Rower',
          },
	},
	distance = 2
})

RegisterNetEvent('many-base:TakeBike')
AddEventHandler('many-base:TakeBike', function()
	if exports['many-base']:itemCount('money') >= 250 then
		TriggerServerEvent('many-base:removeItem', source, 'money', 250, nil)
	    local TR = PlayerPedId()
		local vehicle = 'tribike'
		local coords = GetEntityCoords(TR)
		local heading = GetEntityHeading(TR)
		RequestModel(vehicle)
		while not HasModelLoaded(vehicle) do
			Wait(0)
		end
		local JobVehicle = CreateVehicle(vehicle, coords, 45.0, true, false)
		SetVehicleHasBeenOwnedByPlayer(JobVehicle, true)
		SetEntityAsMissionEntity(JobVehicle, true, true)
		TaskWarpPedIntoVehicle(TR, JobVehicle, -1)
		--local plate = GetVehicleNumberPlateText(JobVehicle)
		--TriggerServerEvent('many-addkeys', plate)
	else
		ESX.ShowNotification('Potrzebujesz 250$ aby wynająć rower!')
	end
end)