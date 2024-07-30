local ESX = exports["es_extended"]:getSharedObject()

AddEventHandler('esx:playerLoaded', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
end)

ESX.RegisterServerCallback('bagieta_idcards:createID', function(source, cb, idDowodu, idtype)
    local xPlayer = ESX.GetPlayerFromId(idDowodu)

    if idtype == "id" then
      local idcard = {}

      idcard.firstName = xPlayer.variables.firstName
      idcard.lastName = xPlayer.variables.lastName
  
      idcard.dateofbirth = xPlayer.variables.dateofbirth
      idcard.sex = xPlayer.variables.sex
      idcard.licki = {}

      cb(idcard)
  
      MySQL.Async.fetchAll('SELECT type FROM user_licenses WHERE owner = @identifier', {['@identifier'] = xPlayer.identifier},
      function (data)
        for i=1, #data, 1 do
          if (data[i].type == 'drive') then 
            idcard.lickab = "yes"
          elseif (data[i].type == 'drive_bike') then 
            idcard.lickaa = "yes"
          elseif (data[i].type == 'drive_truck') then 
            idcard.lickac = "yes"
          end

          cb(idcard)
        end
      end)
    elseif idtype == "businesscard" then
      local businesscard = {}
      businesscard.firstName = xPlayer.variables.firstName
      businesscard.lastName = xPlayer.variables.lastName
      MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier},
      function (result)
        businesscard.phone = result[1].phone_number
        businesscard.bankacc = result[1].account_number
        cb(businesscard)
      end)
    end
end)

RegisterServerEvent('bagieta_idcards:showIDtoplayers')
AddEventHandler('bagieta_idcards:showIDtoplayers', function(idDowodu, players, idtype)
	if #players > 0 then 
		for i=1, #players, 1 do
			local pl = ESX.GetPlayerFromId(players[i])
			TriggerClientEvent('bagieta_idcards:createId', pl.source, idDowodu, idtype)
   		 end
	end 
end)