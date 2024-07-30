ESX = exports["es_extended"]:getSharedObject()


ESX.RegisterUsableItem('trapphone', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('startcall:plug', source)
    xPlayer.removeInventoryItem('trapphone', 1)
end)


RegisterNetEvent('addtocar')
AddEventHandler('addtocar', function()
    local add = exports.ox_inventory:AddItem('glovePLUG', 'cocaine_buggy', 8)
    if add then
        print("All good")
    else
        print("Nothing is good")
    end
end)