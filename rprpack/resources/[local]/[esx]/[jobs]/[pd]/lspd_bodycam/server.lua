ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
ESX.RegisterServerCallback('sove:item', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local qtty = xPlayer.getInventoryItem(item).count
	cb(qtty)
end)
function getIdentity(source)

	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = source})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			nationality = identity['nationality']
			
		}
	else
		return nil
	end
end

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1000)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 255 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
         if true then 
            local name = getIdentity(xPlayer.identifier)
			TriggerClientEvent('sup_bodycam:show', xPlayers[i],'Funkcjonariusz: ' ..name.firstname  .. ' ' .. name.lastname, '' .. 'Stopień: '.. xPlayer.job.grade_label)
		 else
			TriggerClientEvent('sup_bodycam:close', xPlayers[i])
		end
	end
end
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if item.name == 'bodycam' and item.count <= 0 then
	   TriggerClientEvent('sup_bodycam:close', source)
	end
end)

ESX.RegisterUsableItem('bodycam', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('sup_bodycam:bodycam', source)
end)