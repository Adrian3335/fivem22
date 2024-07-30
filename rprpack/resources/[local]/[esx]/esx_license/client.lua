ESX = exports['es_extended']:getSharedObject()

function CheckLicense(license)
    ESX.TriggerServerCallback('esx_license:checkLicense', function(hasLicense)
        if hasLicense then
            return true
        else
            return false
        end
    end, GetPlayerServerId(PlayerId()), license)
end

exports('CheckLicense', CheckLicense)