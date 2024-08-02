ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
	setRadio()
end)

RegisterNetEvent('esx:setJob', function(job)
    ESX.PlayerData.job = job

end)

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