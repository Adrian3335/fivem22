ESX = exports.es_extended.getSharedObject()

local rob = false
local robbers = {}
local moneyState = {}
local lastRobbed = 0

RegisterServerEvent('esx_holdup:setMoneyState')
AddEventHandler('esx_holdup:setMoneyState', function(index, bool)
	moneyState[index] = bool
end)

ESX.RegisterServerCallback('esx_holdup:checkMoneyState', function(source, cb, index)
	cb(moneyState[index])
end)

ESX.RegisterServerCallback('esx_holdup:checkPolice', function(source, cb)
	local xPlayers = ESX.GetPlayers()
	local cops = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			cops = cops + 1
		end
	end
	cb(cops)
end)

RegisterServerEvent('fleecaheist:server:rewardItem')
AddEventHandler('fleecaheist:server:rewardItem', function(reward)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer then
        if reward.item ~= nil and reward.count ~= nil then
			exports.ox_inventory:AddItem(_source, 'money', reward.count)
		
        end
    end
end)

RegisterServerEvent('fleecaheist:server:modelSync')
AddEventHandler('fleecaheist:server:modelSync', function(index, k, model)
    TriggerClientEvent('fleecaheist:client:modelSync', -1, index, k, model)
end)

RegisterServerEvent('fleecaheist:server:lootSync')
AddEventHandler('fleecaheist:server:lootSync', function(index, type, k)
    TriggerClientEvent('fleecaheist:client:lootSync', -1, index, type, k)
end)

RegisterServerEvent('esx_holdup:takeHackingItem')
AddEventHandler('esx_holdup:takeHackingItem', function()
	local _source = source
	exports.ox_inventory:RemoveItem(_source, Config.HackItem.name, 1, nil)
	
end)

RegisterServerEvent('esx_holdup:policeNotification')
AddEventHandler('esx_holdup:policeNotification', function(index)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	local bank = Config.Banks[index]
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_holdup:setblip', xPlayers[i], _source, os.date("%H:%M"), bank.doors)
		end
	end
end)

RegisterServerEvent('esx_holdup:openVault')
AddEventHandler('esx_holdup:openVault', function(index, type)
	local _source = source
	local bank = Config.Banks[index]
	if bank then
		if rob == false then
			rob = true
			TriggerClientEvent('fleecaheist:client:doorSync', -1, index, type)
			TriggerClientEvent('fleecaheist:client:rob', _source, index)
	
			-- bank.lastrobbed = os.time()
			lastRobbed = os.time()
		else
			TriggerClientEvent('esx:showNotification', _source, 'Napad już trwa!')
		end
	end
end)

ESX.RegisterServerCallback('esx_holdup:getRobTime', function(source, cb, index)
	-- local bank = Config.Banks[index]
	-- if (os.time() - bank.lastrobbed) < Config.TimerBeforeNewRob and bank.lastrobbed ~= 0 then
	if (os.time() - lastRobbed) < Config.TimerBeforeNewRob and lastRobbed ~= 0 then
		-- TriggerClientEvent('esx:showNotification', source, 'Poczekaj: ' ..(Config.TimerBeforeNewRob - (os.time() - bank.lastrobbed)).. " sekund!")
		TriggerClientEvent('esx:showNotification', source, 'Poczekaj: ' ..(Config.TimerBeforeNewRob - (os.time() - lastRobbed)).. " sekund!")
		cb(false)
	else
		cb(true)
	end
end)

RegisterServerEvent('esx_holdup:endRobbery')
AddEventHandler('esx_holdup:endRobbery', function(index)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	robbers[_source] = nil
	rob = false
	TriggerClientEvent('fleecaheist:client:doorSync', -1, index, 2)
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_holdup:killblip', xPlayers[i])
		end
	end
end)