ESX = exports["es_extended"]:getSharedObject()


RegisterServerEvent('json:dataStructure')
AddEventHandler('json:dataStructure', function(data)
    print(json.encode(data))
end)

RegisterServerEvent('sv-radialmenu:trunk:server:Door')
AddEventHandler('sv-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('sv-radialmenu:trunk:client:Door', -1, plate, door, open)
end)

ESX.RegisterServerCallback('sv-radialmenu:GetConfig', function(source, cb, i)
    cb(Config.MenuItems[i])
end)

ESX.RegisterServerCallback('sv-radialmenu:GetItems', function(source, cb, name)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(name).count

    cb(item)
end)