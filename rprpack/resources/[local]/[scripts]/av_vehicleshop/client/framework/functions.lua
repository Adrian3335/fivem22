--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

RegisterNetEvent('av_vehicleshop:notification', function(msg)
    if Config.Framework == "QBCore" then
        QBCore.Functions.Notify(msg, 'primary')
    elseif Config.Framework == "ESX" then
        ESX.ShowNotification(msg)
    else
        -- Your custom notification trigger/export goes here
        lib.notify({
            title = 'AV Dealership',
            description = msg,
            type = 'inform'
        })
    end
end)

function BuyVehicle(model,plate)
    local hash = GetHashKey(model)
    local dealership = Config.Dealerships[currentDealer]
    local spawnCoords = dealership['purchased_vehicle_spawn']
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
    end
    local vehicle = CreateVehicle(hash, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.h, true, true)
    while not vehicle do Wait(0) end
    FreezeEntityPosition(PlayerPedId(),false)
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    SetVehicleDirtLevel(vehicle,0.0)
    SetVehicleNumberPlateText(vehicle,plate)
    GiveKeys(plate)
    local veh_props = {}
    if Config.Framework == "QBCore" then
        veh_props = QBCore.Functions.GetVehicleProperties(vehicle)
    elseif Config.Framework == "ESX" then
        veh_props = ESX.Game.GetVehicleProperties(vehicle)
    else
        veh_props = lib.getVehicleProperties(vehicle)
    end
    local class = GetVehicleClass(vehicle)
    local type = "car"
    if class == 14 then type = "boat" end
    if class == 15 or class == 16 then type = "airplane" end
    TriggerServerEvent('av_vehicleshop:setOwner', currentDealer, model, veh_props, type)
end

function GiveKeys(plate)
    Wait(500)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = GetVehicleNumberPlateText(vehicle)
    TriggerEvent('qb-vehiclekeys:client:AddKeys',plate) -- Used for qb-vehiclekeys
end

function isVIP()
    return exports['av_vip']:isVIP() 
end

function ServerCallback(cbName, cb, data)
    if Config.Framework == 'QBCore' then
        QBCore.Functions.TriggerCallback(cbName, function(data)
            if cb then cb(data) else return data end
        end, data)
    elseif Config.Framework == 'ESX' then
        ESX.TriggerServerCallback(cbName, function(data)
            if cb then cb(data) else return data end
        end, data)
    else
        local res = lib.callback.await(cbName, false, data)
        if cb then cb(res) else return res end
    end
end

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. 0 .. "f", num))
end

function DrawText2D(text, scale)
    if Config.OldTimer then
        SetTextFont(4)
        SetTextProportional(7)
        SetTextScale(scale, scale)
        SetTextColour(255, 255, 255, 255)
        SetTextDropShadow(0, 0, 0, 0,255)
        SetTextDropShadow()
        SetTextEdge(4, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString("~b~"..text.."~w~")
        DrawText(0.015, 0.725)
    else
        if lib.isTextUIOpen() then
            lib.hideTextUI()
        end
        lib.showTextUI(text)
    end
end

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

function pairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0
    local iter = function ()
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
    end
    return iter
end