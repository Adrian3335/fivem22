local opisy = {}


RegisterCommand('opis', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    if args[1] ~= nil then
        local text = table.concat(args, " ",1)
        if #text > 91 then
            xPlayer.showNotification('~r~Maksymalna długość tekstu to 91 znaków!')
        else
            TriggerClientEvent('many-base:opis', -1, source, text)
            opisy[source] = text
        end
	else
		TriggerClientEvent('many-base:opis', -1, source, '')
        opisy[source] = nil
	end
end, false)


RegisterServerEvent('many-base:takeOpis')
AddEventHandler('many-base:takeOpis', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier
    local opisSource = opisy[source]
    TriggerClientEvent('many-base:opis', -1, source, opisSource)
    TriggerClientEvent('many-base:opisGraczy', -1)
end)

RegisterServerEvent('many-base:opis:serwer')
AddEventHandler('many-base:opis:serwer', function(id, opis)
    TriggerClientEvent('many-base:opis', -1, id, opis)
end)