weeds = {}
created = {}
stage = {}

local spawned = 0
local weedtable = nil


Citizen.CreateThread(function()
    if spawned == 0 then
        weedtable = CreateObject('bkr_prop_weed_table_01a', Config.WeedTable.coords.x, Config.WeedTable.coords.y, Config.WeedTable.coords.z, false, false, true)
        SetEntityHeading(weedtable, Config.WeedTable.h)
        FreezeEntityPosition(weedtable, true)
        PlaceObjectOnGroundProperly(weedtable)
        local statymas = GetEntityCoords(weedtable)

        exports[Config.Target]:AddBoxZone("joint-table", statymas, 1.2, 1.2, {
            name = "joint-table",
            heading=GetEntityHeading(weedtable),
            debugPoly=false,
            minZ=statymas.z+0.4,
            maxZ=statymas.z+1.2
        }, {
            options = {
            {
                event = "dhm-drugs:jointweed",
                icon = Config.WeedTable.icon,
                label = Config.WeedTable.label,
            },
        },
            job = {"all"},
            distance = 3
        })

        spawned = 1
    end
end)

RegisterNetEvent('dhm-drugs:updategrowthcweed')
AddEventHandler('dhm-drugs:updategrowthcweed',function(weed,status)
    weeds[weed].progress = status
    if weeds[weed].progress < 11 then
        stage[weed] = 1
    elseif weeds[weed].progress > 10 and weeds[weed].progress < 21 then
        stage[weed] = 2
    elseif weeds[weed].progress > 20 and weeds[weed].progress < 41 then
        stage[weed] = 3
    elseif weeds[weed].progress > 40 and weeds[weed].progress < 61 then
        stage[weed] = 4
    elseif weeds[weed].progress > 60 and weeds[weed].progress < 81 then
        stage[weed] = 5
    elseif weeds[weed].progress > 80 and weeds[weed].progress < 100 then
        stage[weed] = 6
    elseif weeds[weed].progress >= 100 then
        stage[weed] = 7
    end
end)

RegisterNetEvent('dhm-drugs:updatetimeweed')
AddEventHandler('dhm-drugs:updatetimeweed',function(weed,time)
    weeds[weed].weedtime = time
end)

RegisterNetEvent('dhm-drugs:synchronizeweed')
AddEventHandler('dhm-drugs:synchronizeweed', function(weed)
    for k,v in pairs(weed) do
        weeds[k] = v
        if v.progress < 11 then
            stage[k] = 1
        elseif v.progress > 10 and v.progress < 21 then
            stage[k] = 2
        elseif v.progress > 20 and v.progress < 41 then
            stage[k] = 3
        elseif v.progress > 40 and v.progress < 61 then
            stage[k] = 4
        elseif v.progress > 60 and v.progress < 81 then
            stage[k] = 5
        elseif v.progress > 80 and v.progress < 100 then
            stage[k] = 6
        elseif v.progress >= 100 then
            stage[k] = 7
        end
    end
end)

Citizen.CreateThread(function()
    exports[Config.Target]:AddCircleZone("weedry", Config.WeedDry.coords, 1.4, {
        name="weedry",
        debugPoly=false,
        useZ=true,
        }, {
            options = {
                    {
                        event = "dhm-drugs:weedrying",
                        icon = Config.WeedDry.icon,
                        label = Config.WeedDry.label,
                    }
            },
            job = {"all"},
            distance = 6
    })
end)

RegisterNetEvent('dhm-drugs:deleteweed')
AddEventHandler('dhm-drugs:deleteweed',function(weed, idas)
    DeleteEntity(created[idas])
    created[idas] = nil
    weeds[weed] = nil
    created[weed] = nil
    exports[Config.Target]:RemoveZone("weed-growing-"..idas)
    stage[weed] = nil
end)

function dryanim()
	local ped = PlayerPedId()
	SetEntityHeading(ped, 240.0)
	RequestAnimDict("amb@prop_human_movie_bulb@idle_a")
	while (not HasAnimDictLoaded("amb@prop_human_movie_bulb@idle_a")) do Citizen.Wait(0) end
	TaskPlayAnim(ped, "amb@prop_human_movie_bulb@idle_a", "idle_a", 8.0, -8.0, -1, 0, 0, false, false, false)
	Citizen.Wait(1000)
	ClearPedTasks(ped)
end

RegisterNetEvent('dhm-drugs:weedrying')
AddEventHandler('dhm-drugs:weedrying',function()
    local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)

	if not busyd then
		busyd = true
		ESX.TriggerServerCallback('dhm-drugs:drugcb', function(quantity)
			if quantity >= 2 then
				local dryentity = CreateObject('bkr_prop_weed_drying_01a', coords.x+0.35, coords.y-0.2, coords.z+1.2, true, true, true)
				FreezeEntityPosition(dryentity, true)
				dryanim()
                load(9500, Config.Translations.dryingweed)
				Citizen.Wait(10000)
				dryanim()
				DeleteEntity(dryentity)
				TriggerServerEvent('dhm-drugs:receive', 'weedbud')
				busyd = false
			else
				busyd = false
				notify(Config.Translations.notenoughweed)
			end
		end, 'amount', 'dhm-weed')
	end
end)

Citizen.CreateThread(function()
    local wait = 5000
    while true do
        if weeds ~= nil then
            for k,v in pairs(weeds) do
                distance = #(GetEntityCoords(PlayerPedId()) - vector3(v.coords.x, v.coords.y+0.5, v.coords.z-1))
                if distance <= 20 then
                    if created[k] ~= nil then
                        DeleteEntity(created[k])
                        created[k] = nil
                    end
                    local weedprop = Config.WeedStage[stage[k]].prop
                    RequestModel(weedprop)
                    while not HasModelLoaded(weedprop) do
                    Citizen.Wait(100)
                    end

                    plantz = CreateObject(weedprop,v.coords.x,v.coords.y+0.5,v.coords.z-1,false,false,false)
                    PlaceObjectOnGroundProperly(plantz)
                    FreezeEntityPosition(plantz, true)
                    created[k] = plantz

                    local ccr = GetEntityCoords(plantz)
                    
                    exports[Config.Target]:AddBoxZone("weed-growing-"..v.weedid, ccr, 0.6, 0.6, {
                        name = "weed-growing-"..v.weedid,
                        heading=0,
                        debugPoly=false,
                        minZ=ccr.z+0.2,
                        maxZ=ccr.z+1.8
                        }, {
                            options = {
                                {
                                    event = "dhm-drugs:wateringweed",
                                    icon = Config.WeedStage[stage[k]].icon,
                                    label = Config.WeedStage[stage[k]].text,
                                    plantid = v.weedid,
                                    itemneeded = Config.WeedStage[stage[k]].itemneeded,
                                },
                            },
                            distance = 2
                    })
                else
                    if created[k] ~= nil then
                        DeleteEntity(created[k])
                        created[k] = nil
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end)

Citizen.CreateThread(function()
    while stage ~= nil do
        local wait = 2500
        if weeds ~= nil then
            for k,v in pairs(weeds) do
                distance = #(GetEntityCoords(PlayerPedId()) - vector3(v.coords.x, v.coords.y+0.5, v.coords.z-1))
                if distance <= 2 then
                    wait = 1
                    if created[k] == nil then
                        DrawText3Ds(v.coords.x,v.coords.y+0.5,v.coords.z+0.1,'~b~Loading...')
                    else
                        if v.weedtime == 0 or v.weedtime == nil then
                            if v.progress < 100 then
                                DrawText3Ds(v.coords.x,v.coords.y+0.5,v.coords.z+0.3,Config.Translations.inneed..''..Config.WeedStage[stage[k]].itemlabel..'~w~\n'..Config.Translations.growth..''..v.progress..'%')
                            elseif v.progress >= 100 then
                                DrawText3Ds(v.coords.x,v.coords.y+0.5,v.coords.z+0.1,Config.Translations.harvestready)
                            end
                        else 
                            DrawText3Ds(v.coords.x,v.coords.y+0.5,v.coords.z+0.1, Config.Translations.growing..''..v.weedtime..'s')
                        end
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end)

RegisterNetEvent('dhm-drugs:jointweed')
AddEventHandler('dhm-drugs:jointweed',function()
	local ped = PlayerPedId()
    ESX.TriggerServerCallback('dhm-drugs:drugcb', function(cb)
        if cb then
	        load(4000, Config.Translations.rollingjoint)
            RequestAnimDict("mp_arresting")
	        while (not HasAnimDictLoaded("mp_arresting")) do Citizen.Wait(0) end
	        TaskPlayAnim(ped, "mp_arresting", "a_uncuff", 8.0, -8.0, -1, 0, 0, false, false, false)
	        Citizen.Wait(4000)
            ClearPedTasks(ped)
            TriggerServerEvent('dhm-drugs:receive', 'joint')
        else
            notify(Config.Translations.notenoughforjoint)
        end
    end, 'joint')
end)

RegisterNetEvent('dhm-drugs:wateringweed')
AddEventHandler('dhm-drugs:wateringweed',function(data)
    TriggerServerEvent('dhm-drugs:updategrowth',data.plantid,data.itemneeded)
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        exports[Config.Target]:RemoveZone("weedry")
        exports[Config.Target]:RemoveZone("joint-table")
		for k,v in pairs(created) do
            DeleteEntity(v)
            TriggerEvent('dhm-drugs:removetargets')
        end
        DeleteEntity(weedtable)
	end
end)

RegisterNetEvent('dhm-drugs:removetargets')
AddEventHandler('dhm-drugs:removetargets',function()
    for k,v in pairs(weeds) do
        exports[Config.Target]:RemoveZone("weed-growing-"..v.weedid)
    end
end)
