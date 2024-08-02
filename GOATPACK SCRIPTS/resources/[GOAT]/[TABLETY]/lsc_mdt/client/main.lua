CLIENT = {
    nuiReady = false,
    open = false,
    notes = {},
    lastNotes = {},
    annoucements = {},
    medics = {},
    statusData = {
        pwc = "",
        cityStatus = Config.CityStatuses[1]
    },
    s4 = {},
    dispatchData = {},
}

local tabletEntity = nil
local tabletModel = "prop_cs_tablet"
local tabletDict = "amb@world_human_seat_wall_tablet@female@base"
local tabletAnim = "base"

local function attachObject()
	if tabletEntity == nil then
		-- Citizen.Wait(380)
		RequestModel(tabletModel)
		while not HasModelLoaded(tabletModel) do
			Citizen.Wait(1)
		end
		tabletEntity = CreateObject(GetHashKey(tabletModel), 1.0, 1.0, 1.0, 1, 1, 0)
		AttachEntityToEntity(tabletEntity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.12, 0.10, -0.13, 25.0, 170.0, 160.0, true, true, false, true, 1, true)
	end
end

local function startAnim()
    local playerPed = PlayerPedId()
    RequestAnimDict(tabletDict)
    while not HasAnimDictLoaded(tabletDict) do
        Citizen.Wait(0)
    end
    attachObject()
    TaskPlayAnim(playerPed, tabletDict, tabletAnim, 3.0, -3.0, -1, 50, 0, false, false, false)
    while CLIENT.open do
        Citizen.Wait(1)
        if not IsEntityPlayingAnim(playerPed, tabletDict, tabletAnim, 3) then
            TaskPlayAnim(playerPed, tabletDict, tabletAnim, 8.0, -8.0, -1, 50, 0, false, false, false)
        end
    end
    ClearPedTasks(PlayerPedId())
    if tabletEntity then
        DeleteEntity(tabletEntity)
        tabletEntity = nil
    end
end

RegisterNUICallback('uiLoaded', function(data, cb)
    SendNUIMessage({
        action = 'init',
        data = {
            locale = TRANSLATIONS[Config.Language],
            tariff = Config.Tariff,
            vehicles = Config.Vehicles,
            units = Config.Units
        }
    })
    CLIENT.nuiReady = true
    cb(true)
end)

CLIENT.SetPlayerData = function()
    while not CLIENT.nuiReady do
        Citizen.Wait(50)
    end
    local data = FRAMEWORK.GetMdtPlayerData()
    SendNUIMessage({
        action = 'setPlayerData',
        data = data[1]
    })
    CLIENT.notes = data[2]
    SendNUIMessage({
        action = 'setNotes',
        data = CLIENT.notes
    })
    CLIENT.annoucements = data[3]
    SendNUIMessage({
        action = 'setAnnoucements',
        data = CLIENT.annoucements
    })
end

local function closeMDT()
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'setVisible',
        data = false
    })
    CLIENT.open = false
    -- STOP ANIM
end


RegisterNUICallback('closeUI', function(data, cb)
    Citizen.CreateThread(function()
        closeMDT()
    end)
    cb('ok')
end)

RegisterCommand(Config.ToggleMDT.commandName, function()
    if not PlayerData.job then
        return
    end
    if not CLIENT.nuiReady then
        return
    end
    if Config.Jobs[PlayerData.job.name] then
        if EDITABLE.CanOpenMDT() then
            CLIENT.SetPlayerData()
            CLIENT.open = true
            CreateThread(startAnim)
            SendNUIMessage({
                action = 'setVisible',
                data = true
            })
            SetNuiFocus(true, true)
            -- PLAY ANIM
        end
    end
end)

RegisterKeyMapping(Config.ToggleMDT.commandName, Config.ToggleMDT.keymappingLabel, 'keyboard', Config.ToggleMDT.key)

RegisterNetEvent('qf_mdt:updateLastNotes2', function(notes)
    CLIENT.lastNotes = notes
    SendNUIMessage({
        action = 'setLastNotes2',
        data = CLIENT.lastNotes
    })
end)

RegisterNUICallback('addNote', function(data, cb)
    table.insert(CLIENT.notes, {title = data.title, content = data.content})
    TriggerServerEvent('qf_mdt:addNote', data.title, data.content)
    cb('ok')
end)

RegisterNUICallback('deleteNote', function(data, cb)
    TriggerServerEvent('qf_mdt:deleteNote', data.annid)
    cb('ok')
end)

RegisterNUICallback('addAnnoucement', function(data, cb)
    TriggerServerEvent('qf_mdt:addAnnoucement', data.title, data.content)
    cb('ok')
end)

RegisterNUICallback('search', function(data, cb)
    if data.type == 'citizen' then
        if data.value then
            ESX.TriggerServerCallback('qf_mdt:searchCitizen', function(info)
                Citizen.CreateThread(function()
                    SendNUIMessage({
                        action = 'searchResults',
                        data = info
                    })
                end)
            end, data.value)
        else
            local player, distance = ESX.Game.GetClosestPlayer(GetEntityCoords(PlayerPedId()))
            if player and player ~= -1 and distance < 5.0 then
                ESX.TriggerServerCallback('qf_mdt:getCitizenIdentifier', function(info)
                    Citizen.CreateThread(function()
                        SendNUIMessage({
                            action = 'searchResults',
                            data = info
                        })
                    end)
                end, GetPlayerServerId(player))
            else
                ESX.ShowNotification("Brak osoby w pobliżu")
            end
        end
    elseif data.type == 'vehicle' then
        if data.value then
            ESX.TriggerServerCallback('qf_mdt:searchVehicle', function(info)
                Citizen.CreateThread(function()
                    SendNUIMessage({
                        action = 'searchResults',
                        data = info
                    })
                end)
            end, data.value)
        else
            local veh = ESX.Game.GetVehicleInDirection()
            if veh and veh ~= 0 and DoesEntityExist(veh) and #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(veh)) < 5.0 then
                local plate = GetVehicleNumberPlateText(veh)
                ESX.TriggerServerCallback('qf_mdt:searchVehicle', function(info)
                    Citizen.CreateThread(function()
                        SendNUIMessage({
                            action = 'searchResults',
                            data = info
                        })
                    end)
                end, plate)
            else
                ESX.ShowNotification('Brak pojazdów w pobliżu')
            end
        end
    end
    cb('ok')
end)

RegisterNUICallback('setData', function(data, cb)
    ESX.TriggerServerCallback('qf_mdt:getData', function(callback)
        cb(callback)
    end, data)
end)

RegisterNUICallback('addVehicleNote', function(data, cb)
    TriggerServerEvent('qf_mdt:addVehicleNote', data)
    cb('ok')
end)

RegisterNUICallback('deleteVehicleNote', function(data, cb)
    TriggerServerEvent('qf_mdt:deleteVehicleNote', data)
    cb('ok')
end)

RegisterNUICallback('addCitizenNote', function(data, cb)
    TriggerServerEvent('qf_mdt:addCitizenNote', data)
    cb('ok')
end)

RegisterNUICallback('deleteCitizenNote', function(data, cb)
    TriggerServerEvent('qf_mdt:deleteCitizenNote', data)
    cb('ok')
end)

CLIENT.Load = function()
    ESX.TriggerServerCallback('qf_mdt:getDispatchData', function(cb)
        CLIENT.statusData = cb.statusData
        CLIENT.s4 = cb.s4
        CLIENT.dispatchData = cb.dispatchData
        SendNUIMessage({
            action = 'setStatusData',
            data = CLIENT.statusData
        })
        SendNUIMessage({
            action = 'setS4',
            data = CLIENT.s4
        })
        SendNUIMessage({
            action = 'setDispatch',
            data = CLIENT.dispatchData
        })
    end)
end

RegisterNUICallback('setPWC', function(data, cb)
    TriggerServerEvent('qf_mdt:setPWC', data.pwc)
    cb('ok')
end)

RegisterNetEvent('qf_mdt:updatePWC', function(pwc)
    CLIENT.statusData.pwc = pwc
    SendNUIMessage({
        action = 'setStatusData',
        data = CLIENT.statusData
    })
end)

RegisterNetEvent('qf_mdt:cityStatus', function(cityStatus)
    CLIENT.statusData.cityStatus = cityStatus
    SendNUIMessage({
        action = 'setStatusData',
        data = CLIENT.statusData
    })
end)

RegisterNUICallback('setStatus', function(data, cb)
    TriggerServerEvent('qf_mdt:setStatus', data.status)
    cb('ok')
end)

RegisterNetEvent('qf_mdt:updateS4', function(data)
    CLIENT.s4 = data
    SendNUIMessage({
        action = 'setS4',
        data = CLIENT.s4
    })
end)

RegisterNUICallback('submitFine', function(data, cb)
    TriggerServerEvent('qf_mdt:submitFineLSC', data)
    cb('ok')
end)

RegisterNUICallback('clearDispatch', function(data, cb)
    TriggerServerEvent('qf_mdt:clearDispatch')
    cb('ok')
end)

RegisterNetEvent('qf_mdt:updateDispatch', function(data)
    CLIENT.dispatchData = data
    SendNUIMessage({
        action = 'setDispatch',
        data = CLIENT.dispatchData
    })
    local id = GetPlayerServerId(PlayerId())
    local currentPatrol = nil
    for i=1, #CLIENT.dispatchData, 1 do
        for p=1, #CLIENT.dispatchData[i].medics, 1 do
            if CLIENT.dispatchData[i].medics[p].id == id then
                currentPatrol = i - 1
                break
            end
        end
    end
    SendNUIMessage({
        action = 'setCurrentPatrol',
        data = currentPatrol
    })
end)

RegisterNUICallback('leavePatrol', function(data, cb)
    TriggerServerEvent('qf_mdt:quitPatrol', data.index)
    cb('ok')
end)

RegisterNUICallback('changePatrolStatus', function(data, cb)
    TriggerServerEvent('qf_mdt:changePatrolStatus', data.index, data.status)
    cb('ok')
end)

RegisterNUICallback('joinPatrol', function(data, cb)
    TriggerServerEvent('qf_mdt:joinPatrol', data.index)
    cb('ok')
end)

RegisterNUICallback('createPatrol', function(data, cb)
    TriggerServerEvent('qf_mdt:createPatrol', data.unit, data.vehicle)
    cb('ok')
end)

RegisterNUICallback('editPatrol', function(data, cb)
    TriggerServerEvent('qf_mdt:editPatrol', data.index, data.unit, data.vehicle)
    cb('ok')
end)

RegisterNetEvent('qf_mdt:getVehicleModel', function(mid)
    local x = GetDisplayNameFromVehicleModel(mid)
    TriggerServerEvent('qf_mdt:backVehicleModel', x)
end)

RegisterNUICallback('removeAnn', function(data, cb)
    TriggerServerEvent('qf_mdt:removeAnn', data.ret)
    cb('ok')
end)

RegisterNetEvent('qf_mdt:updatePersonalNotes', function(notes)
    CLIENT.notes = notes
    SendNUIMessage({
        action = 'setNotes',
        data = CLIENT.notes
    })
end)


RegisterNetEvent('qf_mdt:updateAnnoucements', function(annons)
    CLIENT.annoucements = annons
    
    SendNUIMessage({
        action = 'setAnnoucements',
        data = CLIENT.annoucements
    })
end)


RegisterNetEvent('qf_mdt:updateMedicList', function(funcs)
    CLIENT.medics = {}
    for k, v in pairs(funcs) do
        table.insert(CLIENT.medics, v)
    end
    SendNUIMessage({
        action = 'setMedicList',
        data = CLIENT.medics
    })
end)