dutyData = {}
local allTicks = 0

AddEventHandler('onResourceStart', function(resourceName)
	if resourceName == GetCurrentResourceName() then
        dutyData = json.decode(LoadResourceFile(GetCurrentResourceName(), 'duty.json'))
    end
end)

function saveData()
    SaveResourceFile(GetCurrentResourceName(), 'duty.json', json.encode(dutyData))
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local addTick = false
        for k, v in pairs(dutyData) do
            addTick = true
            if v.src ~= nil and v.status then
                v.time = v.time + 1
                if Config.AntiAfk then
                    local ped = GetPlayerPed(v.src)
                    local coords = GetEntityCoords(ped)
                    if (v.coords ~= nil) then
                        if #(vector3(coords.x, coords.y, coords.z) - vector3(v.coords.x, v.coords.y, v.coords.z)) <= 3 then
                            v.ticks = v.ticks + 1
                            v.coords = coords
                            if (v.ticks == Config.MaxAfk) then
                                v.ticks = 0
                                v.status = false
                                TriggerClientEvent('piotreq_duty:OffDuty', v.src)
                            end
                        else
                            v.ticks = 0
                        end
                    else
                        v.coords = coords
                    end
                end
            end
        end
        if addTick then
            allTicks = allTicks + 1
        end
        if allTicks == 60 then
            allTicks = 0
            saveData()
        end
    end
end)

RegisterNetEvent('piotreq_duty:SwitchDuty', function(duty)
    local xPlayer = ESX.GetPlayerFromId(source)
    if duty then
        if Config.AntiAfk then
            dutyData[xPlayer.identifier] = {
                src = source,
                identifier = xPlayer.identifier,
                time = getUserTime(xPlayer.identifier) or 0,
                job = xPlayer.job.name,
                ticks = 0,
                coords = xPlayer.getCoords(true),
                status = true
            }
        else
            dutyData[xPlayer.identifier] = {
                src = source,
                identifier = xPlayer.identifier,
                time = getUserTime(xPlayer.identifier) or 0,
                job = xPlayer.job.name,
                status = true
            }
        end
    else
        dutyData[xPlayer.identifier].status = false
    end
end)

RegisterNetEvent('esx:playerDropped', function(playerId, reason)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if dutyData[xPlayer.identifier] then
        dutyData[xPlayer.identifier].src = nil
        dutyData[xPlayer.identifier].ticks = 0
        dutyData[xPlayer.identifier].coords = nil
        dutyData[xPlayer.identifier].status = false
    end
end)

function getUserTime(identifier)
    return dutyData[identifier] and dutyData[identifier].time or nil
end

exports('getUserTime', getUserTime)

function formatTime(time)
    if (time < 1) then
        return "00:00:00"
    end
    
    local hours = string.format("%02.f", math.floor(time / 3600))
    local mins = string.format("%02.f", math.floor(time / 60 - (hours * 60)))
    local secs = string.format("%02.f", math.floor(time - hours * 3600 - mins * 60))
    return hours..":"..mins..":"..secs
end

exports('formatTime', formatTime)

function clearUserTime(identifier)
    dutyData[identifier].time = 0
    saveData()
end

exports('cleanUserTime', cleanUserTime)

function clearAllUserTime(job)
    for k, v in pairs(dutyData) do
        if v.job and v.job == job then
            v.time = 0
        end
    end
    saveData()
end

exports('clearAllUserTime', clearAllUserTime)

function timeToHours(time)
    return math.floor(time / 3600)
end

exports('timeToHours', timeToHours)