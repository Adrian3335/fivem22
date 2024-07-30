local isInMarker, HasAlreadyEnteredMarker = false, false, false, false
local LastZone, CurrentAction, CurrentActionMsg
local CurrentActionData = {}
local hasJob = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
  if ESX.PlayerData.job.name == 'doj' then
    Job = true
  else
    Job = false
  end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
  if ESX.PlayerData.job.name == 'doj' then
    Job = true
  else
    Job = false
  end
end)

Citizen.CreateThread(function()
    createZones()
end)

-- Stash

AddEventHandler("dbl_dojjob:dokumenty", function()
  if ESX.PlayerData.job.name == 'doj' then
      exports.ox_inventory:openInventory('stash', 'society_doj_dokumenty')
  end
end)

-- Bossmenu


RegisterNetEvent("dbl_dojjob:openBossMenu", function()
  ESX.TriggerServerCallback("esx_society:isBoss", function(cb) 
      if cb then
          TriggerEvent('esx_society:openBossMenu', 'doj', function(data, menu)
      menu.close()
    end)
      else
          ESX.ShowNotification("Nie posiadasz uprawnień!")
      end
  end, "doj")
end)

-- Clothes

RegisterNetEvent("dbl_dojjob:openClothesShop", function()
  exports["dbl_multichar"]:openShopMenu(nil, nil, "clothes", "Konfigurator", "Dostosuj ubiór swojej postaci.")
end)

RegisterNetEvent("dbl_dojjob:returnLastSkin", function()
  local lib, anim = 'mp_safehouseshower@male@', 'male_shower_towel_dry_to_get_dressed'
  ESX.Streaming.RequestAnimDict(lib, function()
      TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 5000, 0, 0.0, false, false, false)
  end)
  Citizen.Wait(5000)
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
      TriggerEvent('skinchanger:loadSkin', skin)
  end)
end)


RegisterNetEvent("dbl_dojjob:openJobClothes", function()
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


-- Dzwonek

wait = false
AddEventHandler('dbl_dojjob:dzwonek', function()
    if not wait then
        ESX.ShowNotification('Wysłano zgłoszenie do pracowników')
        TriggerServerEvent('dbl_dojjob:call')
        wait = true
        Wait(10000)
        wait = false
    else
        ESX.ShowNotification('Nie możesz używać dzwonka cały czas')
    end
end)

-- Blip

CreateThread(function()
	for k,v in pairs(Config.Blips) do
		local blip = AddBlipForCoord(v.coords)
		SetBlipSprite(blip, v.sprite)
		SetBlipDisplay(blip, v.display)
		SetBlipScale(blip, 0.9)
		SetBlipColour(blip, v.color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName("<font face='Poppins-Medium' size='11'>".. v.title .."</font>")
		EndTextCommandSetBlipName(blip)
	end
end)

createZones = function()
  for k,v in pairs(Config.Targets) do
      local zone = {
          coords = v.pos,
          radius = v.radius,
          debug = Config.DevMode,
          options = {}
      }

      for i=1, #v.options do
          zone.options[#zone.options+1] = {
              event = v.options[i].event,
              icon = v.options[i].icon,
              label = v.options[i].label,
              groups = v.options[i].groups,
          }
      end
      exports.ox_target:addSphereZone(zone)
  end
end