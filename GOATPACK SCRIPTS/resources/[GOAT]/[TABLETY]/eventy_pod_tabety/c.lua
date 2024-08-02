RegisterNetEvent('cc-tablet:lspd')
AddEventHandler('cc-tablet:lspd', function()
    ExecuteCommand('mdt')
end)

RegisterNetEvent('cc-tablet:ems')
AddEventHandler('cc-tablet:ems', function()
    ExecuteCommand('ems_mdt')
end)

RegisterNetEvent('cc-tablet:doj')
AddEventHandler('cc-tablet:doj', function()
    ExecuteCommand('doj_mdt')
end)

RegisterNetEvent('cc-tablet:lsc')
AddEventHandler('cc-tablet:lsc', function()
    ExecuteCommand('mech_mdt')
end)

RegisterNetEvent('cc-tablet:uwu')
AddEventHandler('cc-tablet:uwu', function()
    ExecuteCommand('uwu_mdt')
end)