

function getTime()
    if Config.ShowOnlyTime then
        return os.date("%H:%M", os.time() + Config.TimezoneOffset * 60 * 60)

    end
end

Citizen.CreateThread(function()
    while true do
        TriggerClientEvent('czas', -1, getTime())
        Wait(30000)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        Wait(2500)
        TriggerClientEvent('czas', -1, getTime())
    end
end)
  
AddEventHandler("playerJoining", function (data)
    TriggerClientEvent('czas', source, getTime())
end)
