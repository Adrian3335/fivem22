ESX = exports["es_extended"]:getSharedObject()

local MinigameActive = false
local MinigameFinished = false
local SuccessTrigger = nil
local FailTrigger = nil
local Success = false

function StartFlecca(cb)
        if MinigameActive then return end
    
            SetNuiFocus(true, true)
            SendNUIMessage({type = 'otworz'})
            MinigameActive = true
            MinigameFinished = false
    
            while MinigameActive do
                Citizen.Wait(500)
            end
    
            if cb then
                cb(Success)
            end
    
            return Success
        end
    
    exports('StartFleeca', StartFleeca )

RegisterCommand("test3", function(cb)
    StartFlecca()
end)

exports('startHack', function(cb)
    if MinigameActive then return end

        SetNuiFocus(true, true)
        SendNUIMessage({type = 'otworz'})
        MinigameActive = true
        MinigameFinished = false

        while MinigameActive do
            Citizen.Wait(500)
        end

        if cb then
            cb(Success)
        end

        return Success
    
end)

RegisterNUICallback('udane', function(data, cb)
    SetNuiFocus(false, false)
    Success = true
    MinigameFinished = false
    MinigameActive = false
    cb('ok')
end)

RegisterNUICallback('nieudane', function(data, cb)
    SetNuiFocus(false, false)
    MinigameActive = false
    Success = false
    cb('ok')
end)

-- local success = exports['flecca_panel']:StartFlecca()
-- if success then
--     ESX.ShowNotification('Udane')
-- elseif not success then
-- ESX.ShowNotification('Nie Udane')
-- end
