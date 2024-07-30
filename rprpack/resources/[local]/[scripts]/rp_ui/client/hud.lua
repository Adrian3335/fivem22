Main = {
    HUD = {},
}
local HUD = {}
local playerData = {
    playerId = nil,
    playerServerId = nil,
    InVehicle = false,
    inPauseMenu = false,
    currentVehicle = nil,
    belt = false,
    tempomat = false
}

local displayRadar = false
local ScrollStatus = true


--Class function
HUD.SendNUIMessage = function(action, data)
    return SendNUIMessage({
        action = action,
        data = data,
    })
end

Main.HUD.StartNUI = function()
    return HUD.SendNUIMessage('startNUI', {
        playerID = GetPlayerServerId(PlayerId()),
    })
end

Main.HUD.MainThread = function()
    repeat
        Wait(500)
    until ESX.PlayerLoaded

    CreateThread(function()
        while ESX.PlayerLoaded do
            local _wait = 100
            local voice = NetworkIsPlayerTalking(PlayerId())
            -- displayRadar = exports["lb-phone"]:IsOpen()
            
            if displayRadar and ScrollStatus == true then
                DisplayRadar(true)
            else
                DisplayRadar(false)
            end
    
            HUD.SendNUIMessage('updateUpdateVoice', {
                voice = voice
            })
    
            Wait(_wait)
        end
    end)

    return
end

HUD.SetTalkingMode = function(mode) 
    if mode == 1 then
        mode = 20
    elseif mode == 2 then  
        mode = 50
    elseif mode == 3 then  
        mode = 100
    end
    
    return HUD.SendNUIMessage('setTalkingMode', {
        proximity = mode
    })
end

HUD.PauseMenu = function(data)
    playerData.inPauseMenu = data

    return HUD.SendNUIMessage('pauseMenu', {
        pause = data,
    })
end

HUD.SetDataSpeedometr = function(data)
    local speed = tostring(math.ceil(data.speed * 3.6))

    return HUD.SendNUIMessage('updateCarHud', {
        inVehicle = true,
        percentRPM = data.rpm,
        speed = speed,
        fuel = data.fuel,
        engine = data.engine,
        tempomat = data.tempomat
    })
end

HUD.UpdateBelt = function(status)
    HUD.SendNUIMessage('updateBelt', {
        belt = status,
    })
end

local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', } 
HUD.EnteredVehicle = function(vahicle)
    playerData.currentVehicle = vahicle
    playerData.InVehicle = true
    displayRadar = true

    CreateThread(function()
        while playerData.InVehicle do
            local _wait = 1000
            if playerData.InVehicle and ScrollStatus == true then
                for k, v in pairs(directions) do
                    direction = GetEntityHeading(ESX.PlayerData.ped)
                    if math.abs(direction - k) < 22.5 then
                        direction = v
                        break
                    end
                end
                local x, y, z = table.unpack(GetEntityCoords(ESX.PlayerData.ped))
                local ul = GetStreetNameAtCoord(x, y, z)
                local ulica = GetStreetNameFromHashKey(ul)
                local zone = GetLabelText(GetNameOfZone(x,y,z))

                HUD.SendNUIMessage('updateStreetLabel', {
                    direction = direction;
                    zone = zone;
                    street = ulica;
                })
            else
                _wait = 5000
            end
            Wait(_wait)
        end
    end)

    CreateThread(function()
        while playerData.InVehicle do
            local _wait = 50
            if playerData.InVehicle and ScrollStatus == true then
                local rpm_show = GetVehicleCurrentRpm(playerData.currentVehicle)
                local speed = GetEntitySpeed(playerData.currentVehicle)
                local fuelamount = math.floor(GetVehicleFuelLevel(playerData.currentVehicle) or 0)
    
                HUD.SetDataSpeedometr({
                    speed = speed, 
                    rpm = rpm_show, 
                    fuel = fuelamount,
                    engine = GetIsVehicleEngineRunning(playerData.currentVehicle),
                    tempomat = playerData.tempomat
                })
                _wait = 50
            else
                _wait = 1000
            end
            Wait(_wait)
        end
    end)
end
HUD.ExitedVehicle = function()
    playerData.InVehicle = false
    displayRadar = false

    return HUD.SendNUIMessage('updateCarHud', {
        inVehicle = playerData.InVehicle,
    })
end

HUD.UpdateStatus = function(data)
    local hunger, thirst
    for i = 1, #data do
        if data[i].name == 'thirst' then 
            thirst = math.floor(data[i].percent) 
        elseif data[i].name == 'hunger' then 
            hunger = math.floor(data[i].percent) 
        end
    end

    TriggerEvent('esx_status:getStatus', 'hunger', function(status)
        hunger = status.getPercent()
        if hunger == 15 then
            exports["dbl_notify"]:Notify('hunger', 'Powiadomienie', "Uwaga, zaczyna burczeć ci w brzuchu")
        end
    end)

    TriggerEvent('esx_status:getStatus', 'thirst', function(status)
        thirst = status.getPercent()
        if thirst == 15 then 
            exports["dbl_notify"]:Notify('thirst', 'Powiadomienie', "Uwaga, odwadniasz się!")
        end
    end)

    local health = math.floor(GetEntityHealth(ESX.PlayerData.ped) - 100)
    if ESX.PlayerData.dead then
        health = 0
    end

    return HUD.SendNUIMessage('updateStatus', {
        hunger = hunger,
        thirst = thirst,
        health = health,
        armor = GetPedArmour(ESX.PlayerData.ped),
    })
end

RegisterNUICallback('CloseHudEdit', function()
    SetNuiFocus(false, false)
end)

RegisterCommand("hud", function()
    SetNuiFocus(true, true)
    return HUD.SendNUIMessage('openHudEdit', {})
end)

local function ChangeMinimap(data)
    if data.minimapSide == 'left' then
        RequestStreamedTextureDict("circlemap", false)
        repeat
            Wait(100)
        until HasStreamedTextureDictLoaded("circlemap")

        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")

        SetMinimapClipType(1)
        -- SetMinimapComponentPosition("minimap", "L", "B", 0.8195, 0.002, 0.163, 0.20)
        -- SetMinimapComponentPosition("minimap_mask", "L", "B", 0.8195, 0.002, 0.193, 0.164)
        -- SetMinimapComponentPosition("minimap_blur", "L", "B", 0.8195, 0.002, 0.229, 0.310)
        SetMinimapComponentPosition("minimap", "L", "B", 0.8025, -0.03, 0.153, 0.22)
        SetMinimapComponentPosition("minimap_mask", "L", "B", 0.7895, 0.12, 0.093, 0.164)
        SetMinimapComponentPosition("minimap_blur", "L", "B", 0.7895, 0.022, 0.256, 0.337)
    elseif data.minimapSide == 'right' then
        RequestStreamedTextureDict("circlemap", false)
        repeat
            Wait(100)
        until HasStreamedTextureDictLoaded("circlemap")

        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")

        SetMinimapClipType(1)
        SetMinimapComponentPosition("minimap", "L", "B", 0.025, -0.03, 0.153, 0.22)
        SetMinimapComponentPosition("minimap_mask", "L", "B", 0.135, 0.12, 0.093, 0.164)
        SetMinimapComponentPosition("minimap_blur", "L", "B", 0.012, 0.022, 0.256, 0.337)
    end

    SetMinimapClipType(1)

    SetRadarBigmapEnabled(true, false)
    Wait(1)
    SetRadarBigmapEnabled(false, false)
end
RegisterNUICallback('ChangeMinimap', ChangeMinimap)

HUD.MinimapThread = function()
    local minimap = RequestScaleformMovie("minimap")
    while true do
        Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end

CreateThread(HUD.MinimapThread)

exports("UpdateTempomat", function(status)
    playerData.tempomat = status
end)
AddEventHandler('esx_status:onTick', HUD.UpdateStatus)
AddEventHandler('pma-voice:setTalkingMode', HUD.SetTalkingMode)

AddEventHandler('es_extended:updateBeltStatus', HUD.UpdateBelt)
AddEventHandler('esx:pauseMenuActive', HUD.PauseMenu)
AddEventHandler('esx:enteredVehicle', HUD.EnteredVehicle)
AddEventHandler('esx:exitedVehicle', HUD.ExitedVehicle)



local progstatus = false
local progactive = false

-- RegisterCommand('testprog', function()
--     local success = Progbar('Testowy ProgBar', 1000)
--     if success then
--     else
--         print('jajko2')
--     end
-- end)


function Progbar(label, time, cb, canCancel)
    if progstatus == true then return end
    if canCancel == nil then canCancel = true end
    
    progactive = true

    SendNUIMessage({
		action = "showProgressBar";
		label = label;
		duration = time;
	})

    while progactive do
        if IsControlJustPressed(0, 73) and canCancel then
            SendNUIMessage({
                action = 'cancelProgressBar'
            })
        end
        Wait(0)
    end


    if cb then
        cb(progstatus)
    end

    local temp = progstatus 
    progstatus = false 
    progactive = false
    return temp
end

exports("CancelProgbar", function()
    SendNUIMessage({
        action = 'cancelProgressBar'
    })
end)

RegisterNUICallback('sendRequest', function(data, cb)
    if data.action == "finishProgressBar" then
        progactive = false
        progstatus = true
        cb('ok')
    end

    if data.action == "cancelProgressBar" then
        progactive = false
        progstatus = false
        cb('ok')
    end
end)

local function ToggleHud(dataType, data)
    if dataType.hudstatus == true then
        HUD.SendNUIMessage('toggleHud', {
            type = 'hud',
            status = data,   
        })
    end

    if dataType.watermark == true then
        HUD.SendNUIMessage('toggleHud', {
            type = 'watermark',
            status = data,
        })
    end

    if dataType.carhud == true then
        HUD.SendNUIMessage('toggleHud', {
            type = 'carhud',
            status = data,
        })
    end

    if dataType.radar == true then            
        displayRadar = data
    end
end


RegisterCommand("-toggleHud", function()
    if playerData.inPauseMenu == false then
        ScrollStatus = not ScrollStatus

        ToggleHud({
            hudstatus = true,
            watermark = true,
            exports["dbl_notifications"]:HideBodyCam(not ScrollStatus),
        }, ScrollStatus)
    


        if playerData.InVehicle then
            ToggleHud({
                radar = true,
                carhud = true,
            }, ScrollStatus)
        end
    end
end)
RegisterKeyMapping("-toggleHud", "Chowanie hudu", "MOUSE_BUTTONANY", "MOUSE_MIDDLE")

exports("ToggleHud", function(data)
    ScrollStatus = data
    ToggleHud({
        hudstatus = true,
        watermark = true,
        
    }, ScrollStatus)
end)

local cam = false
RegisterCommand("cam", function()
    cam = not cam

    if playerData.InVehicle then
        displayRadar = not cam
    end

    ScrollStatus = not cam
    ToggleHud({
        hudstatus = true,
        watermark = true,
        carhud = playerData.InVehicle
    }, ScrollStatus)
    exports["dbl_notifications"]:HideBodyCam(cam)

    return HUD.SendNUIMessage('toggleHud', {
        status = cam,
        type = 'cam',
    })
end)

--Belt
RegisterNUICallback('UpdateColor', function(data)
    TriggerEvent('dbl_ui:client:updateColor', data)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    return HUD.SendNUIMessage('UpdateColor', {})
end)

