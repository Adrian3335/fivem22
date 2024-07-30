--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

RegisterNetEvent("av_vehicleshop:admin", function(data, server)
    local vehicles = {}
    local allCategories = {}
    local categories = {}
    for k, v in pairs(data) do
        if not allCategories[k] then
            allCategories[k] = true
        end
        for h, j in pairs(v) do
            vehicles[#vehicles+1] = {
                name = j['name'],
                stock = j['stock'],
                price = j['price'],
                category = j['category']
            }
        end
    end
    for k, v in pairs(allCategories) do
        categories[#categories+1] = {
            value = k,
            label = k
        }
    end
    SetNuiFocus(true,true)
    SendNUIMessage({
        action = "openAdmin",
        data = {
            state = true,
            categories = categories,
            vehicles = vehicles,
            lang = UILang
        }
    })
    if server then
        SendNUIMessage({
            action = "refreshVehicles",
        })
    end
end)

RegisterNUICallback("addVehicle", function(data,cb)
    local name = data.name
    local category = data.category
    local stock = data.stock
    local price = data.price
    if name and category and stock and price then
        if IsModelInCdimage(name) then
            TriggerServerEvent("av_vehicleshop:addVehicle", name, category, stock, price)
        else
            TriggerEvent("av_vehicleshop:notification", Lang['wrong_model'])
        end
    else
        TriggerEvent("av_vehicleshop:notification", Lang['missing_fields'])
    end
    cb("ok")
end)

RegisterNUICallback("deleteVehicle", function(data,cb)
    local name = data.extraData.name
    local category = data.extraData.category
    if name and category then
        TriggerServerEvent("av_vehicleshop:deleteVehicle", name, category)
    end
    cb("ok")
end)

RegisterNUICallback("editVehicle", function(data,cb)
    local name = data.extraData.name
    local price = data.price
    local category = data.category
    local stock = data.stock
    local currentCategory = data.extraData.category
    if name then
        if price or category or stock then
            TriggerServerEvent("av_vehicleshop:editVehicle", name, category, stock, price, currentCategory)
        end
    end
    cb("ok")
end)

RegisterNUICallback("closeAdmin", function(data,cb)
    SetNuiFocus(false, false)
    cb("ok")
end)