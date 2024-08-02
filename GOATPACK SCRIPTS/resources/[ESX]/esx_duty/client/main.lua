local PlayerData              = {}

CreateThread(function ()
 	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('esx_duty:ambulance')
AddEventHandler('esx_duty:ambulance', function()
  TriggerServerEvent('duty:ambulance')
end)

RegisterCommand('dutyems', function(source, args, rawCommand)
  TriggerServerEvent('duty:ambulance')
  TriggerEvent('duty:boats')
end)

RegisterNetEvent('esx_duty:policeduty')
AddEventHandler('esx_duty:policeduty', function()
    TriggerServerEvent('duty:police')
end)

RegisterCommand('dutylspd', function(source, args, rawCommand)
    TriggerServerEvent('duty:police')
    TriggerEvent('duty:boats')
end)

RegisterCommand('dutylssd', function(source, args, rawCommand)
  TriggerServerEvent('duty:lssd')
  TriggerEvent('duty:boats')
end)
RegisterNetEvent('esx_duty:mechanic')
AddEventHandler('esx_duty:mechanic', function()
    TriggerServerEvent('duty:mechanik')
end)

RegisterCommand('dutylscm', function(source, args, rawCommand)
  TriggerServerEvent('duty:mechanik')
end)

