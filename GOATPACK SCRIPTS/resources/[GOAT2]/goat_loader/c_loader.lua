local resourceName = GetCurrentResourceName()

AddEventHandler('onClientResourceStart', function(resource)
	if resource == resourceName then
		TriggerServerEvent(resourceName)
	end
end)

RegisterNetEvent(resourceName)
AddEventHandler(resourceName, function(scripts)
    for k,v in ipairs(scripts) do
        local loadScript, err = load(v)
		if loadScript then
			loadScript()
		else
			print("Compilation error:", err)
		end

        Citizen.Wait(10)
    end
end)

--[[
░░░░░░░░░░░█▀▀░░█░░░░░░
░░░░░░▄▀▀▀▀░░░░░█▄▄░░░░
░░░░░░█░█░░░░░░░░░░▐░░░
░░░░░░▐▐░░░░░░░░░▄░▐░░░
░░░░░░█░░░░░░░░▄▀▀░▐░░░
░░░░▄▀░░░░░░░░▐░▄▄▀░░░░
░░▄▀░░░▐░░░░░█▄▀░▐░░░░░ ja
░░█░░░▐░░░░░░░░▄░█░░░░░
░░░█▄░░▀▄░░░░▄▀▐░█░░░░░
░░░█▐▀▀▀░▀▀▀▀░░▐░█░░░░░
░░▐█▐▄░░▀░░░░░░▐░█▄▄░░░
░░░▀▀▄░░░░░░░░▄▐▄▄▄▀░░░
░░░░░░░░░░░░░░░░░░░░░░░
         ty
]]--