CreateThread(function()
    while true do
        if IsPauseMenuActive() then

        else
  
            local ped = PlayerPedId()
  
        SendNUIMessage({
			action = "updatePlayerId";
			id = GetPlayerServerId(PlayerId());
		})

        end
  
        Citizen.Wait(500)
    end
  end)

RegisterNetEvent('czas')
AddEventHandler('czas', function(time)
    if Config.ShowServerName and Config.ServerName then
        time = time .." | © " .. Config.ServerName
    end
    if Config.ShowPlayerName then
        time = time .."\nPlayer Name: " .. GetPlayerName(NetworkGetEntityOwner(PlayerPedId()))
    end
    if Config.ShowPlayerID then
        time = time .."\nPlayer ID: " .. GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId()))
    end
    SendNUIMessage({
        action = "setTimeAndDate",
        time = time
    })
end)
