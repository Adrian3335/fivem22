local inCar = false
local cinemastate = false
local speed = 0
local dir = 0
local streetname = ""
local crossroad = ""
local isTalking = false

local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false
local wasInCar     = false

Citizen.CreateThread(function()
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(false, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)
    while true do
        Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        HideHudComponentThisFrame(3)
        HideHudComponentThisFrame(4)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(9)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    Wait(1000)
    SendNUIMessage({
        action = "playerLoaded"
    })
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(xPlayer, isNew, skin)
    SendNUIMessage({
        action = "playerLoaded"
    })
end)

function showCarhud()
    SendNUIMessage({
        action = 'showCarhud'
    })
    SendNUIMessage({
        action = 'seatbeltUpdate',
        seatbelt = not beltOn
    })
end
function hideCarhud()
    SendNUIMessage({
        action = 'hideCarhud'
    })
end
function getDirection(dir)
    direction = ""
    if dir >= 337.5 or dir <= 22.5 then
        direction = "North"
    elseif dir > 22.5 and dir < 67.5 then
        direction = "North East"
    elseif dir >= 67.5 and dir <= 112.5 then
        direction = "East"
    elseif dir > 112.5 and dir < 157.5 then
        direction = "South East"
    elseif dir >= 157.5 and dir <= 202.5 then
        direction = "South"
    elseif dir > 202.5 and dir < 247.5 then
        direction = "South West"
    elseif dir >= 247.5 and dir <= 292.5 then
        direction = "West"
    elseif dir > 292.5 and dir < 337.5 then
        direction = "North West"
    end
    return direction
end
function startProgress(time, title)
    time = tonumber(time)
    print('test')
    SendNUIMessage({
        action = 'startProgress',
        title = title,
        time = time
    })
end
function stopProgress()
    SendNUIMessage({
        action = 'stopProgress',
    })
end
function showNotify(title, description, icon)
    if icon then
        SendNUIMessage({
            action = 'showNotify',
            title = title,
            description = description,
            icon = icon
        })
    else
        SendNUIMessage({
            action = 'showNotify',
            title = title,
            description = description,
            icon = "fa-bell"
        })
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local ped = PlayerPedId()
        if(IsPedInAnyVehicle(ped, false)) then
            if(GetIsVehicleEngineRunning(GetVehiclePedIsIn(ped))) then
                if(inCar ~= true and cinemastate == false) then
                    DisplayRadar(true)
                    showCarhud()
                    inCar = true
                end
                inCar = true
            else
                DisplayRadar(false)
                if(inCar == true) then
                    hideCarhud()
                    inCar = false
                end
            end
        else
            DisplayRadar(false)
            if(inCar == true) then
                hideCarhud()
                inCar = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if inCar == true then
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped)
            speed = math.floor(GetEntitySpeed(veh) * 3.6)
            SendNUIMessage({
                action = 'carhudUpdate',
                speed = speed
            })
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if inCar == true then
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped)
            local fuel = GetVehicleFuelLevel(veh)
            street, crossroad = GetStreetNameAtCoord(table.unpack(GetEntityCoords(ped)))
            streetname = GetStreetNameFromHashKey(street)
            crossroad = GetStreetNameFromHashKey(crossroad)
            SendNUIMessage({
                action = 'carhudStreetUpdate',
                fuel = fuel,
                streetname = streetname,
                crossroad = crossroad,
            })
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(400)
        aspectratio = (math.floor(GetAspectRatio()*100))/100
        ultrawide = false
        pause = false
        if IsPauseMenuActive() == 1 then
            pause = true
        elseif IsPauseMenuActive() == false then
            pause = false
        end
        if aspectratio == 2.33 then
            ultrawide = true
        else
            ultrawide = false
        end
        SendNUIMessage({
            action = 'updateInfo',
            pause = pause,
            ultrawide = ultrawide
        })
    end
end)

local hungerC, thirstC = 0, 0

Citizen.CreateThread(function()
    while true do
        player = PlayerId()
        ped = PlayerPedId()
		Citizen.Wait(400)

        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            -- data.hunger =  math.floor(status.val / 10000)
            hungerC = math.floor(status.val / 10000)
        end)
        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            -- data.thirst =  math.floor(status.val / 10000)
            thirstC = math.floor(status.val / 10000)
        end)

        local data = {
            armor = GetPedArmour(ped),
            health = math.floor(((GetEntityHealth(ped) - 100) / (GetEntityMaxHealth(ped) - 100)) * 100),
            hunger = hungerC,
            thirst = thirstC,
            stamina = 0
        }
        -- TriggerEvent('esx_status:getStatus', 'hunger', function(status)
        --     -- data.hunger =  math.floor(status.val / 10000)
        --     hungerC = math.floor(status.val / 10000)
        -- end)
        -- TriggerEvent('esx_status:getStatus', 'thirst', function(status)
        --     -- data.thirst =  math.floor(status.val / 10000)
        --     thirstC = math.floor(status.val / 10000)
        -- end)
        if data.health <= 0 then
            data.health = 0
        end
        dir = 360.0 - ((GetGameplayCamRot(0).z + 360.0) % 360.0)
        direction = getDirection(dir)
        data.stamina = math.floor(100 - GetPlayerSprintStaminaRemaining(player))
        SendNUIMessage({
            action = 'updateHud',
            pause = data.pause,
            armor = data.armor,
            health = data.health,
            hunger = data.hunger,
            thirst = data.thirst,
            stamina = data.stamina,
            direction = direction,
            ultrawide = ultrawide
        })
    end
end)

AddEventHandler('entityDamaged', function(entity, lastHealth)
    if entity == PlayerPedId() then

        player = PlayerId()
        ped = PlayerPedId()
		Citizen.Wait(400)
        local data = {
            armor = GetPedArmour(ped),
            health = math.floor(((GetEntityHealth(ped) - 100) / (GetEntityMaxHealth(ped) - 100)) * 100),
            hunger = hungerC,
            thirst = thirstC,
            stamina = 0
        }
        if data.health <= 0 then
            data.health = 0
        end
        dir = 360.0 - ((GetGameplayCamRot(0).z + 360.0) % 360.0)
        direction = getDirection(dir)
        data.stamina = math.floor(100 - GetPlayerSprintStaminaRemaining(player))
        SendNUIMessage({
            action = 'updateHud',
            pause = data.pause,
            armor = data.armor,
            health = data.health,
            hunger = data.hunger,
            thirst = data.thirst,
            stamina = data.stamina,
            direction = direction,
            ultrawide = ultrawide
        })

    end
end)

local isTalking = false

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(100)
        if NetworkIsPlayerTalking(PlayerId()) and not isTalking then
            isTalking = true
            SendNUIMessage({
                action = 'updateVoiceTalk',
                talking = true
            })
        elseif not NetworkIsPlayerTalking(PlayerId()) and isTalking then
            isTalking = false
            SendNUIMessage({
                action = 'updateVoiceTalk',
                talking = false
            })
        end
    end
end)

RegisterNetEvent("pma-voice:setTalkingMode", function(range)
    if range == 1 then 
        range = 33
    end
    if range == 2 then
        range = 66
    end
    if range == 3 then
        range = 100
    end
	SendNUIMessage({
		action = "updateVoiceRange",
		range = range
	})
end)

RegisterNetEvent('hud:startProgress')
AddEventHandler('hud:startProgress', function(time, title)
    startProgress(time, title)
end)

RegisterNetEvent('hud:stopProgress')
AddEventHandler('hud:stopProgress', function()
    stopProgress()
end)

RegisterNetEvent('hud:showNotify')
AddEventHandler('hud:showNotify', function(title, description, icon)
    showNotify(title, description, icon)
end)

RegisterCommand('hud', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'showSettings'
    })
end)

RegisterNUICallback('hideSettings', function(data, cb)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('cinema', function(data)
    cinemastate = data.status
    if(data.status == true) then
        DisplayRadar(false)
    elseif data.status == false and inCar == true then
        DisplayRadar(true)
    end
end)

-- RegisterCommand('testpowiadomienie', function()
--     TriggerEvent("hud:showNotify", "test", "test")
-- end)

-- RegisterCommand('testpowiadomienie2', function()
--     TriggerEvent("hud:showNotify", "test", "test", "fa-circle-info")
-- end)

-- RegisterCommand('testprogress', function()
--     TriggerEvent("hud:startProgress", 5000, "test")
-- end)

-- RegisterCommand('testprogress2', function()
--     TriggerEvent("hud:stopProgress")
-- end)

-- RegisterCommand('testfocus', function()
--     SetNuiFocus(true, true)
-- end)

-- RegisterCommand('testfocus', function()
--     SendNUIMessage({
--         action = 'seatbeltUpdate',
--         seatbelt = false
--     })
-- end)

IsCar = function(veh)
        local vc = GetVehicleClass(veh)
        return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end 

Fwv = function (entity)
        local hr = GetEntityHeading(entity) + 90.0
        if hr < 0.0 then hr = 360.0 + hr end
        hr = hr * 0.0174533
        return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

--------- PASY 
Citizen.CreateThread(function()
  while true do
  Citizen.Wait(10)
  
    local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped, false) then

		local car = GetVehiclePedIsIn(ped)	

			if car ~= 0 and (wasInCar or IsCar(car)) then
			  wasInCar = true

			  if beltOn then DisableControlAction(0, 75) end

			  speedBuffer[2] = speedBuffer[1]
			  speedBuffer[1] = GetEntitySpeed(car)
			  
			  if speedBuffer[2] ~= nil 
				 and not beltOn
				 and GetEntitySpeedVector(car, true).y > 1.0  
				 and speedBuffer[1] > 19.25 
				 and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
				 
				local co = GetEntityCoords(ped)
				local fw = Fwv(ped)
				SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
				SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
				Citizen.Wait(1)
				SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
			  end
				
			  velBuffer[2] = velBuffer[1]
			  velBuffer[1] = GetEntityVelocity(car)
			  
			elseif wasInCar then
			  wasInCar = false
			  beltOn = false
			  speedBuffer[1], speedBuffer[2] = 0.0, 0.0

			end
		else
			beltOn = false
			Citizen.Wait(750)
		end
	end
end)

RegisterCommand("seatbelt", function(source, args, raw)
	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped, false) then
		local car = GetVehiclePedIsIn(ped)	
		if car ~= 0 and (wasInCar or IsCar(car)) then
			beltOn = not beltOn 
			if beltOn then 
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 3, "belton", 0.5)
                Wait(500)
                SendNUIMessage({
                    action = 'seatbeltUpdate',
                    seatbelt = false
                })
			else 
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 3, "beltoff", 0.5)
                Wait(500)
                SendNUIMessage({
                    action = 'seatbeltUpdate',
                    seatbelt = true
                })
			end
		end
	end
end)
TriggerEvent('chat:removeSuggestion', '/seatbelt')
RegisterKeyMapping('seatbelt', 'Pasy bezpieczeństwa', 'keyboard', 'b')


RegisterNetEvent('coco_hud:setRadioData')
AddEventHandler('coco_hud:setRadioData', function(radioChannelF, radioCountPlayerF, radioData)
	SendNUIMessage({
		radioChannel = radioChannelF,
		radioCountPlayer = radioCountPlayerF,
		playersRadio = radioData
	})
end)