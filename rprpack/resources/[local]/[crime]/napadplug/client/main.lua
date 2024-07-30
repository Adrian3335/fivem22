ESX = exports["es_extended"]:getSharedObject()

plate = "PLUG"

RegisterNetEvent('startcall:plug')
AddEventHandler('startcall:plug', function()
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 4.0, 'plugtest', 0.3)
    if lib.progressBar({
        duration = 12000,
        label = 'Dzwonienie do pluga',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = false,
        },
        anim = {
            dict = 'cellphone@',
            clip = 'cellphone_call_listen_base'
        },
        prop = {
            bone = '58868',
            model = `prop_phone_ing_03`,
            pos = vec3(0.01, 0.01, 0.01),
            rot = vec3(0.0, 0.0, -1.5)

        },
    }) then 
        blip_plug()
        ESX.ShowNotification("Na mapie ukazała ci się lokalizacja pluga. Jedź i go okradnij, masz 10 minut!")
        spawn_plug_car()
        spawn_plug_ped()
    end
end)


function blip_plug()
    local blip = AddBlipForCoord(-1133.7321, -1985.9015, 13.1664)

    SetBlipSprite(blip, 66)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 1)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName("Plug")
    EndTextCommandSetBlipName(blip)


    Citizen.CreateThread(function()
        Citizen.Wait(10000)
        RemoveBlip(blip)
    end)
end

function spawn_plug_car()
    ESX.Game.SpawnVehicle('buffalo4', vector3(-1133.7321, -1985.9015, 13.1664), -100.4182, function(vehicle)
        SetVehicleNumberPlateText(vehicle, plate)
    end)
    TriggerServerEvent("addtocar")
end

function spawn_plug_ped()
    RequestModel(GetHashKey("g_m_y_ballaorig_01"))
    while not HasModelLoaded(GetHashKey("g_m_y_ballaorig_01")) do
        Wait(155)
    end
    while CreatePed == nil do
        Citizen.Wait(100)
    end
    local ped = CreatePed(4, GetHashKey("g_m_y_ballaorig_01"), -1131.1155, -1985.0596, 12.1660, 303.2204, false, true)
    FreezeEntityPosition(ped, false)
    SetEntityInvincible(ped, false)
    SetBlockingOfNonTemporaryEvents(ped, false)
    GiveWeaponToPed(ped, GetHashKey("weapon_pistol"), 100, false, true)
    SetPedWeaponSlot(ped, 0)
    TaskCombatPed(ped, PlayerPedId(), 0, 16)
end