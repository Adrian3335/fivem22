--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

currentVehicle = nil
local prevCoords = nil
local prevHeading = nil
local click = 0
local currentCategory = nil
local busy = false
VIPstatus = false
vehData = {}
tuningcoords = nil

RegisterNUICallback('openCategory', function(data,cb) -- Category > Get all vehicles from that category
    if busy then return end
    busy = true
    currentCategory = data
    openCategory()
    cb('ok')
end)

RegisterNUICallback('showVehicle', function(data,cb)
    if click >= 1 then cb('ok') return end
    if busy then return end
    busy = true
    click = click + 1
    local name = data.name
    local label = data.label
    local stock = data.stock
    if currentVehicle then
        while DoesEntityExist(currentVehicle) do
            SetEntityAsMissionEntity(currentVehicle,false,false)
            DeleteVehicle(currentVehicle)
            Wait(0)
        end
    end
    local hash = GetHashKey(name)
    if not IsModelInCdimage(hash) then 
        print('This model doesnt exist') 
        cb("ok") 
        return 
    end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
    end
    local vehCoords = Config.Dealerships[currentDealer]['preview_vehicle_coords']
    currentVehicle = CreateVehicle(hash, vehCoords.x, vehCoords.y, vehCoords.z, vehCoords.h, false, true)
    while not DoesEntityExist(currentVehicle) do Wait(0) end
    SetVehicleDirtLevel(currentVehicle,0.0)
    local vehInfo = calculateStats(currentVehicle)
    local canBuy = Config.Dealerships[currentDealer].buy_vehicle
    if Config.Dealerships[currentDealer].av_vip then
        canBuy = VIPstatus
    end
    vehData['info'], vehData['class'], vehData['brand'] = vehInfo['info'], vehInfo['class'], vehInfo['brand']
    vehData['name'], vehData['label'], vehData['stock'] = name, label, stock
    vehData['tuning'], vehData['buy'], vehData['test'] = Config.AVTuning, canBuy, Config.Dealerships[currentDealer].test_vehicles
    vehData['unit'] = Config.SpeedUnit
    local speed = GetVehicleEstimatedMaxSpeed(currentVehicle)
    if Config.SpeedUnit == "mph" then
        vehData['speed'] = Round(speed * 2.236936)
    else
        vehData['speed'] = Round(speed * 3.6)
    end
    vehData['seats'] = GetVehicleModelNumberOfSeats(hash)
    SendNUIMessage({
        action = "showDetails",
        data = {
            state = true
        }
    })
    Wait(100)
    SendNUIMessage({
        action = "vehData",
        data = {
            vehData = vehData,
        }
    })
    SetModelAsNoLongerNeeded(hash)
    click = 0
    busy = false
    cb('ok')
end)

RegisterNUICallback("testDrive", function(data, cb)
    if busy then return end
    busy = true
    local model = data.name
    prevCoords = GetEntityCoords(PlayerPedId())
    prevHeading = GetEntityHeading(PlayerPedId())
    local coords = Config.Dealerships[currentDealer].test_coords
    SendNUIMessage({
        action = "close"
    })
    SetNuiFocus(false,false)
    DoScreenFadeOut(100)
    Wait(1000)
    ClearFocus()
    RenderScriptCams(false, false, 0, 1, 0)
    if currentVehicle then
        while DoesEntityExist(currentVehicle) do
            SetEntityAsMissionEntity(currentVehicle,false,false)
            DeleteVehicle(currentVehicle)
            Wait(0)
        end
    end
    currentVehicle = nil
    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(0)
    end
    currentVehicle = CreateVehicle(hash, coords.x, coords.y, coords.z, coords.h, true, true)
    while not currentVehicle do Wait(0) end
    FreezeEntityPosition(PlayerPedId(),false)
    TaskWarpPedIntoVehicle(PlayerPedId(), currentVehicle, -1)
    SetVehicleDirtLevel(currentVehicle,0.0)
    SetVehicleNumberPlateText(currentVehicle,Config.VehicleTestPlates)
    GiveKeys(Config.VehicleTestPlates)
    inMenu = false
    Wait(1000)
    DoScreenFadeIn(50)
    local drawText = false
    local count = Config.DriveTestTime * 60 * 100
    local netId = NetworkGetNetworkIdFromEntity(currentVehicle)
    TriggerServerEvent('av_vehicleshop:addTimer', netId)
    while count > 1 and IsPedInAnyVehicle(PlayerPedId()) do
        count = count - 1
        local seconds = count / 100
        local minutes = math.floor(seconds / 60.0)
        seconds = round(seconds - 60.0 * minutes)
        DrawText2D(Lang['time_left']..' '..minutes..':'..seconds, 0.7)
        Wait(1)
        if GetPedInVehicleSeat(currentVehicle, -1) ~= PlayerPedId() then break end
    end
    if not Config.OldTimer then
        if lib.isTextUIOpen() then
            lib.hideTextUI()
        end
    end
    DoScreenFadeOut(100)
    Wait(1000)
    while DoesEntityExist(currentVehicle) do
        SetEntityAsMissionEntity(currentVehicle,false,false)
        DeleteVehicle(currentVehicle)
        SetEntityAsNoLongerNeeded(currentVehicle)
        Wait(10)
    end
    SetModelAsNoLongerNeeded(hash)
    currentVehicle = nil
    SetEntityCoords(PlayerPedId(),prevCoords)
    SetEntityHeading(PlayerPedId(),prevHeading)
    Wait(1000)
    DoScreenFadeIn(3000)
    busy = false
    cb("ok")
end)

RegisterNUICallback("tuningVehicle", function(data, cb)
    local model = data.name
    if GetEntityModel(currentVehicle) == GetHashKey(model) then
        SendNUIMessage({
            action = "openTuner"
        })
        DoScreenFadeOut(100)
        Wait(1000)
        SetNuiFocus(false, false)
        SetCamActive(prevCam, false)
        ClearFocus()
        RenderScriptCams(false, 1, 0, 1, 0)
        SetEntityAlpha(PlayerPedId(), 1, false)
        tuningcoords = tuningcoords or {}
        tuningcoords['coords'] = GetEntityCoords(PlayerPedId())
        tuningcoords['heading'] = GetEntityHeading(PlayerPedId())
        TaskWarpPedIntoVehicle(PlayerPedId(),currentVehicle, -1)
        TriggerEvent('av_tuning:showroom',currentVehicle)
        Wait(500)
        DoScreenFadeIn(50)
    end
    cb("ok")
end)

RegisterNUICallback("buyVehicle", function(data, cb)
    if busy then return end
    local model = data.name
    local stock = data.stock
    if tonumber(stock) > 0 then
        busy = true
        ServerCallback('av_vehicleshop:buy', function(data)
            if data and data.res then
                SendNUIMessage({
                    action = "close"
                })
                DoScreenFadeOut(0)
                Wait(400)
                if currentVehicle then
                    SetEntityAsMissionEntity(currentVehicle,false,false)
                    DeleteVehicle(currentVehicle)
                    currentVehicle = nil
                    Wait(100)
                end
                FreezeEntityPosition(PlayerPedId(),false)
                BuyVehicle(model, data.plate)
                DoScreenFadeIn(1000)
                SetNuiFocus(false, false)
                ClearFocus()
                RenderScriptCams(false, false, 0, 1, 0)
                inMenu = false
                busy = false
            end
            busy = false
        end, {model = model, category = currentCategory, type = Config.Dealerships[currentDealer].money_account, dealership = currentDealer})
    end
    cb("ok")
end)

RegisterNUICallback('close', function(data,cb)
    DoScreenFadeOut(0)
    Wait(400)
    if currentVehicle then
        SetEntityAsMissionEntity(currentVehicle,false,false)
        DeleteVehicle(currentVehicle)
        currentVehicle = nil
        Wait(100)
    end
    FreezeEntityPosition(PlayerPedId(),false)
    DoScreenFadeIn(1000)
    SetNuiFocus(false, false)
    ClearFocus()
    RenderScriptCams(false, false, 0, 1, 0)
    inMenu = false
    busy = false
    cb("ok")
end)

function openCategory()
    local menu = {}
    local ready = false
    ServerCallback('av_vehicleshop:getCategory', function(vehicles)
        if vehicles then
            for k, v in pairsByKeys(vehicles) do
                local hash = GetHashKey(v['name'])
                if IsModelInCdimage(hash) then
                    local label = ''
                    if Config.Framework == "QBCore" then
                        if QBCore.Shared.Vehicles[v['name']] then
                            label = QBCore.Shared.Vehicles[v['name']]['name']
                        else
                            label = GetLabelText(GetDisplayNameFromVehicleModel(hash))
                        end
                    else
                        label = GetLabelText(GetDisplayNameFromVehicleModel(hash))
                    end
                    label = string.lower(label)
                    if label == "carnotfound" or label == "null" then
                        label = v['name']
                    end
                    table.insert(menu, {label = label, stock = v['stock'], price = v['price'], name = v['name']})
                else
                    print("[IMPORTANT] Vehicle "..v['name'].." doesn't exist in game, please verify your "..currentCategory.." category")
                    print("[IMPORTANT] Vehicle "..v['name'].." doesn't exist in game, please verify your "..currentCategory.." category")
                    print("[IMPORTANT] Vehicle "..v['name'].." doesn't exist in game, please verify your "..currentCategory.." category")
                end
            end
            SendNUIMessage({
                action = "setCarousel",
                data = {
                    type = "vehicles",
                    elements = menu,
                    sign = Config.Dealerships[currentDealer].money_sign,
                }
            })
            ready = true
        else
            TriggerEvent("av_vehicleshop:notification", Lang['empty_category'])
            print('[ERROR] This category is empty')
        end
        busy = false
    end, currentCategory)
    while not ready do Wait(50) end
end