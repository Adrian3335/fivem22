local itemNotification = function(itemName, title, fullName, amount)
	SendNUIMessage({
		action = "itemNotification",
		itemName = itemName,
		title = title,
		fullName = fullName,
		amount = amount
	})
end

RegisterNetEvent("diablohub_notifications:itemNotification", itemNotification)
exports("itemNotification", itemNotification)

local HideAlways = false
local BodyCamVisible = false
local lastState = nil
CreateThread(function()
	while true do
		local thisState = not IsPauseMenuActive() and BodyCamVisible and not HideAlways
		if thisState ~= lastState then
			SendNUIMessage({
				action = "toggleBodycam",
				state = thisState,
			})
			lastState = thisState
		end
		Wait(250)
	end
end)

local ToggleBodyCam = function(state, name, department)
	BodyCamVisible = state
	SendNUIMessage({
		action = "updateBodycamData",
		data = {
			name = name,
			department = department
		}
	})
end

exports("HideBodyCam", function(state)
	HideAlways = state
end)
exports("itemNotification", itemNotification)
RegisterNetEvent("diablohub_notifications:ToggleBodyCam", ToggleBodyCam)

local policeNotifications = {}
local hasNotify = 0

AcceptPoliceNotification = function(id, notif)
	local data = policeNotifications[id or #policeNotifications]
	SetNewWaypoint(data.coords.x, data.coords.y)
	if notif then
		TriggerServerEvent("diablohub_notifications:notifyAccept", data.playerId)
	end
end

CreateThread(function()
	while true do
		if hasNotify > 0 then
			ESX.ShowHelpNotification("Naciśnij <h1>E</h1> aby zaakceptować zgłoszenie")
			if IsControlJustReleased(0, 38) then
				AcceptPoliceNotification(nil, true)
				hasNotify = 0
			end
		end
		Wait(0)
	end
end)

CreateThread(function()
	while true do
		if hasNotify > 0 then
			hasNotify = hasNotify - 1000
		end
		Wait(1000)
	end
end)

local SoundEnable = true
local policeNotification = function(data)
	data.id = #policeNotifications + 1

	if data.coords then
		data.isPinable = true
		policeNotifications[data.id] = {coords = data.coords, playerId = data.playerId}
	end

	SendNUIMessage({
		action = "showFactionNotification",
		data = data
	})
	
	hasNotify = 5000

	if SoundEnable and data.sound then
		TriggerServerEvent("InteractSound_SV:PlayOnSource", data.sound.file, data.sound.volume)
	end

	if data.blip then
		local blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
		SetBlipSprite(blip, data.blip.sprite)
		SetBlipScale(blip, data.blip.scale)
		SetBlipColour(blip, data.blip.colour)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("<font face='Poppins-Medium' size= '11'>".. data.blip.name .."</font>")
		EndTextCommandSetBlipName(blip)

		if data.blip.pulse then
			PulseBlip(blip)
		end

		if data.blip.route then
			SetBlipRoute(blip, true)
		end

		Wait(data.blip.timeToDelete)
		RemoveBlip(blip)
	end
end

RegisterCommand("togglesound", function()
	SoundEnable = not SoundEnable
	ESX.ShowNotification(SoundEnable and "Włączyłeś dzwięki z powiadomień frakcyjnych" or "Wyłączyłeś dzwięki z powiadomień frakcyjnych")
end)

exports("policeNotify", policeNotification)
RegisterNetEvent("diablo_hub:policeNotify", policeNotification)

local mySource = 0
local blips = {}
CreateThread(function()
	while true do
		mySource = GetPlayerServerId(PlayerId())
        local ActiveGPS = GlobalState.ActiveGPS
		if ActiveGPS[mySource] then
			for source, cfg in pairs(ActiveGPS) do
				if source ~= mySource then
					if not blips[source] then
						blips[source] = AddBlipForCoord(cfg.coords)
						SetBlipCategory(blips[source], 2)
						SetBlipRotation(blips[source], Ceil(cfg.heading))
						SetBlipSprite(blips[source], 1)
						SetBlipColour(blips[source], cfg.color)
						SetBlipScale(blips[source], 0.9)
						ShowHeadingIndicatorOnBlip(blips[source], true)
						if cfg.badge then
							ShowNumberOnBlip(blips[source], tonumber(cfg.badge))
						end
						BeginTextCommandSetBlipName('STRING')
        				AddTextComponentSubstringPlayerName(cfg.label)
        				EndTextCommandSetBlipName(blips[source])
					else
						SetBlipCoords(blips[source], cfg.coords)
						SetBlipRotation(blips[source], Ceil(cfg.heading))
					end
				end
			end
		end
		Wait(250)
	end
end)

RegisterNetEvent("goat_gps:off", function(source)
	while true do
		local ActiveGPS = GlobalState.ActiveGPS
		if not ActiveGPS[source] then
			break
		end
		Wait(100)
	end

	if source == mySource then
		for source2, _ in pairs(blips) do
			RemoveBlip(blips[source2])
		end
		blips = {}
	else
		if blips[source] then
			RemoveBlip(blips[source])
			blips[source] = nil
		end
	end
end)

AddEventHandler('esx:removeInventoryItem', function(itemName, totalCount)
	local ActiveGPS = GlobalState.ActiveGPS
	if not ActiveGPS[mySource] then
		return
	end
	if itemName ~= "gps" then
		return
	end

	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	TriggerServerEvent("goat_gps:lost", {x = coords.x, y = coords.y, z = coords.y}, GetStreetNameFromHashKey(s1))
end)

RegisterNetEvent("goat_gps:lost", function(target, coords, location, name, hour)
	if ESX.PlayerData.job and (ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'lssd' or ESX.PlayerData.job.name == 'ambulance') then
		exports["goat_notifications"]:policeNotify({
			playerId = target,
			coords = coords,
			textColor = "#fff",
			bgColor = "#C30000",
			title1 = "10-1",
			title2 = "Lost GPS signal!",
			blip = {
				name = "# Lost GPS: " .. name,
				sprite = 458,
				scale = 0.9,
				colour = 73,
				timeToDelete = 180000
			},
			sound = {
				file = "POLICEOfficerGpsLost",
				volume = 0.3
			},
			content = {
				{
					type = "location",
					text = location
				},
				{
					type = "guard",
					text = name
				},
				{
					type = "msg",
					text = "Godzina zgłoszenia: " .. hour
				}
			}
		})
	end
end)

local CanUse = {
	["10-13"] = true,
	["bk1"] = true,
	["bk2"] = true,
	["bk3"] = true,
}
RegisterCommand("10-13", function()
	if not LocalPlayer.state.IsDead then
		return
	end

	if not CanUse["10-13"] then
		return ESX.ShowNotification("Odczekaj chwilę przed następnym użyciem 10-13")
	end

    local hasJob = false
    for i = 1, #(Config.AuthorizedJobs["10-13"]) do
        if ESX.PlayerData.job.name == Config.AuthorizedJobs["10-13"][i] then
            hasJob = true
            break
        end
    end

    if hasJob then
        TriggerServerEvent("frp_jobutils:10-13")
		CanUse["10-13"] = false
		Wait(30000)
		CanUse["10-13"] = true
    end
end)

RegisterNetEvent("frp_jobutils:10-13", function(target, coords, name, hour)
    local hasJob = false
    for i = 1, #(Config.AuthorizedJobs["10-13"]) do
        if ESX.PlayerData.job.name == Config.AuthorizedJobs["10-13"][i] then
            hasJob = true
            break
        end
    end

    if not hasJob then
        return
    end

    local street = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	exports["goat_notifications"]:policeNotify({
		playerId = target,
		coords = coords,
		textColor = "#fff",
		bgColor = "#000000",
		title1 = "10-13",
		title2 = "Officer Down!",
		blip = {
			name = "# Lokalizacja rannego oficera",
			sprite = 84,
			scale = 0.9,
			colour = 1,
			timeToDelete = 180000
		},
		sound = {
			file = "POLICEofficerdown",
			volume = 0.3
		},
		content = {
			{
				type = "location",
				text = GetStreetNameFromHashKey(street)
			},
			{
				type = "guard",
				text = name
			},
			{
				type = "msg",
				text = "Godzina zgłoszenia: " .. hour
			}
		}
	})
end)


RegisterNetEvent("sellnarko", function(target, coords, name, hour)
    local street = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	exports["goat_notifications"]:policeNotify({
		playerId = target,
		coords = coords,
		textColor = "#fff",
		bgColor = "#000000",
		title1 = "10-70",
		title2 = "Sprzedaz narkotykow!",
		blip = {
			name = "# Lokalizacja sprzedazy",
			sprite = 84,
			scale = 0.9,
			colour = 1,
			timeToDelete = 180000
		},
		sound = {
			file = "POLICEofficerdown",
			volume = 0.3
		},
		content = {
			{
				type = "location",
				text = GetStreetNameFromHashKey(street)
			},
			{
				type = "guard",
				text = name
			},
			{
				type = "msg",
				text = "Godzina zgłoszenia: " .. hour
			}
		}
	})
end)

for i = 1, 3 do
	RegisterCommand("bk" .. i, function()
		if LocalPlayer.state.injured then
			return
		end

		if not CanUse["bk" .. i] then
			return ESX.ShowNotification("Odczekaj chwilę przed następnym użyciem backupa")
		end

		local hasJob = false
		for i = 1, #(Config.AuthorizedJobs["bk" .. i]) do
			if ESX.PlayerData.job.name == Config.AuthorizedJobs["bk" .. i][i] then
				hasJob = true
				break
			end
		end

		if hasJob then
			TriggerServerEvent("frp_jobutils:bk", i)
			CanUse["bk" .. i] = false
			Wait(30000)
			CanUse["bk" .. i] = true
		end
	end)
end

RegisterNetEvent("frp_jobutils:bk1", function(target, coords, name, hour)
    local hasJob = false
    for i = 1, #(Config.AuthorizedJobs["bk1"]) do
        if ESX.PlayerData.job.name == Config.AuthorizedJobs["bk1"][i] then
            hasJob = true
            break
        end
    end

    if not hasJob then
        return
    end

	local street = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	exports["goat_notifications"]:policeNotify({
		playerId = target,
		coords = coords,
		textColor = "#fff",
		bgColor = "#03A300",
		title1 = "BK1",
		title2 = "Need backup!",
		blip = {
			name = "# BK1: " .. name,
			sprite = 161,
			scale = 0.9,
			colour = 3,
			timeToDelete = 180000
		},
		sound = {
			file = "POLICEBackup1",
			volume = 0.3
		},
		content = {
			{
				type = "location",
				text = GetStreetNameFromHashKey(street)
			},
			{
				type = "guard",
				text = name
			},
			{
				type = "msg",
				text = "Godzina zgłoszenia: " .. hour
			}
		}
	})
end)

RegisterNetEvent("frp_jobutils:bk2", function(target, coords, name, hour)
    local hasJob = false
    for i = 1, #(Config.AuthorizedJobs["bk2"]) do
        if ESX.PlayerData.job.name == Config.AuthorizedJobs["bk2"][i] then
            hasJob = true
            break
        end
    end

    if not hasJob then
        return
    end

	local street = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	exports["goat_notifications"]:policeNotify({
		playerId = target,
		coords = coords,
		textColor = "#fff",
		bgColor = "#C38100",
		title1 = "BK2",
		title2 = "Need backup!",
		blip = {
			name = "# BK2: " .. name,
			sprite = 161,
			scale = 0.9,
			colour = 5,
			timeToDelete = 180000,
			route = true
		},
		sound = {
			file = "POLICEBackup2",
			volume = 0.3
		},
		content = {
			{
				type = "location",
				text = GetStreetNameFromHashKey(street)
			},
			{
				type = "guard",
				text = name
			},
			{
				type = "msg",
				text = "Godzina zgłoszenia: " .. hour
			}
		}
	})
end)

RegisterNetEvent("frp_jobutils:bk3", function(target, coords, name, hour)
    local hasJob = false
    for i = 1, #(Config.AuthorizedJobs["bk3"]) do
        if ESX.PlayerData.job.name == Config.AuthorizedJobs["bk3"][i] then
            hasJob = true
            break
        end
    end

    if not hasJob then
        return
    end

	local street = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	exports["goat_notifications"]:policeNotify({
		playerId = target,
		coords = coords,
		textColor = "#fff",
		bgColor = "#C30000",
		title1 = "BK3",
		title2 = "Need immediate assistance!",
		blip = {
			name = "# BK3: " .. name,
			sprite = 161,
			scale = 0.9,
			colour = 75,
			timeToDelete = 180000,
			waypoint = true
		},
		sound = {
			file = "POLICEBackup3",
			volume = 0.3
		},
		content = {
			{
				type = "location",
				text = GetStreetNameFromHashKey(street)
			},
			{
				type = "guard",
				text = name
			},
			{
				type = "msg",
				text = "Godzina zgłoszenia: " .. hour
			}
		}
	})
end)