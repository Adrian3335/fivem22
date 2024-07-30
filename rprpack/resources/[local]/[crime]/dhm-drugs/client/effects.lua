function toggleAddictScreen(handle, value)
	if (handle == 0) then
		ShakeGameplayCam("DRUNK_SHAKE", value)
	elseif (handle == 1) then
		ShakeGameplayCam("DRUNK_SHAKE", value)
	end
end

RegisterNetEvent('dhm_addict:client:drugUsed')
AddEventHandler('dhm_addict:client:drugUsed', function(handle)
	if (handle == nil) then return end

	local playerPed = PlayerPedId()

	local drugUsed = nil
	if (handle == 0) then drugUsed = 'Cocaine'
	elseif (handle == 1) then drugUsed = 'Heroin'
	elseif (handle == 3) then drugUsed = 'Marijuana'
	elseif (handle == 4) then drugUsed = 'Methamphetamine' end
	
	RequestAnimSet(Config.Drugs[drugUsed].AnimationSet)
	while not HasAnimSetLoaded(Config.Drugs[drugUsed].AnimationSet) do
		Citizen.Wait(0)
	end
	TaskStartScenarioInPlace(playerPed, Config.Drugs[drugUsed].TaskScenario, 0, 1)
    Citizen.Wait(3000)
	ClearPedTasksImmediately(playerPed)

	SetEntityHealth(playerPed, GetEntityHealth(playerPed) + Config.Drugs[drugUsed].AddHealth)
	SetPedArmour(playerPed, GetPedArmour(playerPed) + Config.Drugs[drugUsed].AddArmour)

	SetTimecycleModifier(Config.Drugs[drugUsed].TimeCycle)
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, Config.Drugs[drugUsed].AnimationSet, true)
    SetPedIsDrunk(playerPed, true)
	SetPedMoveRateOverride(playerPed, Config.Drugs[drugUsed].AddStamina)
    SetRunSprintMultiplierForPlayer(playerPed, Config.Drugs[drugUsed].AddSpeedMultiplier)
    AnimpostfxPlay(Config.Drugs[drugUsed].Effect, Config.Drugs[drugUsed].DrugDuration + 1, true)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)

	Citizen.Wait(Config.Drugs[drugUsed].DrugDuration)
	removeEffects(playerPed)
end)

function removeEffects(playerPed)
	SetPedMoveRateOverride(playerPed, 1.0)
	SetRunSprintMultiplierForPlayer(playerPed, 1.0)
	SetPedIsDrunk(playerPed, false)
	SetPedMotionBlur(playerPed, false)
	ResetPedMovementClipset(playerPed)
	AnimpostfxStopAll()
	ShakeGameplayCam("DRUNK_SHAKE", 0.0)
	SetTimecycleModifierStrength(0.0)
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
	toggleAddictScreen(1, 0.0)
end)