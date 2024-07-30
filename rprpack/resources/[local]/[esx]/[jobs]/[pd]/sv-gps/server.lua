ESX = exports['es_extended']:getSharedObject()

local dutyTable = {}

Citizen.CreateThread(function()
    while true do
        local sendTable = {}
        for k, v in pairs(dutyTable) do
            local coords = GetEntityCoords(GetPlayerPed(k))
            local tempVar = v
            tempVar.playerId = k
            tempVar.coords = coords

            table.insert(sendTable, tempVar)
        end
        for player in pairs(dutyTable) do
            TriggerClientEvent('sv-gps:receiveData', player, player, sendTable)
        end
        Citizen.Wait(1000)
    end
end)

RegisterNetEvent('sv-gps:setDuty')
AddEventHandler('sv-gps:setDuty', function(onDuty)
    local src = source

    if onDuty then
        local xPlayer = ESX.GetPlayerFromId(src)
        local playerJob = xPlayer.getJob()

        if Config.emergencyJobs[playerJob.name] then
            local cfg = Config.emergencyJobs[playerJob.name]

            dutyTable[src] = {
                job = playerJob.name,
                name = Config.useCharacterName and GetCharacterName(src) or GetPlayerName(src),
                prefix = cfg.gradePrefix ~= nil and cfg.gradePrefix[playerJob.grade] ~= nil and cfg.gradePrefix[playerJob.grade] ~= nil and Config.namePrefix[playerJob.grade_name] or '',
            }
            
        end
    else
        if dutyTable[src] then
            dutyTable[src] = nil
            for k, v in pairs(dutyTable) do
                TriggerClientEvent('sv-gps:removeUser', k, src)
            end
        else
        end
    end
end)

RegisterNetEvent('sv-gps:enteredVeh')
AddEventHandler('sv-gps:enteredVeh', function(vehCfg)
    local src = source
    local playerJob = ESX.GetPlayerFromId(src).getJob()
    dutyTable[src].inVeh = true
    dutyTable[src].vehSprite = vehCfg and vehCfg.sprite or Config.emergencyJobs[playerJob.name].vehBlip['default'].sprite or Config.emergencyJobs[playerJob.name].blip.sprite
    dutyTable[src].vehColor = vehCfg and vehCfg.color or Config.emergencyJobs[playerJob.name].vehBlip['default'].color or Config.emergencyJobs[playerJob.name].blip.color
end)

RegisterNetEvent('sv-gps:leftVeh')
AddEventHandler('sv-gps:leftVeh', function()
    local src = source
    dutyTable[src].inVeh = nil
    dutyTable[src].vehSprite = nil
    dutyTable[src].vehColor = nil
end)

RegisterNetEvent('sv-gps:toggleSiren')
AddEventHandler('sv-gps:toggleSiren', function(isOn)
    local src = source
    local playerJob = ESX.GetPlayerFromId(src).getJob()
    if isOn then
        dutyTable[src].siren = true
        dutyTable[src].flashColors = Config.emergencyJobs[playerJob.name].blip.flashColors or {Config.emergencyJobs[playerJob.name].blip.color}
    else
        dutyTable[src].siren = false
        dutyTable[src].flashColors = nil
    end
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    if dutyTable[src] then
        dutyTable[src] = nil
        for k, v in pairs(dutyTable) do
            TriggerClientEvent('sv-gps:removeUser', k, src)
        end
    end
end)

if Config.useCharacterName then
    function GetCharacterName(source)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

        local data = MySQL.Sync.fetchAll('SELECT firstname, lastname, badge FROM users WHERE identifier = @identifier', {
            ['@identifier']    = xPlayer.identifier
        })    
        
        if data[1] ~= nil then
            return ('%s %s %s'):format('('..data[1].badge..')', data[1].firstname, data[1].lastname)
        else
            return GetPlayerName(_source)
        end
    end
end