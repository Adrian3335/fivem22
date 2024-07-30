RegisterNetEvent("xpack_interactions:cuff", function(target)
    local _source = source
    local _target = target
    if _target ~= nil then
        TriggerClientEvent("xpack_interactions:cuff", _target, _source)
        --exports['wait_logs']:SendLog(_source, '```'..GetPlayerName(_source)..' ('.._source..')``` zakuł ```'..GetPlayerName(target)..'('.._target..')```', 'nowe-kajdanki')
    end
end)

RegisterNetEvent("xpack_interactions:bind", function(target)
    local _source = source
    local _target = target
    if _target ~= nil then
        TriggerClientEvent("xpack_interactions:bind", _target, _source)
        exports.ox_inventory:RemoveItem(_source, 'rope', 1)
       -- exports['wait_logs']:SendLog(_source, '```'..GetPlayerName(_source)..' ('.._source..')``` związał ```'..GetPlayerName(target)..'('.._target..')```', 'nowe-kajdanki')
    end
end)

RegisterNetEvent("xpack_interactions:uncuff", function(target)
    local _source = source
    local _target = target
    if _target ~= nil then
        TriggerClientEvent("xpack_interactions:uncuff", _target, _source)
        --exports['wait_logs']:SendLog(_source, '```'..GetPlayerName(_source)..' ('.._source..')``` odkuł ```'..GetPlayerName(target)..'('.._target..')```', 'nowe-kajdanki')
    end
end)

RegisterNetEvent("xpack_interactions:solve", function(target)
    local _source = source
    local _target = target
    if _target ~= nil then
        exports.ox_inventory:AddItem(_source, 'rope', 1, nil, nil, function(success, reason) end)
        TriggerClientEvent("xpack_interactions:solve", _target, _source)
        --exports['wait_logs']:SendLog(_source, '```'..GetPlayerName(_source)..' ('.._source..')``` rozwiązał ```'..GetPlayerName(target)..'('.._target..')```', 'nowe-kajdanki')
    end
end)

RegisterNetEvent("xpack_interactions:drag", function(target)
    local _source = source
    local _target = target
    if _target ~= nil then
        TriggerClientEvent("xpack_interactions:drag", _target, _source)
        --exports['wait_logs']:SendLog(_source, '```'..GetPlayerName(_source)..' ('.._source..')``` przeniósł ```'..GetPlayerName(target)..'('.._target..')```', 'nowe-kajdanki')
    end
end)

RegisterNetEvent("xpack_interactions:drop", function(target)
    local _source = source
    local _target = target
    if _target ~= nil then
        TriggerClientEvent("xpack_interactions:drop", _target, _source)
        --exports['wait_logs']:SendLog(_source, '```'..GetPlayerName(_source)..' ('.._source..')``` puścił ```'..GetPlayerName(target)..'('.._target..')```', 'nowe-kajdanki')
    end
end)

RegisterNetEvent("xpack_interactions:putInVehicle", function(target)
    local _source = source
    local _target = target
    if _target ~= nil then
        TriggerClientEvent("xpack_interactions:putInVehicle", _target, _source)
        --exports['wait_logs']:SendLog(_source, '```'..GetPlayerName(_source)..' ('.._source..')``` włożył ```'..GetPlayerName(target)..'('.._target..')``` do pojazdu', 'nowe-kajdanki')
    end
end)

RegisterNetEvent("xpack_interactions:outTheVehicle", function(target)
    local _source = source
    local _target = target
    if _target ~= nil then
        TriggerClientEvent("xpack_interactions:outTheVehicle", _target, _source)
        --exports['wait_logs']:SendLog(_source, '```'..GetPlayerName(_source)..' ('.._source..')``` wyciągnął ```'..GetPlayerName(target)..'('.._target..')``` z pojazdu', 'nowe-kajdanki')
    end
end)