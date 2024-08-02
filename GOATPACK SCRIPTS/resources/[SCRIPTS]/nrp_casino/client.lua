ESX = exports["es_extended"]:getSharedObject()

local PlayerData                = {}
local open 						= false

Citizen.CreateThread(function()
    while not ESX.IsPlayerLoaded() do 
        Citizen.Wait(500)
    end
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-1829.582, -1195.926, 13.308)
    SetBlipSprite(blip, 468)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 5)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("<font face='Poppins-Medium' size= '11'>Kasyno</font>" )
    EndTextCommandSetBlipName(blip)
    exports['goat_base']:SetBlip(blip, 'Casino')
end)

Citizen.CreateThread(function()
    exports.qtarget:AddBoxZone("3223786", vector3(-1821.75, -1201.23, 13.31), 1.0, 3.0, {
        name = "3223786",
        heading = 150,
        minZ = 10.91,
  		maxZ = 13.91
    }, {
        options = {
            {
                event = "Alanek:ejamozekupiezetony",
                icon = "fa-light fa-cookie",
                label = "Zakup żetony",
            },
        },
        distance = 1.5
    })
end)

RegisterNetEvent('Alanek:ejamozekupiezetony', function()
    OtworzMenuKasyna()
end)

function OtworzMenuKasyna()
    local coords = GetEntityCoords(PlayerPedId())
    CreateThread(function()
        while true do
            Wait(0)
            if #(GetEntityCoords(PlayerPedId()) - coords) >= 3.0 then
                ESX.UI.Menu.CloseAll()
                break
            end
        end
    end)
	ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'zetony',
      {
          title    = 'Diamond Casino - Kasa',
          align    = 'left',
          elements = {
			{label = "Kup żetony  1szt/10$", value = "buy"},
			{label = "Wymień żetony 1szt/9$", value = "sell"},
		  }
      },
	  function(data, menu)
		local akcja = data.current.value
		if akcja == 'buy' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'get_item_count', {
				title = 'Ilość '
			}, function(data2, menu2)

				local quantity = tonumber(data2.value)

				if quantity == nil then
					ESX.ShowNotification("Nieprawidłowa kwota")
				else
					TriggerServerEvent('route68_kasyno:KupZetony', quantity)
					menu2.close()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		elseif akcja == 'sell' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
				title = 'Ilość '
			}, function(data2, menu2)

				local quantity = tonumber(data2.value)

				if quantity == nil then
					ESX.ShowNotification("Nieprawidłowa kwota")
				else
					TriggerServerEvent('route68_kasyno:WymienZetony', quantity)
					menu2.close()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		end
      end,
      function(data, menu)
		menu.close()
	  end)
end

local function drawHint(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNUICallback('wygrana', function(data)
	ESX.ShowNotification("Wygrałeś/aś "..data.win.." żetonów!")
end)


RegisterNUICallback('updateBets', function(data)
	TriggerServerEvent('esx_slots:updateCoins', data.bets)
end)

function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

RegisterNetEvent("esx_slots:UpdateSlots")
AddEventHandler("esx_slots:UpdateSlots", function(lei)
	TriggerEvent('route68_chatMenu:FocusActive', true)
	SetNuiFocus(true, true)
	open = true
	SendNUIMessage({
		showPacanele = "open",
		coinAmount = tonumber(lei)
	})
end)

RegisterNUICallback('exitWith', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
	TriggerEvent('route68_chatMenu:FocusActive', false)
	open = false
	TriggerServerEvent("esx_slots:PayOutRewards", math.floor(data.coinAmount))
end)


Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(1)
		if open then
			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisableControlAction(0, 24, true) -- Attack
			DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		end
	end
end)

Citizen.CreateThread(function()
    exports.qtarget:AddBoxZone("32", vector3(-1821.76, -1193.27, 13.31), 2.4, 1.2, {
        name="1",
        heading=330,
        minZ=10.31,
        maxZ=13.31
    }, {
        options = {
            {
                event = "route68_ruletka:start",
                icon = "fa-light fa-cookie",
                label = "zagraj na ruletce",
            },
        },
        distance = 1.5
    })
end)


RegisterNetEvent('Alanek:ejzaczynamgracslotymoze', function()
    TriggerServerEvent('esx_slots:BetsAndMoney')
end) 

local coordonate = {
    {1088.1, 221.11, -49.21, nil, 185.5, nil, 1535236204},
    {1100.61, 195.55, -49.45, nil, 316.5, nil, -1371020112},
	
    {1134.33, 267.23, -51.04, nil, 135.5, nil, -245247470},
	{1128.82, 261.75, -51.04, nil, 321.5, nil, 691061163},

	{1143.83, 246.72, -51.04, nil, 320.5, nil, -886023758},
	{1149.33, 252.24, -51.04, nil, 138.5, nil, -1922568579},
	
	{1149.48, 269.11, -51.85, nil, 49.5, nil, -886023758},
	{1151.25, 267.3, -51.85, nil, 227.5, nil, 469792763},
	
	{1143.89, 263.71, -51.85, nil, 45.5, nil, 999748158},
	{1145.77, 261.883, -51.85, nil, 222.5, nil, -254493138},
}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(v[7])
      while not HasModelLoaded(v[7]) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end

end)

local heading = 254.5
local vehicle = nil

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1099.84, 219.86, -49.38, true) < 40 then
			if DoesEntityExist(vehicle) == false then
				RequestModel(GetHashKey('18performante'))
				while not HasModelLoaded(GetHashKey('18performante')) do
					Wait(1)
				end
				vehicle = CreateVehicle(GetHashKey('18performante'), 1099.84, 219.86, -49.38, heading, false, false)
				FreezeEntityPosition(vehicle, true)
				SetEntityInvincible(vehicle, true)
				SetEntityCoords(vehicle, 1099.84, 219.86, -49.38, false, false, false, true)
				local props = ESX.Game.GetVehicleProperties(vehicle)
				props['wheelColor'] = 147
				props['plate'] = "DIAMONDS"
				ESX.Game.SetVehicleProperties(vehicle, props)
			else
				SetEntityHeading(vehicle, heading)
				heading = heading+0.1
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if vehicle ~= nil and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed-1), 1099.84, 219.86, -49.38, true) < 40 then
			SetEntityCoords(vehicle, 1099.84, 219.86, -49.38, false, false, false, true)
		end
	end
end)