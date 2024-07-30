

local connectedPlayers = {}

ESX.RegisterServerCallback('esx_scoreboard:getConnectedPlayers', function(source, cb)
	cb(connectedPlayers)
end)

local Counter = {	
	['ambulance'] = 0,
	['police'] = 0,
	['sheriff'] = 0,
	['doj'] = 0,
	['mechanik'] = 0,
	['mechanik2'] = 0,
	['mechanik3'] = 0,
	['players'] = 0
}
function MisiaczekPlayers()
	return connectedPlayers
end

function CounterPlayers(what)
	return Counter[what]
end

ESX.RegisterServerCallback('esx_scoreboard:getConnectedCops', function(source, cb)
	cb(Counter)
end)

ESX.RegisterServerCallback('esx_scoreboard:getConnectedPlayers', function(source, cb)
	cb(connectedPlayers)
end)

AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	connectedPlayers[playerId].job = job.name
	if Counter[job.name] == connectedPlayers[playerId].job then
		Counter[job.name] = Counter[job.name] + 1
	end
	if Counter[lastJob.name] == connectedPlayers[playerId].job then
		Counter[lastJob.name] = Counter[lastJob.name] - 1
	end
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	if not connectedPlayers[playerId] then
		AddPlayerToScoreboard(xPlayer)
	else
		if connectedPlayers[playerId] then
			if Counter[connectedPlayers[playerId].job] then
				Counter[connectedPlayers[playerId].job] = Counter[connectedPlayers[playerId].job] - 1
			end
			connectedPlayers[playerId].job = xPlayer.job.name
			if Counter[xPlayer.job.name] then
				Counter[xPlayer.job.name] = Counter[xPlayer.job.name] + 1
			end			
		end	
	end
	Counter['players'] = GetNumPlayerIndices()
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		CreateThread(function()
			local players = ESX.GetExtendedPlayers()
			for _, xPlayer in ipairs(players) do
				AddPlayerToScoreboard(xPlayer)
			end
			Citizen.Wait(10000)
			Counter['players'] = GetNumPlayerIndices()
		end)
	end
end)

AddEventHandler('playerDropped', function()
	if connectedPlayers[source] then
		if Counter[connectedPlayers[source].job] then
			Counter[connectedPlayers[source].job] = Counter[connectedPlayers[source].job] - 1
		end
		connectedPlayers[source] = nil
	end
	Counter['players'] = GetNumPlayerIndices()
end)

AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	connectedPlayers[playerId].job = job.name
	if Counter[job.name] then
		Counter[job.name] = Counter[job.name] + 1
	end
	if Counter[lastJob.name] then
		Counter[lastJob.name] = Counter[lastJob.name] - 1
	end
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	if not connectedPlayers[playerId] then
		AddPlayerToScoreboard(xPlayer)
	else
		if connectedPlayers[playerId] then
			if Counter[connectedPlayers[playerId].job] then
				Counter[connectedPlayers[playerId].job] = Counter[connectedPlayers[playerId].job] - 1
			end
			connectedPlayers[playerId].job = xPlayer.job.name
			if Counter[xPlayer.job.name] then
				Counter[xPlayer.job.name] = Counter[xPlayer.job.name] + 1
			end			
		end	
	end
	Counter['players'] = GetNumPlayerIndices()
end)

RegisterCommand("streamer", function(playerId)
	if connectedPlayers[playerId].stramer == nil or connectedPlayers[playerId].stramer == false then
		connectedPlayers[playerId].stramer = true
	else
		connectedPlayers[playerId].stramer = false
	end
end)

RegisterCommand("afk", function(playerId)
	if connectedPlayers[playerId].afk == nil or connectedPlayers[playerId].afk == false then
		connectedPlayers[playerId].afk = true
	else
		connectedPlayers[playerId].afk = falses
	end
end)

ESX.RegisterServerCallback('esx_scoreboard:stremer', function(source, cb)
	cb(connectedPlayers)
end)

function PlayerIdentifier(type, id)
  local identifiers = {}
  local numIdentifiers = GetNumPlayerIdentifiers(id)

  for a = 0, numIdentifiers do
      identifiers[#identifiers + 1] = GetPlayerIdentifier(id, a)
  end

  for b = 1, #identifiers do
      if string.find(identifiers[b], type, 1) then
          return identifiers[b]
      end
  end
  return false
end

function AddPlayerToScoreboard(xPlayer, update)
local groupss = {
  ['user'] = "Gracz",

  ['trialsupport'] = "Trial Support",
  ['support'] = "Support",

  ['juniormoderator'] = "Junior Moderator",
  ['moderator'] = "Moderator",

  ['junioradmin'] = "Junior Administrator",
  ['admin'] = "Administrator",

  ['superadmin2'] = "Head Admin",
  ['zarzad'] = "Zarząd",
  ['best'] = "Project Owner",
}
local playerId = xPlayer.source
connectedPlayers[playerId] = {}
connectedPlayers[playerId].id = playerId
connectedPlayers[playerId].identifier = xPlayer.identifier
connectedPlayers[playerId].name = xPlayer.getName()
connectedPlayers[playerId].job = xPlayer.job.name
connectedPlayers[playerId].group = xPlayer.group
if(PlayerIdentifier('steam', playerId) == 'steam:') then -- 
  connectedPlayers[playerId].groupe = groupss['szef']
elseif(PlayerIdentifier('steam', playerId) == 'steam:') then -- 
  connectedPlayers[playerId].groupe = groupss['szef2']
else
  connectedPlayers[playerId].groupe = groupss[xPlayer.group]
end
connectedPlayers[playerId].stramer = false
connectedPlayers[playerId].afk = false
if Counter[xPlayer.job.name] ~= nil then
  Counter[xPlayer.job.name] = Counter[xPlayer.job.name] + 1
end
end

RegisterNetEvent('esx_scoreboard:players', function()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local groups = {
    ['trialsupport'] = true,
    ['support'] = true,

    ['juniormoderator'] = true,
    ['moderator'] = true,

    ['junioradmin'] = true,
    ['admin'] = true,

	['superadmin2'] = true,
	['zarzad'] = true,
    ['best'] = true
  }
  if xPlayer ~= nil then
    TriggerClientEvent('esx_scoreboard:players', _source, Counter, groups[xPlayer.group])
  end
end)

RegisterNetEvent("esx_scoreboard:show", function(boolean)
  local _source = source
  TriggerClientEvent("esx_scoreboard:playerShowed", -1, _source, boolean)
end)