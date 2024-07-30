ESX = exports['es_extended']:getSharedObject()
PlayersCommand3d = {}
PlayersDescriptions = {}
local ReportVisible = true

local playerGroup = "user"

Citizen.CreateThread(function()
    Citizen.Wait(1000*5)
    while true do
        if PlayerLoad then 
            ESX.TriggerServerCallback("esx_rpchat:getGroup", function(PlayerGroup)
                playerGroup = PlayerGroup
            end)
        end
        Citizen.Wait(1000*120)
   end
end)


local PlayerLoad = false
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
    PlayerLoad = true
    TriggerServerEvent("esx_rpchat:getDescription")
    Citizen.Wait(1000*5)
    ESX.TriggerServerCallback("esx_rpchat:getGroup", function(PlayerGroup)
        playerGroup = PlayerGroup
    end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job, response)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setHiddenJob')
AddEventHandler('esx:setHiddenJob', function(hiddenjob)
	ESX.PlayerData.hiddenjob = hiddenjob
end)

RegisterNetEvent('esx:setGroup')
AddEventHandler('esx:setGroup', function(group)
    playerGroup = group
end)

RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(type, id, template, args, d3dcolor)
    local mId = PlayerId()
    local tId = GetPlayerFromServerId(id)
    -- if tId == -1 then return end
    if type == "ooc" then
        local mPed = GetPlayerPed(mId)
        local tPed = GetPlayerPed(tId)
        local mCoords = GetEntityCoords(mPed)
        local tCoords = GetEntityCoords(tPed)
        local distance = #(mCoords - tCoords)
        if tId == mId then
            TriggerEvent('chat:addMessage', {
				template = template,
				args = args
			})
        elseif distance < Config.Distance then
            if NetworkIsPlayerActive(tId) then
                TriggerEvent('chat:addMessage', {
				    template = template,
					args = args
				})
            end
        end
    elseif type == "mdt" then
        local mPed = GetPlayerPed(mId)
        local tPed = GetPlayerPed(tId)
        local mCoords = GetEntityCoords(mPed)
        local tCoords = GetEntityCoords(tPed)
        local distance = #(mCoords - tCoords)
        if tId == mId then
            TriggerEvent('chat:addMessage', {
				template = template,
				args = args
			})
        elseif distance < Config.Distance then
            if NetworkIsPlayerActive(tId) then
                if HasEntityClearLosToEntity(mPed, tPed, 1) then
                    TriggerEvent('chat:addMessage', {
						template = template,
						args = args
					})
                end
            end
        end
        local number = 1
        if PlayersCommand3d[id] ~= nil then
            number = #PlayersCommand3d[id] + 1
        else
            PlayersCommand3d[id] = {}
        end
        PlayersCommand3d[id][number] = {text = args[3], color = d3dcolor}
        Citizen.Wait(15000)
        if id and number and PlayersCommand3d[id][number] then
            PlayersCommand3d[id][number] = nil
        end
        if #PlayersCommand3d[id] == 0 then
            PlayersCommand3d[id] = nil
        end
    elseif type == "ogloszenie" then
        if tId == mId then
            TriggerEvent('chat:addMessage', {
                template = Config.Templates["ogloszenie"],
                args = args
            })
        elseif tId ~= mId then
            TriggerEvent('chat:addMessage', {
                template = template,
                args = args
            })
        end
    elseif type == "dw" then
        if ESX.PlayerData.job.name ~= "police" and ESX.PlayerData.job.name ~= "police" then
            if playerGroup == 'best' then
                TriggerEvent('chat:addMessage', {
                    template = Config.Templates["dw_id"],
                    args = args
                })
            else
                TriggerEvent('chat:addMessage', {
                    template = Config.Templates["dw"],
                    args = args
                })
            end
        end
    elseif type == "twt" then
        if playerGroup == 'best' then
            TriggerEvent('chat:addMessage', {
                template = Config.Templates["twt_id"],
                args = args
            })
        else
            TriggerEvent('chat:addMessage', {
                template = Config.Templates["twt"],
                args = args
            })
        end
    elseif type == "report" then
        if ReportVisible and playerGroup == "best" or playerGroup == "superadmin" or playerGroup == "admin" or playerGroup == "mod" then
            TriggerEvent('chat:addMessage', {
                template = template,
                args = args
            })
        end
    elseif type == "ambulance" then
        TriggerEvent('chat:addMessage', {
            template = Config.Templates["ambulance"],
            args = args
        })
    elseif type == "police" then
        TriggerEvent('chat:addMessage', {
            template = Config.Templates["police"],
            args = args
        })
    elseif type == "mechanik" then
        TriggerEvent('chat:addMessage', {
            template = Config.Templates[type],
            args = args
        })
    elseif type == "news" then
        TriggerEvent('chat:addMessage', {
            template = Config.Templates["news"],
            args = args
        })
    elseif type == "error" then
        TriggerEvent('chat:addMessage', {
            template = Config.Templates['error'],
            args = args
        })
    elseif type == "wiezienie" then
        TriggerEvent('chat:addMessage', {
            template = Config.Templates['wiezienie'],
            args = args
        })
    elseif type == "mandat" or type == "faktura" then
        TriggerEvent('chat:addMessage', {
            template = Config.Templates[type],
            args = args
        })
    elseif type == "smieciarka" then
        TriggerEvent('chat:addMessage', {
            template = Config.Templates["smieciarka"],
            args = args
        })
    elseif type == "centrala" then
        TriggerEvent('chat:addMessage', {
            template = Config.Templates["centrala"],
            args = args
        })
    end
end)

RegisterCommand("reporttoggle", function()
    ReportVisible = not ReportVisible
    ESX.ShowNotification(ReportVisible and "Od teraz nowe zgłoszenia od graczy będą widoczne!" or "Od teraz nowe zgłoszenia od graczy będą niewidoczne!")
end)

RegisterNetEvent('esx_rpchat:sendDescription')
AddEventHandler('esx_rpchat:sendDescription', function(k)
    PlayersDescriptions = k
end)

local meWait = 0
RegisterCommand("me", function(a, args)
    if meWait > 0 then
        TriggerEvent('chat:addMessage', {
			template = Config.Templates['error'],
			args = { "Odczekaj " .. meWait .. " sekund przed napisaniem następnego ME!", nil, nil }
		})
        return
    end
    TriggerServerEvent("esx_rpchat:sendMe", args)
    meWait = 5
    while meWait > 0 do
        Wait(1000)
        meWait = meWait - 1
    end
end)

local doWait = 0
RegisterCommand("do", function(a, args)
    if doWait > 0 then
        TriggerEvent('chat:addMessage', {
			template = Config.Templates['error'],
			args = { "Odczekaj " .. doWait .. " sekund przed napisaniem następnego DO!", nil, nil }
		})
        return
    end
    TriggerServerEvent("esx_rpchat:sendDo", args)
    doWait = 5
    while doWait > 0 do
        Wait(1000)
        doWait = doWait - 1
    end
end)

local tryWait = 0
RegisterCommand("try", function(a, args)
    if tryWait > 0 then
        TriggerEvent('chat:addMessage', {
			template = Config.Templates['error'],
			args = { "Odczekaj " .. tryWait .. " sekund przed napisaniem następnego TRY!", nil, nil }
		})
        return
    end
    TriggerServerEvent("esx_rpchat:sendTry", args)
    tryWait = 5
    while tryWait > 0 do
        Wait(1000)
        tryWait = tryWait - 1
    end
end)

local twtWait = 0
RegisterCommand("twt", function(a, args)
    if twtWait > 0 then
        TriggerEvent('chat:addMessage', {
			template = Config.Templates['error'],
			args = { "Odczekaj " .. twtWait .. " sekund przed napisaniem następnego twittera!", nil, nil }
		})
        return
    end
    if LocalPlayer.state.IsDead then return end
    if LocalPlayer.state.IsHandcuffed or LocalPlayer.state.Tied then return end
    TriggerServerEvent("esx_rpchat:sendTwitter", args)
    twtWait = 15
    while twtWait > 0 do
        Wait(1000)
        twtWait = twtWait - 1
    end
end)

local dwWait = 0
RegisterCommand("dw", function(a, args)
    -- phoneOpened = exports['gcphone']:isPhoneOpen()
    if dwWait > 0 then
        TriggerEvent('chat:addMessage', {
			template = Config.Templates['error'],
			args = { "Odczekaj " .. dwWait .. " sekund przed napisaniem następnego darkweba!", nil, nil }
		})
        return
    end
    if LocalPlayer.state.IsDead then return end
    if LocalPlayer.state.IsHandcuffed or LocalPlayer.state.Tied then return end
    TriggerServerEvent("esx_rpchat:sendDarkWeb", args)
    dwWait = 15
    while dwWait > 0 do
        Wait(1000)
        dwWait = dwWait - 1
    end
end)

local reportWait = 0
RegisterCommand("report", function(a, args)
    if reportWait > 0 then
        TriggerEvent('chat:addMessage', {
			template = Config.Templates['error'],
			args = { "Odczekaj " .. reportWait .. " sekund przed napisaniem następnego reporta!", nil, nil }
		})
        return
    end
    TriggerServerEvent("esx_rpchat:sendReport", args)
    reportWait = 15
    while reportWait > 0 do
        Wait(1000)
        reportWait = reportWait - 1
    end
end)

local needFrakcje = {
    ['mechanik'] = 0,
    ['police'] = 0,
    ['ambulance'] = 0,
}

local needNews = {
    ['pizzeria'] = 0,
    ['kebab'] = 0,
}

RegisterCommand("ems", function(a, args)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' and ESX.PlayerData.job.grade_name == 'boss' then
        if needFrakcje[ESX.PlayerData.job.name] > 0 then
            TriggerEvent('chat:addMessage', {
                template = Config.Templates['error'],
                args = { "Odczekaj " .. needFrakcje[ESX.PlayerData.job.name] .. " sekund przed napisaniem następnego ogłoszenia!", nil, nil }
            })
            return
        end
        TriggerServerEvent("esx_rpchat:sendOgloszenieFrakcyjne", args)
        needFrakcje[ESX.PlayerData.job.name] = 30
        while needFrakcje[ESX.PlayerData.job.name] > 0 do
            Wait(1000)
            needFrakcje[ESX.PlayerData.job.name] = needFrakcje[ESX.PlayerData.job.name] - 1
        end
    end
end)

RegisterCommand("lspd", function(a, args)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.grade_name == 'boss' then
        if needFrakcje[ESX.PlayerData.job.name] > 0 then
            TriggerEvent('chat:addMessage', {
                template = Config.Templates['error'],
                args = { "Odczekaj " .. needFrakcje[ESX.PlayerData.job.name] .. " sekund przed napisaniem następnego ogłoszenia!", nil, nil }
            })
            return
        end
        TriggerServerEvent("esx_rpchat:sendOgloszenieFrakcyjne", args)
        needFrakcje[ESX.PlayerData.job.name] = 30
        while needFrakcje[ESX.PlayerData.job.name] > 0 do
            Wait(1000)
            needFrakcje[ESX.PlayerData.job.name] = needFrakcje[ESX.PlayerData.job.name] - 1
        end
    end
end)

RegisterCommand("lscm", function(a, args)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'mechanik' and ESX.PlayerData.job.grade_name == 'boss' then
        if needFrakcje[ESX.PlayerData.job.name] > 0 then
            TriggerEvent('chat:addMessage', {
                template = Config.Templates['error'],
                args = { "Odczekaj " .. needFrakcje[ESX.PlayerData.job.name] .. " sekund przed napisaniem następnego ogłoszenia!", nil, nil }
            })
            return
        end
        TriggerServerEvent("esx_rpchat:sendOgloszenieFrakcyjne", args)
        needFrakcje[ESX.PlayerData.job.name] = 30
        while needFrakcje[ESX.PlayerData.job.name] > 0 do
            Wait(1000)
            needFrakcje[ESX.PlayerData.job.name] = needFrakcje[ESX.PlayerData.job.name] - 1
        end
    end
end)

RegisterCommand("news", function(a, args)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'pizzeria' or  ESX.PlayerData.job and ESX.PlayerData.job.name == 'kebab' and ESX.PlayerData.job.grade_name == 'boss' then
        if needNews[ESX.PlayerData.job.name] > 0 then
            TriggerEvent('chat:addMessage', {
                template = Config.Templates['error'],
                args = { "Odczekaj " .. needNews[ESX.PlayerData.job.name] .. " sekund przed napisaniem następnego ogłoszenia!", nil, nil }
            })
            return
        end
        TriggerServerEvent("esx_rpchat:sendNews", args)
        needNews[ESX.PlayerData.job.name] = 600
        while needNews[ESX.PlayerData.job.name] > 0 do
            Wait(1000)
            needNews[ESX.PlayerData.job.name] = needNews[ESX.PlayerData.job.name] - 1
        end
    end
end)

Draw3dMessage = function(position, text, color, rect)
    local onScreen, _x, _y = World3dToScreen2d(position.x, position.y, position.z)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    if rect then
        local factor = text:len() / 325
	    DrawRect(_x, _y + 0.0125, 0.008 + factor, 0.025, color[1], color[2], color[3], 200)
    end
end

Citizen.CreateThread(function()
    local PlayerVisibleCommand3d = {}
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        for b, id in ipairs(GetActivePlayers()) do
            local desc = PlayersCommand3d[GetPlayerServerId(id)]
            if desc then
                local a = GetPlayerServerId(id)
                PlayerVisibleCommand3d[a] = 0
                for k,v in pairs(desc) do
                    local targetPed = GetPlayerPed(GetPlayerFromServerId(a))
                    if DoesEntityExist(targetPed) then
                        if HasEntityClearLosToEntity(playerPed, targetPed, 1) then
                            local targetCoords = GetEntityCoords(targetPed)
                            local textCoords = 0.95 + (PlayerVisibleCommand3d[a] * 0.14)
                            local distance = #(playerCoords - targetCoords)
                            if distance < Config.Distance then
                                Draw3dMessage({x = targetCoords.x, y = targetCoords.y, z = targetCoords.z + textCoords}, v.text, v.color, true)
                                PlayerVisibleCommand3d[a] = PlayerVisibleCommand3d[a] + 1
                            end
                        end
                    end
                end
                PlayerVisibleCommand3d[a] = 0
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        for k, id in ipairs(GetActivePlayers()) do
            local desc = PlayersDescriptions[GetPlayerServerId(id)]
            if desc then
                local targetPed = GetPlayerPed(id)
                if DoesEntityExist(targetPed) then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)
                    if distance < Config.Distance then
                        if HasEntityClearLosToEntity(playerPed, targetPed, 1) then
                            Draw3dMessage({x = targetCoords.x, y = targetCoords.y, z = targetCoords.z}, desc, {55, 55, 55})
                        end
                    end
                end
            end
        end
    end
end)