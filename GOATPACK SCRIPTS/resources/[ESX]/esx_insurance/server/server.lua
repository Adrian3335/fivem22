ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('ubezpieczenie:delete')
AddEventHandler('ubezpieczenie:delete', function(identifier, iType)
	MySQL.Async.execute('DELETE FROM user_licenses WHERE type = @type AND owner = @owner', 
	{
		['@type'] = iType,
		['@owner'] = identifier
	}, function(rowsChanged)
		print("[NeedRP]> Usunięto niewykorzystane ubezpieczenia")
	end)
end)

RegisterServerEvent('ubezpieczenie:sell')
AddEventHandler('ubezpieczenie:sell', function(station, hLong)
	local xPlayer = ESX.GetPlayerFromId(source)
	local targetIdentifier = xPlayer.identifier
	local iType = ""
	
	if station == "NW" then
		iType = "nnw"
	elseif station == "OC" then
		iType = "oc"
	end
	
	local year1 = round(os.date('%Y'),0)
	local month1 = round(os.date('%m'),0)
	local day1 = round(os.date('%d')+hLong,0)
	local hour1 = round(os.date('%H'),0)
	local minutes1 = round(os.date('%M'),0)
	local seconds1 = round(os.date('%S'),0)
	local mTime = {year = year1, month = month1, day = day1, hour = hour1, min = minutes1, sec = seconds1}
	local dt = os.time(mTime)
	
	local needMoney
	if hLong == 3 then
		needMoney = 15000
	elseif hLong == 7 then
		needMoney = 25000
	elseif hLong == 14 then
		needMoney = 35000
	elseif hLong == 31 then
		needMoney = 50000
	end
	
	if xPlayer.getMoney() >= needMoney then
		MySQL.Sync.execute("INSERT INTO user_licenses (type, owner, time) VALUES (@type,  @owner, @time)", 
		{
			['@type'] = iType,
			['@owner'] = targetIdentifier,
			['@time'] = dt
		})
		xPlayer.showNotification("Zakupiono ubezpieczenie na " .. station .. " " .. hLong .. " dni")
		xPlayer.removeMoney(needMoney)
		local fraction
		if station == "NW" then
			fraction = 'ambulance'
		elseif station == "OC" then
			fraction = 'mechanic'
		end
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. fraction, function(account)
			account.addMoney(needMoney)
		end)
	else
	
		xPlayer.showNotification("Nie masz wystarczającej ilości pieniędzy!")
	end
end)

ESX.RegisterServerCallback('ubezpieczenie:check',function(source, cb, station)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local identifier = xPlayer.identifier
	local iType = ""
	
	if station == "NW" then
		iType = "nnw"
	elseif station == "OC" then
		iType = "oc"
	end
	
	MySQL.Async.fetchAll(
		'SELECT time as timestamp FROM user_licenses WHERE owner = @owner AND type = @type',
		{ 
			['@owner'] = identifier,
			['@type'] = iType,
		},
		function(result)
			if result[1] ~= nil then
				local tr = tostring(result[1].timestamp)
				local fromUnix = os.date('%Y-%m-%d %H:%M:%S', tr)
				cb(fromUnix)
			else
				cb(nil)
			end
		end
	)
end)

function round(num, numDecimalPlaces)
  if numDecimalPlaces and numDecimalPlaces>0 then
    local mult = 10^numDecimalPlaces
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function CheckUb(d, h, m)
	print("[DiabloHub]> Sprawdzanie ubezpieczeń w bazie danych")
	local iType1 = "nnw"
	local iType2 = "oc"
	MySQL.Async.fetchAll('SELECT owner, type, time as timestamp FROM user_licenses WHERE type = @type or type = @type2', 
		{
			['@type'] = iType1,
			['@type2'] = iType2
		}, 
		function(result)
			local nowTime = os.time()
			for i=1, #result, 1 do
				local aboTime = result[i].timestamp
				if aboTime <= nowTime then
					TriggerEvent('ubezpieczenie:delete', result[i].owner, result[i].type)
				end
			end
		end
	)
end

TriggerEvent('cron:runAt', 02, 0, CheckUb)
TriggerEvent('cron:runAt', 04, 0, CheckUb)
TriggerEvent('cron:runAt', 12, 0, CheckUb)
TriggerEvent('cron:runAt', 14, 0, CheckUb)
TriggerEvent('cron:runAt', 16, 0, CheckUb)
TriggerEvent('cron:runAt', 18, 0, CheckUb)
TriggerEvent('cron:runAt', 20, 0, CheckUb)
TriggerEvent('cron:runAt', 22, 0, CheckUb)
TriggerEvent('cron:runAt', 24, 0, CheckUb)