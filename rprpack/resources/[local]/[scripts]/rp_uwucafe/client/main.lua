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

exports['rp_base']:SpawnPed("dbl_uwucafe:spawnvehicle", 'ig_trafficwarden', vec4(-592.9047, -1061.2837, 21.3942, 76.63818359375), {
  FreezeEntityPosition = true,
  SetEntityInvincible = true,
  SetBlockingOfNonTemporaryEvents = true, 
}, false, false)



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

AddEventHandler('dbl_uwucake:wyciagnijauto', function(auto)
  if schowaj then 
      ESX.ShowNotification("Musisz schować auto, aby wyciągnąć kolejne") return
  end
  if praca then
      if ESX.Game.IsSpawnPointClear(vec3(-596.4231, -1059.0341, 21.3942), 5) then
          ESX.ShowNotification("Wyciągnałęś pojazdu")
          ESX.Game.SpawnVehicle('rumpo', vec3(-596.4231, -1059.0341, 21.3942), 87.41, function(vehicle)
              plate = "UWU " .. math.random(100, 999)
              SetVehicleNumberPlateText(vehicle, plate)
              TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
              schowaj = true 
              exports["sv-carkeys"]:addKey(plate)
          end)
      end
  else
      exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Musisz rozpocząć pracę.")
  end
end)


AddEventHandler('dbl_uwucake:schowajauto', function(auto)
  if praca then
      ESX.ShowNotification("Schowałeś pojazd")
      local vehicle = GetClosestVehicle(-596.4231, -1059.0341, 21.3942, 10.0, 0, 70)
      ESX.Game.DeleteVehicle(vehicle)
      exports["sv-carkeys"]:removeKey(plate)
      schowaj = false
  else
      exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Musisz rozpocząć pracę.")
  end
end)


-- Bossmenu

AddEventHandler('dbl_uwucafe:bossmenu', function()
  if ESX.PlayerData.job.grade_name == 'boss' then
      TriggerEvent('esx_society:openBossMenu', 'kawiarnia', function(data, menu)
          menu.close()
      end)
  end
end)

RegisterNetEvent("dbl_uwucafe:returnLastSkin", function()
  local lib, anim = 'mp_safehouseshower@male@', 'male_shower_towel_dry_to_get_dressed'
  ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
  end)
  Citizen.Wait(5000)
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
      TriggerEvent('skinchanger:loadSkin', skin)
      praca = false 
  end)
end)


RegisterNetEvent("dbl_uwucafe:openJobClothes", function()
  local Uniform = ESX.PlayerData.job.grade
  if not Config.Uniforms[Uniform] then
      return ESX.ShowNotification("Brak stroju")
  end
  local lib, anim = 'mp_safehouseshower@male@', 'male_shower_towel_dry_to_get_dressed'
  ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
  end)
  Citizen.Wait(5000)
  TriggerEvent('skinchanger:getSkin', function(skin)
  praca = true 
  local uniformObject
  
  if skin.sex == 0 then
    uniformObject = Config.Uniforms[Uniform].male
  else
    uniformObject = Config.Uniforms[Uniform].female
  end
  
  if uniformObject then
    TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
  end
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

RegisterNetEvent("dbl_uwucafe:kasa", function()
  if ESX and ESX.UI and ESX.UI.Inventory and ESX.UI.Inventory.Area.Check(3.0) then
      ESX.UI.Inventory.Area.Build(3.0, false, false, function(target, _, npc)
          if target then
              ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
                  title = "Podaj kwotę"
              }, function(data, menu)
                  menu.close()
                  if data.value and tonumber(data.value) then
                      ESX.ShowNotification("~y~Oczekiwanie na akceptację przez obywatela")
                      TriggerServerEvent("dbl_uwucafe:propozycja", target, data.value)  
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



RegisterNetEvent("dbl_uwucafe:rachunek", function(target, amount)
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dress_menu',{
        title    = 'Czy chcesz zapłacić rachunek $' ..amount,
        align    = 'center',
        elements = {
            {label = "Tak", value = true},
            {label = "Nie", value = false}
        }
    }, function(data, menu)
        menu.close()
        TriggerServerEvent("dbl_uwucafe:wystawrachunek", target, amount, data.current.value)
    end, function(data, menu)
        menu.close()
        TriggerServerEvent("dbl_uwucafe:wystawrachunek", target, amount, false)
    end)
end)


-- Robienie Kawy

AddEventHandler('dbl_uwucafe:makecafe', function()

  if exports.ox_inventory:Search('count', 'coffee') <= 0 then
  local lib, anim = 'mp_prison_break', 'hack_loop'
  ESX.Streaming.RequestAnimDict(lib, function()
    TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
  end)
      kawa = true 
      FreezeEntityPosition(PlayerPedId(), true)
      local status = exports['rp_ui']:Progbar('Robisz kawę', 2000)
      FreezeEntityPosition(PlayerPedId(), false)
      kawa = false 
      ClearPedTasks(PlayerPedId())
      if status then
          TriggerServerEvent('dbl_uwucafe:serverTrigger', 'zrobkawe')
      end
  else
      exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
  end
end)

AddEventHandler('dbl_uwucafe:zabierasztowar', function()
    if test1 then
        exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Odebrałeś już cały towar")
        return
    end

    if praca and not test1 and not zbieranie and exports.ox_inventory:Search('count', 'towar') <= 0 then
      local lib, anim = 'amb@prop_human_movie_bulb@idle_a', 'idle_b'
    ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
    end)
      zbieranie = true 
      FreezeEntityPosition(PlayerPedId(), true)
      local status = exports['rp_ui']:Progbar('Odbierasz towar', 15000)
      FreezeEntityPosition(PlayerPedId(), false)
      zbieranie = false 
      ClearPedTasks(PlayerPedId())
      if status then
          TriggerServerEvent('dbl_uwucafe:serverTrigger', 'zabierasztowar')
          test1 = true 
      end
  else
      exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
  end
end)

AddEventHandler('dbl_uwucafe:oddajtowar', function()
  if not zbieranie and exports.ox_inventory:Search('count', 'towar') >= 100 then
    local lib, anim = 'amb@prop_human_movie_bulb@idle_a', 'idle_b'
    ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
    end)
      zbieranie = true 
      FreezeEntityPosition(PlayerPedId(), true)
      local status = exports['rp_ui']:Progbar('Odkładasz towar.', 10000)
      FreezeEntityPosition(PlayerPedId(), false)
      zbieranie = false 
      ClearPedTasks(PlayerPedId())
      if status then
          TriggerServerEvent('dbl_uwucafe:serverTrigger', 'towarzabierz')
          test1 = false
      end
  else
      exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
  end
end)

RegisterNetEvent("dbl_uwucafe:openstash", function()
    exports.ox_inventory:openInventory('stash', 'uwu_cafe')
end)

RegisterNetEvent("dbl_uwucafe:openpapierek", function()
  exports.ox_inventory:openInventory('shop', {type = 'UwuCafe'})
end)

RegisterNetEvent("dbl_uwucafe:robieniezestawu", function()
  local hasSkladniki = exports.ox_inventory:Search('count', 'uwucafe_skladniki') > 0
  if not hasSkladniki then
      exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Nie posiadasz składników")
      return
  end

  if praca then 
    if not umyte then
      exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Musisz umyć ręce")
      return
    end
  local lib, anim = 'mp_prison_break', 'hack_loop'
  ESX.Streaming.RequestAnimDict(lib, function()
    TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
  end)

  local status = exports['rp_ui']:Progbar("Robisz ciasto", 5000)
    if status then 
    TriggerServerEvent('dbl_uwucafe:serverTrigger', 'robiszciasto')
    ClearPedTasks(PlayerPedId())
    end
  else 
  exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
  end
end)

RegisterNetEvent("dbl_uwucafe:zabieranieskladnikow", function()
    if praca then 
      if not umyte then
          exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Musisz umyć ręce")
          return
      end
    local lib, anim = 'mp_prison_break', 'hack_loop'
    ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
    end)
    local status = exports['rp_ui']:Progbar("Przygotowujesz składniki", 5000)
      if status then 
        TriggerServerEvent('dbl_uwucafe:serverTrigger', 'zbieranieskladnikow')
        ClearPedTasks(PlayerPedId())
      end
    else 
      exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
    end
end)

RegisterNetEvent("dbl_uwucafe:umyjrece", function()
    if praca then 
    local lib, anim = 'mp_prison_break', 'hack_loop'
    ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
    end)
      local status = exports['rp_ui']:Progbar('Myjesz ręce', 2000)
      if status then 
        umyte = true 
        ClearPedTasks(PlayerPedId())
        exports["rp_notify"]:Notify('success', 'Powiadomienie', "Umyłeś ręce, przygotuj zestawy.")
      end
  else
      exports["rp_notify"]:Notify('warning', 'Powiadomienie', "Nie możesz tego zrobić.")
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