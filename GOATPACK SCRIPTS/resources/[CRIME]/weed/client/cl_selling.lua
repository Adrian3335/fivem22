-- \ Locals and tables
local SoldPeds = {}
local SellZone = {}
local currentZone = nil

-- \ Create Zones for the drug sales
for k, v in pairs(Config.SellZones) do
    SellZone[k] = PolyZone:Create(v.points, {
        name= k,
        minZ = v.minZ,
        maxZ = v.maxZ,
        debugPoly = Config.DebugPoly,
    })
end
-- \ Play five animation for both player and ped
local function PlayGiveAnim(tped)
	local pid = PlayerPedId()
	FreezeEntityPosition(pid, true)
	-- QBCore.Functions.RequestAnimDict('mp_common')
	TaskPlayAnim(pid, "mp_common", "givetake2_a", 8.0, -8, 2000, 0, 1, 0,0,0)
	TaskPlayAnim(tped, "mp_common", "givetake2_a", 8.0, -8, 2000, 0, 1, 0,0,0)
	FreezeEntityPosition(pid, false)
end

-- \ Add Old Ped to table
local function AddSoldPed(entity)
    SoldPeds[entity] = true
end

--\ Check if ped is in table
local function HasSoldPed(entity)
    return SoldPeds[entity] ~= nil
end

RegisterNetEvent('it-drugs:client:checkSellOffer', function(entity)
	local copsAmount = lib.callback.await('it-drugs:server:getCopsAmount', false)
	local coords = GetEntityCoords(ESX.PlayerData.ped, true)

	if copsAmount < Config.MinimumCops then
		ShowNotification(nil, _U('NOTIFICATION__NOT__INTERESTED'), 'error')
		if Config.Debug then lib.print.info('Not Enough Cops Online') end
		return
	end
	
	local isSoldtoPed = HasSoldPed(entity)
	if isSoldtoPed then
		ShowNotification(nil, _U('NOTIFICATION__ALLREADY__SPOKE'), 'error')
		return
	end

	SetEntityAsMissionEntity(entity, true, true)
	TaskTurnPedToFaceEntity(entity, PlayerPedId(), -1)
	Wait(500)

	-- seed math random
	math.randomseed(GetGameTimer())
	local sellChance = math.random(0, 100)

	if sellChance > Config.SellSettings['sellChance'] then
		local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
		TriggerServerEvent('narkosprzedane', {x = coords.x, y = coords.y, z = coords.y}, GetStreetNameFromHashKey(s1), name)
		ShowNotification(nil, _U('NOTIFICATION__CALLING__COPS'), 'error')
		TaskUseMobilePhoneTimed(entity, 8000)
		SetPedAsNoLongerNeeded(entity)
		ClearPedTasks(PlayerPedId())
		AddSoldPed(entity)

		local coords = GetEntityCoords(entity)
		SendPoliceAlert(coords)
		return
	end

	if not currentZone then return end
	local zoneConfig = Config.SellZones[currentZone.name]

	local sellAmount = math.random(Config.SellSettings['sellAmount'].min, Config.SellSettings['sellAmount'].max)
	local sellItemData = nil
	local playerItems = 0

	if Config.SellSettings['onlyAvailableItems'] then
		local availabeItems = {}
		for _, itemData in pairs(zoneConfig.drugs) do
			if it.hasItem(itemData.item)then
				table.insert(availabeItems, itemData)
			end
		end

		if #availabeItems == 0 then
			ShowNotification(nil, _U('NOTIFICATION__NO__DRUGS'), 'error')
			SetPedAsNoLongerNeeded(entity)
			return
		end

		-- seed math random
		math.randomseed(GetGameTimer())
		sellItemData = availabeItems[math.random(1, #availabeItems)]
		playerItems = it.getItemCount(sellItemData.item)
	else
		sellItemData = zoneConfig.drugs[math.random(1, #zoneConfig.drugs)]
		playerItems = it.getItemCount(sellItemData.item)
		if playerItems == 0 then
			ShowNotification(nil, _U('NOTIFICATION__NO__DRUGS'), 'error')
			SetPedAsNoLongerNeeded(entity)
			return
		end
	end

	if playerItems < sellAmount then
		sellAmount = playerItems
	end

	TriggerEvent('it-drugs:client:showSellMenu', {item = sellItemData.item, price = sellItemData.price, amount = sellAmount, entity = entity})
	SetTimeout(Config.SellSettings['sellTimeout']*1000, function()
		if Config.Debug then lib.print.info('Sell Menu Timeout... Current Menu', lib.getOpenContextMenu()) end
		if lib.getOpenContextMenu() ~= nil then
			local currentMenu = lib.getOpenContextMenu()
			if currentMenu == 'it-drugs-sell-menu' then
				ShowNotification(nil, _U('NOTIFICATION__TO__LONG'), 'error')
				lib.hideContext(false)
				SetPedAsNoLongerNeeded(entity)
			end
		end
	end)
end) 

-- \ event handler to server (execute server side)
RegisterNetEvent('it-drugs:client:salesInitiate', function(cad)
	local coords = GetEntityCoords(ESX.PlayerData.ped, true)
	AddSoldPed(cad.tped)
	if cad.type == 'close' then
		ShowNotification(nil, _U('NOTIFICATION__OFFER__REJECTED'), 'error')
		SetPedAsNoLongerNeeded(cad.tped)
	else
		PlayGiveAnim(cad.tped)
		TriggerServerEvent('it-drugs:server:initiatedrug', cad)		
		SetPedAsNoLongerNeeded(cad.tped)
	end
end)


-- \ Check if inside sellzone
CreateThread(function()
	while true do
		if SellZone and next(SellZone) then
			local ped = PlayerPedId()
			local coord = GetEntityCoords(ped)
			for k, _ in pairs(SellZone) do
				if SellZone[k] then
					if SellZone[k]:isPointInside(coord) then
						SellZone[k].inside = true
                        currentZone = SellZone[k]
						if not SellZone[k].target then
							SellZone[k].target = true
							CreateSellTarget()
							if Config.Debug then print("Target Added ["..currentZone.name.."]") end
						end
						if Config.Debug then print(json.encode(currentZone)) end
					else
						SellZone[k].inside = false
						if SellZone[k].target then
							SellZone[k].target = false
							RemoveSellTarget()
							if Config.Debug then print("Target Removed ["..SellZone[k].name.."]") end
						end
					end
				end
			end
		end
		Wait(1000)
	end
end)

RegisterNetEvent('narkosprzedane')
AddEventHandler('narkosprzedane', function(target, coords, location, type, hour)
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'lssd' then
		exports["goat_notifications"]:policeNotify({
			playerId = target,
			coords = coords,
			textColor = "#fff",
			bgColor = "#06a5ff",
			title1 = "10-70",
			title2 = "Zgłoszenie",
			blip = {
				name = "Narkotyki",
				sprite = 140,
				scale = 0.9,
				colour = 2,
				timeToDelete = 20000
			},
			sound = {
				file = "PoliceDispatch",
				volume = 0.3
			},
			content = {
				{
					type = "location",
					text = location
				},
				{
					type = "close",
					text = 'Narkotyki'
				},
				{
					type = "msg",
					text = "Dealer narkotykow! Godzina zgłoszenia: " .. hour
				}
			}
		})
	end
end)