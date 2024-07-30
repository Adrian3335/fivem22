local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

local GUI						= {}
GUI.Time						= 0

local HasAlreadyEnteredMarker	= false
local LastZone					= nil
local CurrentAction				= nil
local CurrentActionMsg			= ''
local CurrentActionData			= {}
local currentTattoos			= false
local cam						= -1
local HeadingToSet				= 180.0


function drawTattoos()
	local ped = PlayerPedId()

	local any = false
	for i, k in pairs(currentTattoos) do
		if not k.category then
			local migrate = Config.OldTattooList[k.collection][k.texture]
			for category, list in ipairs(Config.TattooList) do
				for texture, data in ipairs(list) do
					if data.collectionHash == k.collection and data.nameHash == migrate.nameHash then
						k = {
							category = category,
							texture = texture
						}
						if not any then
							any = true
						end

						currentTattoos[i] = k
						break
					end
				end
			end
		end

		if not k.category then
			table.remove(currentTattoos, i)
			if not any then
				any = true
			end
		else			
			local data = Config.TattooList[k.category][k.texture]			
			ApplyPedOverlay(ped, joaat(data.collectionHash), joaat(data.nameHash))
		end
	end

	if any then
		ESX.TriggerServerCallback('esx_tattooshop:purchaseTattoo', function(success) end, currentTattoos, 0, nil)
	end
end

AddEventHandler('skinchanger:modelComplete', function()	
	if not currentTattoos then
		currentTattoos = true
		ESX.TriggerServerCallback('esx_tattooshop:getTattoos', function(tattooList)
			currentTattoos = tattooList
			drawTattoos()
		end)
	elseif type(currentTattoos) == 'table' then
		drawTattoos()
	end
end)

RegisterNetEvent('esx_tattooshop:setTattoos')
AddEventHandler('esx_tattooshop:setTattoos', function(tattooList)
	currentTattoos = tattooList
end)

function OpenShopMenu()
	local elements = {}
	for i, name in pairs(Config.TattooCategories) do
		if #Config.TattooList[i] > 0 then
			elements[#elements + 1] = {label = name, value = i}
		end
	end

	elements[#elements + 1] = {label = 'Usuń tatuaże ' .. _U('money_amount', Config.ClearPrice), value = 'clear', price = Config.ClearPrice}
	if Config.LockCam and DoesCamExist(cam) then
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tattoo_shop', {
		title    = _U('tattoos'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		local currentLabel, currentValue = data.current.label, data.current.value
		if currentValue == 'clear' then
			ESX.TriggerServerCallback('esx_tattooshop:purchaseTattoo', function(success)
				if success then
					menu.close()
					currentTattoos = {}
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
						TriggerEvent('skinchanger:loadSkin', skin)
					end)
				end
			end, {}, data.current.price, nil)
		elseif currentValue ~= nil then
			elements = { {label = _U('go_back_to_menu'), value = nil} }
			for i, k in pairs(Config.TattooList[currentValue]) do
				elements[#elements + 1] = {
					label = _U('tattoo_item', i, _U('money_amount', k.price)),
					value = i,
					price = k.price
				}
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tattoo_shop_categories', {
				title    = _U('tattoos') .. ' | ' .. currentLabel,
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				if data2.current.value ~= nil then
					ESX.TriggerServerCallback('esx_tattooshop:purchaseTattoo', function(success)
						if success then
							currentTattoos[#currentTattoos + 1] = {category = currentValue, texture = data2.current.value}
						end
					end, currentTattoos, data2.current.price, {category = currentValue, texture = data2.current.value})
				else
					OpenShopMenu()
					if Config.LockCam then
						RenderScriptCams(false, false, 0, 1, 0)
						DestroyCam(cam, false)
					end

					setPedSkin()
				end
			end, function(data2, menu2)
				menu2.close()
				if Config.LockCam then
					RenderScriptCams(false, false, 0, 1, 0)
					DestroyCam(cam, false)
				end

				setPedSkin()
			end, function(data2, menu2) -- when highlighted
				if data2.current.value ~= nil then
					drawTattoo(currentValue, data2.current.value)
				end
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

if not Config.Target then
	CreateThread(function()
		Citizen.Wait(1000)
		for k, v in pairs(Config.Zones) do
			local blip = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite(blip, 75)
			SetBlipColour(blip, 1)
			SetBlipScale(blip, 0.8)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(_U('tattoo_shop'))
			EndTextCommandSetBlipName(blip)
			Citizen.Wait(0)
		end
	end)
else
	CreateThread(function()
		for k,v in pairs(Config.Zones) do
			local blip = AddBlipForCoord(v.PedCoords["x"], v.PedCoords["y"], v.PedCoords["z"])
	
			SetBlipSprite(blip, 75)
			SetBlipColour(blip, 1)
			SetBlipScale(blip, 0.8)
			SetBlipAsShortRange(blip, true)
	
			BeginTextCommandSetBlipName("STRING")
			-- AddTextComponentString(_U('tattoo_shop'))
			AddTextComponentString("<font face='Poppins-Medium' size= '11'>".. _U('tattoo_shop') .."</font>" )
			EndTextCommandSetBlipName(blip)
			exports['rp_base']:SetBlip(blip, 'tattoo')
	
			RequestModel(joaat(v.PedCoords["hash"]))
			while not HasModelLoaded(joaat(v.PedCoords["hash"])) do
				Wait(0)
			end
	
			local ped = CreatePed(4, v.PedCoords["hash"], v.PedCoords["x"], v.PedCoords["y"], v.PedCoords["z"] - 1.0, v.PedCoords["h"], false, true)
			FreezeEntityPosition(ped, true)
			SetEntityInvincible(ped, true)
			SetBlockingOfNonTemporaryEvents(ped, true)
	
			exports.qtarget:AddTargetEntity(ped, {
				options = {
					{
						event = "esx_tattooshop:target:openshop",
						icon = "fas fa-bag-shopping",
						label = "Skorzystaj z usług",
						coords = v.MenuCoords,
						timeToOpen = v.MenuCoords.time,
						num = 1
					}
				},
				distance = 2
			})
		end
	end)
	
	RegisterNetEvent("esx_tattooshop:target:openshop", function(data)
		HeadingToSet = data.coords.h
		TaskGoStraightToCoord(
			PlayerPedId(), 
			data.coords.x, 
			data.coords.y, 
			data.coords.z, 
			0.2, 
			-1, 
			data.coords.h, 
			0.0
		)
		ESX.ShowNotification("Za ".. math.floor(data.timeToOpen / 1000) .." sekund pojawi się menu")
		Wait(data.timeToOpen)
		OpenShopMenu()
	end)
end

-- Display markers
CreateThread(function()
	while not Config.Target do
		Citizen.Wait(5)

		local coords = GetEntityCoords(PlayerPedId())
		local sleep = true
		
		for k, v in pairs(Config.Zones) do
			if (Config.Type ~= -1 and #(coords - vec3(v.x, v.y, v.z)) < Config.DrawDistance) then
				sleep = false				
				ESX.DrawMarker(vec3(v.x, v.y, v.z))
			end
		end
		
		if sleep then
			Citizen.Wait(250)
		end
	end
end)

-- Enter / Exit marker events
CreateThread(function()
	while not Config.Target do
		Citizen.Wait(60)

		local coords = GetEntityCoords(PlayerPedId())
		local isInMarker  = false
		local currentZone = nil

		for k, v in pairs(Config.Zones) do
			if #(coords - vec3(v.x, v.y, v.z)) < Config.Size.x then
				isInMarker  = true
				currentZone = 'TattooShop'
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone                = currentZone
			TriggerEvent('esx_tattooshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_tattooshop:hasExitedMarker', LastZone)
		end
	end
end)

AddEventHandler('esx_tattooshop:hasEnteredMarker', function(zone)
	if zone == 'TattooShop' then
		CurrentAction     = 'tattoo_shop'
		CurrentActionMsg  = _U('tattoo_shop_prompt')
		CurrentActionData = {zone = zone}
	end
end)

AddEventHandler('esx_tattooshop:hasExitedMarker', function()
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
	setPedSkin() -- make sure this triggers
end)

-- Key Controls
CreateThread(function()
	while not Config.Target do
		Citizen.Wait(5)
		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)

			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlPressed(0,  Keys['E']) and (GetGameTimer() - GUI.Time) > 300 then
				if CurrentAction == 'tattoo_shop' then
					OpenShopMenu()
				end

				CurrentAction = nil
				GUI.Time      = GetGameTimer()
			end
		else
			Citizen.Wait(250)
		end
	end
end)

function setPedSkin()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
end

function drawTattoo(category, texture)
	local process = function(ped)
		SetEntityHeading(ped, HeadingToSet)

		local data = Config.TattooList[category][texture]
		ApplyPedOverlay(ped, joaat(data.collectionHash), joaat(data.nameHash))
		if Config.LockCam then
			local coords = GetEntityCoords(ped)
			if not DoesCamExist(cam) then
				cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
				SetCamCoord(cam, ped)
				SetCamRot(cam, 0.0, 0.0, 0.0)

				SetCamActive(cam, true)
				RenderScriptCams(true, false, 0, true, true)
				SetCamCoord(cam, ped)
			end

			local x,y,z = table.unpack(coords)
			SetCamCoord(cam, x + data.addedX, y + data.addedY, z + data.addedZ)
			SetCamRot(cam, 0.0, 0.0, data.rotZ)
		end
	end

	local pid = PlayerPedId()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 0,
				helmet_1 = -1,
				helmet_2 = 0,
				torso_1  = 15,
				torso_2  = 0,
				tshirt_1 = 15,
				tshirt_2 = 0,
				arms     = 15,
				decals_1 = 0,
				decals_2 = 0,
				chain_1  = 0,
				chain_2  = 0,
				pants_1  = 61,
				pants_2  = 1,
				shoes_1  = 34,
				shoes_2  = 0,
				bags_1   = 0,
				bags_2   = 0,
				mask_1   = 0,
				mask_2   = 0,
				bproof_1 = 0,
				bproof_2 = 0
			}, function()
				process(pid)
			end)
		else
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 1,
				helmet_1 = -1,
				helmet_2 = 0,
				torso_1  = 15,
				torso_2  = 0,
				tshirt_1 = 15,
				tshirt_2 = 0,
				arms     = 15,
				decals_1 = 0,
				decals_2 = 0,
				chain_1  = 0,
				chain_2  = 0,
				pants_1  = 15,
				pants_2  = 0,
				shoes_1  = 35,
				shoes_2  = 0,
				bags_1   = 0,
				bags_2   = 0,
				mask_1   = 0,
				mask_2   = 0,
				bproof_1 = 0,
				bproof_2 = 0
			}, function()
				process(pid)
			end)
		end
	end)
end

local carry = {
	InProgress = false,
	targetSrc = -1,
	type = "",
	personCarrying = {
		animDict = "missfinale_c2mcs_1",
		anim = "fin_c2_mcs_1_camman",
		flag = 49,
	},
	personCarried = {
		animDict = "nm",
		anim = "firemans_carry",
		attachX = 0.27,
		attachY = 0.15,
		attachZ = 0.63,
		flag = 33,
	}
}

local function GetClosestPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    for _,playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(targetCoords-playerCoords)
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = playerId
                closestDistance = distance
            end
        end
    end
	if closestDistance ~= -1 and closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

local function ensureAnimDict(animDict)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(0)
        end        
    end
    return animDict
end

RegisterCommand("podnies",function(source, args)
	if not carry.InProgress then
		if not LocalPlayer.state.IsHandcuffed and not LocalPlayer.state.Tied and not LocalPlayer.state.IsDead then
			if IsPedStill(PlayerPedId()) then
				if not IsPedInAnyVehicle(PlayerPedId()) then
					local closestPlayer = GetClosestPlayer(3)
					if closestPlayer then
						local targetSrc = GetPlayerServerId(closestPlayer)
						if targetSrc ~= -1 then
							carry.InProgress = true
							carry.targetSrc = targetSrc
							TriggerServerEvent("CarryPeople:sync",targetSrc)
							ensureAnimDict(carry.personCarrying.animDict)
							carry.type = "carrying"
						else
							ESX.ShowNotification("Nie ma nikogo w pobliżu")
						end
					else
						ESX.ShowNotification("Nie ma nikogo w pobliżu")
					end
				end
			else
				ESX.ShowNotification("Nie możesz podnieść kogoś w biegu")
			end
		end
	elseif carry.type == "carrying" then
		carry.InProgress = false
		ClearPedSecondaryTask(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
		TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
		carry.targetSrc = 0
	end
end, false)

RegisterCommand("+stopPodnies", function() end)
RegisterCommand("-stopPodnies", function()
	if carry.InProgress and carry.type == "carrying" then
		carry.InProgress = false
		ClearPedSecondaryTask(PlayerPedId())
		DetachEntity(PlayerPedId(), true, false)
		TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
		carry.targetSrc = 0
	end
end)
RegisterKeyMapping("+stopPodnies", "Puść gracza", "keyboard", "X")

RegisterNetEvent("CarryPeople:syncTarget")
AddEventHandler("CarryPeople:syncTarget", function(targetSrc)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(targetSrc))
	carry.InProgress = true
	ensureAnimDict(carry.personCarried.animDict)
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, carry.personCarried.attachX, carry.personCarried.attachY, carry.personCarried.attachZ, 0.5, 0.5, 180, false, false, false, false, 2, false)
	carry.type = "beingcarried"
end)

RegisterNetEvent("CarryPeople:cl_stop")
AddEventHandler("CarryPeople:cl_stop", function()
	carry.InProgress = false
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

Citizen.CreateThread(function()
	while true do
		if carry.InProgress then
			if carry.type == "beingcarried" then
				if not IsEntityPlayingAnim(PlayerPedId(), carry.personCarried.animDict, carry.personCarried.anim, 3) then
					TaskPlayAnim(PlayerPedId(), carry.personCarried.animDict, carry.personCarried.anim, 8.0, -8.0, 100000, carry.personCarried.flag, 0, false, false, false)
				end
			elseif carry.type == "carrying" then
				if not IsEntityPlayingAnim(PlayerPedId(), carry.personCarrying.animDict, carry.personCarrying.anim, 3) then
					TaskPlayAnim(PlayerPedId(), carry.personCarrying.animDict, carry.personCarrying.anim, 8.0, -8.0, 100000, carry.personCarrying.flag, 0, false, false, false)
				end
			end
		else
			Citizen.Wait(250)
		end
		Citizen.Wait(0)
	end
end)