--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

CreateThread(function()
    if Config.Framework == 'QBCore' then
        QBCore.Functions.CreateCallback("av_vehicleshop:buy", function(source,cb,data)
            local src = source
            local vehicle = GetVehicle(data.category, data.model)
            local Player = QBCore.Functions.GetPlayer(src)
            if vehicle.stock > 0 then
                local res = getMoney(src, data.type, tonumber(vehicle.price))
                if res then
                    SetStock(data.model, data.category, 1)
                    local plate = GeneratePlate()
                    Discord(src, Player.PlayerData.citizenid, data.model, vehicle.price, plate)
                    cb({res = true, plate = plate})
                else
                    TriggerClientEvent('av_vehicleshop:notification',src,Lang['not_enough_money'])
                    cb(false)
                end
            else
                TriggerClientEvent('av_vehicleshop:notification',src,Lang['no_stock'])
                cb(false)
            end
        end)
    elseif Config.Framework == 'ESX' then
        ESX.RegisterServerCallback("av_vehicleshop:buy", function(source,cb,data)
            local src = source
            local vehicle = GetVehicle(data.category, data.model)
            local xPlayer = ESX.GetPlayerFromId(src)
            if vehicle.stock > 0 then
                local res = getMoney(src, data.type, tonumber(vehicle.price))
                if res then
                    SetStock(data.model, data.category, 1)
                    local plate = GeneratePlate()
                    Discord(src, xPlayer.identifier, data.model, vehicle.price, plate)
                    cb({res = true, plate = plate})
                else
                    TriggerClientEvent('av_vehicleshop:notification',src,Lang['not_enough_money'])
                    cb(false)
                end
            else
                TriggerClientEvent('av_vehicleshop:notification',src,Lang['no_stock'])
                cb(false)
            end
        end)
    else
        -- Your custom callback checking the veh stock and player money
        lib.callback.register('av_vehicleshop:buy', function(source, data)
            local src = source
            local vehicle = GetVehicle(data.category, data.model)
            if vehicle.stock > 0 then
                local res = getMoney(src, data.type, tonumber(vehicle.price))
                if res then
                    SetStock(data.model, data.category, vehicle.stock - 1)
                    local plate = GeneratePlate()
                    return {res = true, plate = plate}
                else
                    TriggerClientEvent('av_vehicleshop:notification',src,Lang['not_enough_money'])
                    return false
                end
            else
                TriggerClientEvent('av_vehicleshop:notification',src,Lang['no_stock'])
                return false
            end
        end)
    end
end)

RegisterServerEvent('av_vehicleshop:setOwner', function(dealership, model, props, type)
    local src = source
    if Config.Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
            Player.PlayerData.license,
            Player.PlayerData.citizenid,
            model,
            GetHashKey(model),
            json.encode(props),
            props.plate,
            Config.Dealerships[dealership].garage,
            0
        })
    elseif Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, stored, type) VALUES (?, ?, ?, ?, ?)', {
            xPlayer.identifier,
            props.plate,
            json.encode(props),
            0,
            type
        })
    else
        -- Your custom query to add the vehicle in database
    end
end)