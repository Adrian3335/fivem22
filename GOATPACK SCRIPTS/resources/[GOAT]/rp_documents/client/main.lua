RegisterNetEvent('goat_documents:showDocument', function(type, playerData)
    SendNUIMessage({
        action = 'ShowCard',
        type = type,
        playerData = playerData,
    })
end)

RegisterNetEvent("goat_documents:playAnim", function(type)
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) and not IsPedCuffed(ped) then
        if type == 'odznaka' then
            RequestAnimDict("paper_1_rcm_alt1-9")
            while not HasAnimDictLoaded("paper_1_rcm_alt1-9") do
                Wait(0)
            end
            TaskPlayAnim(ped, "paper_1_rcm_alt1-9", "player_one_dual-9", 0.8, -0.8, -1, 48, 0.0, 0, 0, 0)
            Wait(3500)
            StopAnimTask(ped, "paper_1_rcm_alt1-9", "player_one_dual-9", 1.0)
        else
            RequestAnimDict("random@atmrobberygen")
            while not HasAnimDictLoaded("random@atmrobberygen") do 
                Wait(0) 
            end
            TaskPlayAnim(ped, "random@atmrobberygen", "a_atm_mugging", 0.8, -0.8, -1, 48, 0.0, 0, 0, 0)
            Wait(2000)
            StopAnimTask(ped, "random@atmrobberygen", "a_atm_mugging", 1.0)
        end
    end
end)

RegisterCommand("-showOdznaka", function()
    if ESX.PlayerData.job.name == 'police' then
        ExecuteCommand('odznaka')
    elseif ESX.PlayerData.job.name == 'doj' or ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job.name == 'mechanic' then
        ExecuteCommand('legitymacja')
    end
end)

RegisterKeyMapping("-showOdznaka", "Odznaka", "keyboard", "o")

RegisterNetEvent('goat_ui:client:updateColor', function(data)
    SendNUIMessage({
        action = 'updatecolor',
        color = data,
    })
end)