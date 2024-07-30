local PlayerLoaded = false
local FirstSpawn = true
local LastSkin = nil
local CharacterCam = nil
local heading = nil
local zoomOffset = 0.4
local CharacterAngle = 90
local CharacterHeading = 0.75
local CharacterOffset = 0.0
local CharacterSubmitCb = nil
local CharacterCancelCb = nil
local elements = {}

local changeElementsTo0 = {
	["tshirt_1"] = "tshirt_2",
	["torso_1"] = "torso_2",
	["decals_1"] = "decals_2",
	["arms"] = "arms_2",
	["pants_1"] = "pants_2",
	["shoes_1"] = "shoes_2",
	["mask_1"] = "mask_2",
	["bproof_1"] = "bproof_2",
	["chain_1"] = "chain_2",
	["helmet_1"] = "helmet_2",
	["glasses_1"] = "glasses_2",
	["watches_1"] = "watches_2",
	["bracelets_1"] = "bracelets_2",
	["bags_1"] = "bags_2",
	["ears_1"] = "ears_2",
}

OpenMenu = function(submitCb, cancelCb, restrict)
    CharacterSubmitCb = submitCb
    CharacterCancelCb = cancelCb
    local playerPed = PlayerPedId()
    TriggerEvent('skinchanger:getSkin', function(skin)
		LastSkin = skin
        TriggerEvent('skinchanger:getData', function(components, maxVals)
			elements    = {}
			local _components = {}

			-- Restrict menu
			if restrict == nil then
				for i=1, #components, 1 do
					_components[i] = components[i]
				end
			else
				for i=1, #components, 1 do
					local found = false

					for j=1, #restrict, 1 do
						if components[i].name == restrict[j] then
							found = true
						end
					end

					if found then
						_components[#_components + 1] = components[i]
					end
				end
			end

			-- Insert elements
			for i=1, #_components, 1 do
				local value       = _components[i].value
				
				local componentId = _components[i].componentId
				if componentId == 0 then
					value = GetPedPropIndex(playerPed, _components[i].componentId)
				end

				local data = {
					label     = _components[i].label,
					name      = _components[i].name,
					value     = value,
					min       = _components[i].min,
					restrict  = skin.sex == 0 and _components[i].restrictMale or _components[i].restrictFemale,
					textureof = _components[i].textureof,
					zoomOffset= _components[i].zoomOffset,
					CharacterOffset = _components[i].camOffset,
					type      = 'slider'
				}

				for k,v in pairs(maxVals) do
					if k == _components[i].name then
						data.max = v
					end
				end

				elements[#elements + 1] = data
			end

            while #elements ~= #_components do
                Citizen.Wait(0)
            end

            SendNUIMessage({
                action = "OpenMenu",
                elements = elements
            })
            SetNuiFocus(true, true)

			CreateSkinCam()
        end)
    end)
end

function OpenMenuCreatePed(submitCb, cancelCb, restrict)
	local playerPed = PlayerPedId()

	TriggerEvent('skinchanger:getSkin', function(skin)
		LastSkin = skin

		TriggerEvent('skinchanger:getData2', function(components, maxVals)
			local elements    = {}
			local _components = {}

			-- Restrict menu
			if restrict == nil then
				for i=1, #components, 1 do
					_components[i] = components[i]
				end
			else
				for i=1, #components, 1 do
					local found = false

					for j=1, #restrict, 1 do
						if components[i].name == restrict[j] then
							found = true
						end
					end

					if found then
						_components[#_components + 1] = components[i]
					end
				end
			end

			-- Insert elements
			for i=1, #_components, 1 do
				local value       = _components[i].value
				local componentId = _components[i].componentId

				if componentId == 0 then
					value = GetPedPropIndex(playerPed, _components[i].componentId)
				end

				local data = {
					label     = _components[i].label,
					name      = _components[i].name,
					value     = value,
					min       = _components[i].min,
					restrict  = (skin.sex == 0 and _components[i].restrictMale or _components[i].restrictFemale),
					textureof = _components[i].textureof,
					zoomOffset= _components[i].zoomOffset,
					camOffset = _components[i].camOffset,
					type      = 'slider'
				}

				for k,v in pairs(maxVals) do
					if k == _components[i].name then
						data.max = v
						break
					end
				end

				elements[#elements + 1] = data
            			SendNUIMessage({
              				action = "OpenMenu",
                			elements = elements
          			})
				SetNuiFocus(true, true)
			end

			CreateSkinCam()
			zoomOffset = _components[1].zoomOffset
			camOffset = _components[1].camOffset

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'skin', {
				title = 'Skin menu',
				align = 'bottom-right',
				elements = elements
			}, function(data, menu)
				menu.close()
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'skin_confirm', {
					title    = 'Czy na pewno chcesz zapisać zmiany?',
					align    = 'center',
					elements = {
						{ label = 'Tak', value = true },
						{ label = 'Nie', value = false }
					},
				}, function(data2, menu2)
					menu2.close()
					if data2.current.value then
						TriggerEvent('skinchanger:getSkin', function(skin)
							LastSkin = skin
						end)
						DeleteSkinCam()
						if submitCb ~= nil then
							submitCb(data, menu)
						end
					else
						CreateSkinCam()
						menu.open()
					end
				end, function(data2, menu2)
					menu2.close()
					CreateSkinCam()
					menu.open()
				end)
			end,
			function(data, menu)
				menu.close()
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'skin_confirm', {
					title    = 'Czy na pewno chcesz wyjść bez zapisywania zmian?',
					align    = 'center',
					elements = {
						{ label = 'Tak', value = true },
						{ label = 'Nie', value = false }
					},
				}, function(data2, menu2)
					menu2.close()
					if data2.current.value then
						TriggerEvent('skinchanger:loadSkin', LastSkin)

						DeleteSkinCam()
						if cancelCb ~= nil then
							cancelCb(data, menu)
						end
					else
						CreateSkinCam()
						menu.open()
					end
				end, function(data2, menu2)
					menu2.close()
					CreateSkinCam()
					menu.open()
				end)
			end,
			function(data, menu)
			  TriggerEvent('skinchanger:getSkin', function(skin)
				zoomOffset = data.current.zoomOffset
				camOffset = data.current.camOffset
				if skin[data.current.name] ~= data.current.value then
				  -- Change skin element
				  TriggerEvent('skinchanger:change', data.current.name, data.current.value)

				  -- Update max values
				  TriggerEvent('skinchanger:getData2', function(components, maxVals)
					for i=1, #elements, 1 do
					  local newData = {}

					  newData.max = maxVals[elements[i].name]
					  if elements[i].textureof ~= nil and data.current.name == elements[i].textureof then
						newData.value = 0
					  end

					  menu.update({name = elements[i].name}, newData)
					end

					menu.refresh()
				  end)
				end
			  end)
			end, function()
				DeleteSkinCam()
			end)
		end)
	end)
end

CreateSkinCam = function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    CharacterCam    = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)

    SetCamActive(CharacterCam, true)
	RenderScriptCams(true, true, 500, true, true)

    SetCamRot(CharacterCam, 0.0, 0.0, 270.0, true)
    CharacterAngle = GetEntityHeading(playerPed) - 260
    CharacterOffset = 0
    SendNUIMessage({
        action = "setRot",
        angle = CharacterAngle
    })

    while CharacterCam ~= nil do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)

        local angle = CharacterAngle * math.pi / 180.0
        
        local theta = {
            x = math.cos(angle),
            y = math.sin(angle)
        }

        local pos = {
            x = coords.x + ((zoomOffset + CharacterHeading) * theta.x),
            y = coords.y + ((zoomOffset + CharacterHeading) * theta.y)
        }

        local angleToLook = CharacterAngle - 180.0
        if angleToLook > 360 then
            angleToLook = angleToLook - 360
        elseif angleToLook < 0 then
            angleToLook = angleToLook + 360
        end

        angleToLook = angleToLook * math.pi / 180.0
        local thetaToLook = {
            x = math.cos(angleToLook),
            y = math.sin(angleToLook)
        }

        local posToLook = {
            x = coords.x + ((zoomOffset + CharacterHeading) * thetaToLook.x),
            y = coords.y + ((zoomOffset + CharacterHeading) * thetaToLook.y)
        }

        SetCamCoord(CharacterCam, pos.x, pos.y, coords.z + CharacterOffset)
        PointCamAtCoord(CharacterCam, posToLook.x, posToLook.y, coords.z + CharacterOffset)
    end
end

DeleteSkinCam = function()
    SetCamActive(CharacterCam, false)
	RenderScriptCams(false, true, 500, true, true)
    CharacterCam = nil
end

RegisterNUICallback("change", function(data)
    TriggerEvent('skinchanger:change', data.name, data.value)
    TriggerEvent('skinchanger:getData', function(components, maxVals)
        for i=1, #elements, 1 do
            if elements[i].name == data.name then
                local newmin = elements[i].min
                local newmax = maxVals[elements[i].name]
                SendNUIMessage({
                    action = "UpdateVals",
                    name = elements[i].name,
                    max = newmax,
                    min = newmin,
					value = -1
                })
			elseif changeElementsTo0[data.name] then
				if elements[i].name == changeElementsTo0[data.name] then
					TriggerEvent('skinchanger:change', elements[i].name, 0)
					elements[i].value = 0
					local newmin = elements[i].min
					local newmax = maxVals[elements[i].name]
					SendNUIMessage({
						action = "UpdateVals",
						name = elements[i].name,
						max = newmax,
						min = newmin,
						value = elements[i].value
					})
				end
			end
        end
    end)
end)

RegisterNUICallback("submit", function(data)
    TriggerEvent('skinchanger:getSkin', function(skin)
        LastSkin = skin
    end)
    DeleteSkinCam()
	SetNuiFocus(false, false)
	if CharacterSubmitCb then
        CharacterSubmitCb()
    end
end)

RegisterNUICallback("cancel", function(data)
    TriggerEvent('skinchanger:loadSkin', LastSkin)
	DeleteSkinCam()
    SetNuiFocus(false, false)
    if CharacterCancelCb then
        CharacterCancelCb()
    end
end)

RegisterNUICallback("rotation", function(data)
    local angle = data.value
    CharacterAngle = angle + 0.0
end)

RegisterNUICallback("heading", function(data)
    local heading = data.value
    CharacterHeading = heading + 0.0
end)

RegisterNUICallback("offset", function(data)
    local offsett = data.value
    CharacterOffset = offsett + 0.0
end)

function OpenSaveableMenu(submitCb, cancelCb, restrict)
	TriggerEvent('skinchanger:getSkin', function(skin)
		LastSkin = skin
	end)

	OpenMenu(function()
		TriggerEvent('skinchanger:getSkin', function(skin)
			TriggerServerEvent('esx_skin:save', skin)
			TriggerEvent('esx_ciuchy:wear')
			if submitCb ~= nil then
				submitCb()
			end
		end)

	end, cancelCb, restrict)
end

function OpenSaveableMenuCreatePed(submitCb, cancelCb, restrict)
	TriggerEvent('skinchanger:getSkin', function(skin)
		LastSkin = skin
	end)

	OpenMenuCreatePed(function(data, menu)
		menu.close()
		DeleteSkinCam()
		TriggerEvent('skinchanger:getSkin', function(skin)
			TriggerServerEvent('esx_skin:save', skin)
			TriggerEvent('esx_ciuchy:wear')
			if submitCb ~= nil then
				submitCb(data, menu)
			end
		end)
	end, cancelCb, restrict)
end

AddEventHandler('skinchanger:save', function(cbs)
    TriggerEvent('skinchanger:getSkin', function(skin)
		TriggerServerEvent('esx_skin:save', skin)
		TriggerEvent('esx_ciuchy:wear')
		if cbs ~= nil then
			cbs()
		end
    end)
end)

local CharacterCreating = false
AddEventHandler('wait_core:loading', function(num)
	if num == 1 then
		CreateThread(function()
			while not PlayerLoaded do
				Citizen.Wait(100)
			end
		
			if FirstSpawn then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					if skin == nil then
						TriggerEvent('skinchanger:loadSkin', {sex = 0})
						CharacterCreating = true
						local essss = true
						OpenSaveableMenu(function()
							essss = false
						end, function()
							essss = false
						end, nil)

						MumbleSetVolumeOverride(PlayerId(), 0.0)
						CreateThread(function()
							local playerPool = {}
							while CharacterCreating do
								local players = GetActivePlayers()
								for i = 1, #players do
									local player = players[i]
									if player ~= PlayerId() and not playerPool[player] then
										playerPool[player] = true
										NetworkConcealPlayer(player, true, true)
									end
								end
								Wait(0)
							end
							for k in pairs(playerPool) do
								NetworkConcealPlayer(k, false, false)
							end
						end)
						CreateThread(function()
							while CharacterCreating do
								DisableAllControlActions(0)
								SetEntityVisible(PlayerPedId(), 0, 0)
								SetLocalPlayerVisibleLocally(1)
								SetPlayerInvincible(PlayerId(), 1)
								Wait(0)
								local vehicles = GetGamePool('CVehicle')
								for i = 1, #vehicles do
									SetEntityLocallyInvisible(vehicles[i])
								end
							end
							local playerId, playerPed = PlayerId(), PlayerPedId()
							MumbleSetVolumeOverride(playerId, -1.0)
							SetEntityVisible(playerPed, 1, 0)
							SetPlayerInvincible(playerId, 0)
						end)

						while essss do
							Wait(0)
						end
						CharacterCreating = false

						local playerPed = PlayerPedId()
						SetEntityCoords(playerPed, -1042.575439, -2745.922119, 21.359383)
						SetEntityHeading(playerPed, 323.62954711914)

						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_skin:save', skin)
						end)
					else
						TriggerEvent('skinchanger:loadSkin', skin)
						TriggerEvent('esx_ciuchy:wear')
					end
				end)
				
				FirstSpawn = false
			end
		end)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerLoaded = true
end)

AddEventHandler('esx_skin:getLastSkin', function(cb)
	cb(LastSkin)
end)

AddEventHandler('esx_skin:setLastSkin', function(skin)
	LastSkin = skin
end)

RegisterNetEvent('esx_skin:openMenu')
AddEventHandler('esx_skin:openMenu', function(submitCb, cancelCb)
	OpenMenu(submitCb, cancelCb, nil)
end)

RegisterNetEvent('esx_skin:openRestrictedMenu')
AddEventHandler('esx_skin:openRestrictedMenu', function(submitCb, cancelCb, restrict)
	OpenMenu(submitCb, cancelCb, restrict)
end)

RegisterNetEvent('esx_skin:openSaveableMenu')
AddEventHandler('esx_skin:openSaveableMenu', function(submitCb, cancelCb)
	OpenSaveableMenu(submitCb, cancelCb, nil)
end)

RegisterNetEvent('esx_skin:makeup')
AddEventHandler('esx_skin:makeup', function()

end)

RegisterNetEvent('esx_skin:requestSaveSkin')
AddEventHandler('esx_skin:requestSaveSkin', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
		TriggerServerEvent('esx_skin:responseSatestveSkin', skin)
	end)
end)

RegisterNetEvent('esx_skin:openSaveableMenuPed')
AddEventHandler('esx_skin:openSaveableMenuPed', function(submitCb, cancelCb)
	OpenSaveableMenuCreatePed(submitCb, cancelCb, {'sex'})
end)