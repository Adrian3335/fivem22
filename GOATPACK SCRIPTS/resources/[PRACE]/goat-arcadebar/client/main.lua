ESX = exports['es_extended']:getSharedObject()
Many = exports['goat-other']
local busy = false

RegisterNetEvent('many-arcadebar:PlayPowerStation')
AddEventHandler('many-arcadebar:PlayPowerStation', function()
    if not busy then
        local input = lib.inputDialog('Wprowadź ilość', {'Ilość'})
        if not input then return end
        local siano = input[1]
        if tonumber(siano) >= 100 and tonumber(siano) <= 2000 then
        if Many:itemCount('money') >= tonumber(siano) then
            busy = true
            Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@maleleft', 'insert_coins', 4000, false)
            Citizen.Wait(3500)
            TriggerServerEvent('many-arcadebar:RemoveMoney', siano)
            Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@maleleft', 'idle', -1, true)
            local success = exports['powerStationHack']:PowerStationHack()
            if success then
                busy = false
                ClearPedTasks(PlayerPedId())
                Wait(100)
                TriggerServerEvent('many-arcadebar:AddMoney', siano*2)
                Many:Notify('inform', 'Wygrałeś '..(siano*2)..'$')
                Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@femaleright', 'win', 3000, false)
            else
                busy = false
                ClearPedTasks(PlayerPedId())
                Wait(100)
                Many:Notify('inform', 'Nie udało ci się wygrać')
                Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@maleleft', 'lose', 3000, false)
            end
        else
            Many:Notify('inform', 'Nie masz wystarczająco pieniędzy!')
        end
    else
        Many:Notify('inform', 'Minimalna kwota wynosi 100$, a maskymalna 2000$!')
    end
    end
end)

CreateThread(function()
	local props122 = {
		'prop_arcade_01',
	}

	exports.qtarget:AddTargetModel(props122, {
		options = {
			{
				event = "many-arcadebar:PlayPowerStation",
				icon = "fas fa-users",
				label = "Zagraj",
				num = 1
			},
					},
		
		distance = 5,
	})


local konsola = { 'prop_arcade_01'}
end)
RegisterNetEvent('many-arcadebar:PlayMemoryCard')
AddEventHandler('many-arcadebar:PlayMemoryCard', function()
    if not busy then
        local input = lib.inputDialog('Wprowadź ilość', {'Ilość'})
        if not input then return end
        local siano = input[1]
        if tonumber(siano) >= 500 and tonumber(siano) <= 3000 then
        if Many:itemCount('money') >= tonumber(siano) then
            busy = true
            Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@maleleft', 'insert_coins', 4000, false)
            Citizen.Wait(3500)
            TriggerServerEvent('many-arcadebar:RemoveMoney', siano)
            Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@maleleft', 'idle', -1, true)
            local success = exports['memoryCardHack']:MemoryCardHack()
            if success then
                busy = false
                ClearPedTasks(PlayerPedId())
                Wait(100)
                TriggerServerEvent('many-arcadebar:AddMoney', siano*2.5)
                Many:Notify('inform', 'Wygrałeś '..(siano*2.5)..'$')
                Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@femaleright', 'win', 3000, false)
            else
                busy = false
                ClearPedTasks(PlayerPedId())
                Wait(100)
                Many:Notify('inform', 'Nie udało ci się wygrać')
                Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@maleleft', 'lose', 3000, false)
            end
        else
            Many:Notify('inform', 'Nie masz wystarczająco pieniędzy!')
        end
    else
        Many:Notify('inform', 'Minimalna kwota wynosi 500$, a maskymalna 3000$!')
    end
    end
end)

exports.qtarget:AddTargetModel({-331391016}, {
	options = {
        {
            event = "many-arcadebar:PlayMemoryCard",
            icon = "fas fa-coins",
            label = 'Zagraj',
          },
	},
	distance = 2
})

RegisterNetEvent('many-arcadebar:PlayMovingBlocks')
AddEventHandler('many-arcadebar:PlayMovingBlocks', function()
    if not busy then
        local input = lib.inputDialog('Wprowadź ilość', {'Ilość'})
        if not input then return end
        local siano = input[1]
        if tonumber(siano) >= 500 and tonumber(siano) <= 3000 then
        if Many:itemCount('money') >= tonumber(siano) then
            busy = true
            Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@maleleft', 'insert_coins', 4000, false)
            Citizen.Wait(3500)
            TriggerServerEvent('many-arcadebar:RemoveMoney', siano)
            Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@maleleft', 'idle', -1, true)
            exports['many_lib']:VarHack(function(success)
                if success then
                    busy = false
                    ClearPedTasks(PlayerPedId())
                    Wait(100)
                    TriggerServerEvent('many-arcadebar:AddMoney', siano*2.5)
                    Many:Notify('inform', 'Wygrałeś '..(siano*2.5)..'$')
                    Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@femaleright', 'win', 3000, false)
                else
                    busy = false
                    ClearPedTasks(PlayerPedId())
                    Wait(100)
                    Many:Notify('inform', 'Nie udało ci się wygrać')
                    Many:playAnim(PlayerPedId(), 'anim_casino_a@amb@casino@games@arcadecabinet@maleleft', 'lose', 3000, false)
                end
            end, 5, 10)
        else
            Many:Notify('inform', 'Nie masz wystarczająco pieniędzy!')
        end
    else
        Many:Notify('inform', 'Minimalna kwota wynosi 500$, a maskymalna 3000$!')
    end
    end
end)

exports.qtarget:AddTargetModel({-969961435}, {
	options = {
        {
            event = "many-arcadebar:PlayMovingBlocks",
            icon = "fas fa-coins",
            label = 'Zagraj',
          },
	},
	distance = 2
})

--[[

# MAGAZYN I TACE

]]

exports['qtarget']:AddBoxZone("ArcadeStorage", vector3(-1293.0728, -297.3340, 36.0508), 1.3, 0.7, {
	name="ArcadeStorage",
	heading=0,
	--debugPoly=false,
	minZ=22.07,
	maxZ=22.87,
	}, {
		options = {
			{
				action = function()
                    exports.ox_inventory:openInventory('stash', 'arcade_storage')
                end,
				icon = "fas fa-box",
				label = "Otwórz Magazyn",
			},
		},
		distance = 1.5
})

exports['qtarget']:AddBoxZone("ArcadeTray", vector3(-1288.7563, -296.3918, 36.0508), 0.7, 0.7, {
	name="ArcadeTray",
	heading=0,
	debugPoly=false,
	minZ=22.0,
	maxZ=22.97,
	}, {
		options = {
			{
				action = function()
                    exports.ox_inventory:openInventory('stash', 'arcade_tray')
                end,
				icon = "fas fa-inbox",
				label = "Otwórz Tace",
			},
		},
		distance = 2.0
})


exports['qtarget']:AddBoxZone("Arcadegra", vector3(-1286.96, -301.56, 36.05), 2.6, 2.6, {
	name="Arcadegra",
	heading=295,
	debugPoly=false,
	minZ=22.0,
	maxZ=22.97,
	}, {
		options = {
			{
				event = 'many-arcadebar:PlayPowerStation',
				icon = "fas fa-coins",
				label = "Zagraj",
			},
		},
		distance = 2.0
})

exports['qtarget']:AddBoxZone("Arcadegra2", vector3(-1275.3901, -299.0442, 36.0508), 2, 2, {
	name="Arcadegra2",
	heading=295,
	debugPoly=false,
	minZ=22.0,
	maxZ=22.97,
	}, {
		options = {
			{
				event = 'many-arcadebar:PlayMemoryCard',
				icon = "fas fa-coins",
				label = "Zagraj",
			},
		},
		distance = 2.0
})


local rachunek = 0
local wystawione = false
RegisterNetEvent('many-arcadebar:Fakturka')
AddEventHandler('many-arcadebar:Fakturka', function()
	local input = lib.inputDialog('Faktura', {'Kwota'})
	if not input or input[1] == 0 then return end
	rachunek = input[1]
	Many:Notify('inform', 'Wystawiono rachunek w wysokości '..rachunek..'$')
    wystawione = true
    
    while wystawione do
        Wait(300)
        if rachunek == 0 then
            wystawione = false
            Many:Notify('inform', 'Opłacono Fakture na kasie')
            break
        end
    end
end)

RegisterNetEvent('many-arcadebar:PayFaktura')
AddEventHandler('many-arcadebar:PayFaktura', function()
	if rachunek ~= 0 then
		local dialog = lib.alertDialog({
			header = 'Rachunek',
			content = 'Opłać fakture w wysokości '..rachunek..'$',
			centered = true,
			cancel = true
		})
		if dialog ~= "confirm" then return end
        if Many:itemCount('money') >= tonumber(rachunek) then
		Many:Notify('inform', 'Opłaciłeś fakture na '..rachunek..'$')
        TriggerServerEvent('many-arcadebar:RemoveMoney', rachunek)
		rachunek = 0
        else
            Many:Notify('inform', 'Nie masz wystarczająco pieniędzy!')
        end
	else
		Many:Notify('inform', 'Nie ma ustawionej faktury!')
	end
end)

exports['qtarget']:AddBoxZone("ArcadeTrayBill", vector3(-1288.7563, -296.3918, 36.0508), 1, 1, {
	name="ArcadeTrayBill",
	heading=0,
	--debugPoly=false,
	minZ=22.07,
	maxZ=22.97,
	}, {
		options = {
			{
				event = 'many-arcadebar:Fakturka',
				icon = "fas fa-cash-register",
				label = "Wystaw Fakture",
                job = 'arcade'
			},
            {
				event = 'many-arcadebar:PayFaktura',
				icon = "fas fa-cash-register",
				label = "Opłać Fakture",
			},
		},
		distance = 2.5
})

--[[

# JEDZENIE/PICIE

]]

local Model = nil
local Components = nil
local Props = nil

RegisterNetEvent('many-arcadebar:Animal')
AddEventHandler('many-arcadebar:Animal', function()
    Model = exports['fivem-appearance']:getPedModel(GetPlayerPed(-1))
    Components = exports['fivem-appearance']:getPedComponents(GetPlayerPed(-1))
    Props = exports['fivem-appearance']:getPedProps(GetPlayerPed(-1))
    Citizen.Wait(100)
    exports['fivem-appearance']:setPlayerModel(RandomAnimal())
    print(Model, Props, Components)
    Citizen.Wait(35000)
    exports['fivem-appearance']:setPlayerModel(Model)
    exports['fivem-appearance']:setPedProps(GetPlayerPed(-1), Props)
    exports['fivem-appearance']:setPedComponents(GetPlayerPed(-1), Components)
end)

Animals = {
    'a_c_boar',
    'a_c_chop',
    'a_c_chimp',
    'a_c_westy',
    'a_c_shepherd',
    'a_c_poodle',
    'a_c_pug',
    'a_c_pig',
    'a_c_rabbit_01',
    'a_c_husky'
}

function RandomAnimal()
    return Animals[math.random(#Animals)]
end

RegisterNetEvent('many-arcadebar:RandomPos')
AddEventHandler('many-arcadebar:RandomPos', function()
    local random = math.random(1, 5)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(PlayerPedId(), true)
    SetPedIsDrunk(PlayerPedId(), true)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'tep.ogg', 1.0)
    SetRunSprintMultiplierForPlayer(PlayerPedId(), 1.3)
    RequestAnimSet("move_m@hipster@a")

    while not HasAnimSetLoaded("move_m@hipster@a") do
        Citizen.Wait(0)
    end

    SetPedMovementClipset(PlayerPedId(), "move_m@hipster@a", true)
    DoScreenFadeOut(500)
    DoScreenFadeIn(500)
    if random == 1 then
    SetEntityCoords(PlayerPedId(), 1062.6570, 66.2328, 81.8904)
    elseif random == 2 then
        SetEntityCoords(PlayerPedId(), 938.1642, 10.3880, 124.4987)
    elseif random == 3 then
        SetEntityCoords(PlayerPedId(), 938.1642, 10.3880, 124.4987)
    elseif random == 4 then
        SetEntityCoords(PlayerPedId(), 769.9509, -147.6792, 88.5072)
    elseif random == 5 then
        SetEntityCoords(PlayerPedId(), 543.0272, -139.7430, 74.3645)
    end
    Citizen.Wait(15000)
    SetPedMotionBlur(PlayerPedId(), false)
    SetPedIsDrunk(PlayerPedId(), false)
    ClearTimecycleModifier()
    SetRunSprintMultiplierForPlayer(PlayerPedId(), 1.0)
    ResetPedMovementClipset(PlayerPedId(), 0.0)
end)

local HeistDrink = false
RegisterNetEvent('many-arcadebar:HeistDrink')
AddEventHandler('many-arcadebar:HeistDrink', function()
    HeistDrink = true
    Many:Notify('inform', 'Wypiłeś Heist Drink, czas działania wynosi 1min 30 sek!')
    Citizen.Wait(90000)
    HeistDrink = false
    Many:Notify('inform', 'Czas działania Heist Drinka się zakończył')
end)

function GetHeistDrink()
    return HeistDrink
end

exports('GetHeistDrink', GetHeistDrink)