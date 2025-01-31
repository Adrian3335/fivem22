function ShowNotification(message, notifyType)
    lib.notify({
        description = message,
        type = notifyType,
        position = 'top-right'
    })
end

RegisterNetEvent('lunar_garage:showNotification')
AddEventHandler('lunar_garage:showNotification', ShowNotification)

function ShowUI(text, icon)
    if icon == 0 then
        lib.showTextUI(text)
    else
        lib.showTextUI(text, {
            icon = icon
        })
    end
end

function HideUI()
    lib.hideTextUI()
end

function GetVehicleFuel(vehicle)
    if GetResourceState('LegacyFuel') == 'started' then
        local fuelLevel = exports['LegacyFuel']:GetFuel(vehicle, fuelLevel)
        return math.floor(fuelLevel * 100) / 100
    else
        return GetVehicleFuelLevel(vehicle)
    end
end

function SetVehicleFuel(vehicle, fuelLevel)
    if GetResourceState('LegacyFuel') == 'started' then
        exports['LegacyFuel']:SetFuel(vehicle, fuelLevel)
    end
end

function SetVehicleOwner(plate)
    if not Config.UseKeySystem then return end

    if Framework.name == 'es_extended' then
         TriggerServerEvent("goat_carkeys:AddKey", plate)
    elseif Framework.name == 'qb-core' then
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
    end
end