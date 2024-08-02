local isInMarker, HasAlreadyEnteredMarker = false, false, false, false
local LastZone, CurrentAction, CurrentActionMsg
local ox_inventory = exports.ox_inventory
local CurrentActionData = {}
local hasJob = false
local umyte = false
local test1 = false
local praca = false
local schowaj = false 
local PlayerData = {}





RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
  if ESX.PlayerData.job.name == 'kawiarnia' then
    Job = true
  else
    Job = false
  end
end)

RegisterCommand("nadajpraca", function()
  praca = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
  if ESX.PlayerData.job.name == 'kawiarnia' then
    Job = true
  else
    Job = false
  end
end)

Citizen.CreateThread(function()
    createZones()
end)


-- Auta

AddEventHandler('goat_uwucake:wyciagnijauto', function(auto)
  if schowaj then 
      ESX.ShowNotification("Musisz schować auto, aby wyciągnąć kolejne") return
  end
  if praca then
      if ESX.Game.IsSpawnPointClear(vec3(-596.4231, -1059.0341, 21.3942), 5) then
          ESX.ShowNotification("Wyciągnałęś pojazdu")
          ESX.Game.SpawnVehicle('burrito3', vec3(-596.4231, -1059.0341, 21.3942), 87.41, function(vehicle)
              plate = "UWU " .. math.random(100, 999)
              SetVehicleNumberPlateText(vehicle, plate)
              TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
              schowaj = true 
              exports["goat_carkeys"]:AddKey(plate)
          end)
      end
    else
      exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
  end
end)


AddEventHandler('goat_uwucake:schowajauto', function(auto)
  if praca then
      ESX.ShowNotification("Schowałeś pojazd")
      local vehicle = GetClosestVehicle(-596.4231, -1059.0341, 21.3942, 10.0, 0, 70)
      ESX.Game.DeleteVehicle(vehicle)
      exports["goat_carkeys"]:RemoveKey(plate)
      schowaj = false
  
  end
end)


-- Bossmenu

AddEventHandler('goat_uwucafe:bossmenu', function()
  if ESX.PlayerData.job.grade_name == 'boss' then
      TriggerEvent('esx_society:openBossMenu', 'kawiarnia', function(data, menu)
          menu.close()
      end)
  end
end)

RegisterNetEvent("goat_uwucafe:returnLastSkin", function()
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
      TriggerEvent('skinchanger:loadSkin', skin)
      praca = false 
      exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Zakonczyles prace")
  end)
end)


RegisterNetEvent("goat_uwucafe:openJobClothes", function()

  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
    TriggerEvent('skinchanger:loadSkin', skin)
    praca = false 
  praca = true 
  exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Zaczeles prace , przebierz sie w robocze ciuchy")
end)
end)


-- Blip

CreateThread(function()
	for k,v in pairs(Config.Blips) do
		local blip = AddBlipForCoord(v.coords)
		SetBlipSprite(blip, v.sprite)
		SetBlipDisplay(blip, v.display)
		SetBlipScale(blip, 1.0)
		SetBlipColour(blip, v.color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName("<font face='Poppins-Medium' size='11'>".. v.title .."</font>")
		EndTextCommandSetBlipName(blip)
	end
end)

CreateThread(function()
  if ESX.PlayerData.job.name == 'kawiarnia' then
      for k, v in pairs(Config.Blips1) do
          local blip = AddBlipForCoord(v.coords)
          SetBlipSprite(blip, v.sprite)
          SetBlipDisplay(blip, v.display)
          SetBlipScale(blip, 1.0)
          SetBlipColour(blip, v.color)
          SetBlipAsShortRange(blip, true)

          BeginTextCommandSetBlipName('STRING')
          AddTextComponentSubstringPlayerName("<font face='Poppins-Medium' size='11'>" .. v.title .. "</font>")
          EndTextCommandSetBlipName(blip)
      end
  end
end)

RegisterNetEvent("goat_uwucafe:kasa", function()
    if ESX.UI.Inventory.Area.Check(3.0) then
        ESX.UI.Inventory.Area.Build(3.0, false, false, function(target, _, npc)
            if target then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
                    title = "Podaj kwotę"
                }, function(data, menu)
                    menu.close()
                    if data.value and tonumber(data.value) then
                       ESX.ShowNotification("~y~Oczekiwanie na akceptację przez obywatela")
                       TriggerServerEvent("goat_uwucafe:propozycja", target, data.value)  
                    end
                end, function(data, menu)
                    menu.close()
                end)
            else
                ESX.ShowNotification("~r~Brak obywateli w pobliżu")
            end
        end)
    else
        ESX.ShowNotification("~r~Brak obywateli w pobliżu")
    end
end)


RegisterNetEvent("goat_uwucafe:rachunek", function(target, amount)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dress_menu',{
        title    = 'Czy chcesz zapłacić rachunek $' ..amount,
        align    = 'center',
        elements = {
            {label = "Tak", value = true},
            {label = "Nie", value = false}
        }
    }, function(data, menu)
        menu.close()
        TriggerServerEvent("goat_uwucafe:wystawrachunek", target, amount, data.current.value)
    end, function(data, menu)
        menu.close()
        TriggerServerEvent("goat_uwucafe:wystawrachunek", target, amount, false)
    end)
end)


-- Robienie Kawy

AddEventHandler('goat_uwucafe:makecafe', function()

  if exports.ox_inventory:Search('count', 'coffee') <= 0 then
  local lib, anim = 'mp_prison_break', 'hack_loop'
  ESX.Streaming.RequestAnimDict(lib, function()
    TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
  end)
      kawa = true 
      FreezeEntityPosition(PlayerPedId(), true)
      local status = exports['forge-progress']:StartProg('Robisz kawę', 2000)
      FreezeEntityPosition(PlayerPedId(), false)
      kawa = false 
      ClearPedTasks(PlayerPedId())
      if status then
          TriggerServerEvent('goat_uwucafe:serverTrigger', 'zrobkawe')
      end
    else
      exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
  end
end)

AddEventHandler('goat_uwucafe:zabierasztowar', function()
    if test1 then
        exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Odebrałeś już cały towar")
        return
    end

    if praca and not test1 and not zbieranie and exports.ox_inventory:Search('count', 'towar') <= 0 then
      local lib, anim = 'amb@prop_human_movie_bulb@idle_a', 'idle_b'
    ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
    end)
      zbieranie = true 
      FreezeEntityPosition(PlayerPedId(), true)
      local status = exports['forge-progress']:StartProg('Odbierasz towar', 15000)
      FreezeEntityPosition(PlayerPedId(), false)
      zbieranie = false 
      ClearPedTasks(PlayerPedId())
      if status then
          TriggerServerEvent('goat_uwucafe:serverTrigger', 'zabierasztowar')
          test1 = true 
      end
    else
      exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
  end
end)

AddEventHandler('goat_uwucafe:oddajtowar', function()
  if not zbieranie and exports.ox_inventory:Search('count', 'towar') >= 100 then
    local lib, anim = 'amb@prop_human_movie_bulb@idle_a', 'idle_b'
    ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
    end)
      zbieranie = true 
      FreezeEntityPosition(PlayerPedId(), true)
      local status = exports['forge-progress']:StartProg('Odkładasz towar.', 10000)
      FreezeEntityPosition(PlayerPedId(), false)
      zbieranie = false 
      ClearPedTasks(PlayerPedId())
      if status then
          TriggerServerEvent('goat_uwucafe:serverTrigger', 'towarzabierz')
          test1 = false
      end
    else
      exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
  end
end)

RegisterNetEvent("goat_uwucafe:openstash", function()
    exports.ox_inventory:openInventory('stash', 'uwu_cafe')
end)

RegisterNetEvent("goat_uwucafe:openpapierek", function()
  exports.ox_inventory:openInventory('shop', {type = 'UwuCafe'})
end)

RegisterNetEvent("goat_uwucafe:robieniezestawu", function()
  local hasSkladniki = exports.ox_inventory:Search('count', 'uwucafe_skladniki') > 0
  if not hasSkladniki then
      exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Nie posiadasz składników")
      return
  end

  if praca then 
    if not umyte then
      exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Musisz umyć ręce")
      return
    end
  local lib, anim = 'mp_prison_break', 'hack_loop'
  ESX.Streaming.RequestAnimDict(lib, function()
    TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
  end)

  local status = exports['forge-progress']:StartProg("Robisz ciasto", 5000)
    if status then 
    TriggerServerEvent('goat_uwucafe:serverTrigger', 'robiszciasto')
    ClearPedTasks(PlayerPedId())
    end
  else
    exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
  end
end)

RegisterNetEvent("goat_uwucafe:zabieranieskladnikow", function()
    if praca then 
      if not umyte then
          exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Musisz umyć ręce")
          return
      end
    local lib, anim = 'mp_prison_break', 'hack_loop'
    ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
    end)
    local status = exports['forge-progress']:StartProg("Przygotowujesz składniki", 5000)
      if status then 
        TriggerServerEvent('goat_uwucafe:serverTrigger', 'zbieranieskladnikow')
        ClearPedTasks(PlayerPedId())
      end
    else
      exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
    end
end)

RegisterNetEvent("goat_uwucafe:umyjrece", function()
    if praca then 
    local lib, anim = 'mp_prison_break', 'hack_loop'
    ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
    end)
      local status = exports['forge-progress']:StartProg('Myjesz ręce', 2000)
      if status then 
        umyte = true 
        ClearPedTasks(PlayerPedId())
        exports["goat_notify"]:Notify('success', 'Powiadomienie', "Umyłeś ręce, przygotuj zestawy.")
      end
    else
      exports["goat_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
  end
end)

-- OX TARGET
createZones = function()
  for k,v in pairs(Config.Targets) do
      local zone = {
          coords = v.pos,
          radius = v.radius,
          debug = Config.DevMode,
          options = {}
      }
      for i=1, #v.options do
          zone.options[#zone.options+1] = v.options[i]
      end
      exports.ox_target:addSphereZone(zone)
  end
end