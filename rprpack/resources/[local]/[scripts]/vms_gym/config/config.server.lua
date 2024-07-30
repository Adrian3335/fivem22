AddMoneyToSociety = function(money, sellerJobName)
    if Config.Core == "ESX" then
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..sellerJobName, function(account)
            if account then
                account.addMoney(money)
            end
        end)
    elseif Config.Core == "QB-Core" then
        exports['qb-management']:AddGangMoney(sellerJobName, money)
    end
end