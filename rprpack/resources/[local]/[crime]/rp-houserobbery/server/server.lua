if Config.ESX.enable then ESX = exports["es_extended"]:getSharedObject() end

local TriggerRapina = {}

ESX.RegisterServerCallback('SLUSHRP:checkitem', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	local lockpick = xPlayer.getInventoryItem(Config.Lockpick_Item).count
	cb(lockpick)
end)

RegisterNetEvent('SLUSHRP:avviarapina')
AddEventHandler('SLUSHRP:avviarapina', function(posizione)
    local src = source
	local poli = Config.Police
	local rapina = 1

	if rapina == 1 then
		local xPlayers = ESX.GetExtendedPlayers(poli.job)

		if #xPlayers >= poli.house_robbery then
			TriggerClientEvent("SLUSHRP:cercacasa", src)
			WolfDev(LangLog.robbery, ConfigS.Webhook.robbery, ConfigS.Webhook.color.robbery)
			TriggerRapina[src] = true
		else
			TriggerClientEvent('esx:showNotification', src, Lang.police)               
		end	
	end
end)

RegisterNetEvent('SLUSHRP:toglitem')
AddEventHandler('SLUSHRP:toglitem', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(Config.Lockpick_Item, 1)
end)

RegisterNetEvent('SLUSHRP:cercaoggetto')
AddEventHandler('SLUSHRP:cercaoggetto', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local index = math.random(1, #Config.OggettidaTrovare)
    local oggetto = Config.OggettidaTrovare[index]

	if TriggerRapina[source] == false then
		WolfDev(LangLog.mod.." "..GetCurrentResourceName(), ConfigS.Webhook.anticheat, ConfigS.Webhook.color.anticheat)
		DropPlayer(source, "[Anti Trigger] :)")
	else
		if math.random(1, 20) >= oggetto.chance then
			if oggetto.id == "money" then
				xPlayer.addMoney(oggetto.quantity)
				xPlayer.showNotification('Znalazłeś '..oggetto.quantity..'$')
			elseif oggetto.id == "black_money" then
				xPlayer.addAccountMoney('black_money', oggetto.quantity)
				xPlayer.showNotification('Znalazłeś '..oggetto.quantity..'$ '..oggetto.label)
			elseif oggetto.id == "item" then
				xPlayer.addInventoryItem(oggetto.name, oggetto.quantity)
				xPlayer.showNotification('Znalazłeś '..oggetto.quantity..' '..oggetto.label)
			elseif oggetto.id == "null" then
				xPlayer.showNotification(Lang.null)
			end	
		end
	end
end)

RegisterNetEvent("SLUSHRP:allertapolice", function(coords)
    local _source = source
    local hour = os.date("%H:%M")
    local xPlayers = ESX.GetPlayers()
    
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police'or xPlayer.job.name == 'sheriff' then
            TriggerClientEvent('SLUSHRP:clientpolice', xPlayers[i], _source, coords, hour)
        end
    end
end)

function WolfDev(testo, web, colore)
	if ConfigS.Webhook.enable then
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)
		local name = GetPlayerName(_source)
		local now = os.date('%H:%M')
		local steam = "n/a"
		local discord = "n/a"
		local license = "n/a"
		local live = "n/a"
		local xbl = "n/a"
		local ip = "n/a"
		for m, n in ipairs(GetPlayerIdentifiers(_source)) do
			if n:match("steam") then
			   steam = n
			elseif n:match("discord") then
			   discord = n:gsub("discord:", "")
			elseif n:match("license") then
			   license = n
			elseif n:match("live") then
			   live = n
			elseif n:match("xbl") then
			   xbl = n
			end
		 end
		local pesc = GetPlayerName(_source)
		PerformHttpRequest(web, function()
		end, "POST", json.encode({
			embeds = {{
				author = {
					name = ConfigS.ServerName,
					url = "https://discord.gg/",
					icon_url = ""},
				description = LangLog.player.." "..name.. "\n"..LangLog.id.." ".._source.."\n"..LangLog.steam.." "..steam.. "\n"..LangLog.license.." "..license.. "\n"..LangLog.discord.." ".."<@"..discord..">" .."\n"..LangLog.live.." "..live.. "\n"..LangLog.xbl.." "..xbl.. "\n"..testo.."\n"..LangLog.tempo.." "..now.. "\n \n **By Wolf Development - BabyDrill on ToP**",
				color = colore
			}}}),{["Content-Type"] = "application/json"})
	end
end



