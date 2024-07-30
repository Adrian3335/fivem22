local dogModels = {
    "a_c_shepherd", "a_c_rottweiler", "a_c_husky", "a_c_chop", "a_c_retriever"
}

local isDead = false
local prop = nil
local prop2 = nil
local prop3 = {}
local binds = {}
local bindingkey = false
local ragdoll = false
local mp_pointing = false
local PlayerJob = nil
local loop = {
    status = nil,
    current = nil,
    finish = nil,
    delay = 0,
    dettach = false,
    last = 0
}
Citizen.CreateThread(function()
    local GetBinds = json.decode(GetResourceKvpString("AnimBinds"))
    if GetBinds then
        binds = GetBinds
    else
        SetResourceKvp("AnimBinds", {})
    end
    
    PlayerJob = ESX.GetPlayerData().job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerJob = xPlayer.job
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerJob = job
end)

AddEventHandler("esx:onPlayerDeath", function()
    isDead = true
end)
AddEventHandler("esx:onPlayerSpawn", function()
    isDead = false
end)

RegisterNetEvent('sv-radialmenu:AnimMenu')
AddEventHandler('sv-radialmenu:AnimMenu', function()
    AnimMenu()
end)


-- RegisterCommand('animedit', function()
--     EditPosition()
--   end, false)
  
--   local editingPos = false
--   local lastCoords = nil
--   function EditPosition()
--     local ped = PlayerPedId()
--     lastCoords = GetEntityCoords(ped)
--     local heading = GetEntityHeading(ped)
--     local coords = GetEntityCoords(ped)
--     local newPos = GetEntityCoords(ped)
--     local yoff = 0.0
--               local zoff = 0.0
--         if editingPos then
--           ESX.ShowNotification('Już jesteś podczas edycji animacji!')

--           return
--         end
--         local accepted = false
--         editingPos = true
        
--         FreezeEntityPosition(ped, true)
--   while editingPos do
--     Wait(5)
--     ESX.ShowHelpNotification('~INPUT_MOVE_UP_ONLY~ ~INPUT_MOVE_DOWN_ONLY~ \n~INPUT_COVER~ ~INPUT_MULTIPLAYER_INFO~\n~INPUT_MOVE_LEFT_ONLY~ ~INPUT_MOVE_RIGHT_ONLY~\nABY MANIPULOWAĆ\n\n~INPUT_CELLPHONE_SELECT~ ABY ZATWIERDZIĆ POZYCJE')
--     if IsDisabledControlPressed(0, 32) then
--       yoff = 0.05;
--     end
--               SetEntityInvincible(ped, true)
--     if IsDisabledControlPressed(0, 33) then
--       yoff = -0.05;
--     end
  
--     if IsDisabledControlPressed(0, 44) then
--       zoff = 0.02;
--     end
  
--     if IsDisabledControlPressed(0, 20) then
--       zoff = -0.02;
--     end
  
--     if IsDisabledControlPressed(0, 176) then
--         print('enter')
--       accepted = true
--       editingPos = false
--     end
  
--     if IsDisabledControlPressed(0, 34) then
--       SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) + 2.0)
--     end
  
--     if IsDisabledControlPressed(0, 35) then
--       SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) - 2.0)
--     end
    
--     newPos = GetOffsetFromEntityInWorldCoords(ped, 0.0, yoff, zoff)
--     if (yoff ~= 0.0 or zoff ~= 0.0) then
--     SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, 1, 0, 1)
--     end
--     yoff = 0.0
--     zoff = 0.0
--   end
  
--   if accepted then
--     local crds = GetEntityCoords(PlayerPedId())
--     --SetEntityCoordsNoOffset(ped, newPos.x, newPos.y, newPos.z, 0, 0, 0)
--     SetEntityCoords(ped, crds.x, crds.y, crds.z - 0.97, 0)
--     FreezeEntityPosition(ped, true)
  
--     while accepted do
--       Wait(5)
--       ESX.ShowHelpNotification('~INPUT_PICKUP~ ABY ANULOWAĆ EDYCJE ANIMACJI')
--       local ped = PlayerPedId()
--       if IsDisabledControlPressed(0, 38) then
--         accepted = false
--       end
       
--     end
--     local ped = PlayerPedId()
--     FreezeEntityPosition(ped, false)
--     SetPlayerInvincible(ped, false)
--     local health = GetEntityHealth(ped)
--     SetEntityCoords(ped, lastCoords, 0, 0, 0, false)
--       NetworkResurrectLocalPlayer(lastCoords.x, lastCoords.y, lastCoords.z, GetEntityHeading(PlayerPedId()), true, false)
--       SetPlayerInvincible(ped, false)
--     Wait(500)
--     SetEntityHealth(PlayerPedId(), health)
--   else
--     local ped = PlayerPedId()
--     FreezeEntityPosition(ped, false)
--     SetPlayerInvincible(ped, false)
--     local health = GetEntityHealth(ped)
--     SetEntityCoords(ped, lastCoords, 0, 0, 0, false)
--       NetworkResurrectLocalPlayer(lastCoords.x, lastCoords.y, lastCoords.z, GetEntityHeading(PlayerPedId()), true, false)
--       SetPlayerInvincible(ped, false)
--     Wait(500)
--     SetEntityHealth(PlayerPedId(), health)
--   end
  
  
-- end

CreateThread(function()
	while true do
		Wait(5)
        if IsControlJustReleased(0, 73) then
            StopAll()
        end
	end
end)

RegisterCommand("anim_handsup", function()
    local ped = PlayerPedId()
    if DoesEntityExist(ped) and not IsEntityDead(ped) then
        RequestAnimDict( "random@mugging3" )
        while not HasAnimDictLoaded("random@mugging3") do 
            Citizen.Wait(100)
        end
        if IsEntityPlayingAnim(ped, "random@mugging3", "handsup_standing_base", 3) then
            StopAnimTask(ped, "random@mugging3", "handsup_standing_base", 1.0)
        else
            TaskPlayAnim(ped, "random@mugging3", "handsup_standing_base", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
        end
    end
    Citizen.CreateThread(function()
        while IsEntityPlayingAnim(ped, "random@mugging3", "handsup_standing_base", 3) do
            Citizen.Wait(0)
            DisablePlayerFiring(player, true)
        end
    end)
end)
-- POINTING
StartPointing = function()
    local ped = PlayerPedId()
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end
StopPointing = function(bool)
    local ped = PlayerPedId()
    if not IsPedInjured(ped) and not bool then
        ClearPedSecondaryTask(ped)
    end
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
end
RegisterCommand("anim_pointing", function()
    if not mp_pointing and IsPedOnFoot(PlayerPedId()) then
        StartPointing()
        mp_pointing = true
        while mp_pointing do
            Citizen.Wait(0)
            local ped = PlayerPedId()
            if not Citizen.InvokeNative(0x921CE12C489C4C41, ped) and mp_pointing then
                mp_pointing = false
                StopPointing(true)
            end
            if Citizen.InvokeNative(0x921CE12C489C4C41, ped) then
                if not IsPedOnFoot(ped) then
                    mp_pointing = false
                    StopPointing()
                else
                    local camPitch = GetGameplayCamRelativePitch()
                    if camPitch < -70.0 then
                        camPitch = -70.0
                    elseif camPitch > 42.0 then
                        camPitch = 42.0
                    end
                    camPitch = (camPitch + 70.0) / 112.0

                    local camHeading = GetGameplayCamRelativeHeading()
                    local cosCamHeading = Cos(camHeading)
                    local sinCamHeading = Sin(camHeading)
                    if camHeading < -180.0 then
                        camHeading = -180.0
                    elseif camHeading > 180.0 then
                        camHeading = 180.0
                    end
                    camHeading = (camHeading + 180.0) / 360.0

                    local blocked = 0
                    local nn = 0

                    local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                    local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                    nn,blocked,coords,coords = GetRaycastResult(ray)

                    Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                    Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                    Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                    Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

                end
            end
        end
    elseif mp_pointing or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
        mp_pointing = false
        StopPointing()
    end
end)
RegisterCommand("e",function(source, args)
    if not isDead then
        local player = PlayerPedId()
        if tostring(args[1]) == nil then
            return
        else
            if tostring(args[1]) ~= nil then
                local argh = tostring(args[1])
                for _, group in ipairs(Config.Animations) do
                    for _, anim in ipairs(group.items) do
                        if argh == anim.keyword then
                            if anim.type == 'ragdoll' then
                                TriggerRagdoll(true)
                            elseif anim.type == 'attitude' then
                                if anim.data.car == true then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        StartAttitude(anim.data.lib, anim.data.anim)
                                    end
                                else
                                    if not IsPedInAnyVehicle(PlayerPedId(), false) then
                                        StartAttitude(anim.data.lib, anim.data.anim)
                                    end
                                end
                            elseif anim.type == 'scenario' then
                                if anim.data.car == true then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        StartScenario(anim.data.anim, anim.data.offset)
                                    end
                                else
                                    if not IsPedInAnyVehicle(PlayerPedId(), false) then
                                        StartScenario(anim.data.anim, anim.data.offset)
                                    end
                                end
                            elseif anim.type == 'anim' then
                                if anim.data.car == true then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        StartAnim(anim.data.lib, anim.data.anim, anim.data.mode, anim.data.prop)
                                    end
                                else
                                    if not IsPedInAnyVehicle(PlayerPedId(), false) then
                                        StartAnim(anim.data.lib, anim.data.anim, anim.data.mode, anim.data.prop)
                                    end
                                end
                            elseif anim.type == 'pies' then
                                if isDog() and not IsPedInAnyVehicle(PlayerPedId(), false) then
                                    StartAnim(anim.data.lib, anim.data.anim, anim.data.mode, anim.data.prop)
                                end
                            else
                                if not IsPedInAnyVehicle(PlayerPedId(), false) then
                                    StartLoop(anim.data)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)
RegisterKeyMapping("anim_handsup", "Podnieś Ręce", "keyboard", "OEM_3")
RegisterKeyMapping('anim_pointing', 'Pokazuj Palcem', 'keyboard', 'B')
Citizen.CreateThread(function()
    TriggerEvent("chat:removeSuggestion", "/anim_menu")
    TriggerEvent("chat:removeSuggestion", "/anim_handsup")
    TriggerEvent("chat:removeSuggestion", "/anim_pointing")
    for _, group in ipairs(Config.Animations) do
        for _, item in ipairs(group.items) do
            if item.keyword then
                TriggerEvent("chat:addSuggestion", "/e " .. item.keyword, item.label)
            end
        end
    end
end)

for i=1,9,1 do
    RegisterCommand("anim"..i, function()
        local ped = PlayerPedId()
        if not isDead and not IsPedSprinting(ped) and not IsPedRunning(ped) then
            if IsControlPressed(0, 21) then
                TriggerAnim(binds[i])
            end
        end
    end)
    RegisterKeyMapping("anim"..i, "Ulubiona Animacja #"..i, "keyboard", tostring(i))
    Citizen.CreateThread(function()
        TriggerEvent("chat:removeSuggestion", "/anim"..i)
    end)
end

AnimMenu = function()
    local elements = {}
    if not bindingkey then
        elements[#elements + 1] = {label = '⭐ <span style="color: yellow;">Ulubione Animacje (SHIFT+#)</span>', action = "binds"}
        elements[#elements + 1] = {label = '❌ <span style="color: #fa8282;">PRZERWIJ</span>', action = "cancel"}
    end
    
    for name, group in pairs(Config.Animations) do
        if not group.resource or GetResourceState(group.resource) == "started" then
            if not group.hide then
                elements[#elements + 1] = {label = group.label, value = group.name, hasitems = group.items}
            end
        end
    end
    
    if isDog() then
        elements[#elements + 1] = {label = '🐕 Pies', value = 'dog'}
    end
    
    Wait(100)
    
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "animations_menu", {
        title    = (bindingkey and "Przypisywanie (SHIFT+"..bindingkey..")" or "Animacje"),
        align    = "bottom-right",
        elements = elements
    }, function(data, menu)
        if data.current.action == "binds" then
            AnimBind()
        elseif data.current.action == "cancel" then
            StopAll()
        elseif json.encode(data.current.hasitems) == "[]" then
            AnimSubSubMenu(data.current.value)
        else
            AnimSubMenu(data.current.value)
        end
    end, function(data, menu)
        menu.close()
        bindingkey = nil
    end)
end

AnimSubSubMenu = function(category)
    local elements = {}
    if category == "addon" then
        elements[#elements + 1] = {label = "🧳 Pozy",  value = "pozy"}
        elements[#elements + 1] = {label = "🕺 Tańce",  value = "gang"}
    elseif category == "tancee" then
        elements[#elements + 1] = {label = "🕺 Tańce Zwykłe",  value = "tanceez"}
        elements[#elements + 1] = {label = "💃 Tańce Zabawne", value = "tanceezz"}
    elseif category == "siedzenie" then
        elements[#elements + 1] = {label = "💺 Siedzenie na krześle", value = "siedzeniek"}
        elements[#elements + 1] = {label = "💺 Siedzenie na ziemi",   value = "siedzeniez"}
    elseif category == "praca" then
        elements[#elements + 1] = {label = "👮 LSPD", 	   value = "lspd"}
        elements[#elements + 1] = {label = "💉 EMS",      value = "medyczne"}
        elements[#elements + 1] = {label = "🔧 LST",      value = "mechanik"}
        elements[#elements + 1] = {label = "🧳 Inne", 	   value = "inne"}
    elseif category == "sytuacyjne" then
        elements[#elements + 1] = {label = "🥊 Sport",     value = "sport"}
        elements[#elements + 1] = {label = "❤️ Miłosne",   value = "milosne"}
        elements[#elements + 1] = {label = "🤐 Do Rozmowy",value = "dorozmowy"}
        elements[#elements + 1] = {label = "🔪 Gang", 	    value = "gang"}
        elements[#elements + 1] =  {label = "🔞 PEGI 21",	value = "porn"}
        elements[#elements + 1] = {label = "🧳 Pozostałe",  value = "pozostale"}
    elseif category == "wspolne" then
        SyncedAnim()
        return
    end

    Wait(100)
    
    ESX.UI.Menu.CloseAll()
    
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "animations_sub_sub_menu", {
        title    = "Animacje",
        align    = "bottom-right",
        elements = elements
    }, function(data, menu)
        AnimSubMenu(data.current.value, true, category)
    end, function(data, menu)
        menu.close()
        AnimMenu()
    end)
end

AnimSubMenu = function(category, dual, dualcategory)
    local title, elements = nil, {}
    for name, group in ipairs(Config.Animations) do
        if group.name == category then
            for _, item in ipairs(group.items) do
                elements[#elements + 1] = {label = item.label .. (item.keyword and ' <span style="font-size: 11px; color: rgb(106, 0, 255);">/e ' .. item.keyword .. '</span>' or ''), short = item.label, type = item.type, data = item.data, keyword = item.keyword}
            end

            title = group.label
            break
        end
    end

    Wait(100)
    
    ESX.UI.Menu.CloseAll()
    
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "animations_sub_menu", {
        title    = title,
        align    = "bottom-right",
        elements = elements
    }, function(data, menu)
        if bindingkey then
            binds[bindingkey] = {
                label = data.current.keyword,
                type = data.current.type,
                data = data.current.data
            }
            AnimBindHandler()
            
            bindingkey = nil
            AnimBind()
        else
            TriggerAnim(data.current)
        end
    end, function(data, menu)
        menu.close()
        if dual then
            AnimSubSubMenu(dualcategory)
        else
            AnimMenu()
        end
    end)
end

AnimBind = function()
    local elements = {}
    for i = 1, 9 do
        local bind = binds[i]
        if bind then
            elements[#elements + 1] = {label = "KLAWISZ " .. i .. " -  " .. bind.label, key = i, bind = true}
        else
            elements[#elements + 1] = {label = "KLAWISZ " .. i, key = i, bind = false}
        end
    end
    
    Wait(100)
    
    ESX.UI.Menu.CloseAll()
    
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "animations_bind_menu", {
        title    = "Ulubione Animacje",
        align    = "bottom-right",
        elements = elements
    }, function(data, menu)
        if data.current.bind then
            binds[tonumber(data.current.key)] = nil
            AnimBindHandler()
        else
            bindingkey = tonumber(data.current.key)
            AnimMenu()
        end
    end, function(data, menu)
        menu.close()
        bindingkey = nil
        AnimMenu()
    end)
end

AnimBindHandler = function()
    SetResourceKvp("AnimBinds", json.encode(binds))
end

SyncedAnim = function()
    local elements = {}
    for k, v in pairs(Config.Synced) do
        elements[#elements + 1] = {label = v.label, id = k}
    end

    Wait(100)
    
    ESX.UI.Menu.CloseAll()
    
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "animations_synced_menu", {
        title    = "Wspólne Animacje",
        align    = "bottom-right",
        elements = elements
    }, function(data, menu)
        if ESX.UI.Inventory.Area.Check(3.0) then
            current = data["current"]
            local allowed = false
            if Config.Synced[current["id"]]["Car"] then
                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    allowed = true
                else
                    ESX.ShowNotification("Nie jesteś w pojeździe!")
                end
            else
                allowed = true
            end
            if allowed then
                local allowed = false
                ESX.UI.Inventory.Area.Build(3.0, false, false, function(target, _, npc)
                    if npc then
                        -- 
                    elseif target then
                        ESX.ShowNotification("~y~Oczekiwanie na akceptację przez obywatela")
                        TriggerServerEvent("esx_animations:requestSynced", target, current["id"])
                    else
                        ESX.ShowNotification("Brak obywateli w pobliżu")
                    end
                end, true, false)
            end
        else
            ESX.ShowNotification("Brak obywateli w pobliżu")
        end
    end, function(data, menu)
        menu.close()
        AnimMenu()
    end)
end

RegisterNetEvent("esx_animations:syncRequest")
AddEventHandler("esx_animations:syncRequest", function(requester, id)
    local elements = {}
    
    elements[#elements + 1] = { label = '<span style="color: lightgreen">Zaakceptuj</span>', value = true }
    elements[#elements + 1] = { label = '<span style="color: lightcoral">Odrzuć</span>', value = false }

    Wait(100)
    
    ESX.UI.Menu.CloseAll()
    
    Citizen.CreateThread(function()
        local menuuuu = ESX.UI.Menu.Open("default", GetCurrentResourceName(), "animations_sync_request_menu", {
            title    = "Propozycja animacji "..Config.Synced[id].label.." od "..requester,
            align    = "center",
            elements = elements
        }, function(data, menu)
            menu.close()
            if data.current.value then
                TriggerServerEvent("esx_animations:syncAccepted", requester, id)
            end
        end, function(data, menu)
            menu.close()
            AnimMenu()
        end)
        Wait(5000)
        menuuuu.close()
    end)
end)

RegisterNetEvent("esx_animations:playSynced")
AddEventHandler("esx_animations:playSynced", function(serverid, id, type)
    local target = GetPlayerPed(GetPlayerFromServerId(serverid))
    FreezeEntityPosition(target, false)
    local anim = Config.Synced[id][type]

    if anim['Attach'] then
        local attach = anim['Attach']
        AttachEntityToEntity(target, PlayerPedId(), attach['Bone'], attach['xP'], attach['yP'], attach['zP'], attach['xR'], attach['yR'], attach['zR'], 0, 0, 0, 0, 2, 1)
        AttachEntityToEntity(PlayerPedId(), target, attach['Bone'], attach['xP'], attach['yP'], attach['zP'], attach['xR'], attach['yR'], attach['zR'], 0, 0, 0, 0, 2, 1)
    end
    
    FreezeEntityPosition(target, true)
    
    Wait(750)

    if anim['Type'] == 'animation' then
        PlayAnim(PlayerPedId(), anim['Dict'], anim['Anim'], anim['Flags'])
        PlayAnim(target, anim['Dict'], anim['Anim'], anim['Flags'])
    end

    if type == 'Requester' then
        anim = Config.Synced[id]['Accepter']
    else
        anim = Config.Synced[id]['Requester']
    end
    -- while not IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
    --     Wait(0)
    --     SetEntityNoCollisionEntity(PlayerPedId(), target, true)
    -- end
    DetachEntity(PlayerPedId())
    -- while IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
    --     Wait(0)
    --     SetEntityNoCollisionEntity(PlayerPedId(), target, true)
    -- end

    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(target, true)
end)

TriggerRagdoll = function(a)
    ragdoll = a
    while ragdoll do
        Citizen.Wait(0)
        SetPedToRagdoll(PlayerPedId(), 2000, 2000, 0, 0, 0, 0)
    end
end

TriggerAnim = function(anim)
    if not anim then
        return
    end
    
    local playerPed = PlayerPedId()
    if anim.type == "ragdoll" then
        if not IsPedInAnyVehicle(playerPed, false) then
            TriggerRagdoll(true)
        end
    elseif anim.type == 'attitude' then
        if anim.data.car then
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                StartAttitude(anim.data.lib, anim.data.anim)
            end
        else
            if not IsPedInAnyVehicle(PlayerPedId(), false) then
                StartAttitude(anim.data.lib, anim.data.anim)
            end
        end
    elseif anim.type == 'scenario' then
        if anim.data.car == true then
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                StartScenario(anim.data.anim, anim.data.offset)
            end
        else
            if not IsPedInAnyVehicle(PlayerPedId(), false) then
                StartScenario(anim.data.anim, anim.data.offset)
            end
        end
    elseif anim.type == "anim" then
        if anim.data.car == true then
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                StartAnim(anim.data.lib, anim.data.anim, anim.data.mode, anim.data.prop)
            end
        else
            if not IsPedInAnyVehicle(PlayerPedId(), false) then
                StartAnim(anim.data.lib, anim.data.anim, anim.data.mode, anim.data.prop)
            end
        end
    elseif anim.type == 'pies' then
        if isDog() and not IsPedInAnyVehicle(PlayerPedId(), false) then
            StartAnim(anim.data.lib, anim.data.anim, anim.data.mode, anim.data.prop)
        end
    elseif anim.type == 'facial' then
        TriggerEvent('esx_voice:facial', anim.data)
    else
        if not IsPedInAnyVehicle(PlayerPedId(), false) then
            StartLoop(anim.data)
        end
    end
end

StartAnim = function(lib, anim, mode, obj)
    if not lib then
        return
    elseif not anim then
        return
    end

    if loop.status == true then
        StopLoop(function()
            StartAnim(lib, anim, mode, obj)
        end)
    else
        mode = mode or 0
        Citizen.CreateThread(function()
            RequestAnimDict(lib)
            while not HasAnimDictLoaded(lib) do
                Citizen.Wait(0)
            end
            local playerPed = PlayerPedId()
            TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, mode, 0, false, false, false)
            
            if obj then
                if type(prop) == "table" then
                    DeleteObject(prop.obj)
                    if prop2 then
                        DeleteObject(prop2)
                        prop2 = nil
                    end
                    for _, item in ipairs(prop3) do
                        DeleteObject(item.obj)
                    end
                end
                local coords = GetEntityCoords(playerPed)
                local boneIndex = GetPedBoneIndex(playerPed, obj.bone)
                ESX.Game.SpawnObject(obj.object, {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z + 2
                }, function(object)
                    AttachEntityToEntity(object, playerPed, boneIndex, obj.offset.x + 0.0, obj.offset.y + 0.0, obj.offset.z + 0.0, obj.rotation.x + 0.0, obj.rotation.y + 0.0, obj.rotation.z + 0.0, true, true, false, true, 1, true)
                    prop = {obj = object, lib = lib, anim = anim}
                    prop3[#prop3 + 1] = {obj = object}
                end)
                if obj.object2 then
                    ESX.Game.SpawnObject(obj.object2, {
                        x = coords.x,
                        y = coords.y,
                        z = coords.z + 2
                    }, function(object2)
                        AttachEntityToEntity(object2, playerPed, GetPedBoneIndex(playerPed, obj.bone2), obj.offset2.x + 0.0, obj.offset2.y + 0.0, obj.offset2.z + 0.0, obj.rotation2.x + 0.0, obj.rotation2.y + 0.0, obj.rotation2.z + 0.0, true, true, false, true, 1, true)
                        prop3[#prop3 + 1] = {obj = object2}
                        prop2 = object2
                    end)
                end
            end
        end)
    end
end

StartAttitude = function(lib, anim)
    if not lib then
        return
    elseif not anim then
        return
    end

    Citizen.CreateThread(function()
        RequestAnimSet(anim)
        while not HasAnimSetLoaded(anim) do
            Citizen.Wait(0)
        end
        
        SetPedMovementClipset(PlayerPedId(), anim, true)
    end)
end

StartScenario = function(anim, offset)
    if not anim then
        return
    end

    if loop.status then
        StopLoop(function()
            StartScenario(anim, offset)
        end)
    else
        local ped = PlayerPedId()
        if offset then
            local coords = GetEntityCoords(ped, true)
            TaskStartScenarioAtPosition(ped, anim, coords.x, coords.y, coords.z + offset, GetEntityHeading(ped), 0, true, true)
        else
            TaskStartScenarioInPlace(ped, anim, 0, false)
        end
    end
end

StartLoop = function(data)
    if not data then
        return
    end

    if loop.status then
        StopLoop(function()
            StartLoop(data)
        end)
    else
        Citizen.CreateThread(function()
            while loop.status do
                Citizen.Wait(0)
            end
            RequestAnimDict(data.base.lib)
            while not HasAnimDictLoaded(data.base.lib) do
                Citizen.Wait(0)
            end
            RequestAnimDict(data.idle.lib)
            while not HasAnimDictLoaded(data.idle.lib) do
                Citizen.Wait(0)
            end
            RequestAnimDict(data.finish.lib)
            while not HasAnimDictLoaded(data.finish.lib) do
                Citizen.Wait(0)
            end
        local playerPed = PlayerPedId()
        if data.prop then
            local coords	= GetEntityCoords(playerPed)
            local boneIndex = GetPedBoneIndex(playerPed, data.prop.bone)
            ESX.Game.SpawnObject(data.prop.object, {
                x = coords.x,
                y = coords.y,
                z = coords.z + 2
            }, function(object)
                AttachEntityToEntity(object, playerPed, boneIndex, data.prop.offset.x + 0.0, data.prop.offset.y + 0.0, data.prop.offset.z + 0.0, data.prop.rotation.x + 0.0, data.prop.rotation.y + 0.0, data.prop.rotation.z + 0.0, true, true, false, true, 1, true)
                prop = object
            end)
        end
        TaskPlayAnim(PlayerPedId(), data.base.lib, data.base.anim, 8.0, -8.0, -1, data.mode, 0, false, false, false)
        loop = {status = true, current = nil, finish = data.finish, delay = (GetGameTimer() + 100), last = 0}
        loop.finish.mode = data.mode
        if data.prop then
            loop.dettach = data.prop.dettach
        else
            loop.dettach = false
        end
        Citizen.Wait(data.base.length)
        while loop.status do
            local rng = #data.idle.anims
            if rng > 1 then
                repeat
                    rng = math.random((data.base.entering and 1 or 0), #data.idle.anims)
                until rng ~= loop.last
            end
                loop.delay = GetGameTimer() + 100
                loop.last = rng
                if rng == 0 then
                    TaskPlayAnim(PlayerPedId(), data.base.lib, data.base.anim, 8.0, -8.0, -1, data.mode, 0, false, false, false)
                    loop.current = data.base
                    Citizen.Wait(data.base.length)
                else
                    TaskPlayAnim(PlayerPedId(), data.idle.lib, data.idle.anims[rng][1], 8.0, -8.0, -1, data.mode, 0, false, false, false)
                    loop.current = {lib = data.idle.lib, anim = data.idle.anims[rng][1]}
                    Citizen.Wait(data.idle.anims[rng][2])
                end
            end
        end)
    end
end

StopLoop = function(cb)
    loop.status = false
    Citizen.CreateThread(function()
        TaskPlayAnim(PlayerPedId(), loop.finish.lib, loop.finish.anim, 8.0, 8.0, -1, loop.finish.mode, 0, false, false, false)
        Citizen.Wait(loop.finish.length)
        if loop.status == false and prop and type(prop) ~= "table" then
            if loop.dettach then
                DetachEntity(prop, true, false)
            else
                DeleteObject(prop)
                if prop2 then
                    DeleteObject(prop2)
                    prop2 = nil
                end
                for _, item in ipairs(prop3) do
                    DeleteObject(item.obj)
                end
            end
            prop = nil
        end
        loop.status = nil
        if cb then
            cb()
        end
    end)
end

StopAll = function()
    if loop.status == true then
        StopLoop()
    elseif ragdoll then
        TriggerRagdoll(false)
    else
        local playerPed = PlayerPedId()
        ClearPedTasks(playerPed)
        if loop.status then
            loop.status = nil
            if prop and type(prop) ~= "table" then
                if loop.dettach then
                    DetachEntity(prop, true, false)
                else
                    DeleteObject(prop)
                end
                prop = nil
            end
        elseif type(prop) == "table" then
            DeleteObject(prop.obj)
            prop = nil
            if prop2 then
                DeleteObject(prop2)
                prop2 = nil
            end
            for _, item in ipairs(prop3) do
                DeleteObject(item.obj)
            end
        end
    end
    TriggerEvent("esx_animations:TaskClear")
end

PlayAnim = function(ped, Dict, Anim, Flag)
    LoadDict(Dict)
    TaskPlayAnim(ped, Dict, Anim, 8.0, -8.0, -1, Flag or 0, 0, false, false, false)
end

LoadDict = function(Dict)
    while not HasAnimDictLoaded(Dict) do 
        Wait(0)
        RequestAnimDict(Dict)
    end
end

isDog = function()
    local playerModel = GetEntityModel(PlayerPedId())
    for i=1, #dogModels, 1 do
        if joaat(dogModels[i]) == playerModel then
            return true
        end
    end
    return false
end


--- 5MIASTO
Crouched = false
CrouchedForce = false
Aimed = false
LastCam = 0
Cooldown = false

CoolDownTime = 500 -- in ms

NormalWalk = function()
    local playerPed = PlayerPedId()
	SetPedMaxMoveBlendRatio(playerPed, 1.0)
	ResetPedMovementClipset(playerPed, 0.55)
	ResetPedStrafeClipset(playerPed)
	SetPedCanPlayAmbientAnims(playerPed, true)
	SetPedCanPlayAmbientBaseAnims(playerPed, true)
	ResetPedWeaponMovementClipset(playerPed)
	Crouched = false
end

SetupCrouch = function()
	while not HasAnimSetLoaded('move_ped_crouched') do
		Citizen.Wait(0)
		RequestAnimSet('move_ped_crouched')
	end
end

CanCrouch = function()
    local playerPed = PlayerPedId()
	if
		IsPedOnFoot(playerPed) and
		not IsPedJumping(playerPed) and
		not IsPedFalling(playerPed) and
		not IsPedDeadOrDying(playerPed) and
		not LocalPlayer.state.Dead and
		not LocalPlayer.state.IsHandcuffed and
		LocalPlayer.state.InvBinds and
		not LocalPlayer.state.RadialMenu
	then
		return true
	else
		return false
	end
end

CrouchPlayer = function()
    local playerPed = PlayerPedId()
	SetPedUsingActionMode(playerPed, false, -1, "DEFAULT_ACTION")
	SetPedMovementClipset(playerPed, 'move_ped_crouched', 0.55)
	SetPedStrafeClipset(playerPed, 'move_ped_crouched_strafing') -- it force be on third person if not player will freeze but this func make player can shoot with good anim on crouch if someone know how to fix this make request :D
	SetWeaponAnimationOverride(playerPed, "Ballistic")
	Crouched = true
	Aimed = false
end

SetPlayerAimSpeed = function()
    local playerPed = PlayerPedId()
	SetPedMaxMoveBlendRatio(playerPed, 0.2)
	Aimed = true
end

IsPlayerFreeAimed = function()
	if IsPlayerFreeAiming(PlayerId()) or IsAimCamActive() or IsAimCamThirdPersonActive() then
		return true
	else
		return false
	end
end

Citizen.CreateThread( function()
	SetupCrouch()
end)

local crouched_thread = false
RegisterCommand('+crouch', function()
	if CanCrouch() then
		if not Cooldown then
			CrouchedForce = not CrouchedForce
			if CrouchedForce and not crouched_thread then
				Citizen.CreateThread(function()
					crouched_thread = true
					while CrouchedForce do
						local wait = 75
						DisableControlAction(0, 36, true)
						local CanDo = CanCrouch()
						if CanDo and Crouched and IsPlayerFreeAimed() then
							SetPlayerAimSpeed()
							wait = 0
						elseif CanDo and (not Crouched or Aimed) then
							CrouchPlayer()
						elseif not CanDo and Crouched then
							CrouchedForce = false
							NormalWalk()
						end
						local NowCam = GetFollowPedCamViewMode()
						if CanDo and Crouched and NowCam == 4 then
							SetFollowPedCamViewMode(LastCam)
						elseif CanDo and Crouched and NowCam ~= 4 then
							LastCam = NowCam
						end
						Citizen.Wait(wait)
					end
					crouched_thread = false
					NormalWalk()
				end)
			end
			Cooldown = true
			SetTimeout(CoolDownTime, function()
				Cooldown = false
			end)
		end
	end
end, false)

RegisterCommand('-crouch', function() end)
RegisterKeyMapping("+crouch", "Klawisz kucania", "keyboard", "LCONTROL")