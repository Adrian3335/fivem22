RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(job)
    ESX.PlayerData = job
end)

RegisterCommand('nuifix', function()
    SendNUIMessage({
        action = 'forceClose'
    })
end)

local openingRadial = false
local inRadialMenu = false

function OpenRadialMenu(items)
    ESX.UI.Menu.CloseAll()
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(true)
    SendNUIMessage({
        action = "ui",
        radial = true,
        items = items
    })
    inRadialMenu = true
    CreateThread(function()
        while inRadialMenu do
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 24, true)
            Wait(0)
        end
    end)
    openingRadial = false
end

function CloseRadialMenu()    
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    SendNUIMessage({
        action = "ui"
    })
    inRadialMenu = false
end

CreateThread(function()
    while Config == nil do
        Wait(0)
    end

    for i=1, #Config.MenuItems, 1 do
        RegisterCommand(Config.MenuItems[i].id, function()
            if LocalPlayer.state.IsDead then return end
            if LocalPlayer.state.IsHandcuffed or LocalPlayer.state.Tied then return end
            if exports['rey_tuning']:menuIsOpen() then return end
            if IsPauseMenuActive() then return end
            if openingRadial then return end
            if inRadialMenu then return end
            openingRadial = true

            if Config.MenuItems[i].enableMenu() then
                local cb = Config.MenuItems[i]
                cb.AddsMenu = {}
                for x=1, #Config.MenuAdd, 1 do
                    if Config.MenuAdd[x].id == cb.id then
                        if (Config.MenuAdd[x].item) then
                            if exports.ox_inventory:Search('count', Config.MenuAdd[x].item) > 0 then
                                if Config.MenuAdd[x].addElement() then
                                    for t=1, #Config.MenuAdd[x].items, 1 do
                                        local num = #cb.AddsMenu+1
                                        cb.AddsMenu[num] = Config.MenuAdd[x].items[t];
                                    end
                                end
                            end
                        elseif not Config.MenuAdd[x].item then
                            if Config.MenuAdd[x].addElement() then
                                for t=1, #Config.MenuAdd[x].items, 1 do
                                    local num = #cb.AddsMenu+1
                                    cb.AddsMenu[num] = Config.MenuAdd[x].items[t];
                                end
                            end
                        end
                    end
                end
                OpenRadialMenu(cb.AddsMenu)
                SetCursorLocation(0.5, 0.5)
            end
        end)
        RegisterKeyMapping(Config.MenuItems[i].id, Config.MenuItems[i].tip, 'keyboard', Config.MenuItems[i].key)
        Wait(1000)
        TriggerEvent('chat:removeSuggestion', '/'..Config.MenuItems[i].id)
    end
end)

RegisterNUICallback('closeRadial', function()
    CloseRadialMenu()
end)

RegisterNUICallback('selectItem', function(data)
    local itemData = data.itemData
    if itemData.type == 'client' then
        TriggerEvent(itemData.event, itemData.eventData)
    elseif itemData.type == 'server' then
        TriggerServerEvent(itemData.event, itemData.eventData)
    end
end)

RegisterNetEvent('need_radialmenu:seat4')
AddEventHandler('need_radialmenu:seat4', function()
    ESX.ShowNotification("Zmieniasz miejsce na fotel za pasażerem")
    Citizen.Wait(1000)
	ExecuteCommand('seat4')
end)

RegisterNetEvent('need_radialmenu:seat3')
AddEventHandler('need_radialmenu:seat3', function()
    ESX.ShowNotification("Zmieniasz miejsce na fotel za kierowcą")
    Citizen.Wait(1000)
	ExecuteCommand('seat3')
end)

RegisterNetEvent('need_radialmenu:seat2')
AddEventHandler('need_radialmenu:seat2', function()
    ESX.ShowNotification("Zmieniasz miejsce na pasażera")
    Citizen.Wait(1000)
	ExecuteCommand('seat2')
end)

RegisterNetEvent('need_radialmenu:seat1')
AddEventHandler('need_radialmenu:seat1', function()
    ESX.ShowNotification("Zmieniasz miejsce na kierowcę")
    Citizen.Wait(1000)
	ExecuteCommand('seat1')
end)

-- AddEventHandler('goat_radialmenu:openPhone', function()
-- 	exports["lb-phone"]:ToggleOpen(true, false)
-- end)

RegisterNetEvent('need_radialmenu:advent')
AddEventHandler('need_radialmenu:advent', function()
    ExecuteCommand('advent')
end)

RegisterNetEvent('needrp:pokazdowod')
AddEventHandler('needrp:pokazdowod', function()
    ExecuteCommand('dowod')
end)

RegisterNetEvent('needrp:pokazodznake')
AddEventHandler('needrp:pokazodznake', function()
    ExecuteCommand('odznaka')
end)

RegisterNetEvent('needrp:pokazlegitke')
AddEventHandler('needrp:pokazlegitke', function()
    ExecuteCommand('legitymacja')
end)


RegisterNetEvent('needrp:pokazwiz')
AddEventHandler('needrp:pokazwiz', function()
    ExecuteCommand('wizytowka')
end)


RegisterNetEvent('need_radialmenu:playtime')
AddEventHandler('need_radialmenu:playtime', function()
    ExecuteCommand('sklep')
end)

RegisterNetEvent('need_radialmenu:radiocar')
AddEventHandler('need_radialmenu:radiocar', function()
    ExecuteCommand('radiocar')
end)

RegisterNetEvent('need_radialmenu:toggleDoor')
AddEventHandler('need_radialmenu:toggleDoor', function(data)
    door = data.what
    local playerPed = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(playerPed, false)
    if (IsPedSittingInAnyVehicle(playerPed)) then
        if GetVehicleDoorAngleRatio(playerVeh, tonumber(door)) > 0.0 then 
            SetVehicleDoorShut(playerVeh, tonumber(door), false)
        else
            SetVehicleDoorOpen(playerVeh, tonumber(door), false)
        end
    end
end)


RegisterNetEvent('need_radialmenu:openGarage')
AddEventHandler('need_radialmenu:openGarage', function()
    exports["goat_garages"]:openGarage()
end)

RegisterNetEvent('goat_ui:client:updateColor', function(data)
    SendNUIMessage({
        action = 'updatecolor',
        color = data,
    })
end)
RegisterNetEvent('pokastaty-skxxs')
AddEventHandler('pokastaty-skxxs', function()
    ExecuteCommand('statistics')
end)

RegisterNetEvent('maska')
AddEventHandler('maska', function()
    ExecuteCommand('mask')
end)

RegisterNetEvent('czapka')
AddEventHandler('czapka', function()
    ExecuteCommand('helmet')
end)
RegisterNetEvent('koszulka')
AddEventHandler('koszulka', function()
    ExecuteCommand('torso')
end)


RegisterNetEvent('rece')
AddEventHandler('rece', function()
    ExecuteCommand('gloves')
end)

RegisterNetEvent('jeans')
AddEventHandler('jeans', function()
    ExecuteCommand('jeans')
end)

RegisterNetEvent('uszy')
AddEventHandler('uszy', function()
    ExecuteCommand('ears')
end)
RegisterNetEvent('torba')
AddEventHandler('torba', function()
    ExecuteCommand('bag')
end)

RegisterNetEvent('okulary')
AddEventHandler('okulary', function()
    ExecuteCommand('glasses')
end)

RegisterNetEvent('radio')
AddEventHandler('radio', function()
    ExecuteCommand('carplay')
end)