RegisterNetEvent("need_property:enter", function()
    local _source = source
    SetPlayerRoutingBucket(_source, (1000 + _source))
end)

RegisterNetEvent("need_property:exit", function()
    local _source = source
    SetPlayerRoutingBucket(_source, 0)
end)

RegisterNetEvent("need_property:loadStash", function()
    local _source = source
    local identifier = ESX.GetPlayerFromId(_source).identifier
    exports.ox_inventory:RegisterStash("playerFreeProperty-" .. identifier, "Mieszkanie", 50, 250000, identifier, false, vec3(-816.56, 3469.93, -159.15))
end)

RegisterNetEvent("need_property:saveOutfit", function(label, skin)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local identifier = ESX.GetPlayerFromId(_source).identifier
    TriggerEvent('esx_datastore:getDataStore', 'property', identifier, function(store) 
        local dressing = store.get('dressing')
        if dressing == nil then
            dressing = {}
        end
        local count  = store.count('dressing')
        for i=1, count, 1 do
            local entry = store.get('dressing', i)
            if entry.label == label then
                xPlayer.showNotification('~r~W szafce znajduje się już strój pod taką nazwą!')
                return
            end
        end
        if #dressing < 20 then
            dressing[#dressing + 1] = {
                label = label,
                skin  = skin
            }
            store.set('dressing', dressing)
        else
            xPlayer.showNotification('~r~W szafie nie ma miejsc na więcej ubrań!')		
        end
    end)
end)

RegisterNetEvent("need_property:removeOutfit", function(label)
    local _source = source
    local identifier = ESX.GetPlayerFromId(_source).identifier
    TriggerEvent('esx_datastore:getDataStore', 'property', identifier, function(store)
        local dressing = store.get('dressing') or {}
        table.remove(dressing, label)
        store.set('dressing', dressing)
    end)
end)

ESX.RegisterServerCallback("need_property:getPlayerDressing", function(source, cb)
    local _source = source
    local identifier = ESX.GetPlayerFromId(_source).identifier
    TriggerEvent('esx_datastore:getDataStore', 'property', identifier, function(store)
        local labels = {}
        local count  = store.count('dressing')
        for i=1, count, 1 do
            local entry = store.get('dressing', i)
            labels[#labels + 1] = {label = entry.label, clothes = entry.skin}
        end
        cb(labels)
    end)
end)