local playerLicenses, ownLicenses = {}, {}
local openedMenu = false
local lastVehHealth = nil
local currentDriveVehicle = nil
local tempBlip, pointBlip = nil, nil
local isLicensesNotLoaded = false
showKM = 0
examinerPed = nil
driveErrors = 0
currentExam = nil

if Config.Core == "ESX" then
    ESX = Config.CoreExport()
    
    RegisterNetEvent('vms_driveschoolv2:cl:getLicenses')
	AddEventHandler('vms_driveschoolv2:cl:getLicenses', function(licenses)
		playerLicenses = licenses
	end)
elseif Config.Core == "QB-Core" then
    QBCore = Config.CoreExport()
    PlayerData = QBCore.Functions.GetPlayerData()

    RegisterNetEvent('vms_driveschoolv2:cl:getLicenses')
	AddEventHandler('vms_driveschoolv2:cl:getLicenses', function()
        PlayerData = QBCore.Functions.GetPlayerData()
	end)

    RegisterNetEvent(Config.PlayerLoaded)
    AddEventHandler(Config.PlayerLoaded, function()
        PlayerData = QBCore.Functions.GetPlayerData()
    end)
end

Citizen.CreateThread(function()
    Citizen.Wait(250)
    if Config.Zones["menu"].menuType == "ox_lib" then
        local import = LoadResourceFile('ox_lib', 'init.lua')
        local chunk = assert(load(import, '@@ox_lib/init.lua'))
        chunk()
    end
    if Config.UseTarget then
        Config.Target()
    end
end)

RegisterNetEvent('vms_driveschoolv2:cl:startExam', function(type, category)
    if type == "Theory" then
        startTheoretical(category)
    elseif type == "Practical" then
        startPractical(category)
    end
end)

Citizen.CreateThread(function()
    local schoolBlip = AddBlipForCoord(Config.Zones["menu"].coords)	
    SetBlipSprite(schoolBlip, Config.Zones["menu"].blip.sprite)
    SetBlipDisplay(schoolBlip, Config.Zones["menu"].blip.display)
    SetBlipScale(schoolBlip, Config.Zones["menu"].blip.scale)
    SetBlipColour(schoolBlip, Config.Zones["menu"].blip.color)
    SetBlipAsShortRange(schoolBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Zones["menu"].blip.name)
    EndTextCommandSetBlipName(schoolBlip)
end)

openMenu = function()
    if not isLicensesNotLoaded and Config.Core == "ESX" and ESX.GetPlayerData() then
        TriggerServerEvent('vms_driveschoolv2:sv:loadLicensesWithRestartScript')
        isLicensesNotLoaded = true
        Citizen.Wait(200)
    end
    if Config.Zones["menu"].menuType == "esx_menu_default" then
        openedMenu = true
        ESX.UI.Menu.CloseAll()
        ownLicenses = {}
        for k, v in pairs(playerLicenses) do
            ownLicenses[v.type] = true
        end
        local elements = {}
        if Config.Licenses.Theory['A'].enabled and not ownLicenses[Config.Licenses.Theory['A'].name] then
            elements[#elements + 1] = {icon = Config.Translate['menu.theory_a'].icon, label = Config.Translate['menu.theory_a'].label:format(Config.Licenses.Theory['A'].price), value = 'theory_a'}
        else
            if Config.Licenses.Practical['A'].enabled and not ownLicenses[Config.Licenses.Practical['A'].name] then
                elements[#elements + 1] = {icon = Config.Translate['menu.practical_a'].icon, label = Config.Translate['menu.practical_a'].label:format(Config.Licenses.Practical['A'].price), value = 'practical_a'}
            end
        end
        if Config.Licenses.Theory['B'].enabled and not ownLicenses[Config.Licenses.Theory['B'].name] then
            elements[#elements + 1] = {icon = Config.Translate['menu.theory_b'].icon, label = Config.Translate['menu.theory_b'].label:format(Config.Licenses.Theory['B'].price), value = 'theory_b'}
        else
            if Config.Licenses.Practical['B'].enabled and not ownLicenses[Config.Licenses.Practical['B'].name] then
                elements[#elements + 1] = {icon = Config.Translate['menu.practical_b'].icon, label = Config.Translate['menu.practical_b'].label:format(Config.Licenses.Practical['B'].price), value = 'practical_b'}
            end
        end
        if Config.Licenses.Theory['C'].enabled and not ownLicenses[Config.Licenses.Theory['C'].name] then
            elements[#elements + 1] = {icon = Config.Translate['menu.theory_c'].icon, label = Config.Translate['menu.theory_c'].label:format(Config.Licenses.Theory['C'].price), value = 'theory_c'}
        else
            if Config.Licenses.Practical['C'].enabled and not ownLicenses[Config.Licenses.Practical['C'].name] then
                elements[#elements + 1] = {icon = Config.Translate['menu.practical_c'].icon, label = Config.Translate['menu.practical_c'].label:format(Config.Licenses.Practical['C'].price), value = 'practical_c'}
            end
        end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu', {
			title    = Config.Translate['menu.title'].label,
			elements = elements,
			align    = Config.Zones['menu'].menuPosition,
		}, function(data, menu)
            menu.close()
            if data.current.value == "theory_a" then
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Theory', category = 'A'})
            elseif data.current.value == "theory_b" then
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Theory', category = 'B'})
            elseif data.current.value == "theory_c" then
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Theory', category = 'C'})
            elseif data.current.value == "practical_a" then
                ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, false)
                if Config.CheckIsManeuveringAreaIsOccupied then
                    local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                    if not isPointClear then
                        Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                        openedMenu = false
                        return
                    end
                end
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Practical', category = 'A'})
            elseif data.current.value == "practical_b" then
                ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, false)
                if Config.CheckIsManeuveringAreaIsOccupied then
                    local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                    if not isPointClear then
                        Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                        openedMenu = false
                        return
                    end
                end
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Practical', category = 'B'})
            elseif data.current.value == "practical_c" then
                ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, false)
                if Config.CheckIsManeuveringAreaIsOccupied then
                    local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                    if not isPointClear then
                        Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                        openedMenu = false
                        return
                    end
                end
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Practical', category = 'C'})
            end
		end, function(data, menu)
			menu.close()
            openedMenu = false
		end)
    elseif Config.Zones["menu"].menuType == "esx_context" then
        ESX.CloseContext()
        ownLicenses = {}
        for k, v in pairs(playerLicenses) do
            ownLicenses[v.type] = true
        end
        local elements = {
            {unselectable = true, icon = Config.Translate['menu.title'].icon, title = Config.Translate['menu.title'].label}
        }
        if Config.Licenses.Theory['A'].enabled and not ownLicenses[Config.Licenses.Theory['A'].name] then
            elements[#elements + 1] = {icon = Config.Translate['menu.theory_a'].icon, title = Config.Translate['menu.theory_a'].label:format(Config.Licenses.Theory['A'].price), value = 'theory_a'}
        else
            if Config.Licenses.Practical['A'].enabled and not ownLicenses[Config.Licenses.Practical['A'].name] then
                elements[#elements + 1] = {icon = Config.Translate['menu.practical_a'].icon, title = Config.Translate['menu.practical_a'].label:format(Config.Licenses.Practical['A'].price), value = 'practical_a'}
            end
        end
        if Config.Licenses.Theory['B'].enabled and not ownLicenses[Config.Licenses.Theory['B'].name] then
            elements[#elements + 1] = {icon = Config.Translate['menu.theory_b'].icon, title = Config.Translate['menu.theory_b'].label:format(Config.Licenses.Theory['B'].price), value = 'theory_b'}
        else
            if Config.Licenses.Practical['B'].enabled and not ownLicenses[Config.Licenses.Practical['B'].name] then
                elements[#elements + 1] = {icon = Config.Translate['menu.practical_b'].icon, title = Config.Translate['menu.practical_b'].label:format(Config.Licenses.Practical['B'].price), value = 'practical_b'}
            end
        end
        if Config.Licenses.Theory['C'].enabled and not ownLicenses[Config.Licenses.Theory['C'].name] then
            elements[#elements + 1] = {icon = Config.Translate['menu.theory_c'].icon, title = Config.Translate['menu.theory_c'].label:format(Config.Licenses.Theory['C'].price), value = 'theory_c'}
        else
            if Config.Licenses.Practical['C'].enabled and not ownLicenses[Config.Licenses.Practical['C'].name] then
                elements[#elements + 1] = {icon = Config.Translate['menu.practical_c'].icon, title = Config.Translate['menu.practical_c'].label:format(Config.Licenses.Practical['C'].price), value = 'practical_c'}
            end
        end
        ESX.OpenContext(Config.Zones['menu'].menuPosition, elements, function(menu, element)
            ESX.CloseContext()
            if element.value == "theory_a" then
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Theory', category = 'A'})
            elseif element.value == "theory_b" then
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Theory', category = 'B'})
            elseif element.value == "theory_c" then
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Theory', category = 'C'})
            elseif element.value == "practical_a" then
                ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, nil)
                if Config.CheckIsManeuveringAreaIsOccupied then
                    local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                    if not isPointClear then
                        Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                        return
                    end
                end
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Practical', category = 'A'})
            elseif element.value == "practical_b" then
                ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, nil)
                if Config.CheckIsManeuveringAreaIsOccupied then
                    local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                    if not isPointClear then
                        Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                        return
                    end
                end
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Practical', category = 'B'})
            elseif element.value == "practical_c" then
                ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, nil)
                if Config.CheckIsManeuveringAreaIsOccupied then
                    local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                    if not isPointClear then
                        Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                        return
                    end
                end
                TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Practical', category = 'C'})
            end
        end)
    elseif Config.Zones["menu"].menuType == "qb-menu" then
        local elements = {
            {icon = Config.Translate['menu.title'].icon, header = Config.Translate['menu.title'].label, isMenuHeader = true},
        }
        if Config.Licenses.Theory['A'].enabled and not PlayerData.metadata['licences'][Config.Licenses.Theory['A'].name] then
            elements[#elements + 1] = {
                icon = Config.Translate['menu.theory_a'].icon, 
                header = Config.Translate['menu.theory_a'].label:format(Config.Licenses.Theory['A'].price),
                params = {
                    isAction = true,
                    event = function()
                        TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = "Theory", category = "A"})
                    end
                },
            }
        else
            if Config.Licenses.Practical['A'].enabled and not PlayerData.metadata['licences'][Config.Licenses.Practical['A'].name] then
                elements[#elements + 1] = {
                    icon = Config.Translate['menu.practical_a'].icon, 
                    header = Config.Translate['menu.practical_a'].label:format(Config.Licenses.Practical['A'].price),
                    params = {
                        isAction = true,
                        event = function()
                            ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, nil)
                            if Config.CheckIsManeuveringAreaIsOccupied then
                                local isPointClear = QBCore.Functions.SpawnClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                                    return
                                end
                            end
                            TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = "Practical", category = "A"})
                        end
                    },
                }
            end
        end
        if Config.Licenses.Theory['B'].enabled and not PlayerData.metadata['licences'][Config.Licenses.Theory['B'].name] then
            elements[#elements + 1] = {
                icon = Config.Translate['menu.theory_b'].icon, 
                header = Config.Translate['menu.theory_b'].label:format(Config.Licenses.Theory['B'].price),
                params = {
                    isAction = true,
                    event = function()
                        TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = "Theory", category = "B"})
                    end
                },
            }
        else
            if Config.Licenses.Practical['B'].enabled and not PlayerData.metadata['licences'][Config.Licenses.Practical['B'].name] then
                elements[#elements + 1] = {
                    icon = Config.Translate['menu.practical_b'].icon, 
                    header = Config.Translate['menu.practical_b'].label:format(Config.Licenses.Practical['B'].price),
                    params = {
                        isAction = true,
                        event = function()
                            ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, nil)
                            if Config.CheckIsManeuveringAreaIsOccupied then
                                local isPointClear = QBCore.Functions.SpawnClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                                    return
                                end
                            end
                            TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = "Practical", category = "B"})
                        end
                    },
                }
            end
        end
        if Config.Licenses.Theory['C'].enabled and not PlayerData.metadata['licences'][Config.Licenses.Theory['C'].name] then
            elements[#elements + 1] = {
                icon = Config.Translate['menu.theory_c'].icon, 
                header = Config.Translate['menu.theory_c'].label:format(Config.Licenses.Theory['C'].price),
                params = {
                    isAction = true,
                    event = function()
                        TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = "Theory", category = "C"})
                    end
                },
            }
        else
            if Config.Licenses.Practical['C'].enabled and not PlayerData.metadata['licences'][Config.Licenses.Practical['C'].name] then
                elements[#elements + 1] = {
                    icon = Config.Translate['menu.practical_c'].icon, 
                    header = Config.Translate['menu.practical_c'].label:format(Config.Licenses.Practical['C'].price),
                    params = {
                        isAction = true,
                        event = function()
                            ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, nil)
                            if Config.CheckIsManeuveringAreaIsOccupied then
                                local isPointClear = QBCore.Functions.SpawnClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                                    return
                                end
                            end
                            TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = "Practical", category = "C"})
                        end
                    },
                }
            end
        end
        exports['qb-menu']:openMenu(elements)	
    elseif Config.Zones["menu"].menuType == "ox_lib" then
        openedMenu = true
        ownLicenses = {}
        if Config.Core == "ESX" then
            for k, v in pairs(playerLicenses) do
                ownLicenses[v.type] = true
            end
        end
        local elements = {}
        if Config.Licenses.Theory['A'].enabled and (Config.Core == "ESX" and not ownLicenses[Config.Licenses.Theory['A'].name] or Config.Core == "QB-Core" and not PlayerData.metadata['licences'][Config.Licenses.Theory['A'].name]) then
            elements[#elements + 1] = {
                icon = Config.Translate['menu.theory_a'].icon, 
                title = Config.Translate['menu.theory_a'].label:format(Config.Licenses.Theory['A'].price), 
                onSelect = function()
                    TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Theory', category = 'A'})
                end,
                onExit = function()
                    openedMenu = false
                end
            }
        else
            if Config.Licenses.Practical['A'].enabled and (Config.Core == "ESX" and not ownLicenses[Config.Licenses.Practical['A'].name] or Config.Core == "QB-Core" and not PlayerData.metadata['licences'][Config.Licenses.Practical['A'].name]) then
                elements[#elements + 1] = {
                    icon = Config.Translate['menu.practical_a'].icon, 
                    title = Config.Translate['menu.practical_a'].label:format(Config.Licenses.Practical['A'].price), 
                    onSelect = function()
                        if Config.Core == "ESX" then
                            ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, false)
                            if Config.CheckIsManeuveringAreaIsOccupied then
                                local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                                    openedMenu = false
                                    return
                                end
                            end
                            TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Practical', category = 'A'})
                        else
                            ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, nil)
                            if Config.CheckIsManeuveringAreaIsOccupied then
                                local isPointClear = QBCore.Functions.SpawnClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                                    return
                                end
                            end
                            TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = "Practical", category = "A"})
                        end
                    end,
                    onExit = function()
                        openedMenu = false
                    end
                }
            end
        end
        if Config.Licenses.Theory['B'].enabled and (Config.Core == "ESX" and not ownLicenses[Config.Licenses.Theory['B'].name] or Config.Core == "QB-Core" and not PlayerData.metadata['licences'][Config.Licenses.Theory['B'].name]) then
            elements[#elements + 1] = {
                icon = Config.Translate['menu.theory_b'].icon, 
                title = Config.Translate['menu.theory_b'].label:format(Config.Licenses.Theory['B'].price), 
                onSelect = function()
                    TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Theory', category = 'B'})
                end,
                onExit = function()
                    openedMenu = false
                end
            }
        else
            if Config.Licenses.Practical['B'].enabled and (Config.Core == "ESX" and not ownLicenses[Config.Licenses.Practical['B'].name] or Config.Core == "QB-Core" and not PlayerData.metadata['licences'][Config.Licenses.Practical['B'].name]) then
                elements[#elements + 1] = {
                    icon = Config.Translate['menu.practical_b'].icon, 
                    title = Config.Translate['menu.practical_b'].label:format(Config.Licenses.Practical['B'].price), 
                    onSelect = function()
                        if Config.Core == "ESX" then
                            ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, false)
                            if Config.CheckIsManeuveringAreaIsOccupied then
                                local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                                    openedMenu = false
                                    return
                                end
                            end
                            TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Practical', category = 'B'})
                        else
                            ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, nil)
                            if Config.CheckIsManeuveringAreaIsOccupied then
                                local isPointClear = QBCore.Functions.SpawnClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                                    return
                                end
                            end
                            TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = "Practical", category = "B"})
                        end
                    end,
                    onExit = function()
                        openedMenu = false
                    end
                }
            end
        end
        if Config.Licenses.Theory['C'].enabled and (Config.Core == "ESX" and not ownLicenses[Config.Licenses.Theory['C'].name] or Config.Core == "QB-Core" and not PlayerData.metadata['licences'][Config.Licenses.Theory['C'].name]) then
            elements[#elements + 1] = {
                icon = Config.Translate['menu.theory_c'].icon, 
                title = Config.Translate['menu.theory_c'].label:format(Config.Licenses.Theory['C'].price), 
                onSelect = function()
                    TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Theory', category = 'C'})
                end,
                onExit = function()
                    openedMenu = false
                end
            }
        else
            if Config.Licenses.Practical['C'].enabled and (Config.Core == "ESX" and not ownLicenses[Config.Licenses.Practical['C'].name] or Config.Core == "QB-Core" and not PlayerData.metadata['licences'][Config.Licenses.Practical['C'].name]) then
                elements[#elements + 1] = {
                    icon = Config.Translate['menu.practical_c'].icon, 
                    title = Config.Translate['menu.practical_c'].label:format(Config.Licenses.Practical['C'].price), 
                    onSelect = function()
                        if Config.Core == "ESX" then
                            ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, false)
                            if Config.CheckIsManeuveringAreaIsOccupied then
                                local isPointClear = ESX.Game.IsSpawnPointClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                                    openedMenu = false
                                    return
                                end
                            end
                            TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = 'Practical', category = 'C'})
                        else
                            ClearArea(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z, 15.0, true, false, false, nil)
                            if Config.CheckIsManeuveringAreaIsOccupied then
                                local isPointClear = QBCore.Functions.SpawnClear(vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), 8.0)
                                if not isPointClear then
                                    Config.Notification(Config.Translate['the_maneuvering_area_is_occupied'], 'error')
                                    return
                                end
                            end
                            TriggerServerEvent('vms_driveschoolv2:sv:buyExam', {type = "Practical", category = "C"})
                        end
                    end,
                    onExit = function()
                        openedMenu = false
                    end
                }
            end
        end
        lib.registerContext({
            id = "driveschool-menu",
            title = Config.Translate['menu.title'].label,
            options = elements,
            onExit = function()
                openedMenu = false
            end
        })
        lib.showContext('driveschool-menu')
    end
end

RegisterNetEvent('vms_driveschoolv2:openMenu', function()
    openMenu()
end)

Citizen.CreateThread(function()
    local inRange = false
    local shown = false
    local sleep = true
    while Config.AccessOnMarker do
        inRange = false
        sleep = true
        local myPed = PlayerPedId()
        local myCoords = GetEntityCoords(myPed)
        local distance = #(Config.Zones["menu"].coords - myCoords)
        if distance < 25.0 then
            sleep = false
            if distance < 15.0 then
                if not isLicensesNotLoaded and Config.Core == "ESX" and ESX.GetPlayerData() then
                    TriggerServerEvent('vms_driveschoolv2:sv:loadLicensesWithRestartScript')
                    isLicensesNotLoaded = true
                end
                DrawMarker(Config.Zones["menu"].marker.id, Config.Zones["menu"].coords, 0, 0, 0, 0, 0, 0, Config.Zones["menu"].marker.scale, Config.Zones["menu"].marker.color[1], Config.Zones["menu"].marker.color[2], Config.Zones["menu"].marker.color[3], Config.Zones["menu"].marker.color[4], Config.Zones["menu"].marker.bobUpAndDown, false, false, Config.Zones["menu"].marker.rotate, false, false, false)
                if distance < Config.Zones["menu"].marker.scale.x+.15 then
                    if not openedMenu then
                        inRange = true
                        if Config.Core == "ESX" and not Config.Interact.Enabled then
                            ESX.ShowHelpNotification(Config.Translate['open_menu'])
                        end
                        if IsControlJustPressed(0, 38) then
                            openMenu()
                            inRange = false
                        end
                    end
                end
            end
        end
        if Config.Interact.Enabled then
            if inRange and not shown then
                shown = true
                Config.Interact.Open(Config.Translate['open_menu'])
            elseif not inRange and shown then
                shown = false
                Config.Interact.Close()
            end
        end
        Citizen.Wait(sleep and 2000 or 1)
    end
end)

startTheoretical = function(category)
    currentExam = Config.Licenses.Theory[category].name
    SendNUIMessage({action = 'openTheory', category = category, questions = Config.Questions[category]})
    SetNuiFocus(true, true)
    SetTimecycleModifier(Config.EnableBlur and 'hud_def_blur')
end

startErrorCounter = function()
    Citizen.CreateThread(function()
        while currentExam do
            local myPed = PlayerPedId()
            if IsPedInAnyVehicle(myPed,  false) then
                local vehicle = GetVehiclePedIsIn(myPed, false)
                local vehHealth = GetEntityHealth(vehicle)
                if vehHealth < lastVehHealth then
                    driveErrors = driveErrors + 1
                    Config.Notification(Config.Translate['vehicle_was_damaged']:format(driveErrors, Config.MaxDriveErrors), 'error')
                    Citizen.Wait(1000)
                    lastVehHealth = vehHealth
                end
                if Config.MaxSpeed then
                    local speed = GetEntitySpeed(vehicle) * Config.SpeedMultiplier
                    local tooMuchSpeed = false
                    if speed > Config.MaxSpeed then
                        tooMuchSpeed = true
                        if not isAboveSpeedLimit then
                            driveErrors = driveErrors + 1
                            isAboveSpeedLimit = true
                            Config.Notification(Config.Translate['exceeded_speed_limit']:format(driveErrors, Config.MaxDriveErrors, Config.MaxSpeed), 'error')
                            if Config.EnableMaxSpeedLoop then
                                Citizen.Wait(Config.MaxSpeedLoopTimeout)
                                tooMuchSpeed = false
                            end
                        end
                    end
                    if not tooMuchSpeed then
                        isAboveSpeedLimit = false
                    end
                end
                if driveErrors >= Config.MaxDriveErrors then
                    if pointBlip then
                        RemoveBlip(pointBlip)
                    end
                    Config.Notification(Config.Translate['exceeded_error_limit'], 'error')
                    setBlipToSchool(true)
                    SendNUIMessage({action = 'closeTasks'})
                    Config.PracticalTest[#Config.PracticalTest].action()
                    break
                end
            end
            if IsPlayerDead(myPed) or IsEntityDead(myPed) then
                if pointBlip then
                    RemoveBlip(pointBlip)
                end
                SendNUIMessage({action = 'closeTasks'})
                openedMenu = false
                currentExam = nil
                driveErrors = 0
                showKM = 0
                exports['wiz-idcard']:giveLicenses('car')
                DeleteVehicle(currentDriveVehicle)
                if examinerPed then
                    DeletePed(examinerPed)
                end
            end
            Citizen.Wait(1)
        end
    end)
end

startPractical = function(type)
    currentExam = Config.Licenses.Practical[type].name
    if Config.Core == "ESX" then
        ESX.Game.SpawnVehicle(Config.Practical.Vehicles[type], vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), Config.Practical.SpawnPoint.w, function(vehicle)
            currentDriveVehicle = vehicle
            lastVehHealth = GetEntityHealth(vehicle)
            if Config.Examiner.Enabled then
                RequestModel(GetHashKey(Config.Examiner.PedModel))
                while not HasModelLoaded(GetHashKey(Config.Examiner.PedModel)) do
                    Wait(1)
                end
                examinerPed = CreatePedInsideVehicle(vehicle, 4, Config.Examiner.PedModel, 0, true, false)
                SetBlockingOfNonTemporaryEvents(examinerPed, true)
                SetPedCanBeDraggedOut(examinerPed, false)
                SetEntityInvincible(examinerPed, true)
                SetPedKeepTask(examinerPed, true)
                TaskWarpPedIntoVehicle(examinerPed, vehicle, 0)
            end
            Config.Notification(Config.Translate['started_practical'], 'success')
            SendNUIMessage({
                action = 'openTasks', 
                tasks = Config.Tasks,
                maxPoints = #Config.Tasks
            })
            Config.OnVehicleSpawn(vehicle)
            startErrorCounter()
            for k, v in pairs(Config.PracticalTest) do
                if not IsPlayerDead(PlayerPedId()) and not IsEntityDead(PlayerPedId()) then
                    v.action()
                end
            end
        end)
    elseif Config.Core == "QB-Core" then
        QBCore.Functions.SpawnVehicle(Config.Practical.Vehicles[type], function(vehicle)
            currentDriveVehicle = vehicle
            lastVehHealth = GetEntityHealth(vehicle)
			SetEntityHeading(vehicle, Config.Practical.SpawnPoint.w)
            if Config.Examiner.Enabled then
                RequestModel(GetHashKey(Config.Examiner.PedModel))
                while not HasModelLoaded(GetHashKey(Config.Examiner.PedModel)) do
                    Wait(1)
                end
                examinerPed = CreatePedInsideVehicle(vehicle, 4, GetHashKey(Config.Examiner.PedModel), 0, true, false)
                SetBlockingOfNonTemporaryEvents(examinerPed, true)
                SetPedCanBeDraggedOut(examinerPed, false)
                SetEntityInvincible(examinerPed, true)
                SetPedKeepTask(examinerPed, true)
                TaskWarpPedIntoVehicle(examinerPed, vehicle, 0)
            end
            Config.Notification(Config.Translate['started_practical'], 'success')
            SendNUIMessage({
                action = 'openTasks', 
                tasks = Config.Tasks,
                maxPoints = #Config.Tasks
            })
            Config.OnVehicleSpawn(vehicle)
            startErrorCounter()
            for k, v in pairs(Config.PracticalTest) do
                if not IsPlayerDead(PlayerPedId()) and not IsEntityDead(PlayerPedId()) then
                    v.action()
                end
            end
		end, vec(Config.Practical.SpawnPoint.x, Config.Practical.SpawnPoint.y, Config.Practical.SpawnPoint.z), true)
    end
end

setBlipToSchool = function(create)
    if create then
        if tempBlip then
            RemoveBlip(tempBlip)
        end
        tempBlip = AddBlipForCoord(Config.Zones["return_vehicle"].coords)	
	    SetBlipSprite(tempBlip, Config.Zones["return_vehicle"].blip.sprite)
	    SetBlipDisplay(tempBlip, Config.Zones["return_vehicle"].blip.display)
	    SetBlipScale(tempBlip, Config.Zones["return_vehicle"].blip.scale)
	    SetBlipColour(tempBlip, Config.Zones["return_vehicle"].blip.color)
	    SetBlipAsShortRange(tempBlip, true)
	    BeginTextCommandSetBlipName("STRING")
	    AddTextComponentString(Config.Zones["return_vehicle"].blip.name)
	    EndTextCommandSetBlipName(tempBlip)
        SetBlipRoute(tempBlip, true)
        SetBlipRouteColour(tempBlip, Config.Zones["return_vehicle"].blip.routeColor)
    else
        RemoveBlip(tempBlip)
        TriggerServerEvent('vms_driveschoolv2:sv:addLicense', driveErrors < Config.MaxDriveErrors, currentExam)
        driveErrors = 0
        currentExam = nil
        openedMenu = false
        showKM = 0
    end
end

setBlipToPoint = function(point)
    if pointBlip then
        RemoveBlip(pointBlip)
    end
    local pointCoords = Config.PracticalTest[point].coords or nil
    if pointCoords then
        pointBlip = AddBlipForCoord(pointCoords)
        SetBlipSprite(pointBlip, Config.Practical['Blip'].sprite)
        SetBlipDisplay(pointBlip, Config.Practical['Blip'].display)
        SetBlipScale(pointBlip, Config.Practical['Blip'].scale)
        SetBlipColour(pointBlip, Config.Practical['Blip'].color)
        SetBlipAsShortRange(pointBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Practical['Blip'].name)
        EndTextCommandSetBlipName(pointBlip)
        SetBlipRoute(pointBlip, true)
        SetBlipRouteColour(pointBlip, Config.Practical['Blip'].routeColor)
    end
end

RegisterNUICallback('action', function(data, cb)
    if data.action == "close" then
        SetNuiFocus(false, false)
        SendNUIMessage({action = 'closeTheory'})
        openedMenu = false
        TriggerServerEvent('vms_driveschoolv2:sv:addLicense', data.passed, currentExam)
        currentExam = nil
        SetTimecycleModifier(Config.EnableBlur and 'default')
    elseif data.action == "playSound" then
        if Config.UseSoundsUI then
            if data.type == "nextQuestion" then
                PlaySoundFrontend(-1, 'Boss_Message_Orange', 'GTAO_Boss_Goons_FM_Soundset', 0)
            elseif data.type == "passedExam" then
                PlaySoundFrontend(-1, 'OOB_Start', 'GTAO_FM_Events_Soundset', 0)
            elseif data.type == "failedExam" then
                PlaySoundFrontend(-1, 'OOB_Cancel', 'GTAO_FM_Events_Soundset', 0)
            end
        end
    end
end)

RegisterNetEvent('vms_driveschoolv2:notification', function(message, type, enableAccessMenu)
    Config.Notification(message, type)
    if enableAccessMenu then
        openedMenu = false
    end
end)