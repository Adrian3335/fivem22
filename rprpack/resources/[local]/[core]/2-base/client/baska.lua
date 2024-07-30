local Keys = {
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


ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

	ScriptLoaded()
end)

exports['ox_target']:addBoxZone({
    coords = vec3(299.357, -588.368, 43.269),
    size = vec3(1.0, 1.0, 1.0),
    rotation = 25,
    drawSprite = true,
    debug = false,
    options = {
        {
            event = 'yellowkasakurwo:Last',
            name = 'baska',
            label = 'Ulecz',
            icon = 'fa-solid fa-staff-snake',
            distance = 2
        }
    }
})

function ScriptLoaded()
	LoadLocations()
end

local Locations = {  }

function LoadLocations()

	Citizen.CreateThread(function()

		while true do

			local sleepThread = 500

			local ped = PlayerPedId()
			local pedCoords = GetEntityCoords(ped)

			for locationId, v in pairs(Locations) do
				local distanceCheck = GetDistanceBetweenCoords(pedCoords, v["x"], v["y"], v["z"], true)

				if distanceCheck <= 10.0 then
					sleepThread = 5

					ESX.Game.Utils.DrawText3D(v, "" .. locationId, 0.5)

					if distanceCheck <= 2.0 then
                        if IsControlJustPressed(0, 38) then
                            ESX.TriggerServerCallback('yellowkasakurwo:money', function(hasMoney)
            
                            TriggerServerEvent('yellowkasakurwo:check')
                            end)
						end
					end					
				end
			end
			Citizen.Wait(sleepThread)
		end
	end)
end

function DoAction(action)
    if action == "Reception" then
        ESX.ShowNotification('Lekarz zajmuje się tobą..')
        SetEntityCoords(GetPlayerPed(-1), 322.16723632812, -589.46649169922, 43.990329742432, 252.15016174316)
        SetEntityHeading(GetPlayerPed(-1), 252.15016174316)
        TriggerEvent('esx_ambulancejob:menuopeninventory', GetPlayerPed(-1))
        SetEntityHealth(GetPlayerPed(-1), 200)
        Citizen.Wait(500)
        ERINProgress()
        Citizen.Wait(500)
        Citizen.CreateThread(function()
            local timeStarted = GetGameTimer()
            local Reception = true
            local time = 80000
			while Reception do

				Citizen.Wait(5)

                --[[local percent = (GetGameTimer() - timeStarted) / time * 100
                local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
                CreateThread(function() 
                    exports['ox_lib']:progressCircle({
                        duration = 40000,
                        position = 'bottom',
                        label = 'Lekarz zajmuje się tobą...',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                            combat = true,
                        },
                    }) 
                end)]]

                if lib.progressCircle({
                    duration = 50000,
                    label = 'Lekarz zajmuje się tobą..',
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        car = true,
                        move = true,
                        combat = true
                    }
                }) then
                    ClearPedTasksImmediately(GetPlayerPed(-1))
                    Reception = false
                    TriggerEvent('hypex_ambulancejob:hypexrevive')
                    ESX.ShowNotification('Będziesz czuć lekarstwo przez kilka minut, unikaj prowadzenia pojazdu!')
                    StartScreenEffect('HeistCelebPass', 0, true)
                    Citizen.Wait(60000)
                    StopAllScreenEffects(GetPlayerPed(-1))
				end
			end
		end)
    end
end

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(GetPlayerPed(-1), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
	end)
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

function ERINProgress()

    SetEntityCoords(GetPlayerPed(-1), 311.654, -586.692, 44.175, 247.156)
    RequestAnimDict('anim@gangops@morgue@table@')
    while not HasAnimDictLoaded('anim@gangops@morgue@table@') do
        Citizen.Wait(0)
    end
    TaskPlayAnim(GetPlayerPed(-1), 'anim@gangops@morgue@table@' , 'ko_front' ,8.0, -8.0, -1, 1, 0, false, false, false )
    SetEntityHeading(GetPlayerPed(-1), -25 + 252.15016174316)
    InAction = true


    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
        end
    end)
end

function Nurse()
    wanted_model="s_m_m_paramedic_01"
    modelHash = GetHashKey(wanted_model)
    RequestModel(modelHash)

    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    SetEntityAsMissionEntity(Nurse1)
    Wait(1500)

    SetPedDesiredHeading(Nurse1, 252.15016174316)
    Wait(100)
    
    TaskGoStraightToCoord(Nurse1, 322.16723632812, -589.46649169922, 43.990329742432, 252.15016174316, 5000, 255.50, 2.0)
    Wait(5000)

    TaskStartScenarioInPlace(Nurse1, "WORLD_HUMAN_CLIPBOARD", 0, false)
    Wait(110000)
    TaskGoStraightToCoord(Nurse1, 322.16723632812, -589.46649169922, 43.990329742432, 252.15016174316, 5000, 70.50, 2.0)
    Wait(5000)
    DeleteEntity(Nurse1)
end

RegisterNetEvent('yellowkasakurwo:Last')
AddEventHandler('yellowkasakurwo:Last', function()
    TriggerServerEvent('yellowkasakurwo:pay')
        TriggerServerEvent('esx_society:addMoney', 'ambulance', 3000)
        DoAction("Reception")
    Nurse()
end)