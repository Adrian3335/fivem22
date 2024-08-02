--  ▄▀▄ █▄ █ █   ▀▄▀   █▀ ▄▀▄ █▀▄   ██▀ ▄▀▀ ▀▄▀
--  ▀▄▀ █ ▀█ █▄▄  █    █▀ ▀▄▀ █▀▄   █▄▄ ▄██ █ █
if Config.Core == "ESX" then
    RegisterNetEvent('vms_driveschoolv2:sv:loadLicensesWithRestartScript', function()
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            TriggerEvent('esx_license:getLicenses', src, function(licenses)
                TriggerClientEvent('vms_driveschoolv2:cl:getLicenses', src, licenses)
            end)
        end
    end)

    AddEventHandler(Config.PlayerLoaded, function(source)
        local src = source
        Citizen.Wait(8000)
        TriggerEvent('esx_license:getLicenses', src, function(licenses)
            TriggerClientEvent('vms_driveschoolv2:cl:getLicenses', src, licenses)
        end)
    end)
end


--  ▄▀▄ █▀▄ █▀▄   █   █ ▄▀▀ ██▀ █▄ █ ▄▀▀ ██▀
--  █▀█ █▄▀ █▄▀   █▄▄ █ ▀▄▄ █▄▄ █ ▀█ ▄██ █▄▄
RegisterNetEvent('vms_driveschoolv2:sv:addLicense', function(passed, type)
    local src = source
    if passed then
        if Config.Core == "ESX" then
            TriggerEvent('esx_license:addLicense', src, type, function()
                TriggerEvent('esx_license:getLicenses', src, function(licenses)
                    TriggerClientEvent('vms_driveschoolv2:cl:getLicenses', src, licenses)
                    TriggerClientEvent('vms_driveschoolv2:notification', src, Config.Translate['success_practical'], 'success')
                end)
            end)
        elseif Config.Core == "QB-Core" then
            local Player = QBCore.Functions.GetPlayer(src)
            local licenses = Player.PlayerData.metadata['licences']
            licenses[type] = true
            Player.Functions.SetMetaData('licences', licenses)
            TriggerClientEvent('vms_driveschoolv2:cl:getLicenses', src)
            TriggerClientEvent('vms_driveschoolv2:notification', src, Config.Translate['success_practical'], 'success')
        end
    else
        TriggerClientEvent('vms_driveschoolv2:notification', src, Config.Translate['failed_practical'], 'error')
    end
end)