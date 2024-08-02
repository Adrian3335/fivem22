local ESX = exports.es_extended.getSharedObject()
ESX.RegisterUsableItem("radio", function(source)
	TriggerClientEvent("azure_radio:useRadio", source)
end)