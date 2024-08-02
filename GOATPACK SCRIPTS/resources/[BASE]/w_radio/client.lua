local ESX = exports.es_extended.getSharedObject()
local PlayerData = {}
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
    OnDuty = false
end)


local Radio = {
	Enabled = false,
	Add = function(channel)
		exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
		exports["pma-voice"]:setRadioChannel(channel)
		Config.ChannelCurrent = channel
	end,
	Remove = function()
		exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
		exports["pma-voice"]:setRadioChannel(0)

		Config.ChannelCurrent = 0
	end
}

AddEventHandler("esx:onPlayerDeath", function()
    Radio.Remove()
	Radio.Enabled = false
end)

RegisterNetEvent('w_radio:removeItem', function()
	Radio.Remove()
	Radio.Enabled = false
end)

CheckRadio = function()
	local radioChannel = exports["pma-voice"]:getRadioChannel()
	for channel, data in pairs(Config.ChannelPrivate) do
		if channel == radioChannel then
			for _, job in pairs(data) do
				if job ~= ESX.PlayerData.job.name and job ~= ESX.PlayerData.hiddenjob.name then
					Radio.Remove()
					Radio.Enabled = false
					break
				end
			end
		end
	end
end

exports('setRadioChannel', function(channel)
	if LocalPlayer.state.IsHandcuffed or LocalPlayer.state.xrs_PlayerIsCuffed or LocalPlayer.state.Tied then return end
	local radioChannel = tonumber(channel)
	local channelAccess = false
	local findIsChannelIsPriv = false
	for channel, data2 in pairs(Config.ChannelPrivate) do
		if channel == radioChannel then
			findIsChannelIsPriv = true
			for _, job in pairs(data2) do
				if job == ESX.PlayerData.job.name or job == ESX.PlayerData.hiddenjob.name then
					channelAccess = true
					break
				end
			end
		end
	end
	if not findIsChannelIsPriv then
		channelAccess = true
	end
	if channelAccess then
		Radio.Add(radioChannel)
		Radio.Enabled = true
		callback = radioChannel
		ESX.ShowNotification( (ESX.PlayerData.charinfo.sex == 'm' and 'Połączyłeś' or 'Połączyłaś') .. ' się z częstotliwością: '..radioChannel)
	else
		ESX.ShowNotification('Nie masz dostępu do tej częstotliwości')
	end
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
	CheckRadio()
end)

RegisterNetEvent("esx:setHiddenJob")
AddEventHandler("esx:setHiddenJob", function(job)
	CheckRadio()
end)

OpenRadio = function()
	if LocalPlayer.state.IsHandcuffed or LocalPlayer.state.xrs_PlayerIsCuffed or LocalPlayer.state.Tied then return end
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open"
    })
end

RegisterNetEvent("w_radio:OpenRadio")
AddEventHandler("w_radio:OpenRadio", OpenRadio)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() and Radio.Enabled then
		ESX.ShowNotification( "Radio zostało wyłączone")
        Radio.Remove()
		Radio.Enabled = false
    end
end)

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("join", function(data, cb)
	if LocalPlayer.state.IsHandcuffed or LocalPlayer.state.xrs_PlayerIsCuffed or LocalPlayer.state.Tied then return end
	local callback = ''
	local radioChannel = tonumber(data.channel)
	if not radioChannel then
		ESX.ShowNotification( 'Podaj częstotliwość')
		return
	end
	local channelAccess = false
	local findIsChannelIsPriv = false
	for channel, data2 in pairs(Config.ChannelPrivate) do
		if channel == radioChannel then
			findIsChannelIsPriv = true
			for _, job in pairs(data2) do
				if job == ESX.PlayerData.job.name then
					channelAccess = true
					break
				end
			end
		end
	end
	if not findIsChannelIsPriv then
		channelAccess = true
	end
	if channelAccess then
		Radio.Add(radioChannel)
		Radio.Enabled = true
		callback = radioChannel
		ESX.ShowNotification( (ESX.PlayerData.sex == 'm' and 'Połączyłeś' or 'Połączyłaś') .. ' się z częstotliwością: '..radioChannel)
	else
		ESX.ShowNotification('Nie masz dostępu do tej częstotliwości')
	end
	cb(callback)
end)

RegisterNUICallback("leave", function()
	if Config.ChannelCurrent ~= 0 then
		ESX.ShowNotification( (ESX.PlayerData.charinfo.sex == 'm' and 'Rozłączyłeś' or 'Rozłączyłaś') .. ' się z częstotliwości: '..Config.ChannelCurrent)
	end
	Radio.Remove()
	Radio.Enabled = false
end)

RegisterNetEvent('w_radio:useRadio', function()
	OpenRadio()
end)

RegisterNuiCallback("OffFocus", function()
	SetNuiFocus(false, false)
end)

RegisterNetEvent('w_radio:RefreshRadioList', function(channel, data)
	if tonumber(channel) == tonumber(Config.ChannelCurrent) then
		exports['w_hud']:RefreshRadioList(channel, data)
	end
end)

exports('Enabled', function()
	return Radio.Enabled
end)

exports('GetChannel', function()
	local channelName = Config.ChannelName[Config.ChannelCurrent] or Config.ChannelCurrent
	return channelName
end)


RegisterNetEvent('need_radialmenu:setRadioChannel')
AddEventHandler('need_radialmenu:setRadioChannel', function(data)
    local channel = data.channel
    if LocalPlayer.state.IsHandcuffed or LocalPlayer.state.xrs_PlayerIsCuffed or LocalPlayer.state.Tied then return end
    local radioChannel = tonumber(channel)
    local channelAccess = false
    local findIsChannelIsPriv = false
    for channel, data2 in pairs(Config.ChannelPrivate) do
        if channel == radioChannel then
            findIsChannelIsPriv = true
            for _, job in pairs(data2) do
                if job == ESX.PlayerData.job.name or job == ESX.PlayerData.hiddenjob.name then
                    channelAccess = true
                    break
                end
            end
        end
    end
    if not findIsChannelIsPriv then
        channelAccess = true
    end
    if channelAccess then
        Radio.Add(radioChannel)
        Radio.Enabled = true
        ESX.ShowNotification((ESX.PlayerData.charinfo.sex == 'm' and 'Połączyłeś' or 'Połączyłaś') .. ' się z częstotliwością: ' .. radioChannel)
    else
        ESX.ShowNotification('Nie masz dostępu do tej częstotliwości')
    end
end)
