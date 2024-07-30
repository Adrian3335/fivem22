local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData				= {}
local FirstSpawn				= true
local IsDead					= false
local TimerThreadId	   = nil
local DistressThreadId	= nil
local HasAlreadyEnteredMarker	= false
local LastZone					= nil
local CurrentAction				= nil
local obezwladniony = false
local CurrentActionMsg			= ''
local CurrentActionData			= {}
local IsBusy					= false
local blockShooting = GetGameTimer()
local CurrentTask = {}
local Melee = { `WEAPON_UNARMED`, `WEAPON_KNUCKLE`, `WEAPON_BAT`, `WEAPON_FLASHLIGHT`, `WEAPON_HAMMER`, `WEAPON_CROWBAR`, `WEAPON_PIPEWRENCH`, `WEAPON_NIGHTSTICK`, `WEAPON_GOLFCLUB`, `WEAPON_WRENCH` }
local Knife = { `WEAPON_KNIFE`, `WEAPON_DAGGER`, `WEAPON_MACHETE`, `WEAPON_HATCHET`, `WEAPON_SWITCHBLADE`, `WEAPON_BATTLEAXE`, `WEAPON_BATTLEAXE`, `WEAPON_STONE_HATCHET` }
local Bullet = { `WEAPON_SNSPISTOL`, `WEAPON_SNSPISTOL_MK2`, `WEAPON_PISTOL50`, `WEAPON_VINTAGEPISTOL`, `WEAPON_PISTOL`, `WEAPON_MILITARYRIFLE`, `WEAPON_PISTOL_MK2`, `WEAPON_GADGETPISTOL`, `WEAPON_DOUBLEACTION`, `WEAPON_COMBATPISTOL`, `WEAPON_HEAVYPISTOL`, `WEAPON_DBSHOTGUN`, `WEAPON_SAWNOFFSHOTGUN`, `WEAPON_PUMPSHOTGUN`, `WEAPON_PUMPSHOTGUN_MK2`, `WEAPON_BULLPUPSHOTGUN`, `WEAPON_MICROSMG`, `WEAPON_SMG`, `WEAPON_SMG_MK2`, `WEAPON_ASSAULTSMG`, `WEAPON_COMBATPDW`, `WEAPON_GUSENBERG`, `WEAPON_COMPACTRIFLE`, `WEAPON_ASSAULTRIFLE`, `WEAPON_ASSAULTRIFLE`, `WEAPON_EMPLAUNCHER`, `WEAPON_FERTILIZERCAN`, `WEAPON_CARBINERIFLE`, `WEAPON_MARKSMANRIFLE`, `WEAPON_SNIPERRIFLE`, `WEAPON_NAVYREVOLVER`, `WEAPON_RPG` }
local Electricity = { `WEAPON_STUNGUN`, `WEAPON_STUNGUN_MP` }
local Animal = { -100946242, 148160082 }
local FallDamage = { -842959696 }
local Explosion = { -1568386805, 1305664598, -1312131151, 375527679, 324506233, 1752584910, -1813897027, 741814745, -37975472, 539292904, 341774354, -1090665087 }
local Gas = { -1600701090 }
local Burn = { 615608432, 883325847, -544306709 }
local Drown = { -10959621, 1936677264 }
local Car = { 133987706, -1553120962 }
local tekst = 0
local isUsing = false
local cam = nil

local choosedHospital = nil
local heli = false

ESX								= nil

function isDead()
	return IsDead
end

function checkArray(array, val)
	for _, value in ipairs(array) do
		local v = value
		if type(v) == 'string' then
			v = GetHashKey(v)
		end

		if v == val then
			return true
		end
	end

	return false
end

function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()

	AddTextComponentString(text)
	DrawText(_x, _y)

	local factor = (string.len(text)) / 270
	DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
end

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)

function cleanPlayer(playerPed)
	Citizen.InvokeNative(0xCEA04D83135264CC, playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function RespawnPed(ped, coords)
	TriggerEvent("csskrouble:niggerCheck", false)
	TriggerEvent("csskrouble:save")
	exports["very-deathscreen"]:setDeath(false)
	SetEntityCoords(ped, coords.x, coords.y, coords.z)
	SetEntityHeading(ped, coords.heading)
	if ped == PlayerPedId() then
		SetGameplayCamRelativeHeading(coords.heading)
	end
	
	Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, ped, GetEntityMaxHealth(ped))
	
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.heading, true, false)
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z, coords.heading)
	TriggerEvent('esx:onPlayerSpawn', coords.x, coords.y, coords.z)
	Citizen.InvokeNative(0x239528EACDC3E7DE, ped, false)
	ClearPedBloodDamage(ped)
end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(_type)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)
	if _type == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth , math.floor(health + maxHealth/4))
		Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, playerPed, newHealth)
	elseif _type == 'big' then
		Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, playerPed, maxHealth)
	end

	ESX.ShowNotification('Uleczono gracza')

end)

RegisterNetEvent('esx_ambulancejob:healitem')
AddEventHandler('esx_ambulancejob:healitem', function(_type)
	local playerPed = PlayerPedId()
	local health = GetEntityHealth(playerPed)
	local maxHealth = GetEntityMaxHealth(playerPed)

	if not isUsing then
		if _type == 'bsmall' then
			if health < 200 then 
				isUsing = true
				ESX.UI.Menu.CloseAll()
				local newHealth = health + 50
				FreezeEntityPosition(playerPed, true)
				ClearPedTasks(playerPed)
				FreezeEntityPosition(playerPed, true)
				TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
				
				exports["rp_ui"]:Progbar("Leczenie obywatela", 5000, function()
					Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, playerPed, newHealth)
					FreezeEntityPosition(playerPed, false)
					ClearPedTasks(playerPed)
					isUsing = false				
					FreezeEntityPosition(playerPed, false)
				end)
			elseif health == 200 then
				ESX.ShowNotification('Zużyłeś bandaż')
			end
		elseif _type == 'bmedium' then
			isUsing = true
			ESX.UI.Menu.CloseAll()
			ClearPedTasks(playerPed)
			FreezeEntityPosition(playerPed, true)
			TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
			
			exports["rp_ui"]:Progbar("Leczenie obywatela", 4300, function()
				FreezeEntityPosition(playerPed, false)
				ClearPedTasks(playerPed)
				isUsing = false
				Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, playerPed, maxHealth)
				ESX.ShowNotification('Uleczono gracza')
			end)
		end
	else
		ESX.ShowNotification('Juz sobie pomagasz')
	end
end)

function StartRespawnTimer()
	Citizen.SetTimeout(Config.RespawnDelayAfterRPDeath, function()
			if IsDead then
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'rp_dead', {
			title = _U('rp_dead'),
			align = 'center',
			elements = {
				{ label = _U('yes'), value = 'yes' },
				{ label = _U('no'), value = 'no' },
			}
		}, function (data, menu)
			if data.current.value == 'yes' then
				RemoveItemsAfterRPDeath()
			end
			menu.close()
		end, function (data, menu)
			menu.close()
			if data.current.value == 'no' and IsControlJustPressed(1, 178) then
				RemoveItemsAfterRPDeath()
			end
			menu.close()
		end)
			end
	end)
end

function setUniform(job, playerPed)
	local sex = 0
    if (exports['fivem-appearance']:getPedModel(playerPed) == 'mp_f_freemode_01') then sex = 1 end

    for k, v in pairs(Config.Uniforms[job]) do
        local drawable = v.male.drawable
        local texture = v.male.texture
        if (sex == 1) then
            drawable = v.female.drawable
            texture = v.female.texture
        end

        TriggerEvent('bixbi_core:SetClothing', k, drawable, texture)
    end
end

function StartDistressSignal()
	CreateThread(function()
		local timer = Config.RespawnDelayAfterRPDeath

		local signal = 0
		while IsDead do
			Citizen.Wait(0)

			if obezwladniony then
				return
			else
				if signal < GetGameTimer() then
					SetTextFont(4)
					SetTextCentre(true)
					SetTextProportional(1)
					SetTextScale(0.45, 0.45)
					SetTextColour(255, 255, 255, 255)
					SetTextDropShadow(0, 0, 0, 0, 255)
					SetTextEdge(1, 0, 0, 0, 255)
					SetTextDropShadow()
					SetTextOutline()

					BeginTextCommandDisplayText('STRING')
					-- AddTextComponentSubstringPlayerName(_U('distress_send'))
					EndTextCommandDisplayText(0.5, 0.905)		

					if IsDisabledControlPressed(0, Keys['G']) and not exports['esx_policejob']:IsCuffed() then
						SendDistressSignal()
						signal = GetGameTimer() + 90000 * 4
					end					
				end
			end
		end
	end)
end

function SendDistressSignal()	
	ESX.TriggerServerCallback('gcphone:getItemAmount', function(qtty)
		if qtty > 0 then
			ESX.TriggerServerCallback('route68:getSimWczytana', function(sim)
				if sim == nil then
					ESX.ShowNotification('Nie posiadasz podpiętej karty sim')
				else
					local godzinaInt = GetClockHours()
					local godzina = ''
					if string.len(tostring(godzinaInt)) == 1 then
						godzina = '0'..godzinaInt
					else
						godzina = godzinaInt
					end
					local minutaInt = GetClockMinutes()
					local minuta = ''
					if string.len(tostring(minutaInt)) == 1 then
						minuta = '0'..minutaInt
					else
						minuta = minutaInt
					end
					godzina = godzina..":"..minuta
					
					ESX.ShowNotification('Sygnał alarmowy został wysłany!')
					
					local coords = GetEntityCoords(PlayerPedId())
					TriggerServerEvent('esx_addons_gcphone:startCall', 'ambulance', 'Ranny obywatel o godzienie: '..godzina, {
						x = coords.x,
						y = coords.y,
						z = coords.z
					})				
				end
			end)
		end
	end, 'phone')
end

function ShowDeathTimer()
	if DistressThreadId then
		TerminateThread(DistressThreadId)
	end
	
	local respawnTimer = Config.RespawnDelayAfterRPDeath
	local allowRespawn = Config.RespawnDelayAfterRPDeath/2
	local fineAmount = Config.EarlyRespawnFineAmount
	local payFine = false

	if Config.EarlyRespawn and Config.EarlyRespawnFine then
		ESX.TriggerServerCallback('esx_ambulancejob:checkBalance', function(finePayable)
			if finePayable then
				payFine = true
			else
				payFine = false
			end
		end)
	end

	CreateThread(function()
		ClearPedTasksImmediately(PlayerPedId())
		while respawnTimer > 0 and IsDead do
			Citizen.Wait(0)
			if obezwladniony then
				return
			else
				raw_seconds = respawnTimer/1000
				raw_minutes = raw_seconds/60
				minutes = stringsplit(raw_minutes, ".")[1]
				seconds = stringsplit(raw_seconds-(minutes*60), ".")[1]

				SetTextFont(4)
				SetTextProportional(0)
				SetTextScale(0.0, 0.5)
				SetTextColour(255, 255, 255, 255)
				SetTextDropshadow(0, 0, 0, 0, 255)
				SetTextEdge(1, 1, 0, 0, 255)
				SetTextDropShadow()
				SetTextOutline()

				local text = _U('please_wait', minutes, seconds)

				if Config.EarlyRespawn then
					if not Config.EarlyRespawnFine and respawnTimer <= allowRespawn then
						text = text .. _U('press_respawn')
					elseif Config.EarlyRespawnFine and respawnTimer <= allowRespawn and payFine then
						text = text .. _U('respawn_now_fine', fineAmount)
					else
						text = text
					end
				end

				SetTextCentre(true)
				SetTextEntry("STRING")
				AddTextComponentString(text)
				DrawText(0.5, 0.8)

				if Config.EarlyRespawn then
					if not Config.EarlyRespawnFine then
						if IsControlPressed(0, 46) then
							RemoveItemsAfterRPDeath()
							break
						end
					elseif Config.EarlyRespawnFine then
						if respawnTimer <= allowRespawn and payFine then
							if IsControlPressed(0, 46) then
								PayFine()
								break
							end
						end
					end
				end
				respawnTimer = respawnTimer - 15
			end
		end
	end)
end

RegisterNetEvent('esx_ambulancejob:baska')
AddEventHandler('esx_ambulancejob:baska', function(source)
	BaskaKurwaLeczenie()
end)

function BaskaKurwaLeczenie()
	CreateThread(function()
		DoScreenFadeOut(800)
		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end
		ESX.UI.Menu.CloseAll()
			ESX.SetPlayerData('lastPosition', vector3(306.9029, -595.3215, 43.2840))
			TriggerServerEvent('esx:updateCoords', vector3(306.9029, -595.3215, 43.2840))
			RespawnPed(PlayerPedId(), vector3(306.9029, -595.3215, 43.2840))
			TriggerServerEvent('esx_ambulancejob:setDeathStatus', 0)
			StopScreenEffect('DeathFailOut')
			DoScreenFadeIn(800)
		end)
end

function RemoveItemsAfterRPDeath()
	CreateThread(function()
		DoScreenFadeOut(800)
		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end
		ESX.UI.Menu.CloseAll()
		ESX.TriggerServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function()
			ESX.SetPlayerData('lastPosition', vector3(313.4193, -589.4819, 43.284))
			TriggerServerEvent('esx:updateCoords', vector3(313.4193, -589.4819, 43.2840))
			RespawnPed(PlayerPedId(), vector3(313.4193, -589.4819, 43.2840))
			TriggerServerEvent('esx_ambulancejob:setDeathStatus', 0)
			StopScreenEffect('DeathFailOut')
			DoScreenFadeIn(800)
		end)
	end)
end

function PayFine()
	ESX.TriggerServerCallback('esx_ambulancejob:payFine', function()
	RemoveItemsAfterRPDeath()
	end)
end

function secondsToClock(seconds)
	local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0

	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format('%02.f', math.floor(seconds / 3600))
		local mins = string.format('%02.f', math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format('%02.f', math.floor(seconds - hours * 3600 - mins * 60))

		return secs, mins
	end
end

function StartDeathTimer()
	if TimerThreadId then
		TerminateThread(TimerThreadId)
	end
	local timer = ESX.Math.Round(Config.RespawnToHospitalDelay / 1000)
	local seconds,minutes = secondsToClock(timer)
	local firstScreen = true
	CreateThread(function() 
		HasTimer = true
		while timer > 0 and IsDead do
			Citizen.Wait(1000)
			if timer > 0 then
				timer = timer - 1
			end
			seconds,minutes = secondsToClock(timer)
		end
		HasTimer = false
		firstScreen = false
	end)
	CreateThread(function()
		TimerThreadId = GetIdOfThisThread()

		while firstScreen do
			Citizen.Wait(1)
			if obezwladniony then
				return
			else
				SetTextFont(4)
				SetTextCentre(true)
				SetTextProportional(1)
				SetTextScale(0.45, 0.45)
				SetTextColour(255, 255, 255, 255)
				SetTextDropShadow(0, 0, 0, 0, 255)
				SetTextEdge(1, 0, 0, 0, 255)
				SetTextDropShadow()
				SetTextOutline()

				BeginTextCommandDisplayText("STRING")
				-- AddTextComponentSubstringPlayerName('Pozostało: [~b~'..minutes..' minut i '..seconds..' sekund~w~] do przyjazdu lokalnych medyków')
				EndTextCommandDisplayText(0.5, 0.870)

				




			end
		end

		local pressStart = nil
		while IsDead do
			Citizen.Wait(0)
			if obezwladniony then 
				return
			else
				exports["very-deathscreen"]:setDeath(true, Config.EarlyRespawnTimerr/1000)
				SetTextFont(4)
				SetTextCentre(true)
				SetTextProportional(1)
				SetTextScale(0.45, 0.45)
				SetTextColour(255, 255, 255, 255)
				SetTextDropShadow(0, 0, 0, 0, 255)
				SetTextEdge(1, 0, 0, 0, 255)
				SetTextDropShadow()
				SetTextOutline()


		BeginTextCommandDisplayText("STRING")
		-- AddTextComponentSubstringPlayerName('Przytrzymaj [~p~E] aby zostać transportowanym do szpitala')
		EndTextCommandDisplayText(0.5, 0.8)

		if IsControlPressed(0, Keys['E']) then
			if not pressStart then
				pressStart = GetGameTimer()
			end

			if GetGameTimer() - pressStart > 3000 then
				RemoveItemsAfterRPDeath()
				pressStart = nil
				break
			end
		else
			pressStart = nil
				end
			end	
		end
	end)
end				


CreateThread(function()
	while true do
		Citizen.Wait(2)

		if IsDead then
			DisableAllControlActions(0)
			EnableControlAction(0, Keys['G'], true)
			EnableControlAction(0, Keys['T'], true)
			EnableControlAction(0, Keys['E'], true)
			EnableControlAction(0, Keys['F5'], true)
			EnableControlAction(0, Keys['N'], true)
			EnableControlAction(0, Keys['HOME'], true)
			EnableControlAction(0, Keys['DELETE'], true)
			EnableControlAction(0, Keys['H'], true)
			EnableControlAction(0, 21, true)
			EnableControlAction(0, Keys['Z'], true)
			EnableControlAction(0, Keys['F5'], true)
			EnableControlAction(0, Keys['F1'], true)
			EnableControlAction(0, Keys['F2'], true)
			--drawTxt(0.905, 1.375, 1.0, 1.0, 0.4, 'Użyj komendy ~b~/bwrefresh aby odswieżyć swoją pozycję', 255, 255, 255, 255)
		else
			Citizen.Wait(500)
		end
	end
end)


function DeathFunc() 
	local playerPed = PlayerPedId()
	ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 2.0)
	CreateThread(function ()
		RequestAnimDict('dead')
		while not HasAnimDictLoaded('dead') do
			Citizen.Wait(0)
		end

		if IsPedInAnyVehicle(playerPed, false) then
			while IsPedInAnyVehicle(playerPed, true) do
				Citizen.Wait(0)
			end
		else
			if GetEntitySpeed(playerPed) > 0.2 then
				while GetEntitySpeed(playerPed) > 0.2 do
					Citizen.Wait(0)
				end
			end
		end

		local weapon = GetPedCauseOfDeath(playerPed)
		local sourceofdeath = GetPedSourceOfDeath(playerPed)
		local damagedbycar = false
		if weapon == 0 and sourceofdeath == 0 and HasEntityBeenDamagedByWeapon(playerPed, `WEAPON_RUN_OVER_BY_CAR`, 0) then
			damagedbycar = true
		end
		local coords = GetEntityCoords(playerPed)
		NetworkResurrectLocalPlayer(coords, 0.0, false, false)
		Citizen.Wait(100)
		SetEntityCoords(playerPed, coords)
		SetPlayerInvincible(PlayerId(), true)
		SetPlayerCanUseCover(PlayerId(), false)

		local knockoutDuration = 40000

		if weapon == `WEAPON_UNARMED` or ((weapon == `WEAPON_RUN_OVER_BY_CAR` or damagedbycar) and sourceofdeath ~= playerPed) or weapon == `WEAPON_NIGHTSTICK` then
			obezwladniony = true
			CreateThread(function() 
				exports['ox_lib']:progressBar({
					duration = 40000,
					label = 'Odzyskujesz siły...',
					useWhileDead = false,
					canCancel = true,
					disable = {
						car = true,
						move = true,
						combat = true,
					},
				}) 
			end)

			Citizen.SetTimeout(knockoutDuration, function() 
				RespawnPed(PlayerPedId(), GetEntityCoords(GetPlayerPed(-1)))
				Citizen.Wait(500)
				SetEntityHealth(PlayerPedId(), 170)
			end)
		end

		while IsDead do
			local playerPed = PlayerPedId()
			SetEntityInvincible(playerPed, true)
			SetEntityCanBeDamaged(playerPed, false)
			if not IsPedInAnyVehicle(playerPed, false) then
				if not IsEntityPlayingAnim(playerPed, 'dead', 'dead_a', 3) then
					TaskPlayAnim(playerPed, 'dead', 'dead_a', 1.0, 1.0, -1, 2, 0, 0, 0, 0)
				end
			end

			Citizen.Wait(1)
		end
		obezwladniony = false
		SetPlayerInvincible(PlayerId(), false)
		SetPlayerCanUseCover(PlayerId(), true)
		SetEntityInvincible(playerPed, false)
		SetEntityCanBeDamaged(playerPed, true)
		StopAnimTask(PlayerPedId(), 'dead', 'dead_a', 4.0)
		RemoveAnimDict('dead')
		EnableAllControlActions(0)
	end)
end

function OnPlayerDeath()
	if not IsDead then
		StartDeathCam()
		IsDead = true
		ESX.UI.Menu.CloseAll()
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', 1)
		exports["very-deathscreen"]:setDeath(true, Config.EarlyRespawnTimer/1000)

		local playerPed = PlayerPedId()
		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed, false)
			if GetPedInVehicleSeat(vehicle, -1) == playerPed then
				SetVehicleEngineOn(vehicle, false, true, true)
				while GetEntitySpeed(vehicle) > 0.0 do
					local vehSpeed = GetEntitySpeed(vehicle)
					SetVehicleForwardSpeed(vehicle, (vehSpeed * 0.85))
					Citizen.Wait(300)
				end
			else
				SetEntityCoords(playerPed, GetEntityCoords(playerPed))
			end
		end

		StartDeathTimer()
		StartDistressSignal()

		Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())

		DeathFunc()
	else
		SetEntityHealth(PlayerPedId(), GetPedMaxHealth(PlayerPedId()))
	end	
end

function TeleportFadeEffect(entity, coords)

	CreateThread(function()

		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(0)
		end

		ESX.Game.Teleport(entity, coords, function()
			DoScreenFadeIn(800)
		end)
	end)
end

function WarpPedInClosestVehicle(ped)

	local coords = GetEntityCoords(ped)

	local vehicle, distance = ESX.Game.GetClosestVehicle({
		x = coords.x,
		y = coords.y,
		z = coords.z
	})

	if distance ~= -1 and distance <= 5.0 then

		local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
		local freeSeat = nil

		for i=maxSeats - 1, 0, -1 do
			if IsVehicleSeatFree(vehicle, i) then
				freeSeat = i
				break
			end
		end

		if freeSeat ~= nil then
			TaskWarpPedIntoVehicle(ped, vehicle, freeSeat)
		end

	else
		TriggerEvent('ox_inventory:notify', {type = 'error', text = 'Nie ma pojazdu'})
		-- ESX.ShowNotification(_U('no_vehicles'))
	end
end

CreateThread(function()
	local timer = GetGameTimer()
	
	while true do

		Citizen.Wait(10)
		if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
		
			if IsControlJustReleased(0, 38) and CurrentTask.busy and timer < GetGameTimer() then
				TriggerEvent('ox_inventory:notify', {type = 'error', text = 'Anulowano zajęcie'})
				-- ESX.ShowNotification('Anulowano zajęcie')
				ESX.ClearTimeout(CurrentTask.task)
				ClearPedTasks(PlayerPedId())

				CurrentTask.busy = false
				
				timer = GetGameTimer() + 500
			end	
		
			if IsControlJustReleased(0, Keys['F6']) and not IsDead and timer < GetGameTimer() then
				OpenMobileAmbulanceActionsMenu()
				
				timer = GetGameTimer() + 500
			end
		
		else
			Citizen.Wait(1000)
		end
	end
end)

function OpenMobileAmbulanceActionsMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions',
	{
		title		= _U('ems_menu_title'),
		align		= 'center',
		elements	= {
			{label = ('Interakcje z cywilem'), value = 'citizen_interaction'},
			-- {label = ('Interakcje z pojazdem'), value = 'vehicle_interaction'},
			-- {label = ('Kajdanki'), value = 'Kajdanki'},
			-- {label = ('Tablet SAMS'), value = 'tablet'}
		}
	}, function(data, menu)
		if data.current.value == 'OpenRehabMenu' then					
			menu.close()
			OpenRehabMenu()
		elseif data.current.value == 'tablet' then
			menu.close()
			TriggerEvent('tabletmed')
		elseif data.current.value == 'Kajdanki' then
			menu.close()
			TriggerEvent('Kajdanki')
		elseif data.current.value == 'citizen_interaction' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction',
			{
				title		= _U('ems_menu_title'),
				align		= 'center',
				elements	= {
					{label = ('Ożyw obywatela'), value = 'revive'},
					{label = ('Ulecz małe rany'), value = 'small'},
					{label = ('Ulecz poważne rany'), value = 'big'},
					
				}
			}, function(data, menu)
				if IsBusy then 
					return 
				end
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

						if closestPlayer == -1 or closestDistance > 1.0 then
							ESX.ShowNotification('Brak graczy w pobliżu')
							
						else
		
							if data.current.value == 'revive' then
								ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
									if quantity > 0 then
										local closestPlayerPed = Citizen.InvokeNative(0x43A66C31C68491C0, closestPlayer)
		
										if IsPedDeadOrDying(closestPlayerPed, 1) or IsEntityPlayingAnim(closestPlayerPed, 'dead', 'dead_a', 3) then
											local playerPed = PlayerPedId()
		
											IsBusy = true
											ESX.ShowNotification('Już leczysz jakiegoś gracz')
		
											local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
		
											for i=1, 7, 1 do
												Citizen.Wait(900)
										
												ESX.Streaming.RequestAnimDict(lib, function()
													TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
												end)
											end
		
											TriggerServerEvent('esx_ambulancejob:removeItem', 'apteczka')
											TriggerServerEvent('hypex_ambulancejob:hypexrevive', GetPlayerServerId(closestPlayer))
											IsBusy = false
		
											-- Show revive award?
											if Config.ReviveReward > 0 then
												ESX.ShowNotification('Za uleczenie gracza otrzymałeś '..Config.ReviveReward..'')
											else
												ESX.ShowNotification('Uleczyłeś gracza ')
											end
										else
											ESX.ShowNotification('Gracz nie ma żadnych ran')
										end
									else
										ESX.ShowNotification('Nie masz wystarczająco apteczek')
									end
								end, 'apteczka')
							
							elseif data.current.value == 'zbadaj' then
								if IsPlayerDead(closestPlayer) then
									menu.close()
		
									RequestAnimDict('amb@medic@standing@kneel@base')
									while not HasAnimDictLoaded('amb@medic@standing@kneel@base') do
										Citizen.Wait(0)
									end
		
									RequestAnimDict('anim@gangops@facility@servers@bodysearch@')
									while not HasAnimDictLoaded('anim@gangops@facility@servers@bodysearch@') do
										Citizen.Wait(0)
									end
		
									local closestPlayerPed = Citizen.InvokeNative(0x43A66C31C68491C0, closestPlayer)
									ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions_test', {
										title= 'EMS - Badanie pacjetna',
										align= 'center',
										elements = {
											{label = 'Zbadaj przyczynę utraty przytomności', value = 'death'},
											{label = 'Zbadaj uszkodzenia ciała', value = 'damage'}
										}
									}, function(data2, menu2)
										menu2.close()
		
										local ac = data2.current.value
										if ac == 'damage' then
											local success, bone = GetPedLastDamageBone(closestPlayerPed)
											if success then
												local x, y, z = table.unpack(GetPedBoneCoords(closestPlayerPed, bone))
		
												local timestamp = GetGameTimer()
												while (timestamp + 10000) > GetGameTimer() do
													Citizen.Wait(0)
													DrawText3D(x, y, z, '*', 0.6)
												end
											else
												ESX.ShowNotification('Nie jesteś w stanie zbadać, gdzie pacjent doznał obrażeń')
											end
										elseif ac == 'death' then
											IsBusy = true
											ESX.ShowNotification('Rozpoczynasz badanie pacjenta')
		
											local playerPed = PlayerPedId()
											TaskPlayAnim(playerPed, "amb@medic@standing@kneel@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
											TaskPlayAnim(playerPed, "anim@gangops@facility@servers@bodysearch@", "player_search", 8.0, -8.0, -1, 48, 0, false, false, false)
		
											Citizen.Wait(5000)
											Citizen.InvokeNative(0xAAA34F8A7CB32098, playerPed)
											IsBusy = false
		
											local d = GetPedCauseOfDeath(closestPlayerPed)
											if checkArray(Melee, d) then
												ESX.ShowNotification(_U('dc_hardmeele'))
											elseif checkArray(Bullet, d) then
												ESX.ShowNotification(_U('dc_bullet'))
											elseif checkArray(Knife, d) then
												ESX.ShowNotification(_U('dc_knifes'))
											elseif checkArray(Electricity, d) then
												ESX.ShowNotification(_U('dc_electricity'))
											elseif checkArray(Animal, d) then
												ESX.ShowNotification(_U('dc_bitten'))
											elseif checkArray(FallDamage, d) then
												ESX.ShowNotification(_U('dc_brokenlegs'))
											elseif checkArray(Explosion, d) then
												ESX.ShowNotification(_U('dc_explosive'))
											elseif checkArray(Gas, d) then
												ESX.ShowNotification(_U('dc_gas'))
											elseif checkArray(Burn, d) then
												ESX.ShowNotification(_U('dc_fire'))
											elseif checkArray(Drown, d) then
												ESX.ShowNotification(_U('dc_drown'))
											elseif checkArray(Car, d) then
												ESX.ShowNotification(_U('dc_caraccident'))
											else
												ESX.ShowNotification(_U('dc_unknown'))
											end
										end
									end, function(data2, menu2)
										menu2.close()
									end)
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end	
							elseif data.current.value == 'small' then
		
								ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
									if quantity > 0 then
										local closestPlayerPed = Citizen.InvokeNative(0x43A66C31C68491C0, closestPlayer)
										local health = GetEntityHealth(closestPlayerPed)
		
										if health > 0 then
											local playerPed = PlayerPedId()
		
											IsBusy = true
											ESX.ShowNotification(_U('heal_inprogress'))
											TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
											Citizen.Wait(10000)
											ClearPedTasks(playerPed)
		
											TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
											TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
											ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
											IsBusy = false
										else
											ESX.ShowNotification(_U('player_not_conscious'))
										end
									else
										ESX.ShowNotification(_U('not_enough_bandage'))
									end
								end, 'bandage')
		
							elseif data.current.value == 'big' then
		
								ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
									if quantity > 0 then
										local closestPlayerPed = Citizen.InvokeNative(0x43A66C31C68491C0, closestPlayer)
										local health = GetEntityHealth(closestPlayerPed)
		
										if health > 0 then
											local playerPed = PlayerPedId()
		
											IsBusy = true
											ESX.ShowNotification(_U('heal_inprogress'))
											TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
											Citizen.Wait(10000)
											ClearPedTasks(playerPed)
		
											TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
											TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
											ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
											IsBusy = false
										else
											ESX.ShowNotification(_U('player_not_conscious'))
										end
									else
										ESX.ShowNotification(_U('not_enough_medikit'))
									end
								end, 'bandage')
		
							elseif data.current.value == 'put_in_vehicle' then
								TriggerServerEvent('xlem0n_policejob:putInVehicle', GetPlayerServerId(closestPlayer))
							elseif data.current.value == 'out_vehicle' then
								TriggerServerEvent('xlem0n_policejob:OutVehicle', GetPlayerServerId(closestPlayer))
							end

					
				end
			end, function(data, menu)
				menu.close()
			end)
		elseif data.current.value == 'vehicle_interaction' then
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction',
			{
				title		= _U('ems_menu_title'),
				align		= 'center',
				elements	= {
					{label = ('Napraw pojazd'), value = 'repair'},
					{label = ('Odholuj pojazd'), value = 'impound_vehicle'},
				}
			}, function(data, menu)
				local vehicle = ESX.Game.GetVehicleInDirection()
				if IsPedSittingInAnyVehicle(playerPed) then
					ESX.ShowNotification('Nie możesz tego w aucie zrobić!')
					return
				end
					
				if not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
					ESX.ShowNotification('Brak pojazdu w pobliżu')
				else

					if data.current.value == 'repair' then
						if(not IsPedInAnyVehicle(playerPed)) then
							TriggerEvent('esx_mechanicjobdrugi:onFixkitFree')
						end
					elseif data.current.value == 'hijack' then
						if(not IsPedInAnyVehicle(playerPed)) then
							menu.close()
							TriggerEvent('esx_mechanicjobdrugi:onHijack')
						end
					elseif data.current.value == 'impound_vehicle' then
						local playerPed = PlayerPedId()
						local coords    = GetEntityCoords(playerPed)	 
						if CurrentTask.Busy then
							return
						end
				
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ żeby unieważnić zajęcie')
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
				
						CurrentTask.Busy = true
						CurrentTask.Task = ESX.SetTimeout(10000, function()
							ClearPedTasks(playerPed)
							vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
							ESX.Game.DeleteVehicle(vehicle)
				
							CurrentTask.Busy = false
							Citizen.Wait(100)
						end)
				
						-- keep track of that vehicle!
						CreateThread(function()
							while CurrentTask.Busy do
								Citizen.Wait(1000)
				
								vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
								if not DoesEntityExist(vehicle) and CurrentTask.Busy then
									ESX.ShowNotification(_U(action .. '_canceled_moved'))
									ESX.ClearTimeout(CurrentTask.Task)
				
									ClearPedTasks(playerPed)
									CurrentTask.Busy = false
									break
								end
							end
						end)
					end

					
				end
			end, function(data, menu)
				menu.close()
			end)		
		end

	end, function(data, menu)
		menu.close()
	end)
end


AddEventHandler('otworz:jebana:ems:szafke123', function()
	OpenCloakroomMenu()
end)

function OpenCloakroomMenu(LSFD)
	local elements = {
	--   {label = _U('ems_clothes_civil'), value = 'citizen_wear'},
	--   {label = 'Ubrania Prywatne', value = 'player_dressing' },
	  {label = 'Garderoba SAMS', value = 'otwier_dressing'}
	}
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'cloakroom', {
		title	= _U('cloakroom'),
		align	= 'center',
		elements = elements
	  }, function(data, menu)
		menu.close()
		if data.current.value == 'citizen_wear' then
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
			TriggerEvent('skinchanger:loadSkin', skin)
		  end)
		  elseif data.current.value == 'otwier_dressing' then
			  otwier_dressing()
		  elseif data.current.value == 'player_dressing' then
			  ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
				  local elements = {}
  
				  for i=1, #dressing, 1 do
					  table.insert(elements, {
						  label = dressing[i],
						  value = i
					  })
				  end
  
				  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
					  title    = "Garderoba prywatna",
					  align    = 'center',
					  elements = elements
				  }, function(data2, menu2)
					  TriggerEvent('skinchanger:getSkin', function(skin)
						  ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
							  TriggerEvent('skinchanger:loadClothes', skin, clothes)
							  TriggerEvent('esx_skin:setLastSkin', skin)
  
							  TriggerEvent('skinchanger:getSkin', function(skin)
								  TriggerServerEvent('esx_skin:save', skin)
							  end)
						  end, data2.current.value)
					  end)
				  end, function(data2, menu2)
					  menu2.close()
				  end)
			  end)
  
		end
  
		CurrentAction	 = 'cloak_actions_menu'
		CurrentActionData = {LSFD = LSFD}
	  end,
	  function(data, menu)
		menu.close()
	  end
	)
  
  end
  
  
  local Clothes = {
	  ProfesorMale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 427,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 80,
		['pants_1'] = 55,   ['pants_2'] = 0,
		['shoes_1'] = 32,   ['shoes_2'] = 0,
		['helmet_1'] = -1,      ['helmet_2'] = 0,
		['chain_1'] = 27,    ['chain_2'] = 0,
		['bproof_1'] = 0,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 0,     ['bags_2'] = 0
	  },
	  ProfesorFemale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 452,   ['torso_2'] = 6,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 88,
		['pants_1'] = 144,   ['pants_2'] = 0,
		['shoes_1'] = 73,   ['shoes_2'] = 5,
		['helmet_1'] = -1,      ['helmet_2'] = 0,
		['chain_1'] = 13,    ['chain_2'] = 1,
		['bproof_1'] = 0,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 0,     ['bags_2'] = 0
	  },
	  ChirurgMale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 460,   ['torso_2'] = 4,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 79,
		['pants_1'] = 55,   ['pants_2'] = 5,
		['shoes_1'] = 32,   ['shoes_2'] = 0,
		['helmet_1'] = -1,      ['helmet_2'] = 0,
		['chain_1'] = 27,    ['chain_2'] = 0,
		['bproof_1'] = 0,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 0,     ['bags_2'] = 0
	  },
	  ChirurgFemale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 486,   ['torso_2'] = 5,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 96,
		['pants_1'] = 144,   ['pants_2'] = 0,
		['shoes_1'] = 73,   ['shoes_2'] = 5,
		['helmet_1'] = -1,      ['helmet_2'] = 0,
		['chain_1'] = 13,    ['chain_2'] = 1,
		['bproof_1'] = 59,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 0,     ['bags_2'] = 0
	  },
	  DoktorMale = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 427,   ['torso_2'] = 3,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 86,
        ['pants_1'] = 55,   ['pants_2'] = 9,
        ['shoes_1'] = 32,   ['shoes_2'] = 0,
        ['helmet_1'] = 156,      ['helmet_2'] = 10,
        ['chain_1'] = 27,    ['chain_2'] = 0,
        ['bproof_1'] = 0,     ['bproof_2'] = 0,
        ['mask_1'] = -1,      ['mask_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bags_1'] = 0,     ['bags_2'] = 0
	  },
	  DoktorFemale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 452,   ['torso_2'] = 3,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 88,
		['pants_1'] = 144,   ['pants_2'] = 0,
		['shoes_1'] = 73,   ['shoes_2'] = 5,
		['helmet_1'] = -1,      ['helmet_2'] = 0,
		['chain_1'] = 13,    ['chain_2'] = 1,
		['bproof_1'] = 0,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 0,     ['bags_2'] = 0
	  },
	  LekarzMale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 460,   ['torso_2'] = 5,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 79,
        ['pants_1'] = 55,   ['pants_2'] = 0,
        ['shoes_1'] = 32,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,      ['helmet_2'] = 0,
        ['chain_1'] = 27,    ['chain_2'] = 0,
        ['bproof_1'] = 0,     ['bproof_2'] = 0,
        ['mask_1'] = -1,      ['mask_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bags_1'] = 0,     ['bags_2'] = 0
	  },
	  LekarzFemale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 486,   ['torso_2'] = 4,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 96,
        ['pants_1'] = 144,   ['pants_2'] = 2,
        ['shoes_1'] = 73,   ['shoes_2'] = 5,
        ['helmet_1'] = -1,      ['helmet_2'] = 0,
        ['chain_1'] = 13,    ['chain_2'] = 1,
        ['bproof_1'] = 59,     ['bproof_2'] = 0,
        ['mask_1'] = -1,      ['mask_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bags_1'] = 0,     ['bags_2'] = 0
	  },
	  SpecjalnyMale = {
        ['tshirt_1'] = 119,  ['tshirt_2'] = 3,
        ['torso_1'] = 73,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 82,
        ['pants_1'] = 55,   ['pants_2'] = 5,
        ['shoes_1'] = 8,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,      ['helmet_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 0,
        ['bproof_1'] = 0,     ['bproof_2'] = 0,
        ['mask_1'] = -1,      ['mask_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bags_1'] = 0,     ['bags_2'] = 0
	  },
	  SpecjalnyFemale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 189,   ['torso_2'] = 3,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 96,
		['pants_1'] = 144,   ['pants_2'] = 0,
		['shoes_1'] = 73,   ['shoes_2'] = 5,
		['helmet_1'] = -1,      ['helmet_2'] = 0,
		['chain_1'] = 13,    ['chain_2'] = 1,
		['bproof_1'] = 59,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 0,     ['bags_2'] = 0
	  },
	  RatownikMale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 465,   ['torso_2'] = 3,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 91,
		['pants_1'] = 169,   ['pants_2'] = 1,
		['shoes_1'] = 36,   ['shoes_2'] = 0,
		['helmet_1'] = 156,      ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['bproof_1'] = 0,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 105,     ['bags_2'] = 0
	  },
	  RatownikFemale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 487,   ['torso_2'] = 5,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 101,
		['pants_1'] = 93,   ['pants_2'] = 9,
		['shoes_1'] = 36,   ['shoes_2'] = 0,
		['helmet_1'] = -1,      ['helmet_2'] = 0,
		['chain_1'] = 13,    ['chain_2'] = 1,
		['bproof_1'] = 0,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 104,     ['bags_2'] = 0
	  },
	  PielegniarzMale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 460,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 90,
		['pants_1'] = 161,   ['pants_2'] = 1,
		['shoes_1'] = 36,   ['shoes_2'] = 0,
		['helmet_1'] = 156,      ['helmet_2'] = 10,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['bproof_1'] = 0,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 105,     ['bags_2'] = 0

	  },
	  PielegniarzFemale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 487,   ['torso_2'] = 2,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 101,
		['pants_1'] = 93,   ['pants_2'] = 9,
		['shoes_1'] = 36,   ['shoes_2'] = 0,
		['helmet_1'] = -1,      ['helmet_2'] = 0,
		['chain_1'] = 13,    ['chain_2'] = 1,
		['bproof_1'] = 0,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 104,     ['bags_2'] = 0
	  },
	  KlapekMale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 462,   ['torso_2'] = 3,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 90,
		['pants_1'] = 161,   ['pants_2'] = 9,
		['shoes_1'] = 36,   ['shoes_2'] = 0,
		['helmet_1'] = 156,      ['helmet_2'] = 10,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['bproof_1'] = 0,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 0,     ['bags_2'] = 0
	  },
	  KlapekFemale = {
		['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 367,   ['torso_2'] = 5,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 109,
		['pants_1'] = 144,   ['pants_2'] = 0,
		['shoes_1'] = 73,   ['shoes_2'] = 5,
		['helmet_1'] = -1,      ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 1,
		['bproof_1'] = 0,     ['bproof_2'] = 0,
		['mask_1'] = -1,      ['mask_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0,
		['bags_1'] = 0,     ['bags_2'] = 0
	  },
  }
  
  function otwier_dressing()
	  ESX.UI.Menu.CloseAll()
	  ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'szafka',
		  {
			  align    = 'center',
			  title    = 'Szatnia',
			  elements = {
				  {label = 'Zastępca Dyrektora/Dyrektor', value = 'ppal'},
				  {label = 'Ordynator', value = 'ggume'},
				  {label = 'Zastępca Ordynatora', value = 'lekarzynahere'},
				  {label = 'Doktor Habilinowany', value = 'specjalny'},
				  {label = 'Doktor', value = 'EO'},
				  {label = 'Ratownik Medyczny', value = 'ratowniczek'},
				  {label = 'Pielęgniarz', value = 'pielegniazr'},
				  {label = 'Rekrut', value = 'klapek'}
			  }
		  },
		  function(data, menu)
			  if data.current.value == 'ppal' then
				  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					  if skin.sex == 0 then
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.ProfesorMale)
					  else
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.ProfesorFemale)
					  end
				  end)
			  elseif data.current.value == 'ggume' then
				  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					  if skin.sex == 0 then
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.ChirurgMale)
					  else
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.ChirurgFemale)
					  end
				  end)
			  elseif data.current.value == 'EO' then
				  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					  if skin.sex == 0 then
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.DoktorMale)
					  else
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.DoktorFemale)
					  end
				  end)
			  elseif data.current.value == 'lekarzynahere' then
				  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					  if skin.sex == 0 then
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.LekarzMale)
					  else
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.LekarzFemale)
					  end
				  end)	
			  elseif data.current.value == 'specjalny' then
				  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					  if skin.sex == 0 then
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.SpecjalnyMale)
					  else
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.SpecjalnyFemale)
					  end
				  end)		
			  elseif data.current.value == 'ratowniczek' then
				  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					  if skin.sex == 0 then
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.RatownikMale)
					  else
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.RatownikFemale)
					  end
				  end)	
			  elseif data.current.value == 'klapek' then
				  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					  if skin.sex == 0 then
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.KlapekMale)
					  else
						  TriggerEvent('skinchanger:loadClothes', skin, Clothes.KlapekFemale)
					  end
				  end)
			  end
		  end,
		  function(data, menu)
			  menu.close()
		  end
	  )
  end

AddEventHandler('cywilne', function()
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
end)

AddEventHandler('ubraniaems', function()
	otwier_dressing()
end)

exports['qtarget']:AddBoxZone("PrzebieralniaEMS", vector3(298.38, -598.11, 43.28), 1, 3, {
	name="PrzebieralniaEMS",
	heading=71.9560,
	--debugPoly=false,
	minZ= 42.2841,
	maxZ= 44.4841,
	}, {
		options = {
			{
				event = "ubraniaems",
				icon = "fas fa-tshirt",
				label = "Otwórz Szafkę",
				job = "ambulance"
			},
			{
				event = "esx_skin:openRestrictedMenu",
				icon = "fas fa-tshirt",
				label = "Zmien ubranie",
				job = "ambulance",
			},
			{
				event = "need_property:getClothes",
				icon = "fa-solid fa-shirt",
				label = "Ubrania Prywatne",
				job = "ambulance"
			},
			{
				event = "cywilne",
				icon = "fas fa-tshirt",
				label = "Ubrania cywilne",
				job = "ambulance",
			},
		},
		distance = 3.0
})

function OpenPharmacyMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'pharmacy',
	{
		title		= _U('pharmacy_menu_title'),
		align		= 'center',
		elements = {
			{label = _U('pharmacy_take') .. ' ' .. _('medikit'), value = 'medikit'},
			{label = _U('pharmacy_take') .. ' ' .. _('bandage'), value = 'bandage'},
			{label = _U('pharmacy_take') .. ' ' .. "Gps", value = 'gps', count = 1},
			{label = _U('pharmacy_take') .. ' ' .. "BodyCam", value = 'bodycam', count = 1},
			{label = _U('pharmacy_take') .. ' ' .. "Radio", value = 'radio', count = 1},
		},
	}, function(data, menu)
		TriggerServerEvent('esx_ambulancejob:giveItem', data.current.value, data.current.count)

	end, function(data, menu)
		menu.close()
		CurrentAction		= 'pharmacy'
		CurrentActionMsg	= _U('open_pharmacy')
		CurrentActionData	= {}
	end
	)
end

AddEventHandler('playerSpawned', function()
	EndDeathCam()
	IsDead = false

	if FirstSpawn then
		FirstSpawn = false
		CreateThread(function()
			local status = 0
			while true do
				if status == 0 then
					status = 1 
					TriggerEvent('misiaczek:load', function(result)
						if result == 3 then
							status = 2
						else
							status = 0
						end
					end)
				end
				
				Citizen.Wait(200)
				if status == 2 then
					break
				end
			end
			
			exports.spawnmanager:setAutoSpawn(false)
		end)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	ESX.TriggerServerCallback('esx_license:checkLicense', function(lickajest)
		if lickajest then
			heli = true
		else
			heli = false
		end
	end, GetPlayerServerId(PlayerId()), 'sams_heli')
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)

	local specialContact = {
	name		= 'Ambulance',
	number		= 'ambulance',
	base64Icon	= 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEwAACxMBAJqcGAAABp5JREFUWIW1l21sFNcVhp/58npn195de23Ha4Mh2EASSvk0CPVHmmCEI0RCTQMBKVVooxYoalBVCVokICWFVFVEFeKoUdNECkZQIlAoFGMhIkrBQGxHwhAcChjbeLcsYHvNfsx+zNz+MBDWNrYhzSvdP+e+c973XM2cc0dihFi9Yo6vSzN/63dqcwPZcnEwS9PDmYoE4IxZIj+ciBb2mteLwlZdfji+dXtNU2AkeaXhCGteLZ/X/IS64/RoR5mh9tFVAaMiAldKQUGiRzFp1wXJPj/YkxblbfFLT/tjq9/f1XD0sQyse2li7pdP5tYeLXXMMGUojAiWKeOodE1gqpmNfN2PFeoF00T2uLGKfZzTwhzqbaEmeYWAQ0K1oKIlfPb7t+7M37aruXvEBlYvnV7xz2ec/2jNs9kKooKNjlksiXhJfLqf1PXOIU9M8fmw/XgRu523eTNyhhu6xLjbSeOFC6EX3t3V9PmwBla9Vv7K7u85d3bpqlwVcvHn7B8iVX+IFQoNKdwfstuFtWoFvwp9zj5XL7nRlPXyudjS9z+u35tmuH/lu6dl7+vSVXmDUcpbX+skP65BxOOPJA4gjDicOM2PciejeTwcsYek1hyl6me5nhNnmwPXBhjYuGC699OpzoaAO0PbYJSy5vgt4idOPrJwf6QuX2FO0oOtqIgj9pDU5dCWrMlyvXf86xsGgHyPeLos83Brns1WFXLxxgVBorHpW4vfQ6KhkbUtCot6srns1TLPjNVr7+1J0PepVc92H/Eagkb7IsTWd4ZMaN+yCXv5zLRY9GQ9xuYtQz4nfreWGdH9dNlkfnGq5/kdO88ekwGan1B3mDJsdMxCqv5w2Iq0khLs48vSllrsG/Y5pfojNugzScnQXKBVA8hrX51ddHq0o6wwIlgS8Y7obZdUZVjOYLC6e3glWkBBVHC2RJ+w/qezCuT/2sV6Q5VYpowjvnf/iBJJqvpYBgBS+w6wVB5DLEOiTZHWy36nNheg0jUBs3PoJnMfyuOdAECqrZ3K7KcACGQp89RAtlysCphqZhPtRzYlcPx+ExklJUiq0le5omCfOGFAYn3qFKS/fZAWS7a3Y2wa+GJOEy4US+B3aaPUYJamj4oI5LA/jWQBt5HIK5+JfXzZsJVpXi/ac8+mxWIXWzAG4Wb4g/jscNMp63I4U5FcKaVvsNyFALokSA47Kx8PVk83OabCHZsiqwAKEpjmfUJIkoh/R+L9oTpjluhRkGSPG4A7EkS+Y3HZk0OXYpIVNy01P5yItnptDsvtIwr0SunqoVP1GG1taTHn1CloXm9aLBEIEDl/IS2W6rg+qIFEYR7+OJTesqJqYa95/VKBNOHLjDBZ8sDS2998a0Bs/F//gvu5Z9NivadOc/U3676pEsizBIN1jCYlhClL+ELJDrkobNUBfBZqQfMN305HAgnIeYi4OnYMh7q/AsAXSdXK+eH41sykxd+TV/AsXvR/MeARAttD9pSqF9nDNfSEoDQsb5O31zQFprcaV244JPY7bqG6Xd9K3C3ALgbfk3NzqNE6CdplZrVFL27eWR+UASb6479ULfhD5AzOlSuGFTE6OohebElbcb8fhxA4xEPUgdTK19hiNKCZgknB+Ep44E44d82cxqPPOKctCGXzTmsBXbV1j1S5XQhyHq6NvnABPylu46A7QmVLpP7w9pNz4IEb0YyOrnmjb8bjB129fDBRkDVj2ojFbYBnCHHb7HL+OC7KQXeEsmAiNrnTqLy3d3+s/bvlVmxpgffM1fyM5cfsPZLuK+YHnvHELl8eUlwV4BXim0r6QV+4gD9Nlnjbfg1vJGktbI5UbN/TcGmAAYDG84Gry/MLLl/zKouO2Xukq/YkCyuWYV5owTIGjhVFCPL6J7kLOTcH89ereF1r4qOsm3gjSevl85El1Z98cfhB3qBN9+dLp1fUTco+0OrVMnNjFuv0chYbBYT2HcBoa+8TALyWQOt/ImPHoFS9SI3WyRajgdt2mbJgIlbREplfveuLf/XXemjXX7v46ZxzPlfd8YlZ01My5MUEVdIY5rueYopw4fQHkbv7/rZkTw6JwjyalBCHur9iD9cI2mU0UzD3P9H6yZ1G5dt7Gwe96w07dl5fXj7vYqH2XsNovdTI6KMrlsAXhRyz7/C7FBO/DubdVq4nBLPaohcnBeMr3/2k4fhQ+Uc8995YPq2wMzNjww2X+vwNt1p00ynrd2yKDJAVN628sBX1hZIdxXdStU9G5W2bd9YHR5L3f/CNmJeY9G8WAAAAAElFTkSuQmCC'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)

end)

AddEventHandler('esx:onPlayerDeath', function(reason)
	OnPlayerDeath()
end)

RegisterNetEvent('esx_healthnarmour:set')
AddEventHandler('esx_healthnarmour:set', function(health, armour)
	local status = 0
	while true do
		if status == 0 then
			status = 1
			TriggerEvent('misiaczek:load', function(result)
				if result == 3 then
					status = 2
				else
					status = 0
				end
			end)
		end
		
		Citizen.Wait(200)
		if status == 2 then
			break
		end
	end
	SetEntityHealth(PlayerPedId(), tonumber(health))
	Citizen.InvokeNative(0xCEA04D83135264CC, PlayerPedId(), tonumber(armour))
	if tonumber(health) == 0 then
		ESX.ShowNotification('Jesteś nieprzytomny/a, ponieważ przed wyjściem z serwera Twoja postać miała BW')
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(5)
		
		if blockShooting > GetGameTimer() then
			SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
		else
			Citizen.Wait(2000)
		end
	end
end)

function IsBlockWeapon()
	return blockShooting > GetGameTimer()
end

RegisterNetEvent('hypex_ambulancejob:hypexrevive')
AddEventHandler('hypex_ambulancejob:hypexrevive', function(notBlock)
	if notBlock == nil then
		notBlock = false
	end
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	if IsDead and not notBlock then
		TriggerServerEvent('exile_wypadanie:bron')
		blockShooting = GetGameTimer() + (5 * 60000)
	end
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', 0)

	DoScreenFadeOut(800)

	Citizen.Wait(800)
	
	local formattedCoords = {
		x = ESX.Math.Round(coords.x, 1),
		y = ESX.Math.Round(coords.y, 1),
		z = ESX.Math.Round(coords.z, 1)
	}

	ESX.SetPlayerData('lastPosition', formattedCoords)
	ESX.SetPlayerData('loadout', {})
	TriggerServerEvent('esx:updateCoords', formattedCoords)
	RespawnPed(playerPed, formattedCoords, 0.0)

	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
end)

CreateThread(function()
	local lastHealth = Citizen.InvokeNative(0xEEF059FAD016D209, PlayerPedId())
	while true do
		Citizen.Wait(1000)
		local myPed = PlayerPedId()
		local health = Citizen.InvokeNative(0xEEF059FAD016D209, myPed)
		if HasEntityBeenDamagedByWeapon(myPed, `WEAPON_RAMMED_BY_CAR`, 0) then
			ClearEntityLastDamageEntity(myPed)
			if (health ~= lastHealth) then
				Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, myPed, lastHealth)
			end
		end
		lastHealth = health
	end
end)

RegisterNetEvent('hypex_ambulancejob:hypexreviveblack')
AddEventHandler('hypex_ambulancejob:hypexreviveblack', function(admin)
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	if IsDead then
		TriggerServerEvent('exile_wypadanie:bron')
	end
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', 0)

	DoScreenFadeOut(800)

	Citizen.Wait(800)

	local formattedCoords = {
		x = ESX.Math.Round(coords.x, 1),
		y = ESX.Math.Round(coords.y, 1),
		z = ESX.Math.Round(coords.z, 1)
	}

	ESX.SetPlayerData('lastPosition', formattedCoords)
	ESX.SetPlayerData('loadout', {})
	TriggerServerEvent('esx:updateCoords', formattedCoords)
	RespawnPed(playerPed, formattedCoords, 0.0)

	if admin and admin ~= nil then
		--exports.pNotify:SendNotification({text = "Zostałeś ożywiony przez administratora "..admin.."!", timeout = 3000})
		TriggerEvent("esx:showNotification", "Zostałeś ożywiony przez administratora "..admin.."!")
	end

	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
end)

function FastTravel(pos)
		TeleportFadeEffect(PlayerPedId(), pos)
end

function FastTravelCar(x, y, z)
		etPedCoordsKeepVehicle(PlayerPedId(), pos)
end

-- Blipek szpitala
CreateThread(function()
		local blip = AddBlipForCoord(vector3(305.17172241211, -598.69934082031, 43.284084320068))

		SetBlipSprite(blip, Config.Sprite)
		SetBlipDisplay(blip, Config.Display)
		SetBlipScale(blip, Config.Scale)
		SetBlipColour(blip, Config.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Szpital")
		EndTextCommandSetBlipName(blip)
end)

CreateThread(function()
	local timer = GetGameTimer()
	
	while true do

		Citizen.Wait(10)
		if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
		
			if IsControlJustReleased(0, 38) and CurrentTask.busy and timer < GetGameTimer() then
				ESX.ShowNotification('Anulowano akcje')
				ESX.ClearTimeout(CurrentTask.task)
				ClearPedTasks(PlayerPedId())

				CurrentTask.busy = false
				
				timer = GetGameTimer() + 500
			end		
		else
			Citizen.Wait(1000)
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:requestDeath')
AddEventHandler('esx_ambulancejob:requestDeath', function()
	if Config.AntiCombatLog then
		Citizen.Wait(6000)
		local playerPed = PlayerPedId()
		Citizen.InvokeNative(0x6B76DC1F3AE6E6A3, playerPed, 0)
		ESX.ShowNotification('Jesteś nieprzytomny/a, ponieważ przed wyjściem z serwera Twoja postać miała BW')
	end
end)

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

function GetPlayerByEntityID(id)
	for _, player in ipairs(GetActivePlayers()) do
		if id == Citizen.InvokeNative(0x43A66C31C68491C0, player) then
			return player
		end
	end
end

local cam = nil

local angleY = 0.0
local angleZ = 0.0

CreateThread(function()
    while true do
        Citizen.Wait(1)
        if (cam and IsDead) then
            ProcessCamControls()
		else
			Citizen.Wait(500)
		end
    end
end)

function StartDeathCam()
    ClearFocus()

    local playerPed = PlayerPedId()
    
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(playerPed), 0, 0, 0, GetGameplayCamFov())

    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, false)
end

function EndDeathCam()
    ClearFocus()

    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(cam, false)
    
    cam = nil
end

function ProcessCamControls()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    DisableFirstPersonCamThisFrame()
    
    local newPos = ProcessNewPosition()

    SetFocusArea(newPos.x, newPos.y, newPos.z, 0.0, 0.0, 0.0)
    
    SetCamCoord(cam, newPos.x, newPos.y, newPos.z)
    
    PointCamAtCoord(cam, playerCoords.x, playerCoords.y, playerCoords.z + 0.5)
end

function ProcessNewPosition()
    local mouseX = 0.0
    local mouseY = 0.0
    
    if (IsInputDisabled(0)) then
        mouseX = GetDisabledControlNormal(1, 1) * 8.0
        mouseY = GetDisabledControlNormal(1, 2) * 8.0
    else
        mouseX = GetDisabledControlNormal(1, 1) * 1.5
        mouseY = GetDisabledControlNormal(1, 2) * 1.5
    end

    angleZ = angleZ - mouseX
    angleY = angleY + mouseY
    if (angleY > 89.0) then angleY = 89.0 elseif (angleY < -89.0) then angleY = -89.0 end
    
    local pCoords = GetEntityCoords(PlayerPedId())
    
    local behindCam = {
        x = pCoords.x + ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * (3.5 + 0.5),
        y = pCoords.y + ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * (3.5 + 0.5),
        z = pCoords.z + ((Sin(angleY))) * (3.5 + 0.5)
    }
    local rayHandle = StartShapeTestRay(pCoords.x, pCoords.y, pCoords.z + 0.5, behindCam.x, behindCam.y, behindCam.z, -1, PlayerPedId(), 0)
    local a, hitBool, hitCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
    
    local maxRadius = 3.5
    if (hitBool and Vdist(pCoords.x, pCoords.y, pCoords.z + 0.5, hitCoords) < 3.5 + 0.5) then
        maxRadius = Vdist(pCoords.x, pCoords.y, pCoords.z + 0.5, hitCoords)
    end
    
    local offset = {
        x = ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * maxRadius,
        y = ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * maxRadius,
        z = ((Sin(angleY))) * maxRadius
    }
    
    local pos = {
        x = pCoords.x + offset.x,
        y = pCoords.y + offset.y,
        z = pCoords.z + offset.z
    }
    return pos
end


RegisterNetEvent('route68:wczytajnumer')
AddEventHandler('route68:wczytajnumer', function(numer)
    TriggerServerEvent("route68:SetNumberWejscie", numer)
end)

-- String string
function stringsplit(inputstr, sep)
  if sep == nil then
	  sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
	  t[i] = str
	  i = i + 1
  end
  return t
end

function GetPedVehicleSeat(ped)
    local vehicle = GetVehiclePedIsIn(ped, false)
    for i= -1, GetVehicleMaxNumberOfPassengers(vehicle) do
        if GetPedInVehicleSeat(vehicle, i) == ped then
			return i
		end
    end
	
    return -2
end

function GetPlayerByEntityID(id)
	for _, player in ipairs(GetActivePlayers()) do
		if id == Citizen.InvokeNative(0x43A66C31C68491C0, player) then
			return player
		end
	end
end

function GetVehicleName(name)
	if name ~= 'CARNOTFOUND' then
		local found = false

		if not found then
			local label = GetLabelText(name)
			if label ~= "NULL" then
				name = label
			end
		end
	end

	return name
end










function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
  end
  
  function GetPedVehicleSeat(ped)
	  local vehicle = GetVehiclePedIsIn(ped, false)
	  for i= -1, GetVehicleMaxNumberOfPassengers(vehicle) do
		  if GetPedInVehicleSeat(vehicle, i) == ped then
			  return i
		  end
	  end
	  
	  return -2
  end
  
  function GetPlayerByEntityID(id)
	  for _, player in ipairs(GetActivePlayers()) do
		  if id == Citizen.InvokeNative(0x43A66C31C68491C0, player) then
			  return player
		  end
	  end
  end
  
  function GetVehicleName(name)
	  if name ~= 'CARNOTFOUND' then
		  local found = false
  
		  if not found then
			  local label = GetLabelText(name)
			  if label ~= "NULL" then
				  name = label
			  end
		  end
	  end
  
	  return name
  end

-- test 
local function GetAvailableVehicleSpawnPoint(station)
	local found = nil
	local spawnPoints = Config.Spawners[station].spawnCoords
	
	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i], 2) then
			found = spawnPoints[i]
			break
		end
	end

	return (found or ESX.ShowNotification("Wszystkie miejsca parkingowe są zajęte!"))
end

local function OpenGarageCategory(category, station, type)
    local elements = {}
    for i = 1, #(Config[type][category].vehicles) do
        local v = Config[type][category].vehicles[i]
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

        if can then
            elements[#elements + 1] = {label = v.label, model = v.model, livery = v.livery, extras = v.extras}
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicles', {
		title    = "Kategoria: " .. Config[type][category].label,
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
				local plate = "EMS " .. rand
				SetVehicleNumberPlateText(vehicle, plate)
				exports['sv-carkeys']:addKey(plate)
            end)
        end
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent("dbl_ambulancejob:openGarage", function(options)
	ESX.UI.Menu.CloseAll()

    local elements = {}
    for i = 1, #(Config[options.type]) do
        local v = Config[options.type][i]
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

        if can then
            elements[#elements + 1] = {label = v.label, value = i}
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicles_categories', {
		title    = "Garaż Medyczny",
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		menu.close()
		OpenGarageCategory(data.current.value, options.station, options.type)
	end, function(data, menu)
		menu.close()
	end)
end)

RegisterNetEvent("dbl_ambulancejob:deleteVehicle", function(data)
    local foundVehicle = false
    local points = Config.Spawners[data.station].spawnCoords
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
        if distance < 8.0 then
            local plate = GetVehicleNumberPlateText(playerVehicle, true)
            if type(plate) == "string" then
                plate = plate:gsub("%s$", "")
            end
            DeleteEntity(playerVehicle)
            exports['sv-carkeys']:removeKey(plate)
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

CreateThread(function()
    for k = 1, #(Config.Spawners) do
        local v = Config.Spawners[k]
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
-- test


  
  function OpenVehicleSpawnerMenu(action)
	
	  ESX.UI.Menu.CloseAll()
	  if Config.EnableSocietyOwnedVehicles then
  
		  local elements = {}
		  ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)
  
			  for i = 1, #vehicles, 1 do
				  table.insert(elements, {label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i]})
			  end
  
			  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
				  title	= _U('veh_menu'),
				  align	= 'center',
				  elements = elements,
			  }, function(data, menu)
				  menu.close()
  
				  local vehicleProps = data.current.value
				  ESX.Game.SpawnVehicle(vehicleProps.model, action.data.Pos, action.data.Heading, function(vehicle)
					  DecorSetBool(vehicle, 'isSpawned', true)
					  ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
  
					  TaskWarpPedIntoVehicle(PlayerPedId(),  vehicle,  -1)
					  --local veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
					  local localVehPlate = string.lower(GetVehicleNumberPlateText(veh))
					  local localVehLockStatus = GetVehicleDoorLockStatus(veh)
					--   TriggerEvent("ls:getOwnedVehicle", vehicle, localVehPlate, localVehLockStatus)
  
					  
					  
				  end)
  
				  TriggerServerEvent('esx_society:removeVehicleFromGarage', 'ambulance', vehicleProps)
			  end, function(data, menu)
				  menu.close()
			  end)
		  end, 'ambulance')
  
	  else -- not society vehicles
		  local elements = {}
		  for _, vehicle in ipairs(action.array) do
			  if ESX.PlayerData.job.grade >= vehicle.grade then
				  table.insert(elements, vehicle)
			  end
		  end
  
		  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner', {
			  title	= _U('veh_menu'),
			  align	= 'center',
			  elements = elements
		  }, function(data, menu)
			  menu.close()
			  ESX.Game.SpawnVehicle(data.current.model, action.data.Pos, action.data.Heading, function(vehicle)
				  local plate = "TAK" .. GetRandomIntInRange(100,999)
				  SetVehicleNumberPlateText(vehicle, plate)
				  TriggerServerEvent('ls:addOwner', plate)
				  SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
				  
				  SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
				  TriggerServerEvent('vape-addkeys', plate)
				  ambulanceTaken = true
				  --SetVehicleMaxMods(vehicle, data.current.model, (data.current.livery or false), (data.current.offroad or false), (data.current.color or false), (data.current.extras or nil))
				  
				  TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
				  
  
			  end)
		  end, function(data, menu)
			  menu.close()
		  end)
	  end
  end
  

  
 
  
AddEventHandler('oddaj')
RegisterNetEvent('oddaj', function()
	OpenReturnMenu()
end)
  

  

Citizen.CreateThread(function() 
    RequestModel(GetHashKey("s_m_m_paramedic_01"))
    while not HasModelLoaded(GetHashKey("s_m_m_paramedic_01")) do
        Wait(155)
    end
    while CreatePed == nil do
        Citizen.Wait(100)
    end
    local ped = CreatePed(4, GetHashKey("s_m_m_paramedic_01"), 294.10711669922, -597.91296386719, 43.280933380127-1.00, 64.846458435059, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
end)