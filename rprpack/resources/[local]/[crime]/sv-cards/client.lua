ESX = exports.es_extended.getSharedObject()

-- Kup info
local ped = 'a_m_m_og_boss_01'

Citizen.CreateThread(function()
    RequestModel(ped)
    while not HasModelLoaded(ped) or not HasCollisionForModelLoaded(ped) do
    Wait(1)
end

    typo = CreatePed(28, ped, 277.0372, -1746.403, 28.56611, 6.02, true, true)
    SetEntityAsMissionEntity(typo, true, true)
    SetEntityInvincible(typo, true)
    SetBlockingOfNonTemporaryEvents(typo, true)
    FreezeEntityPosition(typo, true)
end)

exports.qtarget:AddBoxZone("pedal1", vector3(276.89, -1746.2, 29.45), 1.2, 1, {
	name="pedal1",
	heading=100.0,
	debugPoly=false,
	minZ=28.77834,
	maxZ=30.87834,
	}, {
		options = {
			{
				action = function()
                    kupInfo()
                end,
				icon = "fas fa-credit-card",
				label = "Kup informacje",
			},
		},
		distance = 1.5
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

function kupInfo()
    ESX.TriggerServerCallback('sv-cards:stacgo', function(hasitem)
        if hasitem then
            ESX.ShowNotification('Kupiłeś info')
            TriggerServerEvent('sv-cards:removeitem', 'money', 3500)
            TriggerServerEvent('sv-cards:additem', 'danekarta', 1)
            TriggerServerEvent('sv-cards:additem', 'pustakarta', 1)
        else
            ESX.ShowNotification('Nie stać cię')
        end
    end)
end

-- Tworzenie karty

exports.qtarget:AddBoxZone("pedal2", vector3(571.8, -3123.86, 18.78), 0.5, 0.5, {
	name="pedal2",
	heading=0.0,
	debugPoly=false,
	minZ=4.77834,
	maxZ=6.87834,
	}, {
		options = {
			{
				action = function()
                    laptok()
                end,
				icon = "fas fa-credit-card",
				label = "Uruchom laptopa",
			},
		},
		distance = 1.5
})

function laptok()
    ESX.TriggerServerCallback('sv-cards:itemylaptok', function(hasitem)
        if hasitem then
            ESX.ShowNotification('Uruchamianie laptopa')
            local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 0.5}, 'easy'}, {'1', '2', '3', '4', '5'})

            if success then
                print('success')
                if lib.progressCircle({
                    duration = 3500,
                    label = 'Uruchamianie laptopa',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                        movement = true,
                        mouse = false,
                        combat = true,
                    },
                }) 
                then 
                    --print('Do stuff when complete')
                    TriggerEvent("utk_fingerprint:Start", 4, 6, 2, function(outcome, reason)
                        if outcome == true then
                            --print("Succeed")
                            TriggerServerEvent('sv-cards:removeitem', 'pustakarta', 1)
                            TriggerServerEvent('sv-cards:removeitem', 'danekarta', 1)
                            TriggerServerEvent('sv-cards:additem', 'fakekarta', 1)
                        elseif outcome == false then
                            --print("Failed. Reason: "..reason)
                        end
                    end)
                else 
                    ESX.ShowNotification('Przerwano')
                end
            else
                print("successn't")
            end
        else
            ESX.ShowNotification('Nie masz wszystkich wymaganych przedmiotów')
        end
    end)
end

--Wymienianie karty na kase

local dajbrudne = false --Czy z bankomatu ma być dawana brudna kasa

local bankomaty = {
    -870868698,
    -1126237515,
    -1364697528,
    506770882
}

exports.qtarget:AddTargetModel(bankomaty, {
	options = {
		{
			action = function()
                bankomaty()
            end,
			icon = "fas fa-box-circle-check",
			label = "Użyj karty kredytowej",
            item = 'fakekarta'
		},
	},
	distance = 1.5
})

function bankomaty()
    local coords = GetEntityCoords(GetPlayerPed(-1))
    local karta = {
        code = "10-90",
        street = GetStreetAndZone(),
        id = randomId(),
        priority = 1,
        title = "Podejrzana aktywnosc w bankomacie",
        duration = 7000,
        blipname = "# Podejrzany bankomat",
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

    if lib.progressCircle({
        duration = 2000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            movement = true,
            mouse = false,
            combat = true,
            },
        anim = {
            dict = 'anim@amb@prop_human_atm@interior@male@enter',
            clip = 'enter'
        },
    }) 
    then
        TriggerServerEvent("dispatch:svNotify", karta)  
        TriggerServerEvent('sv-cards:removeitem', 'fakekarta', 1)
        if dajbrudne == true then
            
            TriggerServerEvent('sv-cards:additem', 'black_money', math.random(1000,5000))
        elseif dajbrudne == false then
            TriggerServerEvent('sv-cards:additem', 'money', math.random(1000,5000))
        end
    end
end