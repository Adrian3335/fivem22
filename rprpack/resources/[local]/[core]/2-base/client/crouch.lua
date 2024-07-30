playerPed = PlayerPedId()
lib.onCache("ped", function(value) playerPed = value end)
local playerServerId = GetPlayerServerId(PlayerId())

Crouched = false
CrouchedForce = false
Aimed = false
LastCam = 0
Cooldown = false
Battle = nil

CoolDownTime = 500 -- in ms

local Dead = false
local Handcuffed = false
local InvBinds = true
local RadialMenu = false
local GptOpen = false
local TabletOpen = false

NormalWalk = function()
	SetPedMaxMoveBlendRatio(playerPed, 1.0)
	ResetPedMovementClipset(playerPed, 0.55)
	ResetPedStrafeClipset(playerPed)
	SetPedCanPlayAmbientAnims(playerPed, true)
	SetPedCanPlayAmbientBaseAnims(playerPed, true)
	ResetPedWeaponMovementClipset(playerPed)
	Crouched = false
end

SetupCrouch = function()
	while not HasAnimSetLoaded('move_ped_crouched') do
		Citizen.Wait(0)
		RequestAnimSet('move_ped_crouched')
	end
end

CanCrouch = function()
	if
		IsPedOnFoot(playerPed) and
		not IsPedJumping(playerPed) and
		not IsPedFalling(playerPed) and
		not IsPedDeadOrDying(playerPed) and
		not Dead and
		not Handcuffed and
		InvBinds and
		not RadialMenu and 
		not GptOpen and 
		not TabletOpen
	then
		return true
	else
		return false
	end
end

CrouchPlayer = function()
	SetPedUsingActionMode(playerPed, false, -1, "DEFAULT_ACTION")
	SetPedMovementClipset(playerPed, 'move_ped_crouched', 0.55)
	SetPedStrafeClipset(playerPed, 'move_ped_crouched_strafing') -- it force be on third person if not player will freeze but this func make player can shoot with good anim on crouch if someone know how to fix this make request :D
	SetWeaponAnimationOverride(playerPed, "Ballistic")
	Crouched = true
	Aimed = false
end

SetPlayerAimSpeed = function()
	SetPedMaxMoveBlendRatio(playerPed, 0.2)
	Aimed = true
end

IsPlayerFreeAimed = function()
	if IsPlayerFreeAiming(PlayerId()) or IsAimCamActive() or IsAimCamThirdPersonActive() then
		return true
	else
		return false
	end
end

Citizen.CreateThread( function()
	SetupCrouch()
end)

local crouched_thread = false
RegisterCommand('+crouch', function()
	if CanCrouch() and not Battle then
		if not Cooldown then
			CrouchedForce = not CrouchedForce
			if CrouchedForce and not crouched_thread then
				Citizen.CreateThread(function()
					crouched_thread = true
					while CrouchedForce do
						local wait = 75
						DisableControlAction(0, 36, true)
						local CanDo = CanCrouch()
						if CanDo and Crouched and IsPlayerFreeAimed() then
							SetPlayerAimSpeed()
							wait = 0
						elseif CanDo and (not Crouched or Aimed) then
							CrouchPlayer()
						elseif not CanDo and Crouched then
							CrouchedForce = false
							NormalWalk()
						end
						local NowCam = GetFollowPedCamViewMode()
						if CanDo and Crouched and NowCam == 4 then
							SetFollowPedCamViewMode(LastCam)
						elseif CanDo and Crouched and NowCam ~= 4 then
							LastCam = NowCam
						end
						Citizen.Wait(wait)
					end
					crouched_thread = false
					NormalWalk()
				end)
			end
			Cooldown = true
			SetTimeout(CoolDownTime, function()
				Cooldown = false
			end)
		end
	end
end, false)

RegisterCommand('-crouch', function() end)

RegisterKeyMapping("+crouch", "Klawisz kucania", "keyboard", "LCONTROL")

AddStateBagChangeHandler("Dead", ("player:%s"):format(playerServerId), function(bagName, key, value, reserved, replicated)
    Dead = value
end)

AddStateBagChangeHandler("Handcuffed", ("player:%s"):format(playerServerId), function(bagName, key, value, reserved, replicated)
    Handcuffed = value
end)

AddStateBagChangeHandler("InvBinds", ("player:%s"):format(playerServerId), function(bagName, key, value, reserved, replicated)
    InvBinds = value
end)

AddStateBagChangeHandler("RadialMenu", ("player:%s"):format(playerServerId), function(bagName, key, value, reserved, replicated)
    RadialMenu = value
end)

AddStateBagChangeHandler("GptOpen", ("player:%s"):format(playerServerId), function(bagName, key, value, reserved, replicated)
    GptOpen = value
end)

AddStateBagChangeHandler("TabletOpen", ("player:%s"):format(playerServerId), function(bagName, key, value, reserved, replicated)
    TabletOpen = value
end)

AddStateBagChangeHandler("Battle", ("player:%s"):format(playerServerId), function(bagName, key, value, reserved, replicated)
    Battle = value
	if Battle ~= nil then
		CrouchedForce = false
		NormalWalk()
	end
end)