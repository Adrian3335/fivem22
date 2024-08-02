AddEventHandler("fumoPolice:bell", function()
    TriggerServerEvent("fumoPolice:bell")
end)

AddEventHandler("fumoPolice:armory", function()
    if ESX.PlayerData.job.name == 'police' then
        exports.ox_inventory:openInventory('stash', 'society_police_armory')
    end
end)

AddEventHandler("fumoPolice:armory2", function()
    if ESX.PlayerData.job.name == 'police' then
        exports.ox_inventory:openInventory('stash', 'society_police_armory_2')
    end
end)

AddEventHandler("fumoPolice:evidence", function()
    if ESX.PlayerData.job.name == 'police' then
        exports.ox_inventory:openInventory('policeevidence')
    end
end)

AddEventHandler("fumoPolice:bossMenu", function()
    ESX.TriggerServerCallback("esx_society:isBoss", function(cb) 
        if cb then
            TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
				menu.close()
			end)
        else
            ESX.ShowNotification("Nie posiadasz uprawnień!")
        end
    end, "police")
end)

AddEventHandler("fumoPolice:bossMenuLSSD", function()
    ESX.TriggerServerCallback("esx_society:isBoss", function(cb) 
        if cb then
            TriggerEvent('esx_society:openBossMenu', 'lssd', function(data, menu)
				menu.close()
			end)
        else
            ESX.ShowNotification("Nie posiadasz uprawnień!")
        end
    end, "lssd")
end)

AddEventHandler("fumoPolice:giveBadge", function()
    ESX.TriggerServerCallback("esx_society:isBoss", function(cb) 
        if cb then
            local input = lib.inputDialog('Nadaj odznake', {
                { type = 'number', label = 'ID Gracza', required = true },
                { type = 'input', label = 'Numer odznaki', required = true }
            })

            if not input or not input[1] or not input[2] then return end
            local success = lib.callback.await('fumoPolice:setBadge', false, input[1], input[2])
            if success then
                ESX.ShowNotification('Nadano nową odznakę')
            else
                ESX.ShowNotification('System padł, spróbuj ponownie później')
            end
        else
            ESX.ShowNotification("Nie posiadasz uprawnień!")
        end
    end, "police")
end)

AddEventHandler("fumoPolice:giveBadgeLSSD", function()
    ESX.TriggerServerCallback("esx_society:isBoss", function(cb) 
        if cb then
            local input = lib.inputDialog('Nadaj odznake', {
                { type = 'number', label = 'ID Gracza', required = true },
                { type = 'input', label = 'Numer odznaki', required = true }
            })

            if not input or not input[1] or not input[2] then return end
            local success = lib.callback.await('fumoPolice:setBadge', false, input[1], input[2])
            if success then
                ESX.ShowNotification('Nadano nową odznakę')
            else
                ESX.ShowNotification('System padł, spróbuj ponownie później')
            end
        else
            ESX.ShowNotification("Nie posiadasz uprawnień!")
        end
    end, "lssd")
end)

function ManageLicenses(identifier)
    local cb = lib.callback.await('fumoPolice:getEmployeeLicenses', false, identifier)
    local elements = {
        head = {"LICENCJA", "STATUS", "AKCJE"},
        rows = cb
    }
    ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'manage_licenses', elements, function(data, menu)
        menu.close()
        if data.value == "give" then
            lib.callback.await("fumoPolice:giveLicense", false, identifier, data.data.type)
        elseif data.value == "remove" then
            lib.callback.await("fumoPolice:removeLicense", false, identifier, data.data.type)
        end
        ManageLicenses(identifier)
    end, function(data, menu)
        menu.close()
    end)
end

AddEventHandler("fumoPolice:manageLicenses", function()
    local cb = lib.callback.await('fumoPolice:getEmployees', false)

    print(json.encode(cb))

    local elements = {
        head = {"IMIĘ I NAZWISKO", "AKCJE"},
        rows = cb
    }

    print(json.encode(elements.rows))

    ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'manage_licenses', elements, function(data, menu)
        menu.close()
        if data.value == 'manage' then
            ManageLicenses(data.data.identifier)
        end
    end, function(data, menu)
        menu.close()
    end)
end)

AddEventHandler(name..':forceVehicle', function(data)
    currentVehicle = data.entity
    if not currentVehicle or not DoesEntityExist(currentVehicle) then return end

    if data.name == 'police:openVehicle' then
        if actionProgbar("Otwieranie pojazdu", 45000, {scenario = "WORLD_HUMAN_WELDING"}, true) then
            SetVehicleDoorsLocked(currentVehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(currentVehicle, false)
        end
    elseif data.name == 'police:towVehicle' then
        RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        while not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@") do
            Wait(0)
        end
        local ped = PlayerPedId()
        TaskPlayAnim(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, 8.0, -1, 1, false, 0, 0, 0)
        Wait(7500)
        StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
        DeleteEntity(currentVehicle)
    elseif data.name == 'police:towVehicle2' then
        RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        while not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@") do
            Wait(0)
        end
        local ped = PlayerPedId()
        TaskPlayAnim(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, 8.0, -1, 1, false, 0, 0, 0)
        Wait(7500)
        StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
        local properties = ESX.Game.GetVehicleProperties(currentVehicle)
        DeleteEntity(currentVehicle)
        TriggerServerEvent("fumoPolice:addCarToPoliceParking", properties)
    end
end)

local GetAvailableVehicleSpawnPoint = function(station)
	local found = nil
	local spawnPoints = cfg.spawners[station].spawnCoords
	
	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i], 2) then
			found = spawnPoints[i]
			break
		end
	end

	return (found or ESX.ShowNotification("Wszystkie miejsca parkingowe są zajęte!"))
end

local OpenGarageCategory = function(category, station, type, licenses)
    local elements = {}
    for i = 1, #(cfg[type][category].vehicles) do
        local v = cfg[type][category].vehicles[i]
        local can = false
        if v.grade == -1 then
            can = true
        else
            for j = 1, #(v.grade) do
                if v.grade[j] == ESX.PlayerData.job.grade then
                    can = true
                    break
                end
            end
        end

        if v.required and not licenses[v.required] then
            can = false
        end

        if can then
            elements[#elements + 1] = {label = v.label, model = v.model, livery = v.livery, extras = v.extras}
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicles', {
		title    = "Kategoria: " .. cfg.vehiclesGarage[category].label,
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
        menu.close()
        local coords = GetAvailableVehicleSpawnPoint(station)
        if coords then
			ESX.Game.SpawnVehicle(data.current.model, coords, coords[4], function(vehicle)
                SetLastDrivenVehicle(vehicle)
				SetVehicleLivery(vehicle, data.current.livery)

				for i = 1, 20, 1 do
					SetVehicleExtra(vehicle, i, 1)
				end
						
				for i=1, #data.current.extras, 1 do
					SetVehicleExtra(vehicle, data.current.extras[i], extras)
				end

                ESX.Game.SetVehicleProperties(vehicle, {
					modEngine       = 0,
					modBrakes       = 0,
					modTransmission = 0,
					modSuspension   = 2,
					modTurbo        = true
				})

				SetVehicleDirtLevel(vehicle, 0)
				
				local rand = math.random(100,999)
				local plate = "LSPD " .. rand
				SetVehicleNumberPlateText(vehicle, plate)
				exports['goat_carkeys']:AddKey(plate)
            end)
        end
	end, function(data, menu)
		menu.close()
	end)
end

AddEventHandler("fumoPolice:openGarage", function(options)
	ESX.UI.Menu.CloseAll()

    local licenses = lib.callback.await('fumoPolice:getPoliceLicenses', false)

    if options.type == "helicoptersGarage" and not licenses["police_heli"] then
        return ESX.ShowNotification("Nie posiadasz licencji!")
    end

    local elements = {}
    for i = 1, #(cfg[options.type]) do
        local v = cfg[options.type][i]
        local can = false
        if v.grade == -1 then
            can = true
        else
            for j = 1, #(v.grade) do
                if v.grade[j] == ESX.PlayerData.job.grade then
                    can = true
                    break
                end
            end
        end

        if v.required and not licenses[v.required] then
            can = false
        end

        if can then
            elements[#elements + 1] = {label = v.label, value = i}
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicles_categories', {
		title    = "Garaż Policyjny",
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		menu.close()
		OpenGarageCategory(data.current.value, options.station, options.type, licenses)
	end, function(data, menu)
		menu.close()
	end)
end)

AddEventHandler("fumoPolice:deleteVehicle", function(data)
    local foundVehicle = false
    local points = cfg.spawners[data.station].spawnCoords
    local playerVehicle = GetVehiclePedIsIn(ESX.PlayerData.ped, true)

    if not playerVehicle or playerVehicle == 0 then
        playerVehicle = GetLastDrivenVehicle()
    end

    if not playerVehicle or playerVehicle == 0 then
		ESX.ShowNotification("Nie znaleziono twojego pojazdu na miejscu parkingowym!<br/>Wsiądź do niego i spróbuj ponownie.")
        return
    end

    local coords = GetEntityCoords(playerVehicle)
    for i = 1, #(points) do
        local point = points[i]
        local distance = #(coords - vector3(point[1], point[2], point[3]))
        if distance < 2.0 then
            local plate = GetVehicleNumberPlateText(playerVehicle, true)
            if type(plate) == "string" then
                plate = plate:gsub("%s$", "")
            end
            DeleteEntity(playerVehicle)
            exports['goat_carkeys']:RemoveKey(plate)
            foundVehicle = true
            break
        end
    end

    if not foundVehicle then
		ESX.ShowNotification("Nie znaleziono twojego pojazdu na miejscu parkingowym!<br/>Wsiądź do niego i spróbuj ponownie.")
        return
    end

    ESX.ShowNotification("Pojazd został schowany!")
end)

exports.ox_target:addGlobalVehicle({
    {
        name = 'police:openVehicle',
        event = name..':forceVehicle',
        icon = 'fa-solid fa-wrench',
        label = 'Otwórz pojazd',
        groups = {'police', 'mechanic'},
        distance  = 1,
        canInteract = function()
            return (not isBusy)
        end
    },
    {
        name = 'police:towVehicle',
        event = name..':forceVehicle',
        icon = 'fa-solid fa-wrench',
        label = 'Odholuj pojazd',
        groups = {'police', 'mechanic'},
        distance = 1,
        canInteract = function()
            return (not isBusy)
        end
    },
    {
        name = 'police:towVehicle2',
        event = name..':forceVehicle',
        icon = 'fa-solid fa-wrench',
        label = 'Odholuj pojazd (parking policyjny)',
        groups = {'police'},
        distance = 1,
        canInteract = function()
            return (not isBusy)
        end
    }
})

CreateThread(function()
    for k = 1, #(cfg.spawners) do
        local v = cfg.spawners[k]
        for a,b in pairs(v.options) do
            b.distance = 1
            b.station = k
        end
    
        RequestModel(GetHashKey(v.pedModel))
        while not HasModelLoaded(GetHashKey(v.pedModel)) do
            Wait(0)
        end
    
        local npc = CreatePed(4, v.pedModel, v.pedCoords[1], v.pedCoords[2], v.pedCoords[3], v.pedCoords[4], false, true)
    
        SetEntityHeading(npc, v.pedCoords[4])
        FreezeEntityPosition(npc, true)
        SetEntityInvincible(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
    
        exports.ox_target:addLocalEntity(npc, v.options)
    end
end)