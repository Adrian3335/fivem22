local timer = false
local scoreboard = false
local ShowPlayers = {}

local DrawHeadText = function(x, y, z, text, r, g, b)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * 0.6

    if onScreen then
        SetTextScale(0.0 * scale, 1.05 * scale)
        SetTextProportional(1)
        SetTextColour(r, g, b, 150)
        SetTextDropshadow(3, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        World3dToScreen2d(x, y, z, 0)
        DrawText(_x, _y)
    end
end

RegisterNetEvent("goat_scoreboard:show", function(playerId, boolean)
    ShowPlayers[playerId] = boolean
end)

CreateThread(function()
    while true do
        local sleep = true
        local players = 0
        for _, _2 in pairs(ShowPlayers) do
            players = players + 1
        end
        if players > 0 then
            local myId = GetPlayerServerId(PlayerId())
            for _, player in ipairs(GetActivePlayers()) do
                local playerId = GetPlayerServerId(player)
                if myId ~= playerId and ShowPlayers[playerId] then
                    local playerCoords = GetEntityCoords(GetPlayerPed(player))
                    if #(playerCoords - GetEntityCoords(ESX.PlayerData.ped)) < 15.0 then
                        sleep = false
                        DrawHeadText(playerCoords.x, playerCoords.y, playerCoords.z + (scoreboard and 1.22 or 1.0), "📄", 255, 0, 0)
                    end
                end
            end
        end

        if sleep then
            Wait(200)
        end
        Wait(0)
    end
end)

-- RegisterNetEvent('esx:setOrganisation', function(org)
--     ESX.PlayerData.organisation = org
-- end)

RegisterCommand("+showscoreboard", function()
    if timer then
        return
    end

    scoreboard = true

    SendNUIMessage({
        action = 'toggle',
        state = true
    })

    TriggerServerEvent("goat_scoreboard:show")

    ESX.TriggerServerCallback("goat_scoreboard:get", function(players, ThreatCode)
    
            SendNUIMessage({
                action = "updateJob", 
                praca = ESX.PlayerData.job.label .. " - " .. ESX.PlayerData.job.grade_label,
            })

        SendNUIMessage({
            action = "updatePlayerJobs", 
            jobs = players
        })

        SendNUIMessage({
            action = "updateCode", 
            code = ThreatCode
        })
    end)

    while scoreboard do
        for _, player in ipairs(GetActivePlayers()) do
            local playerId = GetPlayerServerId(player)
            local playerPed = GetPlayerPed(player)
            local playerCoords = GetOffsetFromEntityInWorldCoords(playerPed)
            if IsEntityVisible(playerPed) and #(playerCoords - GetEntityCoords(ESX.PlayerData.ped)) < 15.0 then
                sleep = false
                local text = playerId
                local r, g, b = 255, 255, 255
                local vehicle = GetVehiclePedIsIn(playerPed, false)
                if DoesEntityExist(vehicle) then
                    if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                        r, g, b = 255, 0, 0
                    end
                end
                if NetworkIsPlayerTalking(player) then
                    r, g, b = 0, 150, 255
                end
                if Player(playerId).state.streamer then
                    text = text .. " ~p~[STREAMER]"
                end

                DrawHeadText(playerCoords.x, playerCoords.y, playerCoords.z + 1.0, text, r, g, b)
            end
        end
        Wait(0)
    end
    
    SendNUIMessage({
        action = 'toggle',
        state = false
    })

    TriggerServerEvent("goat_scoreboard:hide")
    timer = true
    Wait(1000)
    timer = false
end)

RegisterCommand("-showscoreboard", function()
    scoreboard = false
end)
RegisterKeyMapping("+showscoreboard", "Lista graczy", "keyboard", "z")

local exitPlayers = {}
local cache = {}
CreateThread(function()
    while true do
        cache = {}
        if scoreboard then
            local coords = GetEntityCoords(ESX.PlayerData.ped)
            for i = 1, #(exitPlayers) do
                local player = exitPlayers[i]
                if #(coords - player[2]) < 15.0 then
                    cache[#cache + 1] = {player[1], player[2], player[3], player[4]}
                end
            end
        end
        Wait(250)
    end
end)

CreateThread(function()
    while true do
        for i = 1, #(cache) do
            local player = cache[i]
            local coords = player[2]
            DrawText3D(coords[1], coords[2], coords[3] + 0.1, "Gracz opuścił grę")
            DrawText3DSecond(coords[1], coords[2], coords[3], "[" .. player[1] .. "] " .. player[3])
            DrawText3DSecond(coords[1], coords[2], coords[3] - 0.1, player[4])
        end
        Wait(0)
    end
end)

RegisterNetEvent("goat_scoreboard:exit", function(source, coords, name, reason)
    table.insert(exitPlayers, {source, coords, name, reason})
    local id = #exitPlayers
    Wait(30000)
    table.remove(exitPlayers, id)
end)

function DrawText3DSecond(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 0, 0, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end