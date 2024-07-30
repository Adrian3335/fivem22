ESX = exports.es_extended.getSharedObject()

RegisterCommand('propfix', function()
    for k, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        
        -- Nazwa w pause Menu
        function AddTextEntry(key, value)
            Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
        end
        
        Citizen.CreateThread(function()
          AddTextEntry('FE_THDR_GTAO', '~b~ROLEPLAY ~w~ PACK ~r~1.0')
        end)

        --Radar while driving
        local radarEnabled = IsRadarEnabled()

		if not IsPedInAnyVehicle(PlayerPedId()) and radarEnabled then
			DisplayRadar(false)
		elseif IsPedInAnyVehicle(PlayerPedId()) and not radarEnabled then
			DisplayRadar(true)
		end

        -- Off radio
        if IsPedInAnyVehicle(PlayerPedId()) then
            SetUserRadioControlEnabled(true)
        if GetPlayerRadioStationName() ~= nil then
            SetVehRadioStation(GetVehiclePedIsIn(PlayerPedId()),"OFF")
        end
        end

        -- Blokada AFK kamery
        InvalidateIdleCam()
        InvalidateVehicleIdleCam()

        -- Anty Kolba
        local pedAK = GetPlayerPed(-1)
        local weapon = GetSelectedPedWeapon(pedAK)
        
        if IsPedArmed(pedAK, 4) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end

        -- Discord Rich Presence
        -- local name = GetPlayerName(PlayerId())

		-- ESX.TriggerServerCallback("sv-dev:connectedPlayers", function(players)
		--     SetDiscordAppId(1153052644072493096)
		--  	SetDiscordRichPresenceAsset('svdevlogo')
		--  	SetDiscordRichPresenceAssetText('https://discord.gg/XNTqS4cFBU')
		--  	SetRichPresence(('%s, ID: %s, %s/%s'):format(tostring(name), tostring(GetPlayerServerId(PlayerId())), tostring(players), tostring(GetConvarInt("sv_maxclients", 64))))
		--  	SetDiscordRichPresenceAction(1, "Discord!", "https://discord.gg/XNTqS4cFBU")
		--  end)
		-- Citizen.Wait(6 * 1000)

        -- Minimapa
        SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
        SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) -- Level 1
        SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) -- Level 2
        SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
        SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0) -- Level 4
        SetRadarZoom(1200)
    end
end)