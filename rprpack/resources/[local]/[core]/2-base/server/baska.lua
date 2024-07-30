
ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('yellowkasakurwo:pay')
AddEventHandler('yellowkasakurwo:pay', function()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local society = 'society_ambulance'
    
	if(xPlayer.getMoney() >= 1000) then
		xPlayer.removeMoney(1000)
    end
	TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
		account.addMoney(1000)
end)
end)

ESX.RegisterServerCallback('yellowkasakurwo:money', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money    = xPlayer.getMoney(source)
    if money >= 1000 then
     cb(true)
    else
     cb(false)
     TriggerClientEvent("pNotify:SetQueueMax", -1, hej, 4)
            TriggerClientEvent("manyNotify:SendNotification", source, {
                        text = '<b><i class="fas fa-bell"></i>&nbsp;&nbsp;POWIADOMIENIE</span></b></br>Nie masz tyle pieniędzy',
                        type = "ogolne",
                        timeout = 4000,
                        layout = "bottom"
                     
                })
        
    end
end)
                
function sendNotification(xSource, message, messageType, messageTimeout)
    TriggerClientEvent("pNotify:SendNotification", xSource, {
        text = message,
        type = messageType,
        queue = "zeaq",
        timeout = messageTimeout,
        layout = "bottomCenter"
    })
end

RegisterServerEvent('yellowkasakurwo:check')
AddEventHandler('yellowkasakurwo:check', function()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

    local ambulance = 0
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer.job.name == 'a' then
                    ambulance = ambulance + 1
            end
        end
        if ambulance == 0 then
            TriggerClientEvent('yellowkasakurwo:Last', _source)
    else
        sendNotification(_source, 'Aktualnie są Medycy na Służbie!', 'error', 2500)
    end
end)
