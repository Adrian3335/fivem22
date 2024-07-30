local ESX = exports['es_extended']:getSharedObject()
local PlayerData = {}
local onDuty = false
local inVeh = false
local lastSirenState = false

local longBlips = {}
local nearBlips = {}
local myBlip = {}

Citizen.CreateThread(function()
    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end

	PlayerData = ESX.GetPlayerData()
    
    if Config.blipGroup.renameGroup then
        AddTextEntryByHash(`BLIP_OTHPLYR`, Config.blipGroup.groupName..'~w~')
    end
    checkJob()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
    if onDuty then
        goOffDuty()
    end
    checkJob()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    if Config.bigmapTags then
        DisplayPlayerNameTagsOnBlips(false)
    end
    removeAllBlips()
end)

Citizen.CreateThread(function()
    while true do
        if onDuty then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if veh ~= 0 and not inVeh then
                inVeh = true
                inVehChecks(veh)

                local cfg = Config.emergencyJobs[PlayerData.job.name].vehBlip and Config.emergencyJobs[PlayerData.job.name].vehBlip[GetEntityModel(veh)] or nil
                TriggerServerEvent('sv-gps:enteredVeh', cfg)
            elseif veh == 0 and inVeh then
                inVeh = false
                if lastSirenState then
                    lastSirenState = false
                    TriggerServerEvent('sv-gps:toggleSiren', false)
                end
                if onDuty then
                    TriggerServerEvent('sv-gps:leftVeh')
                end
            end
            Citizen.Wait(750)
        else
            Citizen.Wait(1000)
        end
    end
end)

-- Sprawdzanie czy gracz jest w furze

function inVehChecks(veh, seat, vehiclelabel)
    Citizen.CreateThread(function()
        while inVeh do
            if IsVehicleSirenOn(veh) and not lastSirenState then
                lastSirenState = true
                TriggerServerEvent('sv-gps:toggleSiren', true)
            elseif not IsVehicleSirenOn(veh) and lastSirenState then
                lastSirenState = false
                TriggerServerEvent('sv-gps:toggleSiren', false)
            end
            Citizen.Wait(200)
        end
    end)
end

--Sprawdzanie czy gracz ma joba z configu

function checkJob()
    if PlayerData and PlayerData.job and Config.emergencyJobs[PlayerData.job.name] and Config.emergencyJobs[PlayerData.job.name].ignoreDuty then
        goOnDuty()
    else
        ESX.ShowNotification('Nie pracujesz w odpowiedniej frakcji')
    end
end

-- Odpalanie GPS'a

function goOnDuty()
    if PlayerData and PlayerData.job and Config.emergencyJobs[PlayerData.job.name] then
    onDuty = true
    TriggerServerEvent('sv-gps:setDuty', true)

    ESX.ShowNotification(Config.notifications.onDutyText)

    if Config.bigmapTags then
        SetBigmapActive(true, false)
        DisplayPlayerNameTagsOnBlips(true)
    end
    if inVeh then
        TriggerServerEvent('sv-gps:enteredVeh', Config.emergencyJobs[PlayerData.job.name].vehBlip[GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false))])
    end
  end
end

AddEventHandler('sv-gps:goOnDuty', goOnDuty)

-- Gdy gracz wyrzuci GPS'a

function LostGPS()
    if PlayerData and PlayerData.job and Config.emergencyJobs[PlayerData.job.name] then
    if onDuty then
    onDuty = false
    TriggerServerEvent('sv-gps:setDuty', false)

    ESX.ShowNotification('Wyłączyłeś GPS!')

    local coords = GetEntityCoords(GetPlayerPed(-1))
    local GPSReport = {
        code = "ALERT",
        street = exports['esx_dispatch']:GetStreetAndZone(),
        id = exports['esx_dispatch']:randomId(),
        priority = 2,
        title = "Utracono połączenie z GPS",
        duration = 5000,
        blipname = "# Utracone Połączenie",
        color = 1,
        sprite = 280,
        fadeOut = 30,
        position = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        job = "police"
    }
    TriggerServerEvent("dispatch:svotify", GPSReport)

    if Config.bigmapTags then
        DisplayPlayerNameTagsOnBlips(false)
    end
    removeAllBlips()
end
end
end

AddEventHandler('sv-gps:LostGPS', LostGPS)

-- Wyłącznie GPS'a

function goOffDuty()
    if PlayerData and PlayerData.job and Config.emergencyJobs[PlayerData.job.name] then
    onDuty = false
    TriggerServerEvent('sv-gps:setDuty', false)

    ESX.ShowNotification('Wyłączyłeś GPS!')

    if Config.bigmapTags then
        DisplayPlayerNameTagsOnBlips(false)
    end
    removeAllBlips()
end
end

AddEventHandler('sv-gps:goOffDuty', goOffDuty)

-- Włącznie/Wyłacznie GPS'a

AddEventHandler('sv-gps:toggleDuty', function(bool)
    if not onDuty then
        goOnDuty()
    else
        goOffDuty()
    end
end)

-- Clearowanie blipów

function removeAllBlips()
    restoreBlip(myBlip.blip or GetMainPlayerBlipId())
    for k, v in pairs(nearBlips) do
        RemoveBlip(v.blip)
    end
    for k, v in pairs(longBlips) do
        RemoveBlip(v.blip)
    end
    nearBlips = {}
    longBlips = {}
    myBlip = {}
end

-- Usuwanie blipa z gracza

RegisterNetEvent('sv-gps:removeUser')
AddEventHandler('sv-gps:removeUser', function(plyId)
    if nearBlips[plyId] then
        RemoveBlip(nearBlips[plyId].blip)
        nearBlips[plyId] = nil
    end
    if longBlips[plyId] then
        RemoveBlip(longBlips[plyId].blip)
        longBlips[plyId] = nil
    end
end)

-- Zbieranie info o graczach

RegisterNetEvent('sv-gps:receiveData')
AddEventHandler('sv-gps:receiveData', function(myId, data) -- ugly ass event
    for k, v in pairs(data) do
        local cId = GetPlayerFromServerId(v.playerId)
        --local canSee = v.canSee and includes(v.canSee, PlayerData.job.name)
        --local canSee = v.canSee and v.canSee[PlayerData.job.name]
        local canSee = Config.emergencyJobs[v.job].canSee and Config.emergencyJobs[v.job].canSee[PlayerData.job.name]

        if canSee then
            if myId ~= v.playerId then
                if cId ~= -1 then
                    if nearBlips[v.playerId] == nil then  -- switch/init blip from long to close proximity
                        if longBlips[v.playerId] then
                            RemoveBlip(longBlips[v.playerId].blip)
                            longBlips[v.playerId] = nil
                        end
                        nearBlips[v.playerId] = {}
                        nearBlips[v.playerId].blip = AddBlipForEntity(GetPlayerPed(cId))
                        setupBlip(nearBlips[v.playerId].blip, v)
                    end

                    if v.inVeh and not nearBlips[v.playerId].inVeh then -- entered veh blip setup
                        nearBlips[v.playerId].inVeh = true
                        vehBlipSetup(nearBlips[v.playerId].blip, v)
                    elseif not v.inVeh and nearBlips[v.playerId].inVeh then -- left veh blip
                        nearBlips[v.playerId].inVeh = false
                        vehBlipSetup(nearBlips[v.playerId].blip, v)
                    end

                    if v.siren and not nearBlips[v.playerId].siren then  -- turn on siren flash
                        nearBlips[v.playerId].siren = true
                        nearBlips[v.playerId].sirenState = 1
                    elseif not v.siren and nearBlips[v.playerId].siren then  -- turn on siren flash
                        nearBlips[v.playerId].siren = false
                        if v.inVeh then
                            vehBlipSetup(nearBlips[v.playerId].blip, v)
                        else
                            setupBlip(nearBlips[v.playerId].blip, v)
                        end
                    elseif nearBlips[v.playerId].siren then  -- blip color flash
                        nearBlips[v.playerId].sirenState = v.flashColors[nearBlips[v.playerId].sirenState + 1] and nearBlips[v.playerId].sirenState + 1 or 1
                        updateBlipFlash(nearBlips[v.playerId].blip, v.flashColors[nearBlips[v.playerId].sirenState])
                    end
                else
                    if longBlips[v.playerId] == nil then -- switch/init blip from close to long proximity
                        if nearBlips[v.playerId] then
                            RemoveBlip(nearBlips[v.playerId].blip)
                            nearBlips[v.playerId] = nil
                        end
                        longBlips[v.playerId] = {}
                        longBlips[v.playerId].blip = AddBlipForCoord(v.coords)
                        setupBlip(longBlips[v.playerId].blip, v)
                        if v.inVeh then
                            vehBlipSetup(longBlips[v.playerId].blip, v)
                        end
                    else
                        if longBlips[v.playerId] then
                            RemoveBlip(longBlips[v.playerId].blip)
                        end
                        longBlips[v.playerId].blip = AddBlipForCoord(v.coords)
                        setupBlip(longBlips[v.playerId].blip, v)
                        if v.inVeh then
                            vehBlipSetup(longBlips[v.playerId].blip, v)
                        end
                    end

                    if v.inVeh and not longBlips[v.playerId].inVeh then -- entered veh blip setup
                        longBlips[v.playerId].inVeh = true
                        vehBlipSetup(longBlips[v.playerId].blip, v)
                    elseif not v.inVeh and longBlips[v.playerId].inVeh then -- left veh blip
                        longBlips[v.playerId].inVeh = false
                        vehBlipSetup(longBlips[v.playerId].blip, v)
                    end

                    if v.siren and not longBlips[v.playerId].siren then -- turn on siren flash
                        longBlips[v.playerId].siren = true
                        longBlips[v.playerId].sirenState = 1
                    elseif not v.siren and longBlips[v.playerId].siren then  -- turn on siren flash
                        longBlips[v.playerId].siren = false
                        if v.inVeh then
                            vehBlipSetup(longBlips[v.playerId].blip, v)
                        else
                            setupBlip(longBlips[v.playerId].blip, v)
                        end
                    elseif longBlips[v.playerId].siren then -- blip color flash
                        longBlips[v.playerId].sirenState = v.flashColors[longBlips[v.playerId].sirenState + 1] and longBlips[v.playerId].sirenState + 1 or 1
                        updateBlipFlash(longBlips[v.playerId].blip, v.flashColors[longBlips[v.playerId].sirenState])
                    end
                end
            elseif Config.selfBlip then
                if myBlip.blip == nil then -- my blip setup
                    myBlip.blip = GetMainPlayerBlipId()

                    while myBlip.blip == nil do
                        Citizen.Wait(100)
                    end
                    setupBlip(myBlip.blip, v)
                end

                if v.inVeh and not myBlip.inVeh then -- casual veh stuff, like above
                    myBlip.inVeh = true
                    vehBlipSetup(myBlip.blip, v)
                elseif not v.inVeh and myBlip.inVeh then
                    myBlip.inVeh = false
                    vehBlipSetup(myBlip.blip, v)
                end

                if v.siren and not myBlip.siren then  -- turn on siren flash
                    myBlip.siren = true
                    myBlip.sirenState = 1
                elseif not v.siren and myBlip.siren then -- turn off siren flash
                    myBlip.siren = false
                    if v.inVeh then
                        vehBlipSetup(myBlip.blip, v)
                    else
                        setupBlip(myBlip.blip, v)
                    end
                elseif myBlip.siren then -- blip color flash
                    myBlip.sirenState = v.flashColors[myBlip.sirenState + 1] ~= nil and myBlip.sirenState + 1 or 1
                    updateBlipFlash(myBlip.blip, v.flashColors[myBlip.sirenState])
                end

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(Config.usePrefix and v.prefix..' '..v.name or v.name)
                EndTextCommandSetBlipName(myBlip.blip)
            end
        end
    end
end)

-- Blip gracza gdy nie jest w pojeździe

function setupBlip(blip, data)
	SetBlipSprite(blip, Config.emergencyJobs[data.job].blip.sprite)
	SetBlipDisplay(blip, 2)
	SetBlipScale(blip, Config.emergencyJobs[data.job].blip.scale or 1.0)
	SetBlipColour(blip, Config.emergencyJobs[data.job].blip.color)
    SetBlipFlashes(blip, false)
    --SetBlipShowCone(blip, Config.blipCone)
    SetBlipCategory(blip, 7)
	BeginTextCommandSetBlipName("STRING")
    if Config.font.useCustom then
        AddTextComponentString("<font face='"..Config.font.name.."'>"..data.prefix.." "..data.name.."</font>")
    else
        AddTextComponentString(Config.usePrefix and data.prefix..' '..data.name or data.name)
    end
	EndTextCommandSetBlipName(blip)
end

-- Blip gracza gdy jest w pojeździe

function vehBlipSetup(blip, data)
    if data.inVeh then
        SetBlipSprite(blip, data.vehSprite)
        SetBlipDisplay(blip, 2)
        SetBlipScale(blip, Config.emergencyJobs[data.job].blip.scale or 1.3)
        SetBlipColour(blip, data.vehColor)
        --SetBlipShowCone(blip, Config.blipCone)
        BeginTextCommandSetBlipName("STRING")
        if Config.font.useCustom then
            AddTextComponentString("<font face='"..Config.font.name.."'>"..data.prefix.." "..data.name.."</font>")
        else
            AddTextComponentString(Config.usePrefix and data.prefix..' '..data.name or data.name)
        end
        EndTextCommandSetBlipName(blip)
        SetBlipCategory(blip, 7)
    else
        SetBlipSprite(blip, Config.emergencyJobs[data.job].blip.sprite)
        SetBlipDisplay(blip, 2)
        SetBlipScale(blip, Config.emergencyJobs[data.job].blip.scale or 1.0)
        SetBlipColour(blip, Config.emergencyJobs[data.job].blip.color)
        --SetBlipShowCone(blip, Config.blipCone)
        BeginTextCommandSetBlipName("STRING")
        if Config.font.useCustom then
            AddTextComponentString("<font face='"..Config.font.name.."'>"..data.prefix.." "..data.name.."</font>")
        else
            AddTextComponentString(Config.usePrefix and data.prefix..' '..data.name or data.name)
        end
        EndTextCommandSetBlipName(blip)
        SetBlipCategory(blip, 7)
    end
end

-- Mryganie blipa

function updateBlipFlash(blip, color)
    SetBlipColour(blip, color)
end

-- Przywrócenie blipa

function restoreBlip(blip)
    SetBlipSprite(blip, 6)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7)
    SetBlipColour(blip, 0)
    --SetBlipShowCone(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(GetPlayerName(PlayerId()))
    EndTextCommandSetBlipName(blip)
    SetBlipCategory(blip, 1)
end