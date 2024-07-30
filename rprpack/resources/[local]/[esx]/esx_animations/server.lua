RegisterNetEvent('esx_animations:requestSynced')
AddEventHandler('esx_animations:requestSynced', function(zmienna1, zmienna2)
	local _source = source
	TriggerClientEvent('esx_animations:syncRequest', zmienna1, _source, zmienna2)
end)

RegisterNetEvent('esx_animations:syncAccepted')
AddEventHandler('esx_animations:syncAccepted', function(zmienna1, zmienna2)
	local _source = source
	TriggerClientEvent('esx_animations:playSynced', zmienna1, _source, zmienna2, 'Requester')
	TriggerClientEvent('esx_animations:playSynced', _source, zmienna1, zmienna2, 'Accepter')
end)