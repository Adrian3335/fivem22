--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

currentDealer = nil
local allCategories = {}

AddEventHandler('av_vehicleshop:target', function(data)
    TriggerEvent('av_vehicleshop:open',data['name'])
end)

RegisterNUICallback("showCategories", function(data,cb)
    if currentVehicle then
        while DoesEntityExist(currentVehicle) do
            SetEntityAsMissionEntity(currentVehicle,false,false)
            DeleteVehicle(currentVehicle)
            SetEntityAsNoLongerNeeded(currentVehicle)
            Wait(10)
        end
    end
    if allCategories and allCategories[1] then
        SendNUIMessage({
            action = "setCarousel",
            data = {
                type = "categories",
                elements = allCategories
            }
        })
    else
        print("[ERROR] events.lua line 18")
    end
    cb("ok")
end)

RegisterNetEvent('av_vehicleshop:open', function(name)
    currentDealer = name
    local dealership = Config.Dealerships[currentDealer]
    if dealership then
        if dealership.av_vip then
            VIPstatus = isVIP()
        end
        FreezeEntityPosition(PlayerPedId(),true)
        SetNuiFocus(true,true)
        local categories = dealership['categories']
        local menu = {}
        for k, v in pairs(categories) do
            menu[#menu+1] = {label = v}
        end
        allCategories = menu
        inMenu = true
        renderCamera()
        SendNUIMessage({
            action = "openDealership",
            data = {
                state = true,
                lang = UILang
            }
        })
        SendNUIMessage({
            action = "setCarousel",
            data = {
                type = "categories",
                elements = allCategories
            }
        })
    else
        print("Dealership doesn't exist, verify your config?")
    end
end)

RegisterNetEvent('av_showroom:tuning', function()
    if tuningcoords then
        local coords = tuningcoords['coords']
        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z)
        SetEntityHeading(PlayerPedId(), tuningcoords['heading'])
    end
    SetNuiFocus(true,true)
    ResetEntityAlpha(PlayerPedId())
    renderCamera()
    SendNUIMessage({
        action = "openDealership",
        data = {
            state = true,
            lang = UILang
        }
    })
    openCategory()
    SendNUIMessage({
        action = "showDetails",
        data = {
            state = true
        }
    })
    Wait(100)
    SendNUIMessage({
        action = "vehData",
        data = {
            vehData = vehData,
        }
    })
end)