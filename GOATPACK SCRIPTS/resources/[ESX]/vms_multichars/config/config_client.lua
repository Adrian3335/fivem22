RegisterNetEvent("vms_multichars:WeatherSync")
AddEventHandler("vms_multichars:WeatherSync", function(boolean)
    if boolean then
        Wait(150)
        if Config.WeatherSync == 'cd_easytime' then
            TriggerEvent('cd_easytime:PauseSync', true)
        elseif Config.WeatherSync == 'qb-weathersync' then
            TriggerEvent('qb-weathersync:client:DisableSync')
        elseif Config.WeatherSync == 'vSync' then
            TriggerEvent('vSync:toggle', false)
            Wait(100)
            TriggerEvent('vSync:updateWeather', Config.Weather, false)
        end
        Wait(50)
        NetworkOverrideClockTime(11, 0, 0)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist(Config.Weather)
        SetWeatherTypeNow(Config.Weather)
        SetWeatherTypeNowPersist(Config.Weather)
    else
        Wait(150)
        if Config.WeatherSync == 'cd_easytime' then
            TriggerEvent('cd_easytime:PauseSync', false)
        elseif Config.WeatherSync == 'qb-weathersync' then
            TriggerEvent('qb-weathersync:client:EnableSync')
        elseif Config.WeatherSync == 'vSync' then
            TriggerEvent('vSync:toggle', true)
            Wait(100)
            TriggerServerEvent('vSync:requestSync')
        end
    end
end)

openCharacterCreator = function(skin, gender)
    TriggerEvent('skinchanger:loadSkin', skin, function()
        ResetEntityAlpha(PlayerPedId())
        SetPedAoBlobRendering(PlayerPedId(), true)
        if not Config.UseCustomSkinCreator then
            TriggerEvent('esx_skin:openSaveableMenu', function()
                finished = true 
            end, function() 
                finished = true
            end)
        else
            TriggerEvent('vms_charcreator:openCreator', gender)
        end
    end)
end

openIdentity = function()
    TriggerEvent('vms_identity:showRegisterIdentity')
end

openSpawnSelector = function()
    TriggerEvent('vms_spawnselector:open')
end

if Config.RelogCommand then
	RegisterCommand('relog', function(source, args, rawCommand)
		if canRelog == true then
			canRelog = false
			TriggerServerEvent('vms_multichars:relog')
			ESX.SetTimeout(10000, function()
				canRelog = true
			end)
		end
	end)
end