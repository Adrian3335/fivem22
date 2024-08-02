local waitToNext = false

RegisterNetEvent('notify:Send', function(type, header, content)
	if not waitToNext then
		Notify(type, header, content)
		waitToNext = true
		startWait()
	end
end)

startWait = function()
	if waitToNext then
		Wait(5000)
		waitToNext = false
	end
end

exports("addNotification", function(type, header , content)
    Notify(type, header , content);
end)

function Notify(type, header , content)
    SendNUIMessage({
		action = "sendNotification";
		type = type;
		header = header;
		content = content;
	})
	TriggerEvent("InteractSound_CL:PlayOnOne", 'notify', 0.5)
end

RegisterCommand("TestDiabloNotify2", function()
	exports["goat_notify"]:Notify('hunger', 'Bank', "Otrzymano wypłatę w wysokości 200$")
end)


exports("Notify", function(type, header , content)
	Notify(type, header , content)
end)


-- Tlen 

local _wait = 0

Citizen.CreateThread(function()
    while true do
        Wait(_wait)
        local playerPed = GetPlayerPed(-1)
        if IsPedSwimmingUnderWater(playerPed) == 1 then
			_wait = 500
            local oxygen = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10
			SendNUIMessage({
				action = 'updateOxygen',
				state = true,
				percentage = oxygen
			})
        else
			_wait = 1500
			SendNUIMessage({
				action = 'updateOxygen',
				state = false,
				percentage = 0
			})
        end
    end
end)