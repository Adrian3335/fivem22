local itemsToSell = {
    ['rolex'] = {
        min = 200,
        max = 325
    },

    ['gchain'] = {
        min = 350,
        max = 380,
    }, 

    ['ring'] = {
        min = 350,
        max = 400
    },
    
    ['diamond'] = {
        min = 200,
        max = 400,
    },

    ['5ct_gold_chain'] = {
        min = 400,
        max = 500,
    },

    ['tv'] = {
        min = 600,
        max = 800,
    },
}

RegisterNetEvent('many-base:Lombard:Sprzedaj', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local manyszef = false

    for i,v in pairs(xPlayer.getInventory(false)) do
        if itemsToSell[v.name] then
            if v.count > 0 then
                local reward = v.count * math.random(itemsToSell[v.name].min, itemsToSell[v.name].max)
                manyszef = true
                xPlayer.removeInventoryItem(v.name, v.count)
                xPlayer.addMoney(reward)
                xPlayer.showNotification('Otrzymałeś ' ..reward.. '$ ze sprzedaży ' ..v.label)
            end
        end
    end

    if not manyszef then
        xPlayer.showNotification('Nie masz nic na sprzedaż!')
    end
end)