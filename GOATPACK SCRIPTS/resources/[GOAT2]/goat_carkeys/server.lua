local AddKey = function(source, plate)
    exports.ox_inventory:AddItem(source, "car_keys", 1, plate)
end
exports("AddKey", AddKey)
RegisterNetEvent("goat_carkeys:AddKey", function(plate)
    local _source = source
    AddKey(_source, plate)
end)

local RemoveKey = function(source, plate)
    local count = exports.ox_inventory:GetItem(source, 'car_keys', plate, true)
    exports.ox_inventory:RemoveItem(source, "car_keys", count, plate)
end
exports("RemoveKey", RemoveKey)
RegisterNetEvent("goat_carkeys:RemoveKey", function(plate)
    local _source = source
    RemoveKey(_source, plate)
end)

ESX.RegisterUsableItem("car_keys", function(source, item, data)
    if not data or not data.metadata or not data.metadata.type then
        return
    end
    TriggerClientEvent("goat_carkeys:UseItem", source, data.metadata.type)
end)

ESX.RegisterUsableItem("lockpick", function(source, item, data)
    if not data or not data.metadata or not data.metadata.durability then
        return
    end
    local durability = tonumber(data.metadata.durability)
    if durability <= 0 then
        TriggerClientEvent("esx:showNotification", source, "Nie możesz użyć tego wytrychu!")
        return
    end
    TriggerClientEvent("goat_carkeys:UseLockPick", source, {slot = data.slot, durability = durability})
end)

RegisterNetEvent("goat_carkeys:LockPickUsed", function(data)
    local _source = source
    exports.ox_inventory:SetDurability(_source, data.slot, data.durability - 5)
end)