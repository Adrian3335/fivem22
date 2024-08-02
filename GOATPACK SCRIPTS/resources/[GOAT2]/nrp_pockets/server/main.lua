robbedPeds = {}
GlobalState.robbedPeds = robbedPeds

RegisterNetEvent('goat_pockets:addPed', function(ped)
    robbedPeds[ped] = true
    GlobalState.robbedPeds = robbedPeds
end)

ESX.RegisterServerCallback('goat_pockets:Reward', function(source, cb, amount)
    exports.ox_inventory:AddItem(source, 'money', amount)
    cb(true)
end)

ESX.RegisterServerCallback('goat_pockets:CheckPolice', function(source, cb)
    local police = ESX.GetExtendedPlayers('job', 'police')
    local lssd = ESX.GetExtendedPlayers('job', 'lssd')
    if (#police + #lssd) >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('goat_pockets:PoliceNotify', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local police = ESX.GetExtendedPlayers('job', 'police')
    local lssd = ESX.GetExtendedPlayers('job', 'lssd')
    for _, xOfficer in pairs(police) do
        xOfficer.triggerEvent('goat_shoprobbery:PoliceNotify', {
            playerId = source,
            coords = xPlayer.getCoords(true),
            hour = os.date('%H:%M', os.time())
        })
    end
    for _, xOfficer2 in pairs(lssd) do
        xOfficer2.triggerEvent('goat_shoprobbery:PoliceNotify', {
            playerId = source,
            coords = xPlayer.getCoords(true),
            hour = os.date('%H:%M', os.time())
        })
    end
end)