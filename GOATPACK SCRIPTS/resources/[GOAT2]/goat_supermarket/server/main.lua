ESX.RegisterServerCallback("need_supermarket:buyItems", function(source, cb, data, WeaponShop)
    local xPlayer = ESX.GetPlayerFromId(source)
    local account = data.account
    local cart = data.items
    local price = 0
    local items = 0
    local _source = source
    for k,v in pairs(cart) do
        price = price + tonumber(v.price)
        items = items + 1
    end
    if WeaponShop then
        local p = promise.new()
        TriggerEvent('esx_license:checkLicense', source, "weapon", function(has)
		    p:resolve(has)
        end)
        if not Citizen.Await(p) then
            cb("license")
            return
        end
    end
    if items < 1 then
        cb("amount")
        return
    end
    if xPlayer.getAccount(account).money < price then
        cb("money")
        return
    end

    items = 0
    xPlayer.removeAccountMoney(account, price)
    for k,v in pairs(cart) do
        items = items + 1
        xPlayer.addInventoryItem(k, v.amount)
        -- exports['diablohub_logs']:SendLog(_source, '```'..GetPlayerName(_source)..' kupił przedmiot ' ..price..'$```', 'sklepy')
    end
    cb("success")
end)