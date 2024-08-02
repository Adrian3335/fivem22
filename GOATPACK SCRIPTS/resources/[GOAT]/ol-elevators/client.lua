local ElevatorsOptions = {}
local index = 1
for k,v in pairs(Config.Elevator) do
    ElevatorsOptions[index] = {}
    for key,value in pairs(v) do

        ElevatorsOptions[index][key] = 
            {
                title = value.label,
                description = value.description,
                event = 'ol-elevator:teleport',
                arrow = true,
                args = value.coords,
            }
    end
    index=index+1
end

index = 1
for k,v in pairs(Config.Elevator) do
    lib.registerContext({
        id = 'olix_elevator_'..index,
        title = k,
        options = ElevatorsOptions[index]
    })
    index=index+1
end
Citizen.CreateThread(function()
    local show = false
    while true do
        Citizen.Wait(0)
		local sleep = true
        local ped = PlayerPedId()
        local pedcoords = GetEntityCoords(ped, false)
        local index = 1
        for _,i in pairs(Config.Elevator) do
            for k,v in pairs(i) do
                local distance = Vdist(pedcoords.x,pedcoords.y,pedcoords.z, v.coords.x, v.coords.y, v.coords.z)
                if distance <= Config.Distance then
                    sleep = false
                    if not show and Config.TextUI then
                        ShowTextUI(Config.ElevatorNotification)
                        show = true
                    end

                    if Config.ShowHelpNotification then
                        ShowHelpNotification(Config.ElevatorNotification)
                    end

                    DrawMarker(Config.ElevatorMarker.Type, v.coords.x, v.coords.y, v.coords.z+0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ElevatorMarker.Size.x, Config.ElevatorMarker.Size.y, Config.ElevatorMarker.Size.z, Config.ElevatorMarker.Color.r, Config.ElevatorMarker.Color.g, Config.ElevatorMarker.Color.b, 100, false, true, 2, false, false, false, false)
                        if IsControlJustPressed(0, 38) and IsPedOnFoot(ped) then
                            print('olix_elevator_'..index)
                            lib.showContext('olix_elevator_'..index)
                        end 	
                end
            end
            index=index+1
        end
        

		if sleep then
            if show and Config.TextUI then
                HideTextUI()
                show = false
            end
			Wait(1000)
		end
    end
end)


RegisterNetEvent('ol-elevator:teleport')
AddEventHandler('ol-elevator:teleport', function(coords)
    local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Wait(500)
	end

	ESX.Game.Teleport(playerPed, vector3(coords.x,coords.y,coords.z), function()
		DoScreenFadeIn(800)
        SetEntityHeading(playerPed, coords.w)
	end)
end)
