local DATABASE do
	local connectionString = GetConvar('mysql_connection_string', '');
	if connectionString == '' then
		error(connectionString..'\n^1Unable to start Multicharacter - unable to determine database from mysql_connection_string^0', 0)
	elseif connectionString:find('mysql://') then
		connectionString = connectionString:sub(9, -1)
		DATABASE = connectionString:sub(connectionString:find('/')+1, -1):gsub('[%?]+[%w%p]*$', '')
	else
		connectionString = {string.strsplit(';', connectionString)}
		for i = 1, #connectionString do
			local v = connectionString[i]
			if v:match('database') then
				DATABASE = v:sub(10, #v)
			end
		end
	end
end

local FETCH = nil
local DB_TABLES = Config.UsersDatabase
local SLOTS = Config.Slots
local PREFIX = Config.Prefix
local PRIMARY_IDENTIFIER = Config.Identifier

local starters = {}

local function GetIdentifier(source)
	local identifier = PRIMARY_IDENTIFIER..':'
	for _, v in pairs(GetPlayerIdentifiers(source)) do
		if string.match(v, identifier) then
			identifier = string.gsub(v, identifier, '')
			return identifier
		end
	end
end

if next(ESX.Players) then
	local players = table.clone(ESX.Players)
	table.wipe(ESX.Players)
	for _, v in pairs(players) do
		ESX.Players[GetIdentifier(v.source)] = true
	end
else 
	ESX.Players = {} 
end

local function SetupCharacters(source)
	while not FETCH do Wait(100) end
	local identifier = GetIdentifier(source)
	ESX.Players[identifier] = true
	local slots = MySQL.scalar.await('SELECT slots FROM multichars_slots WHERE identifier = ?', { identifier }) or SLOTS
	identifier = PREFIX..'%:'..identifier
	local result = MySQL.query.await(FETCH, {identifier, slots})
	local characters
	if result then
		local characterCount = #result
		characters = table.create(0, characterCount)
		for i = 1, characterCount, 1 do
			local v = result[i]
			local job, grade = v.job or 'unemployed', tostring(v.job_grade)
			if ESX.Jobs[job] and ESX.Jobs[job].grades[grade] then
				if job ~= 'unemployed' then 
					grade = ESX.Jobs[job].grades[grade].label 
				else 
					grade = '' 
				end
				job = ESX.Jobs[job].label
			end
			local accounts = json.decode(v.accounts)
			local id = tonumber(string.sub(v.identifier, #PREFIX+1, string.find(v.identifier, ':')-1))
			characters[id] = {
				id = id,
				bank = accounts.bank,
				money = accounts.money,
				job = job,
				job_grade = grade,
				firstname = v.firstname,
				lastname = v.lastname,
				dateofbirth = v.dateofbirth,
				skin = v.skin and json.decode(v.skin) or {},
				disabled = v.disabled,
				sex = v.sex == 'm' and Config.Translate['male'] or Config.Translate['female']
			}
		end
	end
	TriggerClientEvent('vms_multichars:SetupUI', source, characters, slots)
end

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
	deferrals.defer()
	local identifier = GetIdentifier(source)
	if identifier then
		if ESX.Players[identifier] then
			deferrals.done(('A player is already connected to the server with this identifier.\nYour identifier: %s:%s'):format(PRIMARY_IDENTIFIER, identifier))
		else
			deferrals.done()
		end
	else
		deferrals.done(('Unable to retrieve player identifier.\nIdentifier type: %s'):format(PRIMARY_IDENTIFIER))
	end
end)

local function DeleteCharacter(source, charid)
	local identifier = ('%s%s:%s'):format(PREFIX, charid, GetIdentifier(source))
	local query = 'DELETE FROM %s WHERE %s = ?'
	local queries = {}
	local count = 0
	for table, column in pairs(DB_TABLES) do
		count += 1
		queries[count] = {query = query:format(table, column), values = {identifier}}
	end
	MySQL.transaction(queries, function(result)
		if result then
			Wait(50)
			SetupCharacters(source)
		else
			error('\n^1Transaction failed while trying to delete '..identifier..'^0')
		end
	end)
end

MySQL.ready(function()
	local length = 42 + #PREFIX
	local DB_COLUMNS = MySQL.query.await(('SELECT TABLE_NAME, COLUMN_NAME, CHARACTER_MAXIMUM_LENGTH FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = "%s" AND DATA_TYPE = "varchar" AND COLUMN_NAME IN (?)'):format(DATABASE, length), {
		{'identifier', 'owner'}
	})
	if DB_COLUMNS then
		local columns = {}
		local count = 0
		for i = 1, #DB_COLUMNS do
			local v = DB_COLUMNS[i]
			if v?.CHARACTER_MAXIMUM_LENGTH ~= length then
				count += 1
				columns[v.TABLE_NAME] = v.COLUMN_NAME
			end
		end
		if next(columns) then
			local query = 'ALTER TABLE `%s` MODIFY COLUMN `%s` VARCHAR(%s)'
			local queries = table.create(count, 0)
			for k, v in pairs(columns) do
				queries[#queries+1] = {query = query:format(k, v, length)}
			end
		end
		ESX.Jobs = {}
		local function GetJobs()
			if ESX.GetJobs then
				return ESX.GetJobs()
			end
			return exports['es_extended']:getSharedObject().Jobs
		end
		repeat
			ESX.Jobs = GetJobs()
			Wait(50)
		until next(ESX.Jobs)
		FETCH = 'SELECT identifier, accounts, job, job_grade, firstname, lastname, dateofbirth, sex, skin, disabled FROM users WHERE identifier LIKE ? LIMIT ?'
	end
end)

RegisterNetEvent('vms_multichars:SetupCharacters', function()
	SetupCharacters(source)
end)

local awaitingRegistration = {}

RegisterNetEvent('vms_multichars:CharacterChosen', function(charid, isNew)
	if type(charid) == 'number' and string.len(charid) <= 2 and type(isNew) == 'boolean' then
		if isNew then
			awaitingRegistration[source] = charid
			starters[source] = true
		else
			TriggerEvent('esx:onPlayerJoined', source, PREFIX..charid)
			ESX.Players[GetIdentifier(source)] = true
		end
	end
end)

AddEventHandler('esx_identity:completedRegistration', function(source, data)
	TriggerEvent('esx:onPlayerJoined', source, PREFIX..awaitingRegistration[source], data)
	awaitingRegistration[source] = nil
	ESX.Players[GetIdentifier(source)] = true
end)

AddEventHandler('playerDropped', function(reason)
	awaitingRegistration[source] = nil
	ESX.Players[GetIdentifier(source)] = nil
end)

RegisterNetEvent('vms_multichars:DeleteCharacter', function(charid)
	if Config.CanDelete and type(charid) == 'number' and string.len(charid) <= 2 then
		DeleteCharacter(source, charid)
	end
end)

RegisterNetEvent('vms_multichars:relog', function()
	TriggerEvent('esx:playerLogout', source)
end)

RegisterNetEvent('vms_multichars:starterPack', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if not xPlayer then
		return print('This player has not been loaded.')
	end
	if starters[src] then
		if Config.EnableStarterItems then
			for _, v in pairs(Config.StarterItems) do
				if v then
					xPlayer.addInventoryItem(v.name, v.count)
				end
			end
		end
		if Config.EnableStarterMoney then
			for _, v in pairs(Config.StarterMoney) do
				if v then
					xPlayer.addAccountMoney(v.account, v.amount)
				end
			end
		end
		starters[src] = false
	else
		print('Player '..src..' trying to use "vms_multichars:starterPack" illegaly.')
	end
end)