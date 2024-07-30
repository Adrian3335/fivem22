ESX = exports.es_extended.getSharedObject()
PlayerData = ESX.GetPlayerData()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

-- Blipy
CreateThread(function()
    for _, info in pairs(Config.Blip) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 1.0)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
      end
end)


-- Pedy

Citizen.CreateThread(function()
    RequestModel('a_m_m_hillbilly_01')
    while not HasModelLoaded('a_m_m_hillbilly_01') or not HasCollisionForModelLoaded('a_m_m_hillbilly_01') do
    Wait(1)
end

-- Ped 1
local typo = CreatePed(28, 'a_m_m_hillbilly_01', 2016.356079, 4987.635254, 41.085693, 201.259842, true, true)
SetEntityAsMissionEntity(typo, true, true)
SetEntityInvincible(typo, true)
SetBlockingOfNonTemporaryEvents(typo, true)
FreezeEntityPosition(typo, true)

-- Ped 2
local typo = CreatePed(28, 'a_m_m_hillbilly_01', 2003.736206, 4984.430664, 40.462280, 308.976379, true, true)
SetEntityAsMissionEntity(typo, true, true)
SetEntityInvincible(typo, true)
SetBlockingOfNonTemporaryEvents(typo, true)
FreezeEntityPosition(typo, true)
end)

--Przebieranie
local przebrany = false

exports.ox_target:addBoxZone({
    coords = vec3(2016.4, 4987.81, 42.1),
    size = vec3(1, 1, 2),
    rotation = 45,
    debug = drawZones,
    drawSprite = true,
    options = {
        {
        name = 'Przebieranie',
        event = 'przebieranie',
        icon = 'fas fa-tshirt',
        label = 'Przebierz się',
        groups = 'rolnik',
        distance = 2
        }
    }
})

RegisterNetEvent('przebieranie', function()
    local Elements = {
        {label = "Ubrania Robocze", name = "job_wear"},
        {label = "Ubrania Cywilne", name = "citizen_wear"},
      }

      ESX.UI.Menu.Open("default", GetCurrentResourceName(), "Przebierzsie", {
        title = "Przebierz sie",
        align    = 'center',
        elements = Elements
      }, function(data,menu)
        if data.current.name == "job_wear" then
          menu.close()
          if lib.progressCircle({
            duration = 2000,
            label = 'Przebieranie',
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                movement = true,
                combat = true,
            },
            anim = {
                dict = 'clothingtie',
                clip = 'try_tie_negative_a'
            }
        }) then 
            przebrany = true
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if skin.sex == 0 then
                  TriggerEvent('skinchanger:loadClothes', skin, Config.SkinMale)
              else
                  TriggerEvent('skinchanger:loadClothes', skin, Config.SkinFemale)
              end
              
            end)
        else 
            print('chuj')
        end
        end

        if data.current.name == "citizen_wear" then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                przebrany = false
            end)
        end
      end, function(data, menu)
        menu.close()
      end)
end)



--Samochód
exports.ox_target:addBoxZone({
    coords = vec3(2003.59, 4984.24, 41.45),
    size = vec3(1, 1, 2),
    rotation = 35,
    debug = drawZones,
    drawSprite = true,
    options = {
        {
        name = 'samochod',
        onSelect = function()
            if przebrany then
                wyciagnijfure()
            else
                ESX.ShowNotification('Najpierw musisz się przebrać')
            end
        end,
        icon = 'fas fa-car',
        label = 'Wyciągnij pojazd',
        groups = 'rolnik',
        distance = 2,
        }
    }
})

wyciagnijfure = function()
            local niger = IsPositionOccupied(2007.543, 4986.819, 41.359, 10, false, true, false, 0, 0, 0, 0)
            if jobVehicle ~= nil then
                ESX.ShowNotification('Wyciągnąłeś już auto!')
                return
            end
        
            if niger == false then
                ESX.Game.SpawnVehicle('ratloader', vector3(2007.543, 4986.819, 41.359), 221.158, function(vehicle)
                jobVehicle = vehicle
                SetPedIntoVehicle(PlayerPedId(), jobVehicle, -1)
                local plate = "FRM " .. GetRandomIntInRange(100,999)
                SetVehicleNumberPlateText(jobVehicle, plate)
                
                TriggerEvent('sv-carkeys:addKey', plate)
            end)
            else
                ESX.ShowNotification('Miejsce jest zastawione')
            end
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		player = PlayerPedId()
		coords = GetEntityCoords(player)
		local distance = GetDistanceBetweenCoords(coords, vector3(2013.015, 4970.324, 41.474), true)
		if distance < 4.0 and przebrany == true and IsPedInVehicle(PlayerPedId(), jobVehicle, true) then
			ESX.ShowFloatingHelpNotification('~INPUT_CONTEXT~ Schowaj pojazd', vector3(2013.015, 4970.324, 41.474))
            if IsControlJustPressed(0, 51) and IsPedInVehicle(PlayerPedId(), jobVehicle, true) then
                TaskLeaveVehicle(PlayerPedId(), jobVehicle, 0)
                Wait(1500)
                ESX.Game.DeleteVehicle(jobVehicle)
                ESX.ShowNotification('Schowałeś pojazd')
            end
		end
	end
end)

--Salata
exports.ox_target:addModel(130470264, {
    name = 'zbieranie-salata',
    label = 'Zbierz sałate',
    icon = 'fas fa-circle',
    onSelect = function()
        zbierzsalate()
    end,
    canInteract = function()
        if przebrany then
            return true
        else
            return false
        end
    end
})

zbierzsalate = function()
    TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
    if lib.progressBar({
        duration = 20000,
        label = 'Zbieranie sałaty',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
            mouse = false,
        },
    }) then 
        ClearPedTasksImmediately(PlayerPedId())
        if exports.ox_inventory:GetItemCount('salata', nil, false) == 6 then
            ESX.ShowNotification('Nie możesz mieć więcej sałaty')
        else
            TriggerServerEvent('sv-rolnik:salata')
        end
    else 
        ClearPedTasksImmediately(PlayerPedId())
        ESX.ShowNotification('Przerwałeś zbieranie sałaty')
    end
end

--Ziemniaki
exports.ox_target:addModel(130917301, {
    name = 'zbieranie-ziemianiki',
    label = 'Zbierz ziemniaki',
    icon = 'fas fa-circle',
    onSelect = function()
        zbierzziemniaki()
    end,
    canInteract = function ()
        if przebrany == true then
            return true
        else
            return false
        end
    end
})

zbierzziemniaki = function()
    TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
    if lib.progressBar({
        duration = 20000,
        label = 'Zbieranie ziemniaków',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
            mouse = false,
        },
    }) then 
        ClearPedTasksImmediately(PlayerPedId())
        if exports.ox_inventory:GetItemCount('ziemniaki', nil, false) == 6 then
            ESX.ShowNotification('Nie możesz mieć więcej sałaty')
            ziemniakizebrane = true
        else
            TriggerServerEvent('sv-rolnik:ziemniaki')
        end
    else 
        ClearPedTasksImmediately(PlayerPedId())
        ESX.ShowNotification('Przerwałeś zbieranie sałaty')
    end
end

--Pomidory
exports.ox_target:addModel(-2031244218, {
    name = 'zbieranie-pomidory',
    label = 'Zbierz pomidory',
    icon = 'fas fa-circle',
    onSelect = function()
        zbierzpomidory()
    end,
    canInteract = function ()
        if przebrany == true then
            return true
        else
            return false
        end
    end
})

zbierzpomidory = function()
    TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
    if lib.progressBar({
        duration = 20000,
        label = 'Zbieranie pomidorów',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
            mouse = false,
        },
    }) then 
        ClearPedTasksImmediately(PlayerPedId())
        if exports.ox_inventory:GetItemCount('pomidory', nil, false) == 6 then
            ESX.ShowNotification('Nie możesz mieć więcej pomidory')
            ziemniakizebrane = true
        else
            TriggerServerEvent('sv-rolnik:pomidory')
        end
    else 
        ClearPedTasksImmediately(PlayerPedId())
        ESX.ShowNotification('Przerwałeś zbieranie pomidorów')
    end
end

-- Skup
Citizen.CreateThread(function()
    RequestModel('a_m_m_hillbilly_01')
    while not HasModelLoaded('a_m_m_hillbilly_01') or not HasCollisionForModelLoaded('a_m_m_hillbilly_01') do
    Wait(1)
end
local typo2 = CreatePed(28, 'a_m_m_hillbilly_01', 159.460, -3110.822, 5.005, 268.765, true, true)
SetEntityAsMissionEntity(typo2, true, true)
SetEntityInvincible(typo2, true)
SetBlockingOfNonTemporaryEvents(typo2, true)
FreezeEntityPosition(typo2, true)
end)

exports.ox_target:addBoxZone({
    coords = vec3(159.460, -3110.822, 6.005),
    size = vec3(1, 1, 2),
    rotation = 35,
    debug = drawZones,
    drawSprite = true,
    options = {
        {
        name = 'skup',
        onSelect = function()
            skup()
        end,
        canInteract = function ()
            if przebrany == true then
                return true
            else
                return false
            end
        end,
        icon = 'fas fa-shop',
        label = 'Sprzedaj warzywa',
        groups = 'rolnik',
        distance = 2,
        }
    }
})

skup = function ()
    local metalCount1 = exports.ox_inventory:GetItemCount('salata', nil, false)
    local metalCount2 = exports.ox_inventory:GetItemCount('ziemniaki', nil, false)
    local metalCount3 = exports.ox_inventory:GetItemCount('pomidory', nil, false)
    if metalCount1 >= 1 and metalCount2 >= 1 and metalCount3 >= 1 then
        if lib.progressBar({
            duration = 10000,
            label = 'Sprzedawanie...',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
                combat = true
            },
            anim = {
                dict = 'mp_common',
                clip = 'givetake1_a'
            }
        }) then
            TriggerServerEvent('sv-rolnik:sprzedaj')
        else
            ESX.ShowNotification('Przestałeś wymieniać części metalowe')
        end
    else
        ESX.ShowNotification('Nie masz nic na wymiane')
    end
end