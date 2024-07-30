vESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

RegisterNetEvent("norp-moneywash:policenotify")
AddEventHandler("norp-moneywash:policenotify", function()
	if Config.EnablePoliceNotify then
    	local player = ESX.GetPlayerData()
    	if player.job.name == "police" then
		local playerCoords = GetEntityCoords(PlayerPedId())
		local data = {displayCode = '211', description = 'Suspicious activity in progress', isImportant = 1, recipientList = {'police'}, length = '4000'}
		local dispatchData = {dispatchData = data, caller = 'Local', coords = playerCoords}
		TriggerServerEvent('wf-alerts:svNotify', dispatchData)
    	end
	end
end)

function WashMoney(amountToWash)
    if Config.NeedIDCardToWashMoney then
        ESX.TriggerServerCallback("norp-moneywash:checkIDCard", function(result)
            if result == true then
                    local dialog = exports['zf_dialog']:DialogInput({
                        header = "Jaką ilość chcesz wyprać?", 
                        rows = {
                            {
                                id = 0, 
                                txt = "Ilość"
                            }
                        }
                    })
                    if dialog ~= nil then
                        if dialog[1].input == nil then return end
                        local amountToWash = tonumber(dialog[1].input)
                        TriggerServerEvent("norp-moneywash:canWashMoney", amountToWash)
					end
            else
				exports['norpNotify']:Alert("Money Laundering", "You dont have an ID Card to access Money Wash.", 5000, 'error')
            end
        end)
    else
                    local dialog = exports['zf_dialog']:DialogInput({
                        header = "Jaką ilość chcesz wyprać?", 
                        rows = {
                            {
                                id = 0, 
                                txt = "Ilość"
                            }
                        }
                    })
                    if dialog ~= nil then
                        if dialog[1].input == nil then return end
                        local amountToWash = tonumber(dialog[1].input)
                        TriggerServerEvent("norp-moneywash:canWashMoney", amountToWash)
					end
    end
end

RegisterNetEvent("norp-moneywash:MoneyWashFunc")
AddEventHandler("norp-moneywash:MoneyWashFunc", function(amountToWash)
    exports['ox_lib']:progressBar({
        duration = 25000,
        label = 'Pranie Gotówki...',
        useWhileDead = false,
        canCancel = true,
        disable = {
          car = true,
          move = true,
          combat = true,
        },
      })
    TriggerServerEvent("norp-moneywash:washMoney", amountToWash)
    local laundromat = vector3(562.7527, -3121.9636)
    local chance = math.random(0,100)
    if chance > 27 then
        TriggerServerEvent("norp-moneywash:notifiPolice", laundromat)
    end
end)

if Config.EnableMoneyWashBlip then
    Citizen.CreateThread(function()
		for k,v in pairs(Config.MoneyWash) do
			for i = 1, #v.WashMoney, 1 do
				local blip = AddBlipForCoord(v.WashMoney[i])
				
				SetBlipSprite (blip, 483)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 0.8)
				SetBlipColour (blip, 17)
				SetBlipAsShortRange(blip, true)
				
				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(Config.WashMoneyBlipName)
				EndTextCommandSetBlipName(blip)
			end
		end
	end)
end

Citizen.CreateThread(function()
    exports.qtarget:AddBoxZone("MoneyWash", vector3(562.7527, -3121.9636, 17.7687), 1, 1, {
        name="MoneyWash",
        heading = 315,
        debugPoly=false,
        minZ = 30.99,
        maxZ = 32.99
    }, {
        options = {
        {
        event = "moneywash:qt",
        icon = "fas fa-money-bill",
        label = "Wypierz",
        required_item = "moneywash_card",
        },
    },
        distance = 2.5
    })
end)

RegisterNetEvent('moneywash:qt')
AddEventHandler('moneywash:qt', function()
    WashMoney(amountToWash)
end)  