--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

--RegisterCommand(Config.AdminCommand, function(source)
--    local src = source
--    local permission = getPermission(src, Config.AdminRank)
--    if permission then
--        TriggerClientEvent("av_vehicleshop:admin",source,allVehicles)
--    else
--        TriggerClientEvent("av_vehicleshop:notification",src,Lang['not_admin'])
--    end
--end)

RegisterServerEvent("av_vehicleshop:addVehicle", function(name, category, stock, price)
    local src = source
    local exists = MySQL.single.await('SELECT `name` FROM `av_vehicleshop` WHERE `name` = ? AND category = ? LIMIT 1', {
        name, category
    })
    if not exists then
        allVehicles[category] = allVehicles[category] or {}
        allVehicles[category][name] = {
            name = name,
            category = category,
            stock = stock,
            price = price
        }
        MySQL.insert('INSERT INTO `av_vehicleshop` (name, price, category, stock) VALUES (?, ?, ?, ?)', {
            name, price, category, stock
        }, function(id)
            TriggerClientEvent("av_vehicleshop:admin",src,allVehicles, true)
        end)
    else
        TriggerClientEvent("av_vehicleshop:notification",src,Lang['already_exists'])
    end
end)

RegisterServerEvent("av_vehicleshop:editVehicle", function(name, category, stock, price, currentCategory)
    local src = source
    local data = MySQL.single.await('SELECT * FROM `av_vehicleshop` WHERE `name` = ? AND `category` = ? LIMIT 1', {
        name, currentCategory
    })
    if data then
        local category = category
        local stock = stock
        local price = price
        if not category then
            category = currentCategory
        end
        if not stock then
            stock = data.stock
        end
        if not price then
            price = data.price
        end
        if (category == currentCategory) then
            deleteTableVehicle(data.category, name)
            allVehicles[category] = allVehicles[category] or {}
            allVehicles[category][name] = {
                name = name,
                category = category,
                stock = stock,
                price = price
            }
            MySQL.update('UPDATE av_vehicleshop SET price = ?, category = ?, stock = ? WHERE name = ? AND category = ?', {
                price, category, stock, name, currentCategory
            }, function(affectedRows)
                TriggerClientEvent("av_vehicleshop:admin",src,allVehicles,true)
            end)
        else
            allVehicles[category] = allVehicles[category] or {}
            allVehicles[category][name] = {
                name = name,
                category = category,
                stock = stock,
                price = price
            }
            MySQL.insert('INSERT INTO `av_vehicleshop` (name, price, category, stock) VALUES (?, ?, ?, ?)', {
                name, price, category, stock
            }, function(id)
                TriggerClientEvent("av_vehicleshop:admin",src,allVehicles, true)
            end)
        end
    end
end)

RegisterServerEvent("av_vehicleshop:deleteVehicle", function(name,category)
    local src = source
    deleteTableVehicle(category, name)
    MySQL.query('DELETE FROM `av_vehicleshop` WHERE `name` = ? AND `category` = ?', {
        name, category
    }, function(response)
        if response then
            TriggerClientEvent("av_vehicleshop:admin",src,allVehicles,true)
        end
    end)
end)

function deleteTableVehicle(category, name)
    local vehicles = allVehicles[category]
    if vehicles then
        for k, v in pairs(vehicles) do
            if v['name'] == name then
                allVehicles[category][name] = nil
                break
            end
        end
    end
end