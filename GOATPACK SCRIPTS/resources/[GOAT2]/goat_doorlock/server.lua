for i = 1, #(Config.Doors) do
    local doorsCfg = Config.Doors[i]
    doorsCfg.locked = (doorsCfg.locked and 1 or 0)
    for j = 1, #(doorsCfg.objects) do
        local doorCfg = doorsCfg.objects[j]
        doorCfg.hash = "Doors-" .. i .. "Door-" .. j
    end
end

ESX.RegisterServerCallback("frp_doorlock:getConfig", function(source, cb)
    cb(Config.Doors)
end)

RegisterNetEvent("frp_doorlock:stateChange", function(door)
    Config.Doors[door].locked = (Config.Doors[door].locked == 1 and 0 or 1)
    TriggerClientEvent("frp_doorlock:stateChange", -1, Config.Doors, door)
end)