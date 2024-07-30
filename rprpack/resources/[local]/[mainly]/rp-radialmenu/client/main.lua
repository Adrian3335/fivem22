ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(job)
    ESX.PlayerData = job
end)


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



local phone = false
local handcuff = false

RegisterNetEvent('sv-radialmenu:radiocar', function()
    ExecuteCommand('radiocar')
end)

RegisterNetEvent('omnibus_szef:telefonik', function()
    ExecuteCommand('phone')
end)

RegisterNetEvent('rp_documents:police', function()
    ExecuteCommand('odznaka')
end)
RegisterNetEvent('mdt-pol:open', function()
    ExecuteCommand('mdt')
end)
RegisterNetEvent('rp_documents:legitymka', function()
    ExecuteCommand('legitymacja')
end)

RegisterNetEvent('sv-radialmenu:mdt', function()
    ExecuteCommand('mdt')
end)

RegisterNetEvent('sv-radialmenu:jeans', function()
    ExecuteCommand('jeans')
end)
RegisterNetEvent('sv-radialmenu:torso', function()
    ExecuteCommand('torso')
end)
RegisterNetEvent('sv-radialmenu:glasses', function()
    ExecuteCommand('glasses')
end)
RegisterNetEvent('sv-radialmenu:bag', function()
    ExecuteCommand('bag')
end)
RegisterNetEvent('sv-radialmenu:mask', function()
    ExecuteCommand('mask')
end)
RegisterNetEvent('sv-radialmenu:ears', function()
    ExecuteCommand('ears')
end)
RegisterNetEvent('sv-radialmenu:shoes', function()
    ExecuteCommand('shoes')
end)

RegisterNetEvent('sv-radialmenu:dispatch', function()
    ExecuteCommand('dispach')
end)
RegisterNetEvent('chuj', function()
    ExecuteCommand('TooglePhone')
end)


RegisterCommand('nuifix', function()
    SendNUIMessage({
        action = 'forceClose'
    })
end)

local inRadialMenu = false

function openRadial(bool, items)

    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        radial = bool,
        items = items.items
    })
    inRadialMenu = bool
end

function closeRadial(bool)    
    SetNuiFocus(false, false)
    inRadialMenu = bool
end

CreateThread(function()
    for i=1, #Config.MenuItems, 1 do

        RegisterCommand(Config.MenuItems[i].id, function()
            if Config.MenuItems[i].enableMenu() then
                ESX.TriggerServerCallback('sv-radialmenu:GetConfig', function(cb)
                    local inventory = ESX.GetPlayerData().inventory
                    for x=1, #Config.MenuAdd, 1 do
                        if Config.MenuAdd[x].id == cb.id then
                            if (Config.MenuAdd[x].item) then
                                if exports['many-core']:IsPlayerHasItem(Config.MenuAdd[x].item) then
                                    if Config.MenuAdd[x].addElement() then
                                        for t=1, #Config.MenuAdd[x].items, 1 do
                                            cb.items[#cb.items+1] = Config.MenuAdd[x].items[t];
                                        end
                                    end
                                end
                            elseif not Config.MenuAdd[x].item then
                                if Config.MenuAdd[x].addElement() then
                                    for t=1, #Config.MenuAdd[x].items, 1 do
                                        cb.items[#cb.items+1] = Config.MenuAdd[x].items[t];
                                    end
                                end
                            end
                        end
                    end
                    openRadial(true, cb)
                    SetCursorLocation(0.5, 0.5)
                end, i)
            end
        end)
        RegisterKeyMapping(Config.MenuItems[i].id, Config.MenuItems[i].tip, 'keyboard', Config.MenuItems[i].key)
        Wait(1000)
        TriggerEvent('chat:removeSuggestion', '/'..Config.MenuItems[i].id)
    end
end)

CreateThread(function()
    for i = 1, #Config.MenuEvents, 1 do
        RegisterNetEvent(Config.MenuEvents[i].event)
        AddEventHandler(Config.MenuEvents[i].event, function()
            if Config.MenuEvents[i].item then
                if isHasItem(Config.MenuEvents[i].item) then
                    openRadial(true, Config.MenuEvents[i])
                    SetCursorLocation(0.5, 0.5)
                end
            else
                if Config.MenuEvents[i].enableMenu() then
                    openRadial(true, Config.MenuEvents[i])
                    SetCursorLocation(0.5, 0.5)
                end 
            end
        end)
    end
end)

RegisterNUICallback('closeRadial', function()
    closeRadial(false)
end)

RegisterNUICallback('selectItem', function(data)
    local itemData = data.itemData

    if itemData.type == 'client' then
        TriggerEvent(itemData.event, itemData)
    elseif itemData.type == 'server' then
        TriggerServerEvent(itemData.event, itemData)
    end
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

AddEventHandler('sv-radialmenu:LP', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 0) > 0.0 then
			SetVehicleDoorShut(vehicle, 0, false)
		else
			SetVehicleDoorOpen(vehicle, 0, false)
		end
	end
end)

AddEventHandler('sv-radialmenu:PP', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 1) > 0.0 then
			SetVehicleDoorShut(vehicle, 1, false)
		else
			SetVehicleDoorOpen(vehicle, 1, false)
		end
	end
end)

AddEventHandler('sv-radialmenu:LT', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 2) > 0.0 then
			SetVehicleDoorShut(vehicle, 2, false)
		else
			SetVehicleDoorOpen(vehicle, 2, false)
		end
	end
end)

AddEventHandler('sv-radialmenu:PT', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 3) > 0.0 then
			SetVehicleDoorShut(vehicle, 3, false)
		else
			SetVehicleDoorOpen(vehicle, 3, false)
		end
	end
end)

AddEventHandler('sv-radialmenu:B', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 5) > 0.0 then
			SetVehicleDoorShut(vehicle, 5, false)
		else
			SetVehicleDoorOpen(vehicle, 5, false)
		end
	end
end)

AddEventHandler('sv-radialmenu:M', function()
    local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, 4) > 0.0 then
			SetVehicleDoorShut(vehicle, 4, false)
		else
			SetVehicleDoorOpen(vehicle, 4, false)
		end
	end
end)

function isHasItem(item)
    ESX.TriggerServerCallback('sv-radialmenu:GetItems', function(cb)
        --print(cb, '2')
        if cb > 0 then
            return true
        else
            return false
        end
    end, item)
end

RegisterNetEvent('many-radial:TogglePhone')
AddEventHandler('many-radial:TogglePhone', function()
	local success, result = pcall(function()
		return exports.npwd:isPhoneVisible()
	end)

	if success then
		exports.npwd:setPhoneVisible(not result)
	end
end)

RegisterNetEvent('sv-radialmenu:dowod', function()
    ExecuteCommand('idcard')
end)

RegisterNetEvent('sv-radialmenu:wiz', function()
    ExecuteCommand('businesscard')
end)