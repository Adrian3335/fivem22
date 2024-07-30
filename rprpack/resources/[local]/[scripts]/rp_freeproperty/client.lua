Citizen.CreateThread(function()
    local blipCoord = AddBlipForCoord(-266.6071, -739.7846, 34.4167)
    SetBlipSprite(blipCoord, 40)
    SetBlipDisplay(blipCoord, 4)
    SetBlipScale(blipCoord, 0.8)
    SetBlipColour(blipCoord, 54)
    SetBlipAsShortRange(blipCoord, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Mieszkanie" ) 
    EndTextCommandSetBlipName(blipCoord)
end)

Citizen.CreateThread(function()
    for k, conf in pairs(Config.Targets) do
        exports.qtarget:AddBoxZone(conf.name, conf.coords, conf.width, conf.length, {
            name = conf.name,
            heading = conf.coords[4],
            debugPoly = false,
            minZ = conf.minZ,
            maxZ = conf.maxZ,
        }, {
            options = conf.options,
            distance = 2
        })
    end
end)

RegisterNetEvent("need_property:enter", function()
    DoScreenFadeOut(50)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, Config.Enter[1], Config.Enter[2], Config.Enter[3])
    local interiorId = GetInteriorFromEntity(PlayerPedId())
    PinInteriorInMemory(interiorId)
    Wait(500)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, Config.Enter[1], Config.Enter[2], Config.Enter[3])
    SetEntityHeading(playerPed, Config.Enter[4])
    TriggerServerEvent("need_property:enter")
    Wait(500)
    DoScreenFadeIn(50)
end)

RegisterNetEvent("need_property:exit", function()
    DoScreenFadeOut(50)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, Config.Exit[1], Config.Exit[2], Config.Exit[3])
    SetEntityHeading(playerPed, Config.Exit[4])
    TriggerServerEvent("need_property:exit")
    Wait(500)
    DoScreenFadeIn(50)
end)

RegisterNetEvent("need_property:stash", function()
    local ox_inventory = exports.ox_inventory
    local identifier = ESX.GetPlayerData().identifier

    if ox_inventory:openInventory('stash', {id = "playerFreeProperty-" .. identifier, owner = identifier}) == false then
        TriggerServerEvent('need_property:loadStash')
        ox_inventory:openInventory('stash', {id = "playerFreeProperty-" .. identifier, owner = identifier})
    end
end)

RegisterNetEvent("need_property:getClothes", function()
	ESX.TriggerServerCallback('need_property:getPlayerDressing', function(dressing)
		local elements = {}
		for k,v in pairs(dressing) do
			elements[#elements + 1] =  {label = v.label, value = v.clothes, value2 = k}
		end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dress_menu',{
			title    = 'Przebierz się',
			align    = 'center',
			elements = elements
		}, function(data, menu)
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerEvent('skinchanger:loadClothes', skin, data.current.value)
                TriggerEvent('esx_skin:setLastSkin', skin)

                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                end)
            end)
        end, function(data, menu)
            menu.close()
        end)
    end)
end)

RegisterNetEvent("need_property:removeClothes", function()
    ESX.TriggerServerCallback('need_property:getPlayerDressing', function(dressing)
		local elements = {}
		for k,v in pairs(dressing) do
			elements[#elements + 1] = {label = v.label, value = v.clothes, value2 = k}
		end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dress_menu',{
			title    = 'Usuń ubranie',
			align    = 'center',
			elements = elements
		}, function(data, menu)
            menu.close()
            TriggerServerEvent('need_property:removeOutfit', data.current.value2)
            TriggerEvent("need_property:removeClothes")
            ESX.ShowNotification('~g~Ubranie pod nazwą: ~g~'..data.current.label..' zostało usunięte')
        end, function(data, menu)
            menu.close()
        end)
    end)
end)

RegisterNetEvent("need_property:addClothes", function()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
        title = "Podaj nazwę"
    }, function(data, menu)
        menu.close()
        if data.value then
            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerServerEvent('need_property:saveOutfit', data.value, skin)
                ESX.ShowNotification('~g~Ubranie zostalo zapisane pod nazwą: ~g~'..data.value)
            end)
        end
    end, function(data, menu)
        menu.close()
    end)
end)