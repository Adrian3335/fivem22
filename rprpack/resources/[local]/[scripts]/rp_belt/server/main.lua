RegisterServerEvent('dbl:impact')
AddEventHandler('dbl:impact', function(list, speedBuffer, velocityBuffer)
	local _source = source
	for k,v in pairs(list) do
		TriggerClientEvent('dbl:impact', v, speedBuffer, velocityBuffer)
	end
	
	TriggerClientEvent('dbl:impact', _source, speedBuffer, velocityBuffer)
end)