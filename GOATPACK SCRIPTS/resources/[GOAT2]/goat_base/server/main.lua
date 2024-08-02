ESX.RegisterServerCallback('goat_base:GetCurrentPlayers', function(source, cb)
    cb(#GetPlayers())
end)
local identifiers = {discord = "", steam = "", license = "", ip = "", live = "", xbl = ""}
local dono = "GoatPack | LogSystem"
local communtiylogo = "https://cdn.discordapp.com/attachments/1072605585498984563/11291738781791/logo.png"  
local hour, minute = 12, 00


CreateThread(function()
    while true do
        Wait(5000)

        minute += 1
        if minute > 59 then
            minute = 0
            hour += 1
        end

        if hour > 23 then
            hour = 0
        end

        TriggerClientEvent("goat_base:UpdateTime", -1, hour, minute)
    end
end)

ESX.RegisterCommand('time', 'superadmin', function(xPlayer, args, showError)
    hour = tonumber(args.hour) 
    minute = tonumber(args.minute) 
	if xPlayer then
		local xPlayer = xPlayer.source
	end
    TriggerClientEvent("goat_base:UpdateTime", -1, hour, minute)
end, true, {help = "Ustaw czas", validate = true, arguments = {
	{name = 'hour', help = "godzina", type = 'number'},
	{name = 'minute', help = "minuta", type = 'number'}
}})


ESX.RegisterUsableItem('dildo', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source) 	
	TriggerClientEvent("goat_use:dildo", source)
end)

ESX.RegisterUsableItem('wheelchair', function(source)
	local xPlayer = ESX.GetPlayerFromId() 	
	print("JEBAC KRISSA")
	xPlayer.triggerEvent("goat_use:wheelchair")
end)

RegisterNetEvent("goat_watercooler:buywater", function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= 25 then 
		xPlayer.removeAccountMoney('money', 25)
		xPlayer.addInventoryItem('water', 1)
		exports["goat_notify"]:notify(source, "success", "Powiadomienie", "Zakupiłeś wodę.")
	else 
		exports["goat_notify"]:notify(source, "failure", "Powiadomienie", "Nie posiadasz tyle gotówki!")
	end
end)

AddEventHandler('playerConnecting', function()
    local num = GetNumPlayerIdentifiers(source)
	for i = 0, num-1 do
		local a = GetPlayerIdentifier(source, i)
		local f = string.find(a, ":")
		if f then
			local b = string.sub(a, 1, f-1)
			identifiers[b] = a
		end
	end

	local israel = GetPlayerName(source)
	local adamtest = GetPlayerLastMsg(source)
	local guid = GetPlayerGuid(source)
	local ping = GetPlayerPing(source)

	if guid ~= nil then
		local connect = {
			{
				["color"] = "16745472",
				["title"] = 'Gracz łączy się z serwerem',
				["description"] = "[Nick] **"..israel.."**\n[IP]: **"..identifiers.ip.."**\n[Hex]: **"..identifiers.steam.."**\n[SID64]: **"..guid.."**\n [Licencja]: **"..identifiers.license.."**\n [Discord]: **"..identifiers.discord.."**\n[Live id]: **"..identifiers.live.."**\n[xbl id]: **"..identifiers.xbl.."**",
				["footer"] = {
					["text"] = dono,
					["icon_url"] = communtiylogo,
				},
			}
		}
		local connect2 = {
			{
				["color"] = "16745472",
				["title"] = 'Gracz łączy się z serwerem',
				["description"] = "[Nick] **"..israel.."**\n[Hex]: **"..identifiers.steam.."**\n[SID64]: **"..guid.."**\n [Licencja]: **"..identifiers.license.."**\n [Discord]: **"..identifiers.discord.."**\n[Live id]: **"..identifiers.live.."**\n[xbl id]: **"..identifiers.xbl.."**",
				["footer"] = {
					["text"] = dono,
					["icon_url"] = communtiylogo,
				},
			}
		}
		
		local webhook = 'https://discord.com/api/webhooks/1129174304249090109/CCs3uwmVuDuNQj2YvGXbdDz2nzm8EzESn93MQSOFQqbC4bvxnOxIX2GlZluWwowiSSlp'
		local webhook2 = 'https://discord.com/api/webhooks/1094602948744589393/2xqMYs5p6aQoYrrJEnQPxen5NXXDMbmsnsyCxdpl_ZRAnBmFIH59IIIzsIvTJUYZ2d-j'
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "NeedRP | Join", iconurl = "https://cdn.discordapp.com/attachments/1072605585498984563/1129173878179123280/needrp_logo_nowe.png" , embeds = connect}), { ['Content-Type'] = 'application/json' })
		PerformHttpRequest(webhook2, function(err, text, headers) end, 'POST', json.encode({username = "NeedRP | Join", embeds = connect2}), { ['Content-Type'] = 'application/json' })
	end
end)

-- Logi Leave

AddEventHandler('playerDropped', function(reason)
    local num = GetNumPlayerIdentifiers(source)
	for i = 0, num-1 do
		local a = GetPlayerIdentifier(source, i)
		local f = string.find(a, ":")
		if f then
			local b = string.sub(a, 1, f-1)
			identifiers[b] = a
		end
	end
	local israel = GetPlayerName(source)
	local adamtest = GetPlayerLastMsg(source)
	local guid = GetPlayerGuid(source)
	local ping = GetPlayerPing(source)
	
	if guid ~= nil then
		local connect = {
			{
				["color"] = "16745472",
				["title"] = "Gracz odłączył się od serwera!",
				["description"] = "[ID]: **"..source.."**\n[Nick]: **"..israel.."** \n [Powód]: **"..reason.."** \n[IP]: **"..identifiers.ip.."**\n[Hex]: **"..identifiers.steam.."**\n[SID64]: **"..guid.."**\n [Licencja]: **"..identifiers.license.."**\n [Discord]: **"..identifiers.discord.."**\n[Live id]: **"..identifiers.live.."**\n[xbl id]: **"..identifiers.xbl.."**",
				["footer"] = {
					["text"] = dono,
					["icon_url"] = communtiylogo,
				},
			}
		}

		local webhook = 'https://discord.com/api/webhooks/1094603010224701530/0IOFANGqIfUg1jSTvj2Y_pWVbxwWMveCk2hY6662dys_tDeAEvdb6i5gB2gdpINDcSj_'
		
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "NeedRP | Leave", iconurl = "https://cdn.discordapp.com/attachments/1072605585498984563/1129173878179123280/needrp_logo_nowe.png", embeds = connect}), { ['Content-Type'] = 'application/json' })
	end
end)

ESX.RegisterUsableItem('wheelchair', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem('wheelchair', 1)
    Wait(250)
    xPlayer.triggerEvent('goat:wozek')
end)

RegisterServerEvent('goat:dodajwozek', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('wheelchair', 1)
end)

RegisterServerEvent('esx:updateDecor')
AddEventHandler('esx:updateDecor', function(what, entity, key, value)
    TriggerClientEvent('esx:updateDecor', -1, what, entity, key, value)
end)