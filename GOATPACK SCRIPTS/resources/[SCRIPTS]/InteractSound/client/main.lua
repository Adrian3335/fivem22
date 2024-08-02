RegisterNetEvent('InteractSound_CL:PlayOnOne')
AddEventHandler('InteractSound_CL:PlayOnOne', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)

RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
AddEventHandler('InteractSound_CL:PlayWithinDistance', function(target, maxDistance, soundFile, soundVolume)	
	local player = GetPlayerFromServerId(tonumber(target))
	if player and player ~= -1 then
		DistanceFunc(GetEntityCoords(GetPlayerPed(player), true), GetEntityCoords(PlayerPedId(), true), maxDistance, soundFile, soundVolume)
	end
end)

function DistanceFunc(sourceCoords, targetCoords, maxDistance, soundFile, soundVolume)
	local distance = #(sourceCoords - targetCoords)
    if distance <= maxDistance then
		local volume = (soundVolume or 1.0) * (1 - distance / maxDistance)
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = volume
        })
    end
end
