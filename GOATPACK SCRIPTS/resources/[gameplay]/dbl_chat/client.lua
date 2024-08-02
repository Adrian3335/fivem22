RegisterNetEvent("dbl_chat:sendMessage", function(src, message, playerName)
    local player = GetPlayerFromServerId(src)
    if player == -1 then
        return
    end

    local pPed = GetPlayerPed(player)
    local mPed = ESX.PlayerData.ped
    local distance = #(GetEntityCoords(pPed) - GetEntityCoords(mPed))
    if player == PlayerId() or distance < 15.0 then
        TriggerEvent("chat:addMessage", {
            templateId = "message",
            multiline = true,
            args = {"125, 125, 125", "fa-solid fa-comment-alt-dots", "[" .. src .. "] " .. playerName, message},
        })
    end
end)

RegisterNetEvent("dbl_chat:sendMessage2", function(src, name, message, icon, color)
    local player = GetPlayerFromServerId(src)
    if player == -1 then
        return
    end

    local pPed = GetPlayerPed(player)
    local mPed = ESX.PlayerData.ped
    local distance = #(GetEntityCoords(pPed) - GetEntityCoords(mPed))
    if player == PlayerId() or (distance < 15.0 and HasEntityClearLosToEntity(mPed, pPed, 3)) then
        TriggerEvent("chat:addMessage", {
            templateId = "message",
            multiline = true,
            args = {color, icon, "[" .. src .. "] " .. name, message},
        })
    end
end)

RegisterCommand("cls", function(source, args)
    TriggerEvent('chat:clear')
end)

RegisterCommand("clear", function(source, args)
    TriggerEvent('chat:clear')
end)

AddEventHandler("rockstar:rozpocznijnagrywanie", function()
    StartRecording(1)
end, false)

RegisterCommand("clip", function()
    StartRecording(0)
end, false)

AddEventHandler("rockstar:zapisznagranie", function()
    StopRecordingAndSaveClip()
end, false)

AddEventHandler("rockstar:deleteclip", function()
    StopRecordingAndDiscardClip()
end, false)

AddEventHandler("rockstar:editor", function()
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
end, false)

CreateThread(function()
    while true do
        local descriptions = GlobalState.descriptions
        local players = GetActivePlayers()
        local myped = PlayerPedId()
        cache = {}
        for i = 1, #(players) do
            local pid = GetPlayerServerId(players[i])
            local ped = GetPlayerPed(players[i])
            local desc = descriptions[pid]
            if desc and #(GetEntityCoords(myped) - GetEntityCoords(ped)) < 20.0 and HasEntityClearLosToEntity(myped, ped, 3) then
                cache[#cache + 1] = {ped = ped, text = desc}
            end
        end
        Wait(250)
    end
end)

CreateThread(function()
    while true do
        for i = 1, #(cache) do
            local coords = GetEntityCoords(cache[i].ped)
            DrawText3D(coords[1], coords[2], coords[3], cache[i].text, 255, 255, 255)
        end
        Wait(0)
    end
end)

CreateThread(function()
    while true do
        local narrative = GlobalState.narrative
        local players = GetActivePlayers()
        local myped = PlayerPedId()
        cache2 = {}
        for i = 1, #(players) do
            local pid = GetPlayerServerId(players[i])
            if narrative[pid] then
                if tostring(json.encode(narrative[pid])):sub(1, 1) == "{" then
                    local ped = GetPlayerPed(players[i])
                    if #(GetEntityCoords(myped) - GetEntityCoords(ped)) < 20.0 and HasEntityClearLosToEntity(myped, ped, 3) then
                        cache2[#cache2 + 1] = {ped = ped, table = narrative[pid]}
                    end
                end
            end
        end
        Wait(250)
    end
end)

local function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
    end
    return iter
end

CreateThread(function()
    while true do
        for i = 1, #(cache2) do
            local coords = GetEntityCoords(cache2[i].ped)
            local table = cache2[i].table
            local j = 0
            for k, v in pairsByKeys(table) do
                local height = 1.0 + (j / 10)
                local color = v.color
                DrawText3D(coords[1], coords[2], coords[3] + height, v.message, color[1], color[2], color[3])
                j = j + 1
            end
        end
        Wait(0)
    end
end)

function DrawText3D(x,y,z, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px,py,pz)-vector3(x,y,z))
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        if not useCustomScale then
            SetTextScale(0.0*scale, 0.4*scale)
        else 
            SetTextScale(0.0*scale, customScale)
        end
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		DrawText(_x,_y)
    end
end
