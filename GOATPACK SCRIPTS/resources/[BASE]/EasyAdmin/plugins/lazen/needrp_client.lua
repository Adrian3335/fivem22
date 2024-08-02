ESX = exports["es_extended"]:getSharedObject()

local function playerOption(playerId)
    if DoesPlayerHavePermissionForCategory(-1, "esx") then
        local esxOptions = _menuPool:AddSubMenu(thisPlayer, "~y~[ESX]~s~ Options","",true)
        esxOptions:SetMenuWidthOffset(menuWidth)

        if permissions["esx.revive"] then
            local thisItem = NativeUI.CreateItem("Revive Player", "")
            esxOptions:AddItem(thisItem)
            thisItem.Activated = function(ParentMenu, SelectedItem)
                TriggerServerEvent("EasyAdmin:ReviveTarget", playerId)
            end
        end
        
        if permissions["esx.heal"] then
            local thisItem = NativeUI.CreateItem("Heal Player", "")
            esxOptions:AddItem(thisItem)
            thisItem.Activated = function(ParentMenu, SelectedItem)
                TriggerServerEvent("EasyAdmin:HealTarget", playerId)
            end
        end
        
        if permissions["esx.feed"] then
            local thisItem = NativeUI.CreateItem("Feed Player", "")
            esxOptions:AddItem(thisItem)
            thisItem.Activated = function(ParentMenu, SelectedItem)
                TriggerServerEvent("EasyAdmin:FeedTarget", playerId)
            end
        end
        
        if permissions["esx.handcuff"] then
            local selectedItem = 1
            local thisItem = NativeUI.CreateListItem("Handcuff Player", {"Zakuj", "Rozkuj"}, 1)
            esxOptions:AddItem(thisItem)
            thisItem.OnListChanged = function(sender, item, index)
                selectedItem = index
            end
            thisItem.OnListSelected = function (sender, item, index)
                TriggerServerEvent("EasyAdmin:HandcuffPlayer", playerId, selectedItem)
            end
        end
        
        if permissions["esx.headbag"] then
            local selectedItem = 1
            local thisItem = NativeUI.CreateListItem("Headbag Player", {"Załóż", "Zdejmij"}, 1)
            esxOptions:AddItem(thisItem)
            thisItem.OnListChanged = function(sender, item, index)
                selectedItem = index
            end
            thisItem.OnListSelected = function (sender,item,index)
                TriggerServerEvent("EasyAdmin:HeadbagPlayer", playerId, selectedItem)
            end
        end

        if permissions["esx.inventory"] then
            local thisItem = NativeUI.CreateItem("Open Inventory", "")
            esxOptions:AddItem(thisItem)
            thisItem.Activated = function(ParentMenu, SelectedItem)
                TriggerServerEvent("EasyAdmin:OpenInventory", playerId)
            end
        end
    end
end

local function GetGroundCoords(coords)
    local rayCast               = StartShapeTestRay(coords.x, coords.y, coords.z, coords.x, coords.y, -10000.0, 1, 0)
    local _, hit, hitCoords     = GetShapeTestResult(rayCast)
    return (hit == 1 and hitCoords) or coords
end

local function mainOption()
    if DoesPlayerHavePermissionForCategory(-1, "accessories") then
        local accessories = _menuPool:AddSubMenu(mainMenu, "Dodatki","",true)
        accessories:SetMenuWidthOffset(menuWidth)
        
        if permissions["accessories.invisibility"] then
            local thisItem = NativeUI.CreateCheckboxItem("Niewidzialność", not IsEntityVisible(PlayerPedId()))
            accessories:AddItem(thisItem)
            thisItem.CheckboxEvent = function(sender, item, checked_)
                SetEntityVisible(PlayerPedId(), not checked_, 0)
            end
        end
        
        if permissions["accessories.noclip"] then
            local thisItem = NativeUI.CreateCheckboxItem("Noclip", IsNoClipping)
            accessories:AddItem(thisItem)
            thisItem.CheckboxEvent = function(sender, item, checked_)
                ToggleNoClip(checked_)
            end
        end

        if permissions["accessories.tpm"] then
            local thisItem = NativeUI.CreateItem("TPM", "")
            accessories:AddItem(thisItem)
            thisItem.Activated = function(ParentMenu, SelectedItem)
                TriggerEvent("esx:tpm")
            end
        end
    end

    if DoesPlayerHavePermissionForCategory(-1, "vehicle") and IsPedInAnyVehicle(PlayerPedId()) then
        local vehicle = _menuPool:AddSubMenu(mainMenu, "Pojazd","",true)
        vehicle:SetMenuWidthOffset(menuWidth)

        if permissions["vehicle.fix"] then
            local thisItem = NativeUI.CreateItem("Napraw", "")
            vehicle:AddItem(thisItem)
            thisItem.Activated = function(ParentMenu, SelectedItem)
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                SetVehicleEngineHealth(vehicle, 1000.0)
                SetVehicleUndriveable(vehicle, false)
                SetVehicleEngineOn(vehicle, true, true)

                SetVehicleBodyHealth(vehicle, 1000.0)
				SetVehicleDeformationFixed(vehicle)
				SetVehicleFixed(vehicle)
            end
        end

        if permissions["vehicle.flip"] then
            local thisItem = NativeUI.CreateItem("Obróć", "")
            vehicle:AddItem(thisItem)
            thisItem.Activated = function(ParentMenu, SelectedItem)
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                local vehicleRotation = GetEntityRotation(vehicle)
                SetEntityRotation(vehicle, vehicleRotation[1], 0, vehicleRotation[3], 2, true)
                SetVehicleOnGroundProperly(vehicle)
            end
        end

        if permissions["vehicle.keys"] then
            local thisItem = NativeUI.CreateItem("Klucze", "")
            vehicle:AddItem(thisItem)
            thisItem.Activated = function(ParentMenu, SelectedItem)
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                local plate = GetVehicleNumberPlateText(vehicle, true)
                if type(plate) == "string" then
                    plate = plate:gsub("%s$", "")
                end
                exports["goat_carkeys"]:AddKey(plate)
            end
        end
        
        if permissions["vehicle.tuning"] then
            local thisItem = NativeUI.CreateItem("Tuning", "")
            vehicle:AddItem(thisItem)
            thisItem.Activated = function(ParentMenu, SelectedItem)
                _menuPool:CloseAllMenus()
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                TriggerServerEvent('misiaczek:forceUpdateOwnedVehicle232232', ESX.Game.GetVehicleProperties(vehicle))
                TriggerEvent('rey_tuning:TuningMenu')
            end
        end
    end
end

local esxPluginData = {
	name = "ESX", 
	functions = {
        mainMenu = mainOption,
		playerMenu = playerOption,
	}
}

addPlugin(esxPluginData)

RegisterNetEvent("EasyAdmin:CallThePlayer", function(name, reason)
	SendNUIMessage({
		action = "announce",
		name = name,
		reason = reason
	})
end)