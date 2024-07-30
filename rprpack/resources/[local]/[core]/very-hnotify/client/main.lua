local Messages = {
	Update = GetGameTimer(),
	Display = false,
	Txt = ''
}

local LastMessages = GetGameTimer()

CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if Messages.Display ~= nil and Messages.Display == true then					
			if LastMessages <= GetGameTimer() then				
				SendNUIMessage({
					action = 'ShowHelpNotification',
					state = 'close',
				})		

				Messages = {
					Update = GetGameTimer(),
					Display = false,
					Txt = ''
				}
				
			end
		else
			Citizen.Wait(250)
		end
	end
end)

RegisterNetEvent('HelpNotification:Show')
AddEventHandler('HelpNotification:Show', function(text)
	if text ~= nil then
		ShowHelpNotification(text)
	end
end)

ShowHelpNotification = function(msg)
	LastMessages = GetGameTimer() + 200
	
	if not Messages.Display then
		Messages.Display = true
		
		SendNUIMessage({
			action = 'ShowHelpNotification',
			state = 'open',
			display = true,
			message = msg
		})
		
		Messages.Txt = msg
	else
		if Messages.Update <= GetGameTimer() then
			Messages.Update = GetGameTimer() + 200
			
			if Messages.Txt ~= msg then	
				Messages.Txt = msg
				
				SendNUIMessage({
					action = 'ShowHelpNotification',
					state = 'open',
					display = false,
					message = msg
				})	
			end
		end
	end
end

RegisterNUICallback('CanHelpNotification', function(data)	
	if data.display ~= nil then
		Messages.Display = false
	end
end)