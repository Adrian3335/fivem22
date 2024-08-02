robbers = {}
robbed = false
currentRobbery = false
currentRobberyPlayer = nil

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    exports.ox_doorlock:setDoorState(162, true)
    exports.ox_doorlock:setDoorState(163, true)
    TriggerClientEvent(name..":syncFixed", -1)
end)

lib.callback.register(name..':createPed', function(source)
    TriggerClientEvent(name..':createClientPed', source, s_cfg)
end)

lib.callback.register(name..':getPoliceCount', function(source)
    local police = ESX.GetExtendedPlayers('job', cfg.policeJob)
    local second = ESX.GetExtendedPlayers('job', cfg.policeSecond)
    return #police+#second
end)

lib.callback.register(name..':removeItem', function(source, state)
    local success = false
    if state then
        success = exports.ox_inventory:RemoveItem(source, cfg.requiredItem.name, cfg.requiredItem.numToRemove)
    else
        success = (exports.ox_inventory:GetItemCount(source, cfg.requiredItem.name) >= 1)
    end
    return success
end)

lib.callback.register(name..':itemsCheck', function(source, item, remove)
    local success = false
    if remove then
        success = exports.ox_inventory:RemoveItem(source, item, 1)
    else
        success = (exports.ox_inventory:GetItemCount(source, item) >= 1)
    end
    return success
end)

lib.callback.register(name..':currentRobbery', function(source, what, status)
    if what == 'check' then
        if robbed then
            return true
        else
            return currentRobbery
        end
    end

    if what == 'set' then
        currentRobbery = status
        if status then
            currentRobberyPlayer = source
            
            SetTimeout(30*60*1000, function()
                if currentRobberyPlayer ~= nil then
                    currentRobberyPlayer = nil
                    currentRobbery = false
                end
            end)

        else
            currentRobberyPlayer = nil
        end
    end
end)

lib.callback.register(name..':checkCooldown', function(source, setCooldown)
    local xPlayer = ESX.GetPlayerFromId(source)

    if setCooldown then
        robbers[xPlayer.getIdentifier()] = true
        SetTimeout(cfg.cooldown*1000, function()
            robbers[xPlayer.getIdentifier()] = nil
        end)
        SetTimeout(cfg.globalCooldown*1000, function()
            robbed = false
            exports.ox_doorlock:setDoorState(162, true)
            exports.ox_doorlock:setDoorState(163, true)
            TriggerClientEvent(name..":syncFixed", -1)
        end)
    else
        if robbers[xPlayer.getIdentifier()] then
            return true
        else
            return false
        end 
    end
end)

lib.callback.register(name..':sellItemsRobbery', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local moneySum = 0

    for k,v in pairs(cfg.rewards) do
        local count = exports.ox_inventory:Search(source, 'count', v.name)
        if count ~= nil and count > 0 then
            local price = math.random(v.money.min, v.money.max) * count
            exports.ox_inventory:RemoveItem(source, v.name, count)
            moneySum = moneySum + price
        end
    end

    if moneySum == 0 then
        return xPlayer.showNotification('Nie masz nic na sprzedaż')
    end

    xPlayer.addAccountMoney('money', moneySum)
    xPlayer.showNotification('Łącznie zarobiłeś: '.. moneySum .. '$')

end)

lib.callback.register(name..':getReward', function(source, vetrine)
    if source == currentRobberyPlayer then
        local ranItem = math.random(1, #cfg.rewards)
        local item = cfg.rewards[ranItem]
        local amount = math.random(item.random.min, item.random.max)

        TriggerClientEvent(name..':syncBroke', -1, vetrine)

        exports.ox_inventory:AddItem(source, item.name, amount)
    end
end)

lib.callback.register(name..':getSafe', function(source)
    if source == currentRobberyPlayer then
        local xPlayer = ESX.GetPlayerFromId(source)
        local cash = math.random(cfg.safeReward.min, cfg.safeReward.max)
        xPlayer.addAccountMoney('money', cash)
    end
end)

lib.callback.register(name..':notifyPolice', function(source)
    local xPlayers = ESX.GetExtendedPlayers('job', cfg.policeJob)
    local xSeconds = ESX.GetExtendedPlayers('job', cfg.policeSecond)
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)

    for _, xSecond in pairs(xSeconds) do
        xSecond.triggerEvent('diablo_hub:policeNotify', {
            playerId = source,
            coords = coords,
            textColor = "#fff",
            bgColor = "#06a5ff",
            title1 = "10-90",
            title2 = "Zgłoszenie",
            blip = {
                name = "Napad w toku",
                sprite = 161,
                scale = 2.0,
                colour = 3,
                timeToDelete = 90000
            },
            sound = {
                file = "POLICERobbery",
                volume = 0.3
            },
            content = {
                {
                    type = "location",
                    text = "Jubiler"
                },
                {
                    type = "msg",
                    text = "Napad na jubilera w toku!"
                }
            }
        })
    end

    for _, xPlayer in pairs(xPlayers) do
        xPlayer.triggerEvent('diablo_hub:policeNotify', {
            playerId = source,
            coords = coords,
            textColor = "#fff",
            bgColor = "#06a5ff",
            title1 = "10-90",
            title2 = "Zgłoszenie",
            blip = {
                name = "Napad w toku",
                sprite = 161,
                scale = 2.0,
                colour = 3,
                timeToDelete = 90000
            },
            sound = {
                file = "POLICERobbery",
                volume = 0.3
            },
            content = {
                {
                    type = "location",
                    text = "Jubiler"
                },
                {
                    type = "msg",
                    text = "Napad na jubilera w toku!"
                }
            }
        })
    end
end)

lib.callback.register(name..':mainDoors', function(source)
    exports.ox_doorlock:setDoorState(162, false)
end)

lib.callback.register(name..':safeDoors', function(source)
    exports.ox_doorlock:setDoorState(163, false)
end)