local ox_inventory = exports.ox_inventory

Citizen.CreateThread(function()
	exports.qtarget:AddBoxZone("gotowanie", vector3(-50.44, 6375.79, 28.81), 1, 1, {
		name = "gotowanie",
		heading = 0,
		--debugPoly = true,
		minZ = 25.81,
		maxZ = 29.81
	}, {
		options = {
			{
				event = "kriss:sod",
				icon = "fas fa-fire",
				label = "Załaduj Wodorotlenek sodu",
			},
			{
				event = "kriss:kwasrybo",
				icon = "fas fa-fire",
				label = "Załaduj Fenyloaceton",
			},
			{
				event = "kriss:aceton",
				icon = "fas fa-fire",
				label = "Załaduj kwas rybonukleinowy",
			},
			{
				event = "kriss:chlor",
				icon = "fas fa-fire",
				label = "Załaduj Chloroefedryne",
			},
		},
		distance = 3.5
	})

	exports.qtarget:AddBoxZone("temp", vector3(-47.39, 6377.75, 28.82), 1, 2, {
		name = "temp",
		heading = 345,
		--debugPoly = true,
		minZ = 25.62,
		maxZ = 29.62
	}, {
		options = {
			{
				event = "kriss:ustawtemp",
				icon = "fas fa-fire",
				label = "Ustaw temperature",
			},
		},
		distance = 3.5
	})

	exports.qtarget:AddBoxZone("tak", vector3(-45.78, 6377.38, 28.82 - 2), 1, 1, {
		name = "tak",
		heading = 0,
		--debugPoly = true,
		minZ = 25.82,
		maxZ = 29.82
	}, {
		options = {
			{
				event = "kriss:gotuj",
				icon = "fas fa-fire",
				label = "Rozpocznij gotowanie",
			},
			{
				event = "kriss:wyciagnijmetke",
				icon = "fas fa-fire",
				label = "Wyciągnij towar",
			},
		},
		distance = 3.5
	})
end)

RegisterNetEvent('kriss:ustawtemp', function()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'nygger', {
		title = ('Podaj temperature')
	}, function(data, menu)
		local amount = tonumber(data.value)
		if amount == nil then
			ESX.ShowNotification('Ta linijka nie moze byc pusta')
		else
			if amount == 130 then
				menu.close()
				TriggerEvent('kriss:dobratemp')
			else
				menu.close()
				TriggerEvent('kriss:slabatemp')
			end
		end
	end, function(data, menu)
		menu.close()
	end)
end)

RegisterNetEvent('kriss:flara', function()
	AddExplosion(-43.56, 6378.07, 42.70 - 1, 21, 0.9, 1, 0, 1065353216, 0)
	Wait(10000)
	AddExplosion(-43.56, 6378.07, 42.70 - 1, 21, 0.9, 1, 0, 1065353216, 0)
	Wait(10000)
	AddExplosion(-43.56, 6378.07, 42.70 - 1, 21, 0.9, 1, 0, 1065353216, 0)
end)


AddEventHandler('kriss:wyciagnijmetke', function()
	ox_inventory:openInventory('stash', 'storage')
end)

AddEventHandler('kriss:dobratemp', function()
	TriggerServerEvent('kriss:temp:dobra')
end)

AddEventHandler('kriss:slabatemp', function()
	TriggerServerEvent('kriss:temp:slaba')
end)

AddEventHandler('kriss:gotuj', function()
	TriggerServerEvent('kriss:gotowanie:start')
end)

AddEventHandler('kriss:sod', function()
	TriggerServerEvent('kriss:wloz:sod')
end)

AddEventHandler('kriss:kwasrybo', function()
	TriggerServerEvent('kriss:wloz:kwasrybo')
end)

AddEventHandler('kriss:aceton', function()
	TriggerServerEvent('kriss:wloz:aceton')
end)

AddEventHandler('kriss:chlor', function()
	TriggerServerEvent('kriss:wloz:chlor')
end)
