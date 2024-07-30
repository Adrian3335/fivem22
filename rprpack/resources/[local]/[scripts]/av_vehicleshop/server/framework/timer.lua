--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

local vehicles = {}

RegisterServerEvent('av_vehicleshop:addTimer', function(netId)
    vehicles[#vehicles+1] = {netId = netId, time = addTime(Config.DriveTestTime)}
end)

CreateThread(function()
    while true do
        local time = os.time()
        for k, v in pairs(vehicles) do
            if tonumber(time) >= tonumber(v['time']) then
                local vehicle = NetworkGetEntityFromNetworkId(v['netId'])
                if vehicle and DoesEntityExist(vehicle) then
                    DeleteEntity(vehicle)
                end
                vehicles[k] = nil
            end
        end
        Wait(3 * 60 * 1000)
    end
end)

function addTime(time)
    return (os.time() + time * 60)
end