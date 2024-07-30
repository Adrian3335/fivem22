ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
	setRadio()
end)

RegisterNetEvent('esx:setJob', function(job)
    ESX.PlayerData.job = job
	setRadio()
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count, showNotification)
	for i,v in pairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.PlayerData.inventory[i].count = count
		end
	end
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, count, silent)
	for i,v in pairs(ESX.PlayerData.inventory) do
		if v.name == item then
			ESX.PlayerData.inventory[i].count = count
		end
	end
end)


function IsPlayerHasItem(name, count)
	if not count then count = 1 end
	for i,v in pairs(ESX.PlayerData.inventory) do
		if v.name == name then
			return v.count >= count
		end
	end
end
exports('IsPlayerHasItem', IsPlayerHasItem)

function IsPlayerJob(name, grade)
	if ESX.PlayerData.job.name == name then
		if grade then
			return ESX.PlayerData.job.grade >= grade
		else
			return true
		end
	else
		return false
	end
end