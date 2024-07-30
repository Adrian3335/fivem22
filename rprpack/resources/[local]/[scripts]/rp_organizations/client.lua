local CreatedZones = {}
local CreatedBlips = {}
local function ClearJob()
    for i = 1, #(CreatedBlips) do
        RemoveBlip(CreatedBlips[i])
    end
    CreatedBlips = {}
    
    for i = 1, #(CreatedZones) do
        exports.ox_target:removeZone(CreatedZones[i])
    end
    CreatedZones = {}
end

local function CreateBlip(coords)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, 84)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 75)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("<font face='Poppins-Medium' size= '11'>Dom Organizacji</font>" ) 
    EndTextCommandSetBlipName(blip)
    CreatedBlips[#CreatedBlips + 1] = blip
end


CreateThread(function()
    for k,v in pairs(Config.BlipsCircle) do
        local blip = AddBlipForCoord(v.coords)
        SetBlipSprite(blip, v.sprite)
        SetBlipDisplay(blip, v.display)
        SetBlipScale(blip, 0.32)
        SetBlipColour(blip, v.color)
        SetBlipAlpha(blip, v.alpha)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName("<font face='Poppins-Medium' size='11'>".. v.title .."</font>")
        EndTextCommandSetBlipName(blip)
    end
end)

local function CreateZones(config, name)
    local id1 = exports.ox_target:addBoxZone({
        coords = config.Safe.coords,
        size = config.Safe.size,
        rotation = config.Safe.rotation,
        debug = false,
        options = {
            {
                label = "Sprawdź",
                icon = "fa-solid fa-vault",
                event = "dbl_organizations:checkSafeMoney",
                canInteract = function()
                    return Config.Organizations[ESX.PlayerData.org.name] and ESX.PlayerData.org.permissions["safe"]
                end
            },
            {
                label = "Wpłać",
                icon = "fa-solid fa-vault",
                event = "dbl_organizations:depositSafeMoney",
                canInteract = function()
                    return Config.Organizations[ESX.PlayerData.org.name] and ESX.PlayerData.org.permissions["safe"]
                end
            },
            {
                label = "Wypłać",
                icon = "fa-solid fa-vault",
                event = "dbl_organizations:withdrawSafeMoney",
                canInteract = function()
                    return Config.Organizations[ESX.PlayerData.org.name] and ESX.PlayerData.org.permissions["safe"]
                end
            }
        },
    })
    CreatedZones[1] = id1

    local id2 = exports.ox_target:addBoxZone({
        coords = config.Storage.coords,
        size = config.Storage.size,
        rotation = config.Storage.rotation,
        debug = false,
        options = {
            {
                label = "Otwórz Magazyn",
                icon = "fa-solid fa-warehouse",
                event = "dbl_organizations:openStash",
                canInteract = function()
                    return Config.Organizations[ESX.PlayerData.org.name] and ESX.PlayerData.org.permissions["warehouse"]
                end
            }
        },
    })
    CreatedZones[2] = id2
    
    local id3 = exports.ox_target:addBoxZone({
        coords = config.Wardrobe.coords,
        size = config.Wardrobe.size,
        rotation = config.Wardrobe.rotation,
        debug = false,
        options = {
            {
                label = "Prywatna Garderoba",
                icon = "fa-solid fa-shirt",
                event = "dbl_barbershop:clothesmenu",
                canInteract = function()
                    return Config.Organizations[ESX.PlayerData.org.name]
                end
            },
            {
                label = "Organizacyjna Garderoba",
                icon = "fa-solid fa-shirt",
                event = "dbl_organizations:openOrganizationWardrobe",
                canInteract = function()
                    return Config.Organizations[ESX.PlayerData.org.name] and ESX.PlayerData.org.permissions["wardrobeOpen"]
                end
            },
            {
                label = "Dodaj Ubranie",
                icon = "fa-solid fa-shirt",
                event = "dbl_organizations:addOrganizationClothes",
                canInteract = function()
                    return Config.Organizations[ESX.PlayerData.org.name] and ESX.PlayerData.org.permissions["wardrobeAdd"]
                end
            },
            {
                label = "Usuń Ubranie",
                icon = "fa-solid fa-shirt",
                event = "dbl_organizations:removeOrganizationClothes",
                canInteract = function()
                    return Config.Organizations[ESX.PlayerData.org.name] and ESX.PlayerData.org.permissions["wardrobeRemove"]
                end
            }
        },
    })
    CreatedZones[3] = id3
end

CreateThread(function()
    while not ESX.PlayerLoaded do
        Wait(100)
    end

    ESX.TriggerServerCallback("dbl_organizations:getJob", function(org)
        ClearJob()
        ESX.PlayerData.org = org

        if Config.Organizations[org.name] then
            CreateBlip(Config.Organizations[org.name].Blip)
            CreateZones(Config.Organizations[org.name], org.name)
        end
    end)
end)

RegisterNetEvent("esx:setOrg", function(org)
    ClearJob()
    ESX.PlayerData.org = org

    print(json.encode(org.permissions))

    if Config.Organizations[org.name] then
        CreateBlip(Config.Organizations[org.name].Blip)
        CreateZones(Config.Organizations[org.name])
    end
end)

RegisterNetEvent("dbl_organizations:openStash", function()
    exports.ox_inventory:openInventory('stash', ESX.PlayerData.org.name)
end)

RegisterNetEvent("dbl_organizations:openOrganizationWardrobe", function()
    local elements = lib.callback.await('dbl_organizations:getOrganizationWardrobe', false)

    if #elements == 0 then
        elements[1] = {label = "Brak zapisanych ubrań", value = "empty"}
    end

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "organization_wardrobe", {
        title = "Garderoba",
        align = "center",
        elements = elements
    }, function(data, menu)
        if data.current.value == "empty" then
            return menu.close()
        end

        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerEvent('skinchanger:loadClothes', skin, json.decode(data.current.value))
            TriggerEvent('esx_skin:setLastSkin', skin)

            TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerServerEvent('esx_skin:save', skin)
            end)
        end)
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent("dbl_organizations:addOrganizationClothes", function()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'enter_name', {
        title = "Podaj nazwę"
    }, function(data, menu)
        local name = tostring(data.value)
        if name == nil then
            return
        end
        
        TriggerEvent("skinchanger:getSkin", function(skin)
            lib.callback.await('dbl_organizations:saveOrganizationClothes', false, {label = name, value = skin})
            menu.close()
            ESX.ShowNotification("Ubranie zostało zapisane")
        end)
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent("dbl_organizations:removeOrganizationClothes", function()
    local elements = lib.callback.await('dbl_organizations:getOrganizationWardrobe', false)

    if #elements == 0 then
        elements[1] = {label = "Brak zapisanych ubrań", value = "empty"}
    end

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "organization_wardrobe", {
        title = "Garderoba",
        align = "center",
        elements = elements
    }, function(data, menu)
        if data.current.value == "empty" then
            return menu.close()
        end

        lib.callback.await('dbl_organizations:removeOrganizationClothes', false, data.current)
        menu.close()
        ESX.ShowNotification("Ubranie zostało usunięte")
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent("dbl_organizations:checkSafeMoney", function()
    local money = lib.callback.await('dbl_organizations:checkSafeMoney', false)
    ESX.ShowNotification("W sejfie znajduje się $" .. money)
end)

RegisterNetEvent("dbl_organizations:depositSafeMoney", function()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'enter_money', {
        title = "Wprowadź kwotę"
    }, function(data, menu)
        local count = tonumber(data.value)
        if count == nil then
            return
        end
        
        local success = lib.callback.await('dbl_organizations:depositSafeMoney', false, count)
        menu.close()
        if type(success) == "number" then
            ESX.ShowNotification("Od teraz w sejfie znajduje się $" .. success)
        elseif success == "money" then
            ESX.ShowNotification("Nie masz wystarczającej ilości gotówki!")
        end
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent("dbl_organizations:withdrawSafeMoney", function()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'enter_money', {
        title = "Wprowadź kwotę"
    }, function(data, menu)
        local count = tonumber(data.value)
        if count == nil then
            return
        end
        
        local success = lib.callback.await('dbl_organizations:withdrawSafeMoney', false, count)
        menu.close()
        if type(success) == "number" then
            ESX.ShowNotification("Od teraz w sejfie znajduje się $" .. success)
        elseif success == "money" then
            ESX.ShowNotification("W sejfie nie ma wystarczającej ilości gotówki!")
        end
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNetEvent("dbl_organizations:OpenTablet", function()
    if ESX.PlayerData.org and Config.Organizations[ESX.PlayerData.org.name] and not LocalPlayer.state.IsDead then
        ESX.TriggerServerCallback("dbl_organizations:GetTabletInfo", function(data)
            SetNuiFocus(true, true)
            SendNUIMessage({
                action = "open",
                data = data,
                owner = Config.Organizations[ESX.PlayerData.org.name].owner,
                upgrades = Config.UpgradesPrice,
                permissions = Config.Permissions,
                mypermissions = ESX.PlayerData.org.permissions
            })
        end)
    end
end)

RegisterNUICallback("getMembers", function(data, cb)
    ESX.TriggerServerCallback("dbl_organizations:GetMembers", function(data)
        cb(data)
    end)
end)

RegisterNUICallback("getLogs", function(data, cb)
    ESX.TriggerServerCallback("dbl_organizations:GetLogs", function(data)
        cb(data)
    end)
end)

RegisterNUICallback("savePermissions", function(data)
    print(json.encode(data.permissions))
    TriggerServerEvent("dbl_organizations:savePermissions", data)
end)

RegisterNUICallback("buyUpgrade", function(data)
    lib.callback.await('dbl_organizations:buyUpgrade', false, data)
end)

RegisterNUICallback("noteAdd", function(data, cb)
    lib.callback.await('dbl_organizations:noteAdd', false, data)
end)

RegisterNUICallback("getNearbyPlayers", function(data, cb)
    local players = {}
    local myPed = PlayerPedId()
	local coords = GetEntityCoords(myPed, true)
    local pid = PlayerId()
    for _, player in ipairs(ESX.Game.GetPlayers()) do
        if pid ~= player then
            local target = GetPlayerPed(player)
            if IsEntityVisible(target) then
                local distance = #(coords - GetEntityCoords(target, true))
                if distance <= 3.0 then
                    table.insert(players, GetPlayerServerId(player))
                end
            end
        end
    end

    cb(players)
end)

RegisterNUICallback("fireMember", function(data, cb)
    cb(lib.callback.await('dbl_organizations:fireMember', false, data.identifier))
end)

RegisterNUICallback("hireMember", function(data, cb)
    cb(lib.callback.await('dbl_organizations:hireMember', false, data.id))
end)

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)

exports("hasOrgJob", function()
    return (ESX.PlayerData.org and Config.Organizations[ESX.PlayerData.org.name]) and ESX.PlayerData.org.name
end)

RegisterCommand("tabletorg", function(source, args, rawCommand)
    TriggerEvent("dbl_organizations:OpenTablet", source)
end)
