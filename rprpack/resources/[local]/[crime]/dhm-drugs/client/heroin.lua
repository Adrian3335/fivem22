ESX = nil 
Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports['es_extended']:getSharedObject()
        Citizen.Wait(1)
    end
end)

heroinplant = {}
createdheroin = {}
spawnedheroin = 0
hstage = {}
targ = {}
opiumtable = nil

barrels = {}

Citizen.CreateThread(function()
  if spawnedheroin == 0 then
      opiumtable = CreateObject('bkr_prop_meth_table01a', Config.OpiumTable.coords.x, Config.OpiumTable.coords.y, Config.OpiumTable.coords.z, false, false, true)
      SetEntityHeading(opiumtable, Config.OpiumTable.h)
      FreezeEntityPosition(opiumtable, true)
      PlaceObjectOnGroundProperly(opiumtable)
      local statymas = GetEntityCoords(opiumtable)
      exports[Config.Target]:AddBoxZone("opium-table", statymas, 1.2, 1.2, {
          name = "opium-table",
          heading=GetEntityHeading(opiumtable),
          debugPoly=false,
					minZ=statymas.z+0.4,
					maxZ=statymas.z+1.2
      }, {
          options = {
          {
              event = "dhm-drugs:extractop",
              icon = Config.OpiumTable.icon,
              label = Config.OpiumTable.label,
              plant = opiumtable,
          },
      },
          job = {"all"},
          distance = 3
      })

      herointable = CreateObject('bkr_prop_meth_table01a', Config.HeroinTable.coords.x, Config.HeroinTable.coords.y, Config.HeroinTable.coords.z, false, false, true)
      SetEntityHeading(herointable, Config.HeroinTable.h)
      FreezeEntityPosition(herointable, true)
      PlaceObjectOnGroundProperly(herointable)
      local statymas = GetEntityCoords(herointable)

      exports[Config.Target]:AddBoxZone("heroin-table", statymas, 1.2, 1.2, {
          name = "heroin-table",
          heading=GetEntityHeading(herointable),
          debugPoly=false,
					minZ=statymas.z+0.4,
					maxZ=statymas.z+1.2
      }, {
          options = {
          {
              event = "dhm-drugs:makeheroin",
              icon = Config.HeroinTable.icon,
              label = Config.HeroinTable.label,
              plant = herointable,
          },
      },
          job = {"all"},
          distance = 3
      })

      spawnedheroin = 1
  end
end)

RegisterNetEvent('dhm-drugs:synchronizeheroin')
AddEventHandler('dhm-drugs:synchronizeheroin', function(heroindata)
  for k,v in pairs(heroindata) do
    heroinplant[k] = v
    hstage[k] = 1
  end
end)

RegisterNetEvent('dhm-drugs:updatetimeheroin')
AddEventHandler('dhm-drugs:updatetimeheroin',function(heroindata,time)
  heroinplant[heroindata].herointime = time
  if heroinplant[heroindata].herointime < 21 and heroinplant[heroindata].herointime > 1 then
    hstage[heroindata] = 1
  else
    hstage[heroindata] = 2
  end
end)

Citizen.CreateThread(function()
  local wait = 5000
  while true do
      if heroinplant ~= nil then
          for k,v in pairs(heroinplant) do
              distance = #(GetEntityCoords(PlayerPedId()) - vector3(v.coords.x, v.coords.y+0.5, v.coords.z-1))
              if distance <= 20 then
                  if createdheroin[k] ~= nil then
                      DeleteEntity(createdheroin[k])
                      createdheroin[k] = nil
                  end
                  local heroinprop = Config.PoppyStage[hstage[k]].prop
                  RequestModel(heroinprop)
                  while not HasModelLoaded(heroinprop) do
                  Citizen.Wait(100)
                  end

                  planth = CreateObject(heroinprop,v.coords.x,v.coords.y+0.5,v.coords.z-1,false,false,false)
                  PlaceObjectOnGroundProperly(planth)
                  FreezeEntityPosition(planth, true)
                  createdheroin[k] = planth

                  local cch = GetEntityCoords(planth)

                  if hstage[k] == 2 and not targ[k] then
                    exports[Config.Target]:AddBoxZone("poppy-plant-"..v.heroinid, cch, 1.6, 2.2, {
                        name = "poppy-plant-"..v.heroinid,
                        heading=GetEntityHeading(planth),
                        debugPoly=false,
                        minZ=cch.z-0.2,
                        maxZ=cch.z+1.2
                        }, {
                            options = {
                                {
                                    event = "dhm-drugs:harvestheroin",
                                    icon = Config.PoppyStage[hstage[k]].icon,
                                    label = Config.PoppyStage[hstage[k]].text,
                                    plantid = v.heroinid,
                                },
                            },
                            job = {"all"},
                            distance = 2
                    })
                    targ[k] = true
                  end
              else
                  if createdheroin[k] ~= nil then
                      DeleteEntity(createdheroin[k])
                      exports[Config.Target]:RemoveZone("poppy-plant-"..k)
                      createdheroin[k] = nil
                  end
              end
          end
      end
      Citizen.Wait(wait)
  end
end)


RegisterNetEvent('dhm-drugs:harvestheroin')
AddEventHandler('dhm-drugs:harvestheroin',function(data)
  TriggerServerEvent('dhm-drugs:harvestheroin', data.plantid)
end)

RegisterNetEvent('dhm-drugs:harvesth')
AddEventHandler('dhm-drugs:harvesth',function(k)
  if createdheroin[k] ~= nil then
    DeleteEntity(createdheroin[k])
    exports[Config.Target]:RemoveZone("poppy-plant-"..k)
  end
  heroinplant[k] = nil
  createdheroin[k] = nil
  hstage[k] = nil
  targ[k] = false
end)

Citizen.CreateThread(function()
  while true do
    if heroinplant ~= nil then
      wait = 1000
      for k,v in pairs(heroinplant) do
        distance = #(GetEntityCoords(PlayerPedId()) - vector3(v.coords.x, v.coords.y+0.5, v.coords.z-1))
        if distance <= 2 then
          wait = 1
          if v.herointime >= 1 then
            textas = Config.Translations.growing..v.herointime.."s"
          else
            textas = Config.Translations.harvestready
          end
          DrawText3Ds(v.coords.x,v.coords.y+0.5,v.coords.z, textas)
        end
      end
    end
  Citizen.Wait(wait)
  end
end)

Citizen.CreateThread(function()
  if Config.PoppyPlantZone.visiblezone then
    local blip = AddBlipForRadius(Config.PoppyPlantZone.coords.x, Config.PoppyPlantZone.coords.y, Config.PoppyPlantZone.coords.z, Config.PoppyPlantZone.range)
  
    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, 8)
    SetBlipAlpha (blip, 128)
  end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
    if heroinplant ~= nil then
		  for k,v in pairs(createdheroin) do
        DeleteEntity(v)
        exports[Config.Target]:RemoveZone("poppy-plant-"..k)
      end
    end
    if barrels ~= nil then
      for k,v in pairs(barrels) do
        if v.plant ~= nil then
          DeleteEntity(v.plant)
          exports[Config.Target]:RemoveZone("chem-"..v.plant)
        end
      end
    end
    DeleteEntity(opiumtable)
    DeleteEntity(herointable)
    exports[Config.Target]:RemoveZone("opium-table")
    exports[Config.Target]:RemoveZone("heroin-table")
  end
end)


-- Chemical

RegisterNetEvent('dhm-drugs:heroincoords')
AddEventHandler('dhm-drugs:heroincoords',function(tbl)
	for k,v in pairs(tbl) do
		if barrels[k] == nil then
			barrels[k] = v
		end
	end
end)

local gameprops = 0
local busyg = false
local busyd = false
local busyx = false


Citizen.CreateThread(function()
	local wait = 500
	while true do
			local ped = PlayerPedId()
			local coords = GetEntityCoords(ped)
			local c = Config.HeroinChem.coords
			local dist = #(coords - c)
			if dist < 40 then
        for k,v in pairs(barrels) do
          if not v.planted or v.planted == nil then
            wait = 500
            local entity = CreateObject('prop_barrel_02a', v.coords.x, v.coords.y, v.coords.z, false, false, true)
            SetEntityAsMissionEntity (entity,true,true)
            PlaceObjectOnGroundProperly(entity)
            FreezeEntityPosition(entity, true)
            local statymas = GetEntityCoords(entity)
            exports[Config.Target]:AddBoxZone("chem-"..entity, statymas, 1.2, 1.2, {
              name = "chem-"..entity,
              heading=GetEntityHeading(entity),
              debugPoly=false,
              minZ=statymas.z+0.4,
              maxZ=statymas.z+1.2
            }, {
                options = {
                {
                    event = "dhm-drugs:pickchem",
                    icon = Config.HeroinChem.icon,
                    label = Config.HeroinChem.label,
                    plant = entity,
                    plantid = k,
                },
            },
                job = {"all"},
                distance = 2
            })
            barrels[k].plant = entity
            barrels[k].planted = true
          else
            wait = 2500
          end
				end
			else
        if barrels ~= nil then
          for k,v in pairs(barrels) do
            if v.plant ~= nil then
              DeleteEntity(v.plant)
              v.planted = false
              v.plant =  nil
            end
          end
        end
        wait = 5000
			end
	Citizen.Wait(wait)
	end
end)

RegisterNetEvent('dhm-drugs:pickchem')
AddEventHandler('dhm-drugs:pickchem', function(data)
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)
		if data.plantid and foot and not busyg then
  		ESX.TriggerServerCallback('dhm-drugs:pickchem', function(valid)
        if valid then
          busyg = true
          load(9000, Config.Translations.searching)
          animation('search')
          TriggerServerEvent('dhm-drugs:pickchem', data.plantid)
          TriggerServerEvent('dhm-drugs:receive', 'heroinchemical')
          busyg = false
        end
      end, data.plantid)
		end
end)

RegisterNetEvent('dhm-drugs:deletechemh')
AddEventHandler('dhm-drugs:deletechemh',function(k)
	if barrels[k] ~= nil then
		if barrels[k].plant ~= nil then
			DeleteEntity(barrels[k].plant)
			exports[Config.Target]:RemoveZone("chem-"..barrels[k].plant)
		end
		barrels[k] = nil
	end
end)

RegisterNetEvent('dhm-drugs:extractop')
AddEventHandler('dhm-drugs:extractop', function()
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)
		if foot and not busyd then
  		busyd = true
			ESX.TriggerServerCallback('dhm-drugs:drugcb', function(quantity)
				if quantity > 1 then
					load(6000, Config.Translations.extractingopium)
					animation('make')
					TriggerServerEvent('dhm-drugs:receive', 'opium')
          busyd = false
				else
					notify(Config.Translations.notenoughpods)
          busyd = false
				end
			end, 'amount', 'dhm-poppypod')
		else
			Citizen.Wait(500)
		end
end)

RegisterNetEvent('dhm-drugs:makeheroin')
AddEventHandler('dhm-drugs:makeheroin', function()
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)
		if foot and not busyx then
  		busyx = true
			ESX.TriggerServerCallback('dhm-drugs:drugcb', function(cb)
				if cb then
					load(10000, Config.Translations.makingheroin)
          RequestAnimDict("mp_arresting")
          while (not HasAnimDictLoaded("mp_arresting")) do Citizen.Wait(0) end
          TaskPlayAnim(ped, "mp_arresting", "a_uncuff", 8.0, -8.0, -1, 0, 0, false, false, false)
          Citizen.Wait(4000)
          ClearPedTasks(ped)
					animation('make')
					TriggerServerEvent('dhm-drugs:receive', 'heroin')
          busyx = false
				else
					notify(Config.Translations.moreitems)
          busyx = false
				end
			end, 'heroin')
		else
			Citizen.Wait(500)
		end
end)