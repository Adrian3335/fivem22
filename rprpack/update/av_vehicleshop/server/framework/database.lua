--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

RegisterCommand('dealership:register', function(source,args)
    if source == 0 then
        for k, v in pairs(Config.Categories) do
            for j, h in pairs(v) do
                MySQL.insert.await('INSERT INTO av_vehicleshop (name, price, category, stock) VALUES (?, ?, ?, ?)', {h.name, h.price, k, h.stock})
            end
        end
        SyncVehicles()
        print('^2 All vehicles has been registered.')
    end
end,true)

RegisterCommand('dealership:refresh', function(source,args)
    if source == 0 then
        SyncVehicles()
    end
end,true)

function InitDatabase()
    local res = MySQL.query.await('SELECT * FROM av_vehicleshop', {})
    if not res[1] then
        for k, v in pairs(Config.Categories) do
            for j, h in pairs(v) do
                MySQL.insert.await('INSERT INTO av_vehicleshop (name, price, category, stock) VALUES (?, ?, ?, ?)', {h.name, h.price, k, h.stock})
            end
        end
        SyncVehicles()
        print('^2 All vehicles has been registered.')
    end
end

function GetVehicles()
    local veh = MySQL.query.await('SELECT * FROM av_vehicleshop', {})
    return veh
end

function UpdateStock(name, category, stock)
    MySQL.update.await('UPDATE av_vehicleshop SET stock = ? WHERE name = ? AND category = ?', {stock, name, category})
end

function GeneratePlate()
    local plate = RandomInt(1) .. RandomStr(2) .. RandomInt(3) .. RandomStr(2)
    local table = 'player_vehicles'
    if Config.Framework == "ESX" then
        table = 'owned_vehicles'
    end
    local result = MySQL.scalar.await('SELECT plate FROM '..table..' WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

RegisterCommand('deletecategory', function(source,args)
    local category = args[1]
    if not category then print('[ERROR] Please provide a category name') return end
    local res = MySQL.query.await('DELETE FROM av_vehicleshop WHERE category = ?', {category})
    if res and res.affectedRows then
        print(res.affectedRows.. " vehicles removed | Category: "..category)
    end
end)