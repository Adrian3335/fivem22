

AddEventHandler('fumoPolice:uniform', function(data)
    local job = 'police'
    local categories = {}
    
    table.insert(categories, {label = "Ubranie prywatne", value = "private"})
    table.insert(categories, {label = "LSPD", value = "job"})
    table.insert(categories, {label = "Inne", value = "others"})

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom'..job, {
        title = 'Szatnia',
        align = 'bottom-right',
        elements = categories
    }, function(data, menu)
        if data.current.value == "private" then
            local lib, anim = 'mp_safehouseshower@male@', 'male_shower_towel_dry_to_get_dressed'
            ESX.Streaming.RequestAnimDict(lib, function()
                TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
            end)
            Citizen.Wait(5000)
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
        elseif data.current.value == "shop" then
            menu.close()
            TriggerServerEvent('esx_clotheshop:buyClothes', function(bought)
                if bought then
                    TriggerEvent('esx_skin:openRestrictedMenu')
                else
                    ESX.ShowNotification('Nie możesz kupić ubrań.')
                end
            end)
        elseif data.current.value == "job" then
            setUniform("grades", ESX.PlayerData.job.grade)
        elseif data.current.value == "lssd" then
            openSubMenu("lssd")
        elseif data.current.value == "others" then
            openSubMenu("others")
        elseif data.current.value == "special" then
            openSubMenu("special")
        end
    end, function(data, menu)
        menu.close()
    end)
end)





openSubMenu = function(cat, data, specialNum)
    local elements = {}
    local config = cfg.clothes[cat]

    if config then
        if data == "special" then
            local getLicenses = lib.callback.await('fumoPolice:getLicenses', false)
            if getLicenses then
                local licenses = {}

                for i=1, #getLicenses, 1 do
                    if getLicenses[i].label and getLicenses[i].type then
                        licenses[getLicenses[i].type] = true
                    end
                end
                            
                for k,v in pairs(config) do
                    if licenses[v.license] then
                        table.insert(elements, {label = v.label, value = k})
                    end
                end
            else
                return ESX.ShowNotification('Brak licencji')
            end
        elseif data == "specialNum" then
            for k,v in pairs(config[specialNum].sets) do
                table.insert(elements, {label = v.label, value = k, specialNum = specialNum})
            end
        else
            for k,v in pairs(config) do
                table.insert(elements, {label = v.label, value = k})
            end
        end

        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'szatnia'..cat, {
            title = 'Szatnia',
            align = 'bottom-right',
            elements = elements,
        }, function(menuData, menu)
            if data == "special" then
                openSubMenu("special", "specialNum", menuData.current.value)
            else
                setUniform(cat, menuData.current.value, menuData.current.specialNum)
            end
        end, function(menuData, menu)
            menu.close()
        end)

    else
        return ESX.ShowNotification("Brak stroju")
    end
end

setUniform = function(cat, data, special)
    local found = false
    if cat == "grades" then
        for k,v in pairs(cfg.clothes.grades) do
            if v.grade == ESX.PlayerData.job.grade then
                found = v
            end
        end
    end
    if cat == "lssd" then
        for k,v in pairs(cfg.clothes.lssd) do
            if k == data then
                found = v
            end
        end
    end
    if cat == "others" then
        for k,v in pairs(cfg.clothes.others) do
            if k == data then
                found = v
            end
        end
    end

    if cat == "special" then
        for k,v in pairs(cfg.clothes.special[special].sets) do
            if k == data then
                found = v
            end
        end 
    end
    
    if found then
        cleanPlayer()
        local lib, anim = 'mp_safehouseshower@male@', 'male_shower_towel_dry_to_get_dressed'
        ESX.Streaming.RequestAnimDict(lib, function()
            TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
        end)

        Citizen.Wait(5000)

        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.sex == 0 then
                if found.male ~= nil then
                    TriggerEvent('skinchanger:loadClothes', skin, found.male)
                else
                    ESX.ShowNotification('Brak stroju!')
                end
            else
                if found.female ~= nil then
                    TriggerEvent('skinchanger:loadClothes', skin, found.female)
                else
                    ESX.ShowNotification('Brak stroju!')
                end
            end
        end)
    else
        ESX.ShowNotification('Brak stroju')
    end
end

cleanPlayer = function()
    local ped = PlayerPedId()
    SetPedArmour(ped, 0)
    ClearPedBloodDamage(ped)
    ResetPedVisibleDamage(ped)
    ClearPedLastWeaponDamage(ped)
    ResetPedMovementClipset(ped, 0)
end