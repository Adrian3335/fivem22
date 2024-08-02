if Config.Core == "ESX" then
    ESX = Config.CoreExport()
elseif Config.Core == "QB-Core" then
    QBCore = Config.CoreExport()
end

RegisterNetEvent('vms_driveschoolv2:sv:buyExam', function(data)
    local src = source
    if data and data.type and data.category and Config.Licenses[data.type][data.category] then
        local examPrice = Config.Licenses[data.type][data.category].price
        if Config.Core == "ESX" then
            local xPlayer = ESX.GetPlayerFromId(src)
            if xPlayer then
                local myMoney = xPlayer.getMoney()
                if myMoney >= examPrice then
                    xPlayer.removeMoney(examPrice)
                    TriggerClientEvent('vms_driveschoolv2:cl:startExam', src, data.type, data.category)
                else
                    if Config.PossibleChargeByBank then
                        local myBank = xPlayer.getAccount('bank').money
                        if myBank >= examPrice then
                            xPlayer.removeAccountMoney('bank', examPrice)
                            TriggerClientEvent('vms_driveschoolv2:cl:startExam', src, data.type, data.category)
                        else
                            TriggerClientEvent('vms_driveschoolv2:notification', src, Config.Translate['not_enough_cash_and_bank'], 'error', true)
                        end
                    else
                        TriggerClientEvent('vms_driveschoolv2:notification', src, Config.Translate['not_enough_cash'], 'error', true)
                    end
                end
            end
        elseif Config.Core == "QB-Core" then
            local Player = QBCore.Functions.GetPlayer(src)
            if Player then
                local myMoney = Player.Functions.GetMoney('cash')
                if myMoney >= examPrice then
			        Player.Functions.RemoveMoney('cash', examPrice)
                    TriggerClientEvent('vms_driveschoolv2:cl:startExam', src, data.type, data.category)
                else
                    if Config.PossibleChargeByBank then
                        local myBank = Player.Functions.GetMoney('bank')
                        if myBank >= examPrice then
        			        Player.Functions.RemoveMoney('bank', examPrice)
                            TriggerClientEvent('vms_driveschoolv2:cl:startExam', src, data.type, data.category)
                        else
                            TriggerClientEvent('vms_driveschoolv2:notification', src, Config.Translate['not_enough_cash_and_bank'], 'error', true)
                        end
                    else
                        TriggerClientEvent('vms_driveschoolv2:notification', src, Config.Translate['not_enough_cash'], 'error', true)
                    end
                end
            end
        end
    end
end)