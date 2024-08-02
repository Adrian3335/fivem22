local p = nil

function StartGame()
    p = promise.new()

    SendNUIMessage({
        action = 'START_GAME',
    })
    SetNuiFocus(true, true)

    local result = Citizen.Await(p)
    return result
end

exports('StartGame', StartGame)

RegisterNUICallback('EndGame', function(data)
    p:resolve(tonumber(data.money))
    p = nil
    SetNuiFocus(false, false)
end)