local opisy = {}


RegisterCommand('opis', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    if args[1] ~= nil then
        local text = table.concat(args, " ",1)
        if #text > 91 then
            xPlayer.showNotification('~r~Maksymalna długość tekstu to 91 znaków!')
        else
            TriggerClientEvent('213:opis', -1, source, text)
            opisy[source] = text
        end
	else
		TriggerClientEvent('213:opis', -1, source, '')
        opisy[source] = nil
	end
end, false)


RegisterServerEvent('213:opisGet')
AddEventHandler('213:opisGet', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    local opisSource = opisy[source]
    TriggerClientEvent('213:opis', -1, source, opisSource)
    TriggerClientEvent('213:opisInnychGraczy', -1)
end)

RegisterServerEvent('213:opisInnychGraczyServer')
AddEventHandler('213:opisInnychGraczyServer', function(id, opis)
    TriggerClientEvent('213:opis', -1, id, opis)
end)