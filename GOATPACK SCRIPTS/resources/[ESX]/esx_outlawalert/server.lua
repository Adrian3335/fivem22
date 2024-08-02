ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('esx_jb_outlawalert:notifyShots')
AddEventHandler('esx_jb_outlawalert:notifyShots', function(coords, str, type)
    TriggerClientEvent('esx_jb_outlawalert:notifyShots', -1, source, coords, str, type, os.date("%H:%M"))
end)

RegisterServerEvent('esx_jb_outlawalert:notifyCombat')
AddEventHandler('esx_jb_outlawalert:notifyCombat', function(coords, str)
    TriggerClientEvent('esx_jb_outlawalert:notifyCombat', -1, coords, str)
end)


RegisterServerEvent('esx_jb_outlawalert:notifyThief')
AddEventHandler('esx_jb_outlawalert:notifyThief', function(coords, str, model)
    TriggerClientEvent('esx_jb_outlawalert:notifyThief', -1, source, coords, str, model, os.date("%H:%M"))
end)

RegisterServerEvent('esx_jb_outlawalert:napadjebie')
AddEventHandler('esx_jb_outlawalert:napadjebie', function(coords, str)
    TriggerClientEvent('esx_jb_outlawalert:napadjebie', -1, source, coords, str,  os.date("%H:%M"))
end)