local ESX = exports["es_extended"]:getSharedObject()
local loadingScreenFinished = false
local guiEnabled = false
local guiLoaded = false

RegisterNetEvent('vms_identity:alreadyRegistered', function()
    while not loadingScreenFinished do 
        Wait(100) 
    end
    TriggerEvent('esx_skin:playerRegistered')
end)

AddEventHandler('esx:loadingScreenOff', function()
    loadingScreenFinished = true
end)

RegisterNUICallback('ready', function(data, cb)
    guiLoaded = true
    cb(1)
end)

function EnableGui(state)
    while not guiLoaded do
        Wait(10)
    end
    SetNuiFocus(state, state)
    guiEnabled = state
    if Config.EnableBlur then
        if state then
            SetTimecycleModifier("hud_def_blur")
        else
            ClearTimecycleModifier()
        end
    end
    SendNUIMessage({
        type = "enableui", 
        enable = state,
        height = Config.LimitHeight
    })
end

RegisterNetEvent('vms_identity:showRegisterIdentity', function()
    while not loadingScreenFinished do
        Wait(10)
    end
    TriggerEvent('esx_skin:resetFirstSpawn')
    if not ESX.PlayerData.dead then 
        EnableGui(true) 
    end
end)

RegisterNUICallback('register', function(data, cb)
    ESX.TriggerServerCallback('vms_identity:registerIdentity', function(callback)
        if callback == true then
            SendNUIMessage({type = "clearInputs"})
            Config.Notification(Config.Translate["register_notify"], Config.Translate['register_success'], "success")
            EnableGui(false)
            if data.sex == "f" then
                local model = GetHashKey("mp_f_freemode_01")
                RequestModel(model)
                while not HasModelLoaded(model) do
                    RequestModel(model)
                    Wait(0)
                end
                SetPlayerModel(PlayerId(), model)
                SetModelAsNoLongerNeeded(model)
            else
                local model = GetHashKey("mp_m_freemode_01")
                RequestModel(model)
                while not HasModelLoaded(model) do
                    RequestModel(model)
                    Wait(0)
                end
                SetPlayerModel(PlayerId(), model)
                SetModelAsNoLongerNeeded(model)
            end
            if not Config.Multichars then
                TriggerEvent('skinchanger:loadSkin', {sex = 0}, function()
                    ResetEntityAlpha(PlayerPedId())
                    SetPedAoBlobRendering(PlayerPedId(), true)
                    if not Config.UseCustomSkinCreator then
                        TriggerEvent('esx_skin:playerRegistered')
                    else
                        TriggerEvent('vms_charcreator:openCreator')
                    end
                end)
            end
        else
            Config.Notification(Config.Translate["register_notify"], callback, "error")
        end
    end, data)
end)

CreateThread(function()
    while true do
        local sleep = 1500
        if guiEnabled then
            sleep = 0
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 106, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 30, true)
            DisableControlAction(0, 31, true)
            DisableControlAction(0, 21, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 47, true)
            DisableControlAction(0, 58, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 75, true)
            DisableControlAction(27, 75, true)
        end
        Wait(sleep)
    end
end)

if not Config.Multichars then
    RegisterNetEvent('vms_identity:setPlayerData', function(data)
        SetTimeout(1, function()
            ESX.SetPlayerData('firstName', data.firstName)
            ESX.SetPlayerData('lastName', data.lastName)
            ESX.SetPlayerData('dateofbirth', data.dateOfBirth)
            ESX.SetPlayerData('sex', data.sex)
            ESX.SetPlayerData('height', data.height)
        end)
    end)
end