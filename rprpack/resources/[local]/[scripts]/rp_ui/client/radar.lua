local radarShown = false
local radarFreeze = false
local radarFront = false
local radarBack = false
local vehicle = GetVehiclePedIsIn(ESX.PlayerData.ped)
local ped = PlayerPedId()

lib.onCache("vehicle", function(value)
    vehicle = value

    if vehicle and vehicle ~= 0 and GetVehicleClass(vehicle) == 18 then
        radarShown = true
    else
        radarShown = false
    end

    radarFreeze = false
    SendNUIMessage({
        action = "togglePoliceRadar",
        state = radarShown
    })
end)

lib.onCache("ped", function(value)
    ped = value
end)

CreateThread(function()
    while true do
        if vehicle and vehicle ~= 0 and radarShown then
            if not radarFreeze then
                local coords1 = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 5.0, 0.0)
                local coords2 = GetOffsetFromEntityInWorldCoords(vehicle, -2.5, 50.0, 0.0)
                local rayHandle1 = StartShapeTestCapsule(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z, 5.0, 10, vehicle, 7)
                local _, _, _, _, shapeResult1 = GetShapeTestResult(rayHandle1)

                if IsEntityAVehicle(shapeResult1) then
                    radarFront = {
                        GetDisplayNameFromVehicleModel(GetEntityModel(shapeResult1)),
                        math.ceil(GetEntitySpeed(shapeResult1) * 3.6),
                        GetVehicleNumberPlateText(shapeResult1),
                        GetVehicleNumberPlateTextIndex(shapeResult1)
                    }
                else
                    radarFront = false
                end

                local coords3 = GetOffsetFromEntityInWorldCoords(vehicle, -2.5, -50.0, 0.0)
                local rayHandle2 = StartShapeTestCapsule(coords1.x, coords1.y, coords1.z, coords3.x, coords3.y, coords3.z, 5.0, 10, vehicle, 7)
                local _, _, _, _, shapeResult2 = GetShapeTestResult(rayHandle2)

                if IsEntityAVehicle(shapeResult2) then
                    radarBack = {
                        GetDisplayNameFromVehicleModel(GetEntityModel(shapeResult2)),
                        math.ceil(GetEntitySpeed(shapeResult2) * 3.6),
                        GetVehicleNumberPlateText(shapeResult2),
                        GetVehicleNumberPlateTextIndex(shapeResult2)
                    }
                else
                    radarBack = false
                end

                SendNUIMessage({
                    action = "updatePoliceRadar",
                    front = radarFront,
                    back = radarBack
                })
            end
        elseif radarShown then
            SendNUIMessage({
                action = "togglePoliceRadar",
                state = false
            })
            radarFreeze = false
        end
        Wait(500)
    end
end)

RegisterCommand("+NEEDRPpoliceRadarFreezeToggle", function() end)
RegisterCommand("-NEEDRPpoliceRadarFreezeToggle", function()
    if not vehicle or vehicle == 0 or GetVehicleClass(vehicle) ~= 18 then
        return
    end

    radarFreeze = not radarFreeze
    SendNUIMessage({
        action = "policeRadarFreezeToggle",
        state = radarFreeze
    })
end)
RegisterKeyMapping("+NEEDRPpoliceRadarFreezeToggle", "Uruchom/Zatrzymaj radar policyjny", "keyboard", "NUMPAD5")