ESX = nil
ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('mj_zarzadzenie:wyjebfure')
AddEventHandler('mj_zarzadzenie:wyjebfure', function (owner, plate, cb)
	local _source = owner
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx:showNotification', source, "Wyjebałeś ziomka")

	-- local function RemoveLicense(identifier, licenseType, cb)
	-- 	MySQL.update('DELETE FROM user_licenses WHERE type = ? AND owner = ?', {licenseType, identifier}, function(rowsChanged)

	-- MySQL.Async.store('DELETE FROM `owned_vehicles` WHERE plate = @plate', {['@plate'] = plate})

	MySQL.update('DELETE FROM owned_vehicles WHERE plate = ?', {plate}, function(smiga)
		if cb then
			cb(smiga)
		end
end)
end)
	

RegisterServerEvent('mj-zarzadzanie:sendlog')
AddEventHandler('mj-zarzadzanie:sendlog', function(fura, idtypa)
	local message = "Gracz dodał pojazd **" ..fura.. "** graczowi od ID "..idtypa
	
end)

ESX.RegisterServerCallback('mj_zarzadzanie:GetCars', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local vehicleList = {}
	local result = MySQL.query.await('SELECT vehicle, plate, vin, state, ssn, id FROM `owned_vehicles` WHERE job = @job', {
		['@job'] = xPlayer.getJob().name
	})
	for k, v in pairs(result) do
			local vehicle = json.decode(v.vehicle)
			local driver = MySQL.query.await('SELECT identifier, firstname, lastname FROM users WHERE identifier = @identifier', {
					['@ssn'] = v.ssn
			})[1]
			if driver then
					vehData = {id = v.id, model = vehicle.model, state = v.state, vin = v.vin, plate = v.plate, driver = driver.firstname..' '..driver.lastname, ssn = v.ssn}
			else
					vehData = {id = v.id, model = vehicle.model, state = v.state, vin = v.vin, plate = v.plate, driver = 'Brak'}
			end
			table.insert(vehicleList, vehData)
	end
	cb(vehicleList)
end)