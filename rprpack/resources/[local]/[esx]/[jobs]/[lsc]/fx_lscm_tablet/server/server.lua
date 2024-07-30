ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Get history
ESX.RegisterServerCallback('lscmtablet:getHistory', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM lscmtablet_history', {}, function(result)
		if result then
			cb(result)
		else
			cb(false)
		end
	end)
end)

-- Parse doctor
ESX.RegisterServerCallback('lscmtablet:parseDoctor', function(source, cb, data)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll("SELECT firstname,lastname FROM `users` WHERE `identifier` = @identifier", {
		['@identifier'] = data.identifier,
	}, function(result)
		if result[1]['firstname'] ~= nil then
			cb(result[1]['firstname'] .. ' ' .. result[1]['lastname'])
		else
			cb('-')
		end
	end)
end)

-- Parse name
ESX.RegisterServerCallback('lscmtablet:parseName', function(source, cb, id)
	local xPlayer = ESX.GetPlayerFromId(id)
	MySQL.Async.fetchAll("SELECT firstname,lastname FROM `users` WHERE `identifier` = @identifier", {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		if result[1]['firstname'] ~= nil then
			local data = {
				firstname = result[1]['firstname'],
				lastname = result[1]['lastname']
			}
			cb(data)
		else
			local data = {
				firstname = '',
				lastname = ''
			}
			cb(data)
		end
	end)
end)

-- Get assistance (for individual check)
ESX.RegisterServerCallback('lscmtablet:getUserAssistance', function(source, cb, data)
	local name = split(data.name, " ")
	if name[1] ~= nil and name[2] ~= nil then
		MySQL.Async.fetchAll("SELECT firstname,lastname,identifier FROM `users` WHERE `firstname` LIKE @firstname AND `lastname` LIKE @lastname", {['@firstname'] = name[1] .. '%', ['@lastname'] = name[2] .. '%'}, function(result)
			if result then
				cb(result)
			else
				cb(false)
			end
		end)
	else
		cb(false)
	end
end)

function split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

-- Get assistance (for history)
ESX.RegisterServerCallback('lscmtablet:getAssistance', function(source, cb, data)
	MySQL.Async.fetchAll('SELECT time as timestamp FROM user_licenses WHERE owner = @owner AND type = @type', { 
			['@owner'] = data.identifier,
			['@type'] = 'oc_insurance',
	}, function(result)
		if result[1] ~= nil then
			local tr = tostring(result[1].timestamp)
			local fromUnix = os.date('%Y-%m-%d %H:%M:%S', tr)
			cb(fromUnix)
		else
			cb('Brak')
		end
	end)
end)

-- Add invoice to history
ESX.RegisterServerCallback('lscmtablet:addHistory', function(source, cb, data)
	local xPlayer = ESX.GetPlayerFromId(source)
	local _data = data.data
	local _target = ESX.GetPlayerFromId(data.target)
	
	if xPlayer.job.name == 'mechanic' then
		local hajsoponenta = _target.getAccount('bank').money
		if hajsoponenta >= math.floor(tonumber(_data.price)) then
			_target.removeAccountMoney('bank', tonumber(_data.price))
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. xPlayer.job.name, function(account)
				local oblicz = math.floor(tonumber(_data.price))
				account.addMoney(oblicz)
			end)
			xPlayer.addMoney(math.floor(tonumber(_data.price) / 100 * 10))
			TriggerClientEvent('esx:showNotification', _target.source, 'Otrzymałeś fakturę na: ' ..math.floor(tonumber(_data.price))..'$')
			TriggerClientEvent('esx:showNotification', source, 'Wystawiłeś fakturę na: ' ..math.floor(tonumber(_data.price))..'$')
			MySQL.Async.execute('INSERT INTO lscmtablet_history (owner, name, surname, treatment, price, date, doctor) VALUES (@owner, @name, @surname, @treatment, @price, @date, @doctor)', {
				['@owner'] = _target.identifier,
				['@name'] = _data.name,
				['@surname'] = _data.surname,
				['@treatment'] = _data.treatment,
				['@price'] = _data.price,
				['@date'] = _data.date,
				['@doctor'] = xPlayer.identifier
			})
			cb(true)
		else
			TriggerClientEvent('esx:showNotification', source, 'Ta osoba nie posiada tylu pieniędzy!')
		end
	else
		-- TriggerEvent("csskrouble:banPlr", "nigger", xPlayer.source, "Tried to invoice (fx_lscm_tablet)")
		--exports['exile_logs']:SendLog(xPlayer.source, 'Chcial wjebac komus fakture przez tablet LSCM', 'anticheat', '3447003')
	end
end)

-- Get default data
ESX.RegisterServerCallback('lscmtablet:getDefaultData', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	-- Getting firstname and lastname
	MySQL.Async.fetchAll("SELECT firstname, lastname FROM `users` WHERE `identifier` = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1]['firstname'] ~= nil then
			_firstname = result[1]['firstname']
			_lastname = result[1]['lastname']
		else
			_firstname = ''
			_lastname = ''
		end
		-- Getting invoices count
		MySQL.Async.fetchAll("SELECT COUNT(*) as count FROM `lscmtablet_history` WHERE `doctor` = @identifier", {['@identifier'] = xPlayer.identifier}, function(result)
			if result[1]['count'] ~= nil then
				_invoices = result[1]['count']
			else
				_invoices = 0
			end

			local data = {
				firstname = _firstname,
				lastname = _lastname,
				invoices = _invoices
			}
			cb(data)
		end)
	end)
end)