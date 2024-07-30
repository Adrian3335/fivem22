ESX = nil 
Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports['es_extended']:getSharedObject()
        Citizen.Wait(1)
    end
end)

local started = false
local displayed = false
local progress = 0
local valid = false
local smoke
local car 
local call = 0
local spawnedmeth = 0
local methtable = nil

local LastCar

Citizen.CreateThread(function()
  if spawnedmeth == 0 then
      methtable = CreateObject('bkr_prop_meth_table01a', Config.MethTable.coords.x, Config.MethTable.coords.y, Config.MethTable.coords.z, false, false, true)
      SetEntityHeading(methtable, Config.MethTable.h)
      FreezeEntityPosition(methtable, true)
      PlaceObjectOnGroundProperly(methtable)

			local statymas = GetEntityCoords(methtable)
      exports[Config.Target]:AddBoxZone("meth-table", statymas, 1.2, 1.2, {
          name = "meth-table",
          heading=GetEntityHeading(methtable),
          debugPoly=false,
					minZ=statymas.z+0.4,
					maxZ=statymas.z+1.2
      }, {
          options = {
          {
              event = "dhm-meth:methbag",
              icon = Config.MethTable.icon,
              label = Config.MethTable.label,
              plant = methtable,
          },
      },
					job = {"all"},
          distance = 3
      })

      spawnedmeth = 1
  end
end)

RegisterNetEvent('dhm-meth:stop')
AddEventHandler('dhm-meth:stop', function()
	playerPed = PlayerPedId()
	car = GetVehiclePedIsIn(playerPed, false)
	started = false
	notify(Config.Translations.cookstop)
	FreezeEntityPosition(LastCar, false)
	give1 = false
	give2 = false
	give3 = false
	give4 = false
	give5 = false
	give6 = false
	give7 = false

	
	TaskLeaveVehicle(playerPed, car, 16)
	SetVehicleDoorShut(car, 2, 0)
end)

RegisterNetEvent('dhm-meth:stopfreeze')
AddEventHandler('dhm-meth:stopfreeze', function(id)
	FreezeEntityPosition(id, false)
end)

RegisterNetEvent('dhm-meth:startprod')
AddEventHandler('dhm-meth:startprod', function()
	started = true
	FreezeEntityPosition(car,true)
	displayed = false
	notify(Config.Translations.cookingstarted)	
	SetPedIntoVehicle(GetPlayerPed(-1), car, 3)
	SetVehicleDoorOpen(car, 2)
end)


RegisterNetEvent('dhm-meth:smoke')
AddEventHandler('dhm-meth:smoke', function(posx, posy, posz)
	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Citizen.Wait(1)
		end
	end
	SetPtfxAssetNextCall("core")
	smoke = StartParticleFxLoopedAtCoord("exp_grd_flare", posx, posy, posz + 1.7, 0.0, 0.0, 0.0, 2.0, false, false, false, false)
	SetParticleFxLoopedAlpha(smoke, 0.8)
	SetParticleFxLoopedColour(smoke, 0.0, 0.0, 0.0, 0)
	Citizen.Wait(165000)
	StopParticleFxLooped(smoke, 0)
end)

Citizen.CreateThread(function()
	while true do
		wait = 2000
		playerPed = PlayerPedId()
		local pos = GetEntityCoords(playerPed)
		if IsPedInAnyVehicle(playerPed) then
			car = GetVehiclePedIsIn(playerPed, false)
			LastCar = GetVehiclePedIsUsing(playerPed)
			local model = GetEntityModel(car)
			local modelName = GetDisplayNameFromVehicleModel(model)
			if modelName == 'JOURNEY' and car then
				if GetPedInVehicleSeat(car, -1) == playerPed then
					wait = 1
					if started == false then
            			DrawText3Ds(pos.x,pos.y,pos.z,Config.Translations.presstostart)
					end
					if IsControlJustReleased(0, 38) then
						TriggerServerEvent('dhm-meth:start')	
						progress = 0
            call = 0 
          end
				end
			else
				wait = 2000
			end
		end
    if started == true then
			wait = 1
      if progress < 96 then
        DrawText3Ds(pos.x,pos.y,pos.z,Config.Translations.process..'~h~' .. progress .. '%')
        if IsPedInAnyVehicle(playerPed) then
          if call == 0 then
            TriggerServerEvent('dhm-meth:make', pos.x,pos.y,pos.z)
            call = 1
          end
					if progress > 10 and progress < 25 and not give1 then 
						give1 = true
						TriggerServerEvent('dhm-meth:finish')
					elseif progress > 25 and progress < 40 and not give2 then 
						give2 = true
						TriggerServerEvent('dhm-meth:finish')
					elseif progress > 40 and progress < 55 and not give3 then  
						give3 = true
						TriggerServerEvent('dhm-meth:finish')
					elseif progress > 55 and progress < 70 and not give4 then  
						give4 = true
						TriggerServerEvent('dhm-meth:finish')
					elseif progress > 70 and progress < 85 and not give5 then  
						give5 = true
						TriggerServerEvent('dhm-meth:finish')
					elseif progress > 85 and progress < 100 and not give6 then  
						give6 = true
						TriggerServerEvent('dhm-meth:finish')
					end
        else
          TriggerEvent('dhm-meth:stop')
        end
      else
        TriggerEvent('dhm-meth:stop')
        progress = 100
        notify(Config.Translations.cookisover)
				if not give7 then  
					give7 = true
        	TriggerServerEvent('dhm-meth:finish')
				end
				Citizen.Wait(100)
        TaskLeaveVehicle(playerPed, car, 16)
        SetVehicleDoorShut(car, 2, 0)
        FreezeEntityPosition(LastCar, false)
      end	
    end
		Citizen.Wait(wait)
	end
end)

Citizen.CreateThread(function()
	local wait = 5000
	while true do
		Citizen.Wait(wait)
			playerPed = PlayerPedId()
			if IsPedInAnyVehicle(playerPed) then
				if started then
          			progress = progress + math.random(1,5)
        		end
			else
				if started then
					started = false
					displayed = false
					TriggerEvent('dhm-meth:stop')
					FreezeEntityPosition(LastCar,false)
				end		
			end
	end
end)


-- Barrels

local busymethg = false
local busymethd = false
local methbars = {}

RegisterNetEvent('dhm-drugs:methcoords')
AddEventHandler('dhm-drugs:methcoords',function(tbl)
	for k,v in pairs(tbl) do
		if methbars[k] == nil then
			methbars[k] = v
		end
	end
end)

Citizen.CreateThread(function()
	local wait = 500
	while true do
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local c = Config.MethChem.coords
		local dist = #(coords - c)
		if dist < 40 then
			for k,v in pairs(methbars) do
				if not v.planted or v.planted == nil then
					wait = 500
					local entity = CreateObject('prop_barrel_01a', v.coords.x, v.coords.y, v.coords.z, false, false, true)
					SetEntityAsMissionEntity (entity,true,true)
					PlaceObjectOnGroundProperly(entity)
					FreezeEntityPosition(entity, true)
					local statymas = GetEntityCoords(entity)
					exports[Config.Target]:AddBoxZone("methbar-"..entity, statymas, 1.2, 1.2, {
						name = "methbar-"..entity,
						heading=GetEntityHeading(entity),
						debugPoly=false,
						minZ=statymas.z+0.4,
						maxZ=statymas.z+1.2
					}, {
						options = {
						{
							event = "dhm-meth:pickchem",
							icon = Config.MethChem.icon,
							label = Config.MethChem.label,
							plant = entity,
							plantid = k,
						},
					},
						job = {"all"},
						distance = 2
					})
					methbars[k].plant = entity
					methbars[k].planted = true
				else
					wait = 2500
				end
			end
		else
			if methbars ~= nil then
				for k,v in pairs(methbars) do
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

RegisterNetEvent('dhm-meth:pickchem')
AddEventHandler('dhm-meth:pickchem', function(data)
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)
	if data.plantid and foot and not busymethg then
  		ESX.TriggerServerCallback('dhm-drugs:pickchemm', function(valid)
			if valid then
				busymethg = true
				load(9000, Config.Translations.searching)
				animation('search')
				TriggerServerEvent('dhm-drugs:pickchemm', data.plantid)
				TriggerServerEvent('dhm-drugs:receive', 'methchemical')
				busymethg = false
			end
      	end, data.plantid)
	end
end)

RegisterNetEvent('dhm-drugs:deletechemm')
AddEventHandler('dhm-drugs:deletechemm',function(k)
	if methbars[k] ~= nil then
		if methbars[k].plant ~= nil then
			DeleteEntity(methbars[k].plant)
			exports[Config.Target]:RemoveZone("methbar-"..methbars[k].plant)
		end
		methbars[k] = nil
	end
end)

RegisterNetEvent('dhm-meth:methbag')
AddEventHandler('dhm-meth:methbag', function()
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)
		if foot and not busymethd then
  		busymethd = true
			ESX.TriggerServerCallback('dhm-drugs:drugcb', function(cb)
				if cb then
					load(7000, Config.Translations.bagging)
          RequestAnimDict("mp_arresting")
          while (not HasAnimDictLoaded("mp_arresting")) do Citizen.Wait(0) end
          TaskPlayAnim(ped, "mp_arresting", "a_uncuff", 8.0, -8.0, -1, 0, 0, false, false, false)
          Citizen.Wait(4000)
          ClearPedTasks(ped)
					RequestAnimDict("amb@prop_human_bum_bin@base")
					while (not HasAnimDictLoaded("amb@prop_human_bum_bin@base")) do Citizen.Wait(0) end
					TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
					Citizen.Wait(1500)
					TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 0, 0, false, false, false)
					Citizen.Wait(1500)
					ClearPedTasks(ped)
					TriggerServerEvent('dhm-drugs:receive', 'methbag')
          busymethd = false
				else
					notify(Config.Translations.methitemsnotenough)
          busymethd = false
				end
			end, 'methbag')
		else
			Citizen.Wait(500)
		end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
	if methbars ~= nil then
		for k,v in pairs(methbars) do
			if v.plant ~= nil then
				DeleteEntity(v.plant)
				exports[Config.Target]:RemoveZone("methbar-"..v.plant)
			end
		end
	end
    DeleteEntity(methtable)
    exports[Config.Target]:RemoveZone("meth-table")
  end
end)



