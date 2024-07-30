exports("setDeath", function(mode, time)
    if mode == true then
        SendNUIMessage({name = "time", time = time})
    elseif mode == false then
        SendNUIMessage({name = "hide"})
    end
end)

local passengerDriveBy = true 


Citizen.CreateThread(function()
    while true do
        Wait(1)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local speed = GetEntitySpeed(vehicle)
        local kmh = 3.6
        local mph = 2.23694
        local vehicleClass = GetVehicleClass(vehicle)
        local vehicleModel = GetEntityModel(vehicle)


        if vehicleClass ~= 15 and 16 then
        GetEntitySpeed(GetPedInVehicleSeat(GetPlayerPed(-1), false)) 
        if math.floor(speed*kmh) > 50 then 
                SetPlayerCanDoDriveBy(PlayerId(), false)
            elseif passengerDriveBy then
                SetPlayerCanDoDriveBy(PlayerId(), true)
            else
                SetPlayerCanDoDriveBy(PlayerId(), false)
            end
        end
    end
end)