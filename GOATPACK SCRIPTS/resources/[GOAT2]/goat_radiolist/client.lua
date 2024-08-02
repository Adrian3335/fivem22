local MyChannel = 0
RegisterNetEvent("goat_radiolist:connected", function(channel)
    MyChannel = channel
    local name = Config.Channels[MyChannel] or MyChannel
    SendNUIMessage({
        action = "UpdateVisible",
        number = MyChannel,
        name = name
    })
end)

RegisterNetEvent("goat_radiolist:setTalkingOnRadio", function(channel, target, talking)
    if channel == MyChannel then
        SendNUIMessage({
            action = "UpdateTalking",
            target = target,
            talking = talking
        })
    end
end)

RegisterNetEvent("goat_radiolist:updateList", function(channel, list)
    if MyChannel ~= 0 and channel == MyChannel then
        if channel == MyChannel then
            SendNUIMessage({
                action = "UpdateList",
                count = #list,
                list = list
            })
        end
    end
end)

RegisterNetEvent('goat_ui:client:updateColor', function(data)
    SendNUIMessage({
        action = 'updatecolor',
        color = data,
    })
end)

exports("visible", function(data)
    SendNUIMessage({
        action = 'UpdateHudVisible',
        visible = data
    })
end)