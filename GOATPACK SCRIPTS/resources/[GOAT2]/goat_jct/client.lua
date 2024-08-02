CreateThread(function()
    for k,v in pairs(Config.Zones) do
        for a,b in pairs(v.options) do
            b.distance = 2
        end

        exports.ox_target:addBoxZone({
            coords = vec3(v.coords[1], v.coords[2], v.coords[3]),
            size = vec3(v.width, v.length, v.maxZ - v.minZ),
            rotation = v.coords[4],
            debug = false,
            options = v.options,
        })
    end
end)

Citizen.CreateThread(function()
    local blipson = AddBlipForCoord(vector3(-235.2666, -922.2701, 31.3622)) 
    SetBlipSprite (blipson, 407)
		SetBlipDisplay(blipson, 4)
		SetBlipScale  (blipson, 0.8)
		SetBlipColour (blipson, 27)
		SetBlipAsShortRange(blipson, true)
		BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("<font face='Poppins-Medium' size= '11'>Urząd Miasta</font>" )
		EndTextCommandSetBlipName(blipson)
end)

local function AddVehicleKey(plate, result)
    local options = {}
    local myPed = PlayerPedId()
	local coords = GetEntityCoords(myPed, true)
    local pid = PlayerId()
    for _, player in ipairs(ESX.Game.GetPlayers()) do
        if pid ~= player then
            local target = GetPlayerPed(player)
            if IsEntityVisible(target) then
                local distance = #(coords - GetEntityCoords(target, true))
                if distance <= 3.0 then
                    local id = GetPlayerServerId(player)
                    table.insert(options, {value = id, label = "Obywatel [" .. id .. "]"})
                end
            end
        end
    end

    local input = lib.inputDialog('Daj klucze [' .. string.upper(plate) .. ']', {
        {type = "select", label = "Wybierz obywatela", options = options}
    })
    if not input or not input[1] then
        return ESX.ShowNotification("Wybierz obywatela!")
    end
    local result = lib.callback.await("goat_jct:addVehicleSubowner", false, result.id, input[1])
    if result == "success" then
        ESX.ShowNotification("Klucze zostały nadane!")
    elseif result == "error" then
        ESX.ShowNotification("Wystąpił błąd!")
    elseif result == "money" then
        ESX.ShowNotification("Nie posiadasz wystarczającej ilości pieniędzy na koncie!")
    end
end

local function RemoveVehicleKey(plate, result)
    local options = {}

    for i = 1, #(result.subowners) do
        table.insert(options, {value = result.subowners[i].identifier, label = result.subowners[i].label})
    end

    local input = lib.inputDialog('Zabierz klucze [' .. string.upper(plate) .. ']', {
        {type = "select", label = "Wybierz obywatela", options = options}
    })
    if not input or not input[1] then
        return ESX.ShowNotification("Wybierz obywatela!")
    end
    local result = lib.callback.await("goat_jct:removeVehicleSubowner", false, result.id, input[1])
    if result then
        ESX.ShowNotification("Klucze zostały zabrane!")
    else
        ESX.ShowNotification("Wystąpił błąd!")
    end
end

RegisterNetEvent("goat_jct:vehicleManage", function()
    local input = lib.inputDialog('Zarządzanie pojazdami', {{type = "input", label = "Wpisz rejestrację pojazdu", placeholder="ABC 1234", required = true}})
    if not input then
        return ESX.ShowNotification("Podaj rejestrację pojazdu!")
    end

    local plate = input[1]
    if #plate ~= 7 then
        return ESX.ShowNotification("Nie znaleziono pojazdu!")
    end

    local result = lib.callback.await("goat_jct:getVehicleSubowners", false, plate)
    if not result then
        return ESX.ShowNotification("Nie znaleziono pojazdu!")
    end

    lib.registerContext({
        id = 'manage_vehicle',
        title = 'Zarządzanie pojazdem [' .. string.upper(plate) .. ']',
        options = {
            {
                title = 'Daj klucze [$' .. Config.AddKeysPrice .. ']',
                onSelect = function()
                    AddVehicleKey(plate, result)
                end
            },
            {
                title = 'Zabierz klucze',
                onSelect = function()
                    RemoveVehicleKey(plate, result)
                end
            }
        }
    })
    lib.showContext('manage_vehicle')
end)

RegisterNetEvent("goat_jct:openJct", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        name = ESX.PlayerData.firstName,
    })
end)

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("setjob", function(data)
    SetNuiFocus(false, false)
    TriggerServerEvent('goat_jct:setJob', data.praca)
end)

RegisterNetEvent('goat_ui:client:updateColor', function(data)
    SendNUIMessage({
        action = 'updatecolor',
        color = data,
    })
end)