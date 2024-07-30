ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('213-Wytrychy:Start', function()
	local ped = PlayerPedId()
    local vehicle = ESX.Game.GetVehicleInDirection()

	if DoesEntityExist(vehicle) then
		if GetVehicleDoorLockStatus(vehicle) > 2 then
            TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_WELDING', 0, true)
			ExecuteCommand('e mechanik2')
			local finished = exports["summer-taskbarskill"]:taskBar(3700, 1)
			if finished == 100 then
						ClearPedTasksImmediately(ped)
						SetVehicleDoorsLocked(vehicle, 1)
						SetVehicleDoorsLockedForAllPlayers(vehicle, false)

						ESX.ShowNotification('Otwarto pojazd o numerze rejestracyjnym ' ..string.upper(GetVehicleNumberPlateText(vehicle)))
					else
						SetVehicleAlarm(vehicle, true)
						StartVehicleAlarm(vehicle)
						ClearPedTasksImmediately(ped)
						ESX.ShowNotification('Alarm w pojezdzie o numerze rejestracyjnym ' ..string.upper(GetVehicleNumberPlateText(vehicle)).. ' został włączony!')
						local random = math.random(1,10)
					if random == 3 then
						ESX.ShowNotification('Twój wytrych się zniszczył!')

						TriggerServerEvent('lockpick:remove')
						end
					end
        		else
            ESX.ShowNotification('Drzwi w pojezdzie o numerze rejestracyjnym ' ..string.upper(GetVehicleNumberPlateText(vehicle)).. ' są otwarte!')
        end
	end
end)