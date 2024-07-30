ESX = exports['es_extended']:getSharedObject()

-- ## THREADS
exports.qtarget:AddTargetModel({'prop_till_01', 'prop_till_03'}, {
    options = {
        {
            event = 'sv-storerobbery:Kasetka',
            icon = "fas fa-cash-register",
            label = "Okradnij kasetkę",
        },
    },
    distance = 2
})

function GetStreetAndZone()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    local street = street1 .. ", " .. zone
    return street
end

function randomId()
    math.randomseed(GetCloudTimeAsInt())
    return string.gsub("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx", "[xy]", function(c)
        return string.format("%x", (c == "x") and math.random(0, 0xf) or math.random(8, 0xb))
    end)
end

RegisterNetEvent('sv-storerobbery:Kasetka')
AddEventHandler('sv-storerobbery:Kasetka', function()
    local success = lib.skillCheck({'easy', 'easy', {areaSize = 70, speedMultiplier = 1}, 'hard'}, {'w', 'a', 's', 'd'})
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local car = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local carname = GetDisplayNameFromVehicleModel(car)
    local kasetka = {
        code = "10-90",
        street = GetStreetAndZone(),
        id = randomId(),
        priority = 1,
        title = "Napad na kasetkę",
        duration = 7000,
        blipname = "# Napad na kasetkę",
        color = 76,
        sprite = 108,
        fadeOut = 100,
        position = {
            x = coords.x,
            y = coords.y,
            z = coords.z
        },
        job = "police"
    }
    TriggerServerEvent("dispatch:svNotify", kasetka)
    if success then
       

        ESX.TriggerServerCallback('sv-storerobbery:CheckTime', function(time)
            if time then
                ESX.TriggerServerCallback('sv-storerobbery:PoliceCount', function(status)
                    if status then
                            if lib.progressBar({
                                duration = 15000,
                                label = 'Zbieranie pieniędzy...',
                                useWhileDead = false,
                                canCancel = true,
                                disable = {
                                    car = true,
                                    move = true,
                                    combat = true,
                                },
                                anim = {
                                    dict = 'oddjobs@shop_robbery@rob_till',
                                    clip = 'loop', 
                                },
                            }) then
                                TriggerServerEvent('sv-storerobbery:Reward', 'cashfull')
                            else
                                TriggerServerEvent('sv-storerobbery:Reward', 'cashhalf')
                                ESX.ShowNotification('Nie zdążyłeś zebrać wszystkich pieniędzy!')
                            end
                        end
                    end)
                end
            end)
        end
    if not success then
        ESX.ShowNotification('Nie udało ci się otworzyć kasetki')
    end
end)