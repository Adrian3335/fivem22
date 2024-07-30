
RegisterNetEvent('very-hurtownia')
AddEventHandler('very-hurtownia', function()
    FishPrice = {
        fish_szczupak = 33,
        fish_sum = 35,
        fish_okon = 32,
        fish_mintaj = 30,
        fish_losos = 34,
        fish_jesiotr = 36,
        bursztyn = 5,
    }

    ESX.UI.Menu.CloseAll()
	local elements = {}
	for k, v in pairs(ESX.GetPlayerData().inventory) do
		local price = FishPrice[v.name]

		if price and v.count > 0 then
			table.insert(elements, {
				label = ('%s - <span style="color:LightGreen;"><b>%s</b></span>'):format(v.label, '$'..price, ESX.Math.GroupDigits(price)),
				name = v.name,
				price = price,

				type = 'slider',
				value = 1,
				min = 1,
				max = v.count
			})
		end
	end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'hurtownia', {
		title    = 'Hurtownia',
		align    = 'center',
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('very-hurtownia', data.current.name, data.current.value)
	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_y_airworker"))
    while not HasModelLoaded(GetHashKey("s_m_y_airworker")) do
        Wait(155)
    end
    while CreatePed == nil do
        Citizen.Wait(100)
    end
    local ped = CreatePed(4, GetHashKey("s_m_y_airworker"), 1242.2474365234, -3161.08984375, 5.5282959938049-1.00, 272.33981323242, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
end)

exports.qtarget:AddBoxZone("very-hurtownia", vector3(1242.32, -3161.16, 5.53), 1, 1, {
    name="very-hurtownia",
    heading= 11.0,
    debugPoly= false,
    minZ= 4.77834,
    maxZ= 6.87834,
    }, {
        options = {
            {
                event = "very-hurtownia",
                icon = "fas fa-sign-in-alt",
                label = "Hurtownia",
            },
        },
        distance = 3.5
})