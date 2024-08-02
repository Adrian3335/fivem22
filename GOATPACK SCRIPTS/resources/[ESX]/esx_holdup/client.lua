ESX = exports.es_extended.getSharedObject()

local timeInside = 0
local blip = nil
local grabNow = false
local moneyToTake = 0
local actualBank = ''
Banks = {
    ['trolly'] = {}
}

function drawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if outline then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
	AddTextComponentString("<font face='Poppins-Medium' size= '11'>".. text .."</font>" ) 

    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('fleecaheist:client:rob')
AddEventHandler('fleecaheist:client:rob', function(index)
	startRobTimer(index)
end)

Citizen.CreateThread(function()
	for k, v in pairs(Config.Banks) do
		exports.qtarget:AddBoxZone(v.name, v.pos, v.width, v.length, {
			name = v.name,
			heading = v.heading,
			debugPoly = false,
			minZ = v.minZ,
			maxZ = v.maxZ,
		}, {
			options = {
				{
					icon = "fas fa-laptop",
					label = "Rozpocznij hackowanie",
					action = function(data)
						local count = exports.ox_inventory:Search("count", Config.HackItem.name)
						-- ESX.TriggerServerCallback('gcphone:getItemAmount', function(count)
							if count > 0 then
								if k == v.bank then
									ESX.TriggerServerCallback('esx_holdup:getRobTime', function(time)
										if time then
											ESX.TriggerServerCallback('esx_holdup:checkPolice', function(cops)
												if cops >= Config.NeedCops then
													TriggerServerEvent('esx_holdup:policeNotification', k)
													local success = exports['hacking2']:startHack()
													TriggerServerEvent('esx_holdup:takeHackingItem')
													if success then
														actualBank = v.bank
														TriggerServerEvent('esx_holdup:openVault', k, 1)
													end
												else
													ESX.ShowNotification("Nie ma "..Config.NeedCops.." policjantów!")
												end
											end)
										end
									end, k)
								end
							else
								ESX.ShowNotification("Aby rozpocząć rabunek, potrzebujesz "..Config.HackItem.label)
							end
						-- end, Config.HackItem.name)
					end,
				},
			},
			distance = 1.5
		})

		if v.name2 ~= nil then
			exports.qtarget:AddBoxZone(v.name2, v.pos2, v.width2, v.length2, {
				name = v.name2,
				heading = v.heading2,
				debugPoly = false,
				minZ = v.minZ2,
				maxZ = v.maxZ2,
			}, {
				options = {
					{
						icon = "fas fa-laptop",
						label = "Rozpocznij hackowanie",
						action = function(data)
							local count = exports.ox_inventory:Search("count", Config.HackItem.name)
							-- ESX.TriggerServerCallback('gcphone:getItemAmount', function(count)
								if count > 0 then
									if k == v.bank then
										actualBank = v.bank
									end
									StartComputer()
									ESX.ShowNotification("Wciśnij LPM, aby wybrać")
								else
									ESX.ShowNotification("Potrzebujesz "..Config.HackItem.label)
								end
							-- end, Config.HackItem.name)
						end,
					},
				},
				distance = 1.5
			})
		end

		if v.name3 then
			exports.qtarget:AddBoxZone(v.name3, v.pos3, v.width3, v.length3, {
				name = v.name3,
				heading = v.heading3,
				debugPoly = false,
				minZ = v.minZ3,
				maxZ = v.maxZ3,
			}, {
				options = {
					{
						icon = "fas fa-hand",
						label = "Zbierz gotówke",
						action = function(data)
							grabMoney(k)
						end,
					},
				},
				distance = 1.5
			})
		end

		TriggerServerEvent('esx_holdup:setMoneyState', k, true)

		blip = AddBlipForCoord(v.doors)
		SetBlipSprite(blip, 156)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		SetBlipColour(blip, 37)
		BeginTextCommandSetBlipName("STRING")
		-- AddTextComponentString("Napad na "..v.label)
		AddTextComponentString("<font face='Poppins-Medium' size= '11'>Napad na "..v.label.."</font>" )
		EndTextCommandSetBlipName(blip)
	end
end)

RegisterNetEvent('fleecaheist:client:doorSync')
AddEventHandler('fleecaheist:client:doorSync', function(index, type)
	if type == 1 then
		local object2 = GetClosestObjectOfType(Config.Banks[index]['doors'], 50.0, joaat('hei_prop_heist_sec_door'), 1, 0, 0)
		if object2 == 0 then
			object2 = GetClosestObjectOfType(Config.Banks[index]['doors'], 50.0, joaat('v_ilev_gb_vauldr'), 1, 0, 0)
		end
		Citizen.Wait(100)
		repeat
			SetEntityHeading(object2, GetEntityHeading(object2) - 0.5)
			Citizen.Wait(10)
		until GetEntityHeading(object2) <= Config.Banks[index]['doorHeading'][2]
	elseif type == 2 then
		local object2 = GetClosestObjectOfType(Config.Banks[index]['doors'], 50.0, joaat('hei_prop_heist_sec_door'), 1, 0, 0)
		if object2 == 0 then
			object2 = GetClosestObjectOfType(Config.Banks[index]['doors'], 50.0, joaat('v_ilev_gb_vauldr'), 1, 0, 0)
		end
		Citizen.Wait(100)
		repeat
			SetEntityHeading(object2, GetEntityHeading(object2) + 0.5)
			Citizen.Wait(10)
		-- until GetEntityHeading(object2) >= 249.0 and GetEntityHeading(object2) <= 251.0
		until GetEntityHeading(object2) >= (Config.Banks[index]['doorHeading'][2]+49.0) and GetEntityHeading(object2) <= (Config.Banks[index]['doorHeading'][2]+51.0)
	end
end)

RegisterNetEvent('esx_holdup:killblip')
AddEventHandler('esx_holdup:killblip', function()
	if blip ~= nil then
    	RemoveBlip(blip)
	end
end)

RegisterNetEvent('esx_holdup:setblip')
AddEventHandler('esx_holdup:setblip', function(target, hour, pos)
	local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	exports["goat_notifications"]:policeNotify({
		playerId = target,
		coords = pos,
		textColor = "#fff",
		bgColor = "#06a5ff",
		title1 = "10-90",
		title2 = "Zgłoszenie",
		blip = {
			name = "Napad w toku",
			sprite = 161,
			scale = 2.0,
			colour = 3,
			timeToDelete = 240000
		},
		sound = {
			file = "POLICERobbery",
			volume = 0.3
		},
		content = {
			{
				type = "location",
				text = GetStreetNameFromHashKey(s1)
			},
			{
				type = "msg",
				text = "Napad w toku! Godzina zgłoszenia: " .. hour
			}
		}
	})
end)

RegisterNetEvent('fleecaheist:client:modelSync')
AddEventHandler('fleecaheist:client:modelSync', function(index, k, model)
    Config.Banks[index]['wozki'][k]['model'] = model
end)

RegisterNetEvent('fleecaheist:client:lootSync')
AddEventHandler('fleecaheist:client:lootSync', function(index, type, k)
    if k then 
        Config.Banks[index][type][k]['loot'] = not Config.Banks[index][type][k]['loot']
    else
        Config.Banks[index][type]['loot'] = not Config.Banks[index][type]['loot']
    end
end)

function startRobTimer(index)
    for k, v in pairs(Config.Banks[index]['wozki']) do
		local object3 = GetClosestObjectOfType(v['coords'], 1.0, 269934519, false, false, false)
		local object4 = GetClosestObjectOfType(v['coords'], 1.0, 769923921, false, false, false)
		if DoesEntityExist(object3) then 
			DeleteEntity(object3)
		end
		if DoesEntityExist(object4) then 
			DeleteEntity(object4)
		end
		v['loot'] = false
		for k, v in pairs(Config.Banks) do
			if k == v.bank then
				TriggerServerEvent('esx_holdup:setMoneyState', k, false)
			end
		end
		Citizen.Wait(150)
		Banks['trolly'][k] = CreateObject(269934519, v['coords'], 1, 0, 0)
		TriggerServerEvent('fleecaheist:server:modelSync', index, k, 269934519)
        SetEntityHeading(Banks['trolly'][k], v['heading'])
		exports.qtarget:AddTargetEntity(Banks['trolly'][k], {
			options = {
				{
					icon = "fas fa-sack-dollar",
					label = "Zbierz gotówkę",
					action = function(data)
						for x, v in pairs(Config.Banks[index]['wozki']) do
							if not v['loot'] then
								if not grabNow then
									GrabTrolly(index, x)
								end
							else
								ESX.ShowNotification('Nie ma nic na tym wózku!')
							end
						end
					end,
				},
			},
			distance = 2
		})
    end
	timeInside = Config.TimeInside
	while timeInside > 0 do
		Citizen.Wait(1000)
		timeInside = timeInside - 1
		if timeInside == 5 or timeInside == 10 or timeInside == 15 or timeInside == 30 or timeInside == 60 or timeInside == 90 or timeInside == 119 then
			ESX.ShowNotification('Wszystkie drzwi zablokują się za '..timeInside..' sekund!')
		elseif timeInside == 1 then
			for bnk, data in pairs(Config.Banks) do
				if bnk == actualBank then
					if data.doorsID ~= nil then
						TriggerServerEvent('esx_doorlock:updateState', data.doorsID, true)
					end
					ESX.ShowNotification('Wszystkie drzwi się zablokowały!')
					-- for k, v in pairs(Config.Banks) do
						-- if k == v.bank then
							TriggerServerEvent('esx_holdup:endRobbery', actualBank)
						-- end
					-- end
					actualBank = ''
				end
			end
		end
	end
	Citizen.Wait(0)
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(50)
    end
end

function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = joaat(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

function grabMoney(index)
	ESX.TriggerServerCallback('esx_holdup:checkMoneyState', function(state)
		if not state then
			TriggerServerEvent('esx_holdup:setMoneyState', index, true)
			local ped = PlayerPedId()
			FreezeEntityPosition(ped, true)
			RequestAnimDict('oddjobs@shop_robbery@rob_till')
			while not HasAnimDictLoaded('oddjobs@shop_robbery@rob_till') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(ped, "oddjobs@shop_robbery@rob_till", "loop", 8.0, 1.0, 20000, 1)
			grabNow = true
			reward = { item = 'money', count = 400 }
			moneyToTake = 25
			while moneyToTake > 0 do
				Citizen.Wait(1000)
				moneyToTake = moneyToTake - 1
				TriggerServerEvent('fleecaheist:server:rewardItem', reward)
				if moneyToTake == 0 then
					grabNow = false
					ClearPedTasksImmediately(ped)
					FreezeEntityPosition(ped, false)
				end
			end
		else
			ESX.ShowNotification('Nie ma nic na tym wózku!')
		end
	end, index)
	Citizen.Wait(0)
end

function GrabTrolly(index, k)
	grabNow = true
	robber = true
	TriggerServerEvent('fleecaheist:server:lootSync', index, 'wozki', k)
	local ped = PlayerPedId()
	local pedCo, pedRotation = GetEntityCoords(ped), vector3(0.0, 0.0, 0.0)
	local trollyModel = Config.Banks[index]['wozki'][k]['model']
	local animDict = 'anim@heists@ornate_bank@grab_cash'
	grabModel = 'hei_prop_heist_cash_pile'
	loadAnimDict(animDict)
	loadModel('hei_p_m_bag_var22_arm_s')

	sceneObject = GetClosestObjectOfType(Config.Banks[index]['wozki'][k]['coords'], 2.0, trollyModel, 0, 0, 0)
	bag = CreateObject(joaat("hei_p_m_bag_var22_arm_s"), pedCo, true, false, false)

	while not NetworkHasControlOfEntity(sceneObject) do
		NetworkRequestControlOfEntity(sceneObject)
		Citizen.Wait(0)
	end

	for i = 1, #Trolly['animations'] do
		Trolly['scenes'][i] = NetworkCreateSynchronisedScene(GetEntityCoords(sceneObject), GetEntityRotation(sceneObject), 2, true, false, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(ped, Trolly['scenes'][i], animDict, Trolly['animations'][i][1], 1.5, -4.0, 1, 16, 1148846080, 0)
		NetworkAddEntityToSynchronisedScene(bag, Trolly['scenes'][i], animDict, Trolly['animations'][i][2], 4.0, -8.0, 1)
		if i == 2 then
			NetworkAddEntityToSynchronisedScene(sceneObject, Trolly['scenes'][i], animDict, "cart_cash_dissapear", 4.0, -8.0, 1)
		end
	end

	NetworkStartSynchronisedScene(Trolly['scenes'][1])
	Citizen.Wait(1750)
	CashAppear(grabModel)
	NetworkStartSynchronisedScene(Trolly['scenes'][2])
	Citizen.Wait(37000)
	NetworkStartSynchronisedScene(Trolly['scenes'][3])
	Citizen.Wait(2000)

	local emptyobj = 769923921
	newTrolly = CreateObject(emptyobj, Config.Banks[index]['wozki'][k]['coords'], true, false, false)
	SetEntityRotation(newTrolly, 0, 0, GetEntityHeading(sceneObject), 1, 0)
	DeleteObject(sceneObject)
	DeleteObject(bag)
	grabNow = false
end

function CashAppear(grabModel)
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    reward = { item = 'money', count = 650 }
    local grabmodel = joaat(grabModel)
    loadModel(grabmodel)
    local grabobj = CreateObject(grabmodel, pedCoords, true)
    FreezeEntityPosition(grabobj, true)
    SetEntityInvincible(grabobj, true)
    SetEntityNoCollisionEntity(grabobj, ped)
    SetEntityVisible(grabobj, false, false)
    AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
    local startedGrabbing = GetGameTimer()

    Citizen.CreateThread(function()
        while GetGameTimer() - startedGrabbing < 37000 do
            if HasAnimEventFired(ped, joaat("CASH_APPEAR")) then
                if not IsEntityVisible(grabobj) then
                    SetEntityVisible(grabobj, true, false)
                end
            end
            if HasAnimEventFired(ped, joaat("RELEASE_CASH_DESTROY")) then
                if IsEntityVisible(grabobj) then
                    SetEntityVisible(grabobj, false, false)
                    TriggerServerEvent('fleecaheist:server:rewardItem', reward)
                end
            end

			Citizen.Wait(0)
        end
        DeleteObject(grabobj)
    end)
end

exports('checkGrabNow', function()
	return grabNow
end)

RegisterNetEvent("onResourceStop", function(res)
	if res ~= GetCurrentResourceName() then
		return
	end

	for k, v in pairs(Config.Banks) do
		index = k
		local object2 = GetClosestObjectOfType(Config.Banks[index]['doors'], 50.0, joaat('hei_prop_heist_sec_door'), 1, 0, 0)
		if object2 == 0 then
			object2 = GetClosestObjectOfType(Config.Banks[index]['doors'], 50.0, joaat('v_ilev_gb_vauldr'), 1, 0, 0)
		end
		SetEntityHeading(object2, Config.Banks[index]['doorHeading'][2] + 50.0)
		if DoesEntityExist(x) then
			DeletePed(x)
		end
		for k, v in pairs(Config.Banks[index]['wozki']) do
			local object3 = GetClosestObjectOfType(v['coords'], 1.0, 269934519, false, false, false)
			local object4 = GetClosestObjectOfType(v['coords'], 1.0, 769923921, false, false, false)
			if DoesEntityExist(object3) then 
				DeleteEntity(object3)
			end
			if DoesEntityExist(object4) then 
				DeleteEntity(object4)
			end
		end
		for k, v in pairs(Config.Banks[index]['wozki']) do
			v['loot'] = false
		end
	end
end)