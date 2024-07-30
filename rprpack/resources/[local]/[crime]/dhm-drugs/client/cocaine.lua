ESX = nil 
Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports['es_extended']:getSharedObject()
        Citizen.Wait(1)
    end
end)

cocaplant = {}
local busycocag = false
local cocaplants = {}
local temperature = 0
local workingheater = false
local typeheater = 'Zwiększ temperature'
local cokefinished = false
local timeleft = 0

local info = {}

info[GetPlayerServerId(PlayerId())] = {
	acid = 0,
	mix = 0,
	vicodin = 0,           
}

RegisterNetEvent('dhm-coke:tableclient')
AddEventHandler('dhm-coke:tableclient', function(inf)
	for k,v in pairs(inf) do
		info[k] = v
	end
end)

RegisterNetEvent('dhm-drugs:cocacoords')
AddEventHandler('dhm-drugs:cocacoords',function(tbl)
	for k,v in pairs(tbl) do
		if cocaplant[k] == nil then
			cocaplant[k] = v
		end
	end
end)

Citizen.CreateThread(function()
	local wait = 500
	while true do
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local c = Config.CocaPlants.coords
		local dist = #(coords - c)
		if dist < 40 then
			for k,v in pairs(cocaplant) do
				if not v.planted or v.planted == nil then
					wait = 500
					local entity = CreateObject('prop_plant_01a', v.coords.x, v.coords.y, v.coords.z, false, false, true)
					SetEntityAsMissionEntity (entity,true,true)
					PlaceObjectOnGroundProperly(entity)
					FreezeEntityPosition(entity, true)
					local statymas = GetEntityCoords(entity)
					exports[Config.Target]:AddBoxZone("cocaplant-"..entity, statymas, 1.2, 1.2, {
						name = "cocaplant-"..entity,
						heading=GetEntityHeading(entity),
						debugPoly=false,
						minZ=statymas.z+0.4,
						maxZ=statymas.z+1.2
					}, {
						options = {
						{
							event = "dhm-drugs:pickleaf",
							icon = Config.CocaPlants.icon,
							label = Config.CocaPlants.label,
							plant = entity,
							plantid = k,
						},
					},
						job = {"all"},
						distance = 2.5
					})
					cocaplant[k].plant = entity
					cocaplant[k].planted = true
				else
					wait = 2500
				end
			end
		else
			if cocaplant ~= nil then
				for k,v in pairs(cocaplant) do
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

RegisterNetEvent('dhm-drugs:pickleaf')
AddEventHandler('dhm-drugs:pickleaf', function(data)
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)
	if data.plantid and foot and not busycocag then
  		ESX.TriggerServerCallback('dhm-drugs:pickcoca', function(valid)
			if valid then
				busycocag = true
				load(8000, Config.Translations.cocaleavespick)
          		animation('leaf')
				TriggerServerEvent('dhm-drugs:pickcoca', data.plantid)
				TriggerServerEvent('dhm-drugs:receive', 'cocaleaf')
				busycocag = false
			end
      	end, data.plantid)
	end
end)

RegisterNetEvent('dhm-drugs:deletecoca')
AddEventHandler('dhm-drugs:deletecoca',function(k)
	if cocaplant[k] ~= nil then
		if cocaplant[k].plant ~= nil then
			DeleteEntity(cocaplant[k].plant)
			exports[Config.Target]:RemoveZone("cocaplant-"..cocaplant[k].plant)
		end
		cocaplant[k] = nil
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if barrels ~= nil then
			for k,v in pairs(cocaplant) do
				if v.plant ~= nil then
					DeleteEntity(v.plant)
					exports[Config.Target]:RemoveZone("cocaplant-"..v.plant)
				end
			end
		end
		exports[Config.Target]:RemoveZone("collectacid")
		exports[Config.Target]:RemoveZone("crushvic")
		exports[Config.Target]:RemoveZone("acidcan")
		exports[Config.Target]:RemoveZone("mixer")
		exports[Config.Target]:RemoveZone("heater")
		exports[Config.Target]:RemoveZone("collection")
  end
end)

Citizen.CreateThread(function()
	TriggerServerEvent('dhm-coke:table')

	local statymas = Config.AcidCollect.coords

		exports[Config.Target]:AddBoxZone("collectacid", statymas, 1.6, 1.05, {
			name = "collectacid",
			heading=90.0,
			debugPoly=false,
			minZ=statymas.z+0.4,
			maxZ=statymas.z+1.2
		}, {
				options = {
				{
						event = "dhm-coke:pickacid",
						icon = Config.AcidCollect.icon,
						label = Config.AcidCollect.label,
				},
		},
				job = {"all"},
				distance = 2.5
		})

		local statymas2 = Config.VicodinCrush.coords

		exports[Config.Target]:AddBoxZone("crushvic", statymas2, 1.6, 1.6, {
			name = "crushvic",
			heading=115.0,
			debugPoly=false,
			minZ=statymas2.z+0.4,
			maxZ=statymas2.z+1.2
		}, {
				options = {
				{
						event = "dhm-coke:crushvic",
						icon = Config.VicodinCrush.icon,
						label = Config.VicodinCrush.label,
				},
		},
				job = {"all"},
				distance = 2.5
		})

		local statymas3 = Config.AcidCanister.coords

		exports[Config.Target]:AddBoxZone("acidcan", statymas3, 0.6, 0.6, {
			name = "acidcan",
			heading=115.0,
			debugPoly=false,
			minZ=statymas3.z+0.4,
			maxZ=statymas3.z+1.2
		}, {
				options = {
				{
						event = "dhm-coke:acidput",
						icon = Config.AcidCanister.icon,
						label = Config.AcidCanister.label,
						canInteract = function()
							if info[GetPlayerServerId(PlayerId())].acid < 8 then 
									return true
							else 
									return false
							end 
						end,
				},
		},
				job = {"all"},
				distance = 2.5
		})

		local statymas4 = Config.Mixer.coords

		exports[Config.Target]:AddBoxZone("mixer", statymas4, 1.6, 1.6, {
			name = "mixer",
			heading=115.0,
			debugPoly=false,
			minZ=statymas4.z+0.4,
			maxZ=statymas4.z+1.2
		}, {
				options = {
				{
						event = "dhm-coke:mixer",
						icon = Config.Mixer.icon,
						label = Config.Mixer.label,
						canInteract = function()
							if not workingheater then 
									return true
							else 
									return false
							end 
						end,
				},
		},
				job = {"all"},
				distance = 2.5
		})

		local statymas5 = Config.Heater.coords

		exports[Config.Target]:AddBoxZone("heater", statymas5, 1.6, 1.6, {
			name = "heater",
			heading=115.0,
			debugPoly=false,
			minZ=statymas5.z+0.4,
			maxZ=statymas5.z+1.2
		}, {
				options = {
				{
						event = "dhm-coke:heater",
						icon = Config.Heater.icon,
						label = Config.Heater.label,
						canInteract = function()
							if not workingheater and info[GetPlayerServerId(PlayerId())].acid >= 8 and info[GetPlayerServerId(PlayerId())].mix >= 1 then 
									return true
							else 
									return false
							end 
						end,
				},
				{
						event = "dhm-coke:adjust",
						icon = Config.Heater.iconheat,
						label = Config.Heater.labelheat,
						type = 'heat',
						canInteract = function()
							if workingheater and not cokefinished then 
									return true
							else 
									return false
							end 
						end,
				},
				{
						event = "dhm-coke:adjust",
						icon = Config.Heater.iconcold,
						label = Config.Heater.labelcold,
						type = 'Zmniejsz temperature',
						canInteract = function()
							if workingheater and not cokefinished then 
									return true
							else 
									return false
							end 
						end,
				},
		},
				job = {"all"},
				distance = 2.5
		})

		local statymas6 = Config.Collection.coords

		exports[Config.Target]:AddBoxZone("collection", statymas6, 1.6, 1.6, {
			name = "collection",
			heading=115.0,
			debugPoly=false,
			minZ=statymas6.z+0.4,
			maxZ=statymas6.z+1.2
		}, {
				options = {
				{
						event = "dhm-coke:collect",
						icon = Config.Collection.icon,
						label = Config.Collection.label,
						canInteract = function()
							if cokefinished then 
									return true
							else 
									return false
							end 
						end,
				},
		},
				job = {"all"},
				distance = 2.5
		})
end)

local busyacidg = false

RegisterNetEvent('dhm-coke:pickacid')
AddEventHandler('dhm-coke:pickacid', function()
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)
		if foot and not busyacidg then
  		busyacidg = true
			ESX.TriggerServerCallback('dhm-drugs:drugcb', function(canCarry)
				if canCarry then
					load(2000, Config.Translations.putacidcan)
          animation('acid')
					TriggerServerEvent('dhm-drugs:receive', 'acid')
          busyacidg = false
				else
					notify(Config.Translations.nospace)
          busyacidg = false
				end
			end, 'carry', 'dhm-acid', 1)
		end
end)

local busyvicg = false

RegisterNetEvent('dhm-coke:crushvic')
AddEventHandler('dhm-coke:crushvic', function()
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)
		if foot and not busyvicg then
  		busyvicg = true
			ESX.TriggerServerCallback('dhm-drugs:drugcb', function(quantity)
				if quantity > 0 then
					load(2000, Config.Translations.crushingvicodin)
      		animation('acid')
					TriggerServerEvent('dhm-drugs:receive', 'vic')
     	 		busyvicg = false
				else
					notify(Config.Translations.noitem)
          busyvicg = false
				end
			end, 'amount', 'dhm-vicodin')
		end
end)

local busyputg = false

RegisterNetEvent('dhm-coke:acidput')
AddEventHandler('dhm-coke:acidput', function()
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)
	if info[GetPlayerServerId(PlayerId())].acid < 8 then
		if foot and not busyputg then
  		busyputg = true
			ESX.TriggerServerCallback('dhm-drugs:drugcb', function(quantity)
				if quantity > 0 then
					load(2000, Config.Translations.acidpour)
      		animation('acid')
					TriggerServerEvent('dhm-drugs:acidfunction')
					busyputg = false
				else
					notify(Config.Translations.noitem)
          busyputg = false
				end
			end, 'amount', 'dhm-acid')
		end
	end
end)

local busymixerg = false

RegisterNetEvent('dhm-coke:mixer')
AddEventHandler('dhm-coke:mixer', function()
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)

	if foot and not busymixerg then
  	busymixerg = true
		ESX.TriggerServerCallback('dhm-drugs:drugcb', function(items)
			if items then
				load(2000, Config.Translations.pouringmix)
    		animation('acid')
				TriggerServerEvent('dhm-drugs:mixturefunction')
				busymixerg = false
			else
				notify(Config.Translations.noitem)
        busymixerg = false
			end
		end, 'mixer')
	end
end)

RegisterNetEvent('dhm-coke:heater')
AddEventHandler('dhm-coke:heater', function()
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)

	if foot then
		temperature = math.random (40,80)
		timeleft = 30
		typeheater = 'heat'
		workingheater = true
	end
end)

RegisterNetEvent('dhm-coke:collect')
AddEventHandler('dhm-coke:collect', function()
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)

	if foot then
		if temperature >= 60 and temperature <= 65 then
			TriggerServerEvent('dhm-coke:makecoke', true)
			
			temperature = 0
			timeleft = 0
			typeheater = 'heat'
			workingheater = false
			cokefinished = false
		else
			TriggerServerEvent('dhm-coke:makecoke', false)
			
			temperature = 0
			timeleft = 0
			typeheater = 'heat'
			workingheater = false
			cokefinished = false
		end
	end
end)

RegisterNetEvent('dhm-coke:adjust')
AddEventHandler('dhm-coke:adjust', function(data)
	local ped = PlayerPedId()
	local foot = IsPedOnFoot(ped)

	if foot then
		typeheater = data.type
	end
end)

Citizen.CreateThread(function()
	local wait = 500
	while true do
			local ped = PlayerPedId()
			local coords = GetEntityCoords(ped)
			local c = Config.AcidCanister.coords
			local dist = #(coords - c)
			local c2 = Config.Mixer.coords
			local dist2 = #(coords - c2)
			local c3 = Config.Heater.coords
			local dist3 = #(coords - c3)
			
			if dist < 3 then
				wait = 2
				if info[GetPlayerServerId(PlayerId())].acid < 8 then
					DrawText3Ds(c.x,c.y,c.z+1.2, 'Poziom Kwasu: ~o~'..info[GetPlayerServerId(PlayerId())].acid..'~w~/8')
				elseif info[GetPlayerServerId(PlayerId())].acid >= 8 then
					DrawText3Ds(c.x,c.y,c.z+1.2, 'Kwas ~g~Gotowy! ~w~8/8')
				end
			elseif dist3 < 3 and dist2 < 3 and dist < 3 then
				wait = 2000
			end
			if dist2 < 3 then
				wait = 2
				DrawText3Ds(c2.x,c2.y,c2.z+1.2, 'Gotowe Mieszanki: ~b~'..info[GetPlayerServerId(PlayerId())].mix)
			elseif dist3 < 3 and dist2 < 3 and dist < 3 then
				wait = 2000
			end
			if dist3 < 3 then
				wait = 2
				if cokefinished then 
					DrawText3Ds(c3.x,c3.y,c3.z+1.2, 'Temperatura ~o~(60-65C potrzebna)~w~: ~b~'..temperature..'C\n~g~Gotowe!')
				elseif not cokefinished then 
					DrawText3Ds(c3.x,c3.y,c3.z+1.2, 'Temperatura ~o~(60-65C Potrzebna)~w~: ~b~'..temperature..'C\n~w~Pozostały czas: '..timeleft..'s')
				end
			elseif dist3 < 3 and dist2 < 3 and dist < 3 then
				wait = 2000
			end
	Citizen.Wait(wait)
	end
end)

Citizen.CreateThread(function()
	local wait = 5000
	while true do
			if workingheater and timeleft > 0 then
				local chance = math.random(1,2)
				if chance == 1 then
					temperature = temperature - math.random(1,5)
				elseif chance == 2 then
					temperature = temperature + math.random(1,5)
				end
			end
	Citizen.Wait(wait)
	end
end)


Citizen.CreateThread(function()
	local wait = 1000
	while true do
		if workingheater and timeleft > 0 then
			wait = 1000
			timeleft = timeleft - 1
			if typeheater == 'heat' then
				temperature = temperature + 1
			elseif typeheater == 'cold' then
				temperature = temperature - 1
			end
		else
			wait = 5000
		end
		if timeleft <= 0 and workingheater and not cokefinished then
			wait = 5000
			cokefinished = true
		end
	Citizen.Wait(wait)
	end
end)

Citizen.CreateThread(function()
	while Config.UseTeleport do
		local wait = 2000
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local c = Config.LabEntry.coords
		local dist = #(coords - c)
		local c2 = Config.LabCoords.coords
		local dist2 = #(coords - c2)

		if dist < 3 then
			wait = 2
			DrawText3Ds(c.x,c.y,c.z, Config.LabEntry.label)
			if IsControlJustReleased(1, 38) then
				SetEntityCoords(ped, c2.x, c2.y, c2.z)
			end
		elseif dist2 < 3 then
			wait = 2
			DrawText3Ds(c2.x,c2.y,c2.z, Config.LabCoords.label)
			if IsControlJustReleased(1, 38) then
				SetEntityCoords(ped, c.x, c.y, c.z)
			end
		end
	Citizen.Wait(wait)
	end
end)