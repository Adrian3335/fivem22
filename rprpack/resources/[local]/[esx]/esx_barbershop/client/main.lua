ESX = exports.es_extended.getSharedObject()
local currentSkin             = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
		
		Citizen.Wait(250)
	end
end)

function OpenShopMenu()
	TriggerEvent('skinchanger:getSkin', function(skin)
		currentSkin = skin
	end)
	
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadSkin', {
				helmet_1 = -1,
				helmet_2 = 0,
				mask_1   = 0,
				mask_2   = 0,
			})
		else
			TriggerEvent('skinchanger:loadSkin', {
				helmet_1 = -1,
				helmet_2 = 0,
				mask_1   = 0,
				mask_2   = 0,
			})
		end
	end)

	TriggerEvent('esx_skin:openRestrictedMenu', function()
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title = _U('valid_purchase'),
			align = 'center',
			elements = {
				{label = _U('yes'), value = 'yes'},
				{label = _U('no'), value = 'no'},
			}
		}, function(data, menu)
			menu.close()
			if data.current.value == 'yes' then
				ESX.TriggerServerCallback('esx_barbershop:checkMoney', function(hasEnoughMoney)
					if hasEnoughMoney then
						TriggerServerEvent('esx_barbershop:pay')
						TriggerEvent('skinchanger:getSkin', function(skin)
							skin['helmet_1'] = currentSkin['helmet_1']
							skin['helmet_2'] = currentSkin['helmet_2']
							skin['mask_1'] = currentSkin['mask_1']
							skin['mask_2'] = currentSkin['mask_2']
							
							TriggerServerEvent('esx_skin:save', skin)
							
							currentSkin = skin
						end)
					else
						ESX.ShowNotification(_U('not_enough_money'))
						cleanPlayer()
					end
				end)
			elseif data.current.value == 'no' then
				cleanPlayer()
			end
		end, function(data, menu)
			cleanPlayer()
		end)
	end, function(data, menu)
		cleanPlayer()
	end, {
		'hair_1',
		'hair_2',
		'hair_3',
		'hair_color_1',
		'hair_color_2',
		'makeup_1',
		'makeup_2',
		'makeup_3',
		'makeup_4',
		'blush_1',
		'blush_2',
		'blush_3',
		'lipstick_1',
		'lipstick_2',
		'lipstick_3',
		'lipstick_4',
		'eyebrows_1',
		'eyebrows_2',
		'eyebrows_3',
		'eyebrows_4',
		'beard_1',
		'beard_2',
		'beard_3',
		'beard_4',
		'chest_1',
		'chest_2',
		'chest_3',
	})
end

function cleanPlayer()
	TriggerEvent('skinchanger:loadSkin', currentSkin)
	currentSkin = nil
end

-- Create Blips
CreateThread(function()
	for k,v in pairs(Config.Shops) do
		local blip = AddBlipForCoord(v.MenuCoords.x, v.MenuCoords.y, v.MenuCoords.z)

		SetBlipSprite (blip, 71)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.8)
		SetBlipColour (blip, 41)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('barber_blip'))
		EndTextCommandSetBlipName(blip)
	end	
end)

exports['qtarget']:AddBoxZone("fryzjer1", vector3(-30.54, -151.2, 57.08), 1.5, 1, {
	name="fryzjer1",
	heading=70,
	debugPoly=false,
	minZ=56.03,
	maxZ=58.93,
	}, {
		options = {
			{
				event = "openfryzjer",
				icon = "fas fa-scissors",
				label = "Fryzjer",
			},
		},
		distance = 2.0
})

exports['qtarget']:AddBoxZone("fryzjer2", vector3(134.14, -1708.37, 29.29), 1.5, 1, {
	name="fryzjer2",
	heading=70,
	debugPoly=false,
	minZ=28.03,
	maxZ=30.93,
	}, {
		options = {
			{
				event = "openfryzjer",
				icon = "fas fa-scissors",
				label = "Fryzjer",
			},
		},
		distance = 2.0
})

exports['qtarget']:AddBoxZone("fryzjer3", vector3(-1284.89, -1115.42, 6.99), 1.5, 1, {
	name="fryzjer3",
	heading=70,
	debugPoly=false,
	minZ=5.03,
	maxZ=8.93,
	}, {
		options = {
			{
				event = "openfryzjer",
				icon = "fas fa-scissors",
				label = "Fryzjer",
			},
		},
		distance = 2.0
})

exports['qtarget']:AddBoxZone("fryzjer4", vector3(1210.78, -470.45, 66.21), 1.5, 1, {
	name="fryzjer4",
	heading=70,
	debugPoly=false,
	minZ=65.03,
	maxZ=67.93,
	}, {
		options = {
			{
				event = "openfryzjer",
				icon = "fas fa-scissors",
				label = "Fryzjer",
			},
		},
		distance = 2.0
})

exports['qtarget']:AddBoxZone("fryzjer5", vector3(-278.4, 6231.01, 31.7), 1.5, 1, {
	name="fryzjer5",
	heading=70,
	debugPoly=false,
	minZ=30.03,
	maxZ=32.93,
	}, {
		options = {
			{
				event = "openfryzjer",
				icon = "fas fa-scissors",
				label = "Fryzjer",
			},
		},
		distance = 2.0
})


RegisterNetEvent('openfryzjer', function(data)
	OpenShopMenu()
end)