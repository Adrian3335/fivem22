local ShopOpen = false
local WeaponShop = false

OpenShop = function(k, v)
    local addedItems = 0
    for a, b in pairs(v["Items"]) do
        addedItems = addedItems + 1
        SendNUIMessage({
            action = "add",
            item = b["name"],
            label = b["label"],
            price = b["price"],
            desc = b["desc"]
        })
    end

    local ItemsInShop = #v["Items"]
    while ItemsInShop ~= addedItems do
        Citizen.Wait(0)
    end

    if v["Weapon"] then
        WeaponShop = true
    end

    ShopOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openShop",
        shopName = k
    })
end

RegisterNUICallback("buyItems", function(data, cb)
    ESX.TriggerServerCallback("need_supermarket:buyItems", cb, data, WeaponShop)
end)

RegisterNUICallback("closeShop", function()
    ShopOpen = false
    WeaponShop = false
    SetNuiFocus(false, false)
end)

Citizen.CreateThread(function()
    for a,b in pairs(Config.Shops) do
        local Config = b
        if Config["Blip"] ~= nil then
        for k,v in pairs(Config["Coords"]) do
            local blip = AddBlipForCoord(v[1], v[2], v[3])
            SetBlipSprite (blip, Config["Blip"]["Sprite"])
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, Config["Blip"]["Scale"])
            SetBlipColour (blip, Config["Blip"]["Colour"])
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("<font face='Poppins-Medium' size= '11'>".. a .."</font>" ) 
            EndTextCommandSetBlipName(blip)
        end
        end
    end
end)

RegisterNetEvent("need_supermarket:Open", function(data)
    local Action = data.action2
    if Action then
	    OpenShop(Action[1], Action[2])
    end
end)

Citizen.CreateThread(function()
    for a,b in pairs(Config.Shops) do
        local Config = b
        for k,v in pairs(Config["Coords"]) do
            RequestModel(GetHashKey(Config["PedModel"]))
            while not HasModelLoaded(GetHashKey(Config["PedModel"])) do
                Wait(1)
            end

            local npc = CreatePed(4, Config["PedModel"], v[1], v[2], v[3], v[4], false, true)

            SetEntityHeading(npc, v[4])
            FreezeEntityPosition(npc, true)
            SetEntityInvincible(npc, true)
            SetBlockingOfNonTemporaryEvents(npc, true)

            exports.qtarget:AddTargetEntity({npc}, {
                options = {
                    {
                        event = "need_supermarket:Open",
                        icon = "fas fa-shopping-bag",
                        label = "Kup przedmioty",
                        num = 1, 
                        action2 = {a, Config}
                    },
                },
                distance = 2.5
            })
        end
	end
end)

RegisterNetEvent('goat_ui:client:updateColor', function(data)
    SendNUIMessage({
        action = 'updatecolor',
        color= data,
    })
end)