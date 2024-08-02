ESX.RegisterUsableItem("headbag", function(source)
    TriggerClientEvent("goat_headbag:useItem", source)
end)

RegisterNetEvent("goat_headbag:putOnHead", function(_target)
    local _source = source
    if _target == -1 then
        return
    end
    if #(GetEntityCoords(GetPlayerPed(_source)) - GetEntityCoords(GetPlayerPed(_target))) > 2.0 then
        return
    end

    TriggerClientEvent("goat_headbag:putOnHead", _target, _source)
    exports['goat_logs']:SendLog(source, "Założył worek: [" .. _target .."] " ..GetPlayerName(_target), 'kajdanki-headbag')
end)

RegisterNetEvent("goat_headbag:putFailed", function(_target)
    local _source = source
    if _target == -1 then
        return
    end
    TriggerClientEvent("goat_headbag:putFailed", _target)
    exports['goat_logs']:SendLog(source, "Wyrwał się graczowi przed założeniem worka: [" .. _target .."] " ..GetPlayerName(_target), 'kajdanki-headbag')
end)

RegisterNetEvent("goat_headbag:takeOffHead", function(_target)
    local _source = source
    if _target == -1 then
        return
    end
    if #(GetEntityCoords(GetPlayerPed(_source)) - GetEntityCoords(GetPlayerPed(_target))) > 2.0 then
        return
    end

    TriggerClientEvent("goat_headbag:takeOffHead", _target, _source)
    exports['goat_logs']:SendLog(source, "Ściągnał worek: [" .. _target .."] " ..GetPlayerName(_target), 'kajdanki-headbag')
end)