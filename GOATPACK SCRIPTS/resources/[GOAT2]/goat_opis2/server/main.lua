Config.Zones = {}

RegisterNetEvent("addopis2")
AddEventHandler("addopis2", function(coords, text, veh, plate)
	local source = source
	local ide = (#Config.Zones+1)
	if veh then
		Config.Zones[#Config.Zones + 1] = {text = text, Pos = coords, id = source, idopisu = ide, vehicle = veh, plate = plate}
		TriggerClientEvent("addopis2", -1, coords, text, source, ide, veh, plate)
		exports['goat_logs']:SendLog(source, "STWORZYŁ NOWY OPIS2 NA AUCIE: " ..text.. " KORDY: "..coords.." ID: "..ide.." REJSTRACJA AUTA: "..plate, 'opis2')
	else
		Config.Zones[#Config.Zones + 1] = {text = text, Pos = coords, id = source, idopisu = ide}
		TriggerClientEvent("addopis2", -1, coords, text, source, ide)
		exports['goat_logs']:SendLog(source, "STWORZYŁ NOWY OPIS2: " ..text.. " KORDY: "..coords.." ID: "..ide, 'opis2')
	end
	TriggerClientEvent("esx:showNotification", source, "~g~Utworzyłeś opis2 o id: ~p~"..ide)
end)

RegisterNetEvent("addopis2usun")
AddEventHandler("addopis2usun", function(id)
	local source = source
	Config.Zones[id] = nil
	TriggerClientEvent("addopis2usun", -1, id)
	exports['goat_logs']:SendLog(source, "USUNĄŁ OPIS2 O ID: " ..id, 'opis2')
end)

RegisterNetEvent("addopis2lista")
AddEventHandler("addopis2lista", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local text = ""
	for k,v in pairs(Config.Zones) do
		if v.id == _source then
			text = text .. "ID: " .. v.idopisu.." | "..v.text .. "<br/>"
		end
	end
	xPlayer.showNotification(text)
end)