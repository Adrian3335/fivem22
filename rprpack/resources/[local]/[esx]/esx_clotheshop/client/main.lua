ESX = exports.es_extended.getSharedObject()
local currentSkin = nil

function RestrictedMenu()
	ESX.UI.Menu.CloseAll()
	
	TriggerEvent('skinchanger:getSkin', function(skin)
		currentSkin = skin
	end)
	
	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title = _U('valid_this_purchase'),
			align = 'right',
			elements = {
				{label = _U('no'), value = 'no'},
				{label = _U('yes'), value = 'yes'}
			}
		}, function(data, menu)
			menu.close()

			local t = true
			if data.current.value == 'yes' then
				ESX.TriggerServerCallback('esx_clotheshop:buyClothes', function(bought)
					if bought then
						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_skin:save', skin)
							currentSkin = skin
						end)
					else
						t = false
						ESX.ShowNotification(_U('not_enough_money'))
						cleanPlayer()
					end
				end)
			elseif data.current.value == 'no' then
				t = false
			end
		end, function(data, menu)
			menu.close()
			cleanPlayer()
		end)

	end, function(data, menu)
		cleanPlayer()
	end, {
		'tshirt_1',
		'tshirt_2',
		'torso_1',
		'torso_2',
		'decals_1',
		'decals_2',
		'arms',
		'pants_1',
		'pants_2',
		'shoes_1',
		'shoes_2',
		'chain_1',
		'chain_2',
		'watches_1',
		'watches_2',
		'helmet_1',
		'helmet_2',
		'mask_1',
		'mask_2',
		'glasses_1',
		'glasses_2',
		'bags_1',
		'bags_2'
	})
end

function cleanPlayer()
	TriggerEvent('skinchanger:loadSkin', currentSkin)
	currentSkin = nil
end

-- Create Blips
CreateThread(function()
	for k,v in pairs(Config.Shops) do
		local blip = AddBlipForCoord(v.PedCoords["x"], v.PedCoords["y"], v.PedCoords["z"])

		SetBlipSprite (blip, 73)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, v.BlipColor)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.Name)
		EndTextCommandSetBlipName(blip)

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
					event = "esx_clotheshop:OpenShopMenu",
					icon = "fas fa-bag-shopping",
					label = "Sklep Odzieżowy [$"..Config.Price.."]",
					-- coords = v.MenuCoords,
					-- timeToOpen = v.MenuCoords.time,
					-- type = "shop_clothes",
				},
			},
			distance = 2
		})
	end
end)

RegisterNetEvent("esx_clotheshop:OpenShopMenu", function(data)
	-- if data.type == "shop_clothes" then
		-- TaskGoStraightToCoord(
		-- 	PlayerPedId(), 
		-- 	data.coords.x, 
		-- 	data.coords.y, 
		-- 	data.coords.z, 
		-- 	0.2, 
		-- 	-1, 
		-- 	data.coords.h, 
		-- 	0.0
		-- )
		ESX.ShowNotification("Za ".. math.floor(3000 / 1000) .." sekund pojawi się menu edycji")
		Wait(3000)
		RestrictedMenu()
	-- end
end)