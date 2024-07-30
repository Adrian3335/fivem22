ESX = nil 
Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports['es_extended']:getSharedObject()
        Citizen.Wait(1)
    end
end)

function load(time, label, scenario, animationDictionary)
	exports.rprogress:Custom({
		Duration = time,
		Label = label,
		Animation = {
			scenario = scenario or "",
			animationDictionary = animationDictionary or "",
		},
		DisableControls = {
			Mouse = false,
			Player = true,
			Vehicle = true
		}
	})
end

function DrawText3Ds(x,y,z, text)
  
    SetDrawOrigin(x,y,z)
    local _, count = string.gsub(text, "\n", "")

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextEntry('STRING')
    SetTextCentre(1)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(0.0, 0.0 - 0.01 * count)

    ClearDrawOrigin()
end

function keyOf(tbl, value)
    for k, v in pairs(tbl) do
        if v == value then
            return k
        end
    end
    return nil
end

function animation(type)
	local ped = PlayerPedId()
    if type == 'search' then
        RequestAnimDict("amb@prop_human_bum_bin@base")
		while (not HasAnimDictLoaded("amb@prop_human_bum_bin@base")) do Citizen.Wait(0) end
		TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(1500)
		TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(1500)
		TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(1500)
		TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(1500)
		TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(1500)
		TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(1500)
		ClearPedTasks(ped)	
    elseif type == 'make' then
        RequestAnimDict("amb@prop_human_bum_bin@base")
		while (not HasAnimDictLoaded("amb@prop_human_bum_bin@base")) do Citizen.Wait(0) end
		TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(1500)
		TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(1500)
		TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
	    Citizen.Wait(1500)
		TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(1500)
		ClearPedTasks(ped)	
    elseif type == 'leaf' then
        RequestAnimDict("creatures@rottweiler@tricks@")
        while (not HasAnimDictLoaded("creatures@rottweiler@tricks@")) do Citizen.Wait(0) end
        TaskPlayAnim(ped, "creatures@rottweiler@tricks@", "petting_franklin", 8.0, -8.0, -1, 0, 0, false, false, false)
        Wait(2000)
        TaskPlayAnim(ped, "creatures@rottweiler@tricks@", "petting_franklin", 8.0, -8.0, -1, 0, 0, false, false, false)
        Wait(2000)
        TaskPlayAnim(ped, "creatures@rottweiler@tricks@", "petting_franklin", 8.0, -8.0, -1, 0, 0, false, false, false)
        Wait(2000)
        TaskPlayAnim(ped, "creatures@rottweiler@tricks@", "petting_franklin", 8.0, -8.0, -1, 0, 0, false, false, false)
        Wait(2000)
		elseif type == 'acid' then
			RequestAnimDict("creatures@rottweiler@tricks@")
			while (not HasAnimDictLoaded("creatures@rottweiler@tricks@")) do Citizen.Wait(0) end
			TaskPlayAnim(ped, "creatures@rottweiler@tricks@", "petting_franklin", 8.0, -8.0, -1, 0, 0, false, false, false)
			Wait(2000)
			ClearPedTasks(ped)	
    end
end

RegisterNetEvent('dhm-drugs:notif')
AddEventHandler('dhm-drugs:notif', function(text)
	notify(text)
end)