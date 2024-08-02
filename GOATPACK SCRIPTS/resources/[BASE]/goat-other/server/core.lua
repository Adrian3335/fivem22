ESX = exports["es_extended"]:getSharedObject()

OxInventory = true -- zostaw jak jest bo cie rozjebie

IllegalTaskBlacklist = { -- blacklista na joby które nie mogą robić illegal rzeczy
    police = {},
    ambulance = {}
}

--[[

# FUNKCJA OD USUWANIA ITEMU ;3

]]

function removeItem(src, item, count, metadata)
    if (source == nil) then return end

    if (OxInventory) then
        exports.ox_inventory:RemoveItem(source, item, count, metadata)
    else 
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.removeInventoryItem(item, count)
    end
end

exports('removeItem', removeItem)

RegisterServerEvent('many-base:removeItem')
AddEventHandler('many-base:removeItem', function(src, item, count, metadata)
    removeItem(src, item, count, metadata)
end)

--[[

# FUNKCJA OD DODAWANIA ITEMU ;3

]]

function addItem(source, item, count, metadata)
    if (source == nil) then return end
    if (OxInventory) then
        local Inventory = exports.ox_inventory
        local canCarryItem = Inventory:CanCarryItem(source, item, count)
        if (canCarryItem) then
            Inventory:AddItem(source, item, count, metadata)
            return true
        else
            TriggerClientEvent('many-base:Notify', source, 'error', 'Nie uniesiesz tego przedmiotu')
            return false
        end
    else
        if (xPlayer.canCarryItem(item, count)) then
            xPlayer.addInventoryItem(item, count)
            return true
        else
            TriggerClientEvent('many-base:Notify', source, 'error', 'Nie uniesiesz tego przedmiotu')
            return false
        end
    end
end
exports('addItem', addItem)
AddEventHandler('many-base:addItem', function(item, count)
    return addItem(source, item, count)
end)

--[[

# FUNKCJA OD SPRAWDZANIA ILOŚCI DANEGO ITEMU

]]

function itemCount(source, item, metadata)
    if (source == nil) then return end
    if (OxInventory) then
        local itemCount = exports.ox_inventory:Search(source, 'count', item, metadata)
        if (itemCount == nil) then itemCount = 0 end
		return itemCount
	else
		local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.getInventoryItem(item).count
	end
end
exports('sv_itemCount', itemCount)

ESX.RegisterServerCallback('many-base:itemCountCb', function(source, cb, item, metadata)
    cb(itemCount(source, item, metadata))
end)

RegisterServerEvent('many-base:sv_itemCount')
AddEventHandler('many-base:sv_itemCount', function(source, item, metadata)
    return itemCount(source, item, metadata)
end)

--[[

# FUNKCJA CZY MOŻE PODNIEŚĆ DANY ITEM

]]

function canHoldItem(source, item, count)
    if (source == nil) then return end
    if (OxInventory) then
		return exports.ox_inventory:CanCarryItem(source, item, count)
	else
		local xPlayer = ESX.GetPlayerFromId(source)
        return xPlayer.canCarryItem(item, count)
	end
end

exports('sv_canHoldItem', canHoldItem)

ESX.RegisterServerCallback('many-base:canHoldItem', function(source, cb, item, count)
    cb(canHoldItem(source, item, count))
end)

RegisterServerEvent('many-base:sv_canHoldItem')
AddEventHandler('many-base:sv_canHoldItem', function(source, item, count)
    return canHoldItem(source, item, count)
end)

--[[

# EVENTY OD INSTANCJI (JESLI NIE OGARNIASZ TO SIĘ NIE BAW BO SOBIE SERWER ROZKURWISZ) ;3

]]

RegisterServerEvent('many-base:AddToInstance')
AddEventHandler('many-base:AddToInstance', function(source, instanceId)
    SetPlayerRoutingBucket(source, instanceId)
        if (instanceId == 0) then return end
    SetRoutingBucketEntityLockdownMode(instanceId, 'strict')
    SetRoutingBucketPopulationEnabled(instanceId, false)
end)

RegisterServerEvent('many-base:RemoveFromInstance')
AddEventHandler('many-base:RemoveFromInstance', function(source)
    if (GetPlayerRoutingBucket(source) ~= 0) then TriggerEvent('many-base:AddToInstance', source, 0) end
end)

--[[

# CALLBACK OD ILLEGAL TASKÓW ;3

]]

ESX.RegisterServerCallback('many-base:illegalTaskBlacklist', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    -- var = check (and) true (or) false
    local result = IllegalTaskBlacklist[xPlayer.job.name] == true and true or false
    cb(result)
end)

--[[

# CALLBACK OD ILOŚCI JOBÓW ;3

]]

ESX.RegisterServerCallback('many-base:jobCount', function(source, cb, job)
    cb(#ESX.GetExtendedPlayers('job', job))
end)

--[[

# EXPORT DO NPWD CZY MOZE ODPALIC TELEFON ;3

]]

ESX.RegisterServerCallback('phone_export:canUse', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('phone')
	if xItem.count >= 1 then
		cb(true)
	else
		cb(false)
	end
end)

--[[

# REMOVE WYTRYCH

]]

RegisterServerEvent('blowpipe:remove')
AddEventHandler('blowpipe:remove', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('blowpipe', 1)
end)