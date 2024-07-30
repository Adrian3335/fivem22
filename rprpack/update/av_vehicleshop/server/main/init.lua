--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

function GetCategory(categoryName)
    return Config.Categories[categoryName]
end

function GetVehicle(category, model)
    for _, vehicle in ipairs(Config.Categories[category]) do
        if vehicle.name == model then
            return vehicle
        end
    end
    return nil
end

function SetStock(model, category, decrement)
    for i, vehicle in ipairs(Config.Categories[category]) do
        if vehicle.name == model then
            vehicle.stock = vehicle.stock - decrement
            
            if vehicle.stock < 0 then
                vehicle.stock = 0
            end

            break
        end
    end
end