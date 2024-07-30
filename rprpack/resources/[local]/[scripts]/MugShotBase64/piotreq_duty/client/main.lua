local dutyStatus = false
local inZone = false
local timeoutActive = false
local timeout = nil

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.Zones) do
        function onEnter(self)
            if ESX.PlayerData.job.name == self.job then
                inZone = true
                if (timeout ~= nil) then
                    timeoutActive = false
                    ESX.ClearTimeout(timeout)
                    timeout = nil
                end
            end
        end
         
        function onExit(self)
            if ESX.PlayerData.job.name == self.job then
                if inZone then
                    inZone = false
                    if dutyStatus then
                        ESX.ShowNotification('Za 3 minuty automatycznie zejdziesz ze służby')
                        if timeoutActive then
                            return
                        end
        
                        timeoutActive = true
                        timeout = ESX.SetTimeout(3 * 60000, function()
                            if not inZone then
                                timeoutActive = false
                                SwitchDuty(false)
                                v.task()
                            end
                        end)
                    end
                end
            end
        end
        
        local box = lib.zones.box({
            coords = v.coords,
            size = v.size,
            rotation = v.rotation,
            debug = false,
            job = v.job,
            onEnter = onEnter,
            onExit = onExit
        })
    end
end)

function SwitchDuty(duty)
    dutyStatus = duty
    TriggerServerEvent('piotreq_duty:SwitchDuty', duty)
    if dutyStatus then
        ESX.ShowNotification('Wszedłeś na służbe')
    else
        ESX.ShowNotification('Zszedłeś ze służby')
    end
end

RegisterNetEvent('piotreq_duty:OffDuty', function()
    dutyStatus = false
    ESX.ShowNotification('Zostałeś wyrzucony ze służby')
    for k, v in pairs(Config.Zones) do
        if v.job == ESX.PlayerData.job.name then
            v.task()
            break
        end
    end
end)

RegisterCommand('duty_mech', function()
    SwitchDuty(not dutyStatus)
end)