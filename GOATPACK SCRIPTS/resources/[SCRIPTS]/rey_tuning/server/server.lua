local Vehicles = {}
local Access = {}

MySQL.ready(function()
	local vehicles = MySQL.Sync.fetchAll('SELECT * FROM vehicles')

	for i=1, #vehicles, 1 do
		local vehicle = vehicles[i]

		Vehicles[vehicle.model] = vehicle.price
	end
end)

ESX.RegisterServerCallback('rey_tuning:payForShopping', function(source, cb, netId, target, price, labour)
    local sourcePlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(target)
    local hasPermissions = false
    for _, jobName in pairs(Config.MechanicJobs) do
        if sourcePlayer.job.name == jobName then
            hasPermissions = true
        end
    end
    if Access[source] then
        hasPermissions = true
    end
    if not hasPermissions then
        cb(false, "Error!")
    end
    if targetPlayer.getAccount(Config.Account).money >= price then
        cb(true, "Transakcja udana!")
        targetPlayer.removeAccountMoney(Config.Account, price)
        targetPlayer.showNotification("Zapłaciłeś $" .. price .. " za tuning pojazdu")
        if source ~= target then
            sourcePlayer.addAccountMoney(Config.Account, (Config.PercentForCompany / 100) * price)
        end
    else
        cb(false, "Wybrana osoba nie posiada wystarczającej ilości gotówki!")
    end
end)

ESX.RegisterServerCallback('rey_tuning:getVehicleModelPrice', function(source, cb, vehicle)
    cb(Vehicles[vehicle] or 50000)
end)

RegisterNetEvent('misiaczek:forceUpdateOwnedVehicle232232', function()
    local _source = source
    Access[_source] = true
end)

RegisterNetEvent("rey_tuning:saveVehProps", function(netId, car)
    if car ~= nil then
        MySQL.Async.execute('UPDATE owned_vehicles SET vehicle = @vehicle WHERE plate = @plate',{ 
            ['@plate'] = car.plate,
            ['@vehicle'] = json.encode(car)
        })
    end
end)