notifyServer = function(source, type, header, content)
    TriggerClientEvent('notify:Send', source, type, header, content)
end

exports("notify", notifyServer)