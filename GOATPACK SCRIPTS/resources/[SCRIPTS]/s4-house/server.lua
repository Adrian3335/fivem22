
CacheHouses = {}
ESX = exports['es_extended']:getSharedObject()

__init__ = function()

    for k,v in pairs(Config.Houses) do
   
       shopdata = MySQL.Sync.fetchAll("SELECT * FROM `s4-house` WHERE id = '"..k.."' ")
        
       if #shopdata == 0 then 
          MySQL.Async.execute("INSERT INTO `s4-house` (id, owner, name, garage, friends, extends) VALUES ('"..k.."', '"..Config.Houses_Template.owner.."', '"..Config.Houses_Template.name.."', '"..json.encode(Config.Houses_Template.garage).."', '"..json.encode(Config.Houses_Template.friends).."', '"..json.encode(Config.Houses_Template.extends).."')", {  })
       end

       Wait(100)
    end

    LoadHouses()
end


LoadHouses = function() 

    houses = MySQL.Sync.fetchAll("SELECT * FROM `s4-house`")

    for k,v in pairs(houses) do

      i = {
        name = v.name,
        price = Config.Houses[k].price,
        coords = {      
          house_in = Config.Houses[k].coords.house_in,
          house_out = Config.Houses[k].coords.house_out,
          garage_in = Config.Houses[k].coords.garage_in,
          garage_out = Config.Houses[k].coords.garage_out,
          stash = Config.Houses[k].coords.stash,
        },
        owner = v.owner,
        friends = json.decode(v.friends),
        garage =  json.decode(v.garage),
        garage_stock = Config.Houses[k].garage_stock,
        theme = v.theme,
        extends = json.decode(v.extends),
      }

      table.insert(CacheHouses, i)

    end

end

RegisterCommand("house_reload", function(source, args, rawCommand)
   CacheHouses = {}
   LoadHouses()
   TriggerClientEvent('s4-house:client:updateHouses', -1, CacheHouses)
end)

ESX.RegisterServerCallback('s4-house:server:tryBuy', function(source, cb, data)
   xPlayer = ESX.GetPlayerFromId(source)
   house = GetHouseFromId(tonumber(data.id))
   if xPlayer and house then 

      if data.type == "cash" and xPlayer.getMoney() >= house.price then 
         result = CheckPayment(source, data.type, house.price)
         if result == true then 
            BuyHouse(xPlayer.identifier, tonumber(data.id), source)
         end
         return cb(result)
      end
 
      if data.type == "bank" and xPlayer.getAccount('bank').money >= house.price  then
         result = CheckPayment(source, data.type, house.price)
         if result == true then 
            BuyHouse(xPlayer.identifier, tonumber(data.id), source)
         end
         return cb(result)
      end
      
   end
end)


ESX.RegisterServerCallback('s4-house:server:GetPlayers', function(source, cb, data)
   local Players = {}
 
   for k, v in pairs(ESX.GetPlayers()) do
      local xPlayer = ESX.GetPlayerFromId(v)
      Players[#Players+1] = { id = xPlayer.identifier,  name = xPlayer.getName() }
   end

   return cb(Players)
end)

RegisterNetEvent("s4-house:server:AddFriends")
AddEventHandler("s4-house:server:AddFriends",function(id, pid, name)
   for k,v in pairs(CacheHouses[id].friends) do
      if v.id == pid then 
        return
      end   
   end
   table.insert(CacheHouses[id].friends, { id = pid,  name = name })
   TriggerClientEvent('s4-house:client:updateHouses', source, CacheHouses)

   MySQL.Async.execute("UPDATE `s4-house` SET friends = '"..json.encode(CacheHouses[id].friends).."' WHERE id = '"..id.."'  ")
end)

RegisterNetEvent("s4-house:server:RemoveFriends")
AddEventHandler("s4-house:server:RemoveFriends",function(id, pid, name)
   for k,v in pairs(CacheHouses[id].friends) do
      if v.id == pid then 
         table.remove(CacheHouses[id].friends, k) 
         break
      end   
   end
   TriggerClientEvent('s4-house:client:updateHouses', source, CacheHouses)

   MySQL.Async.execute("UPDATE `s4-house` SET friends = '"..json.encode(CacheHouses[id].friends).."' WHERE id = '"..id.."'  ")
end)

RegisterNetEvent("s4-house:server:StreamFriends")
AddEventHandler("s4-house:server:StreamFriends",function() TriggerClientEvent('s4-house:client:updateHouses', -1, CacheHouses) end)

ESX.RegisterServerCallback('s4-house:server:trySell', function(source, cb, data)
   xPlayer = ESX.GetPlayerFromId(source)

   house = GetHouseFromId(tonumber(data.id))

   house.id = tonumber(data.id)

   if xPlayer and house then 
      
      if data.type == "cash" then 
         result = SellHouse(xPlayer, house)
         
         if result ~= false then 
            xPlayer.addMoney(tonumber(result))
         end
         return cb(result)
      end

      if data.type == "bank" then
         result = SellHouse(xPlayer, house)
         if result ~= false then 
            xPlayer.addAccountMoney('bank', tonumber(result))
         end
         return cb(result)
      end
      
   end
end)




BuyHouse = function(idf, id, src) 
   for k,v in pairs(CacheHouses) do
      if k == id then
         CacheHouses[k].owner = idf
         MySQL.Async.execute('UPDATE `s4-house` SET owner = @idf WHERE id = @id', { ['@id'] = id,   ['@idf'] = idf })
		 TriggerClientEvent('s4-house:client:updateHouses', src, CacheHouses, id)
         -- TriggerClientEvent('s4-house:client:updateHouses', -1, CacheHouses, nil, true)
         return
      end
   end
end

SellHouse = function(xPlayer, house) 


   identifier = xPlayer.identifier

   yuzde = house.price/100
   yuzde = yuzde * 10
   yuzde = house.price - yuzde

   for k,v in pairs(CacheHouses) do
      
      if k == house.id then
        
         if CacheHouses[k].owner == identifier then 
           
           CacheHouses[k].owner = ""
		   CacheHouses[k].garage = Config.Houses_Template.garage
		   CacheHouses[k].friends = Config.Houses_Template.friends
		   CacheHouses[k].extends = Config.Houses_Template.extends
		   
           MySQL.Async.execute('UPDATE `s4-house` SET owner = @idf, garage = @garage, friends = @friends, extends = @extends WHERE id = @id', {
 		          ['@id'] = house.id,
				  ['@idf'] = CacheHouses[k].owner,
				  ['@garage'] = json.encode(Config.Houses_Template.garage),
				  ['@friends'] = json.encode(Config.Houses_Template.friends),
				  ['@extends'] = json.encode(Config.Houses_Template.extends)
		   })
		   TriggerClientEvent('s4-house:client:updateHouses', xPlayer.source, CacheHouses, house.id)
           TriggerClientEvent('s4-house:client:updateHouses', -1, CacheHouses, house.id, true)
           return tonumber(yuzde)
         end
      end
   end

   return false 
end

CheckPayment = function(source, type, count)

   local p = promise.new()
   local xPlayer = ESX.GetPlayerFromId(source)
   local cache
   local res = false
   
   if type == "cash" then 
      cache = xPlayer.getMoney()
      xPlayer.removeMoney(count)
      if cache == xPlayer.getMoney() + count then 
         res = true
      end
   end

   if type == "bank" then 
      cache = xPlayer.getAccount('bank').money
      xPlayer.removeAccountMoney('bank', count)
      if cache == xPlayer.getAccount('bank').money + count then 
         res = true
      end
   end

   p:resolve(res)
   return Citizen.Await(p)

end

 


RegisterNetEvent('s4-house:server:request')
AddEventHandler('s4-house:server:request', function()
   local source = source
 
   if #CacheHouses == 0 then 
      TriggerClientEvent('s4-house:client:tryAgain', tonumber(source))
   else 
      TriggerClientEvent('s4-house:client:updateHouses', tonumber(source), CacheHouses)
   end
   
end)

RegisterNetEvent("s4-house:server:setbucket")
AddEventHandler("s4-house:server:setbucket",function(id)
   if not CacheHouses[id].bucket_id then 
      CacheHouses[id].bucket_id = id + 4000
   end
   SetPlayerRoutingBucket(source, CacheHouses[id].bucket_id)
end)

RegisterNetEvent("s4-house:server:outbucket")
AddEventHandler("s4-house:server:outbucket",function()
   SetPlayerRoutingBucket(source, 0)
end)


RegisterNetEvent("s4-house:server:setTheme")
AddEventHandler("s4-house:server:setTheme",function(id, theme)
   local xPlayer = ESX.GetPlayerFromId(source)
   if CheckAuth(id, xPlayer.identifier) == true then 
      CacheHouses[id].theme = theme
      TriggerClientEvent('s4-house:client:updateHouses', -1, CacheHouses, id, true)
      MySQL.Async.execute("UPDATE `s4-house` SET theme = '"..theme.."' WHERE id = '"..id.."'  ")
   end
end)

RegisterNetEvent("s4-house:server:setExtends")
AddEventHandler("s4-house:server:setExtends",function(id, data)
   local xPlayer = ESX.GetPlayerFromId(source)
   if CheckAuth(id, xPlayer.identifier) == true then 
      table.insert(CacheHouses[id].extends, data)
      TriggerClientEvent('s4-house:client:updateHouses', -1, CacheHouses, id, true)
      MySQL.Async.execute("UPDATE `s4-house` SET extends = '"..json.encode(CacheHouses[id].extends).."' WHERE id = '"..id.."'  ")
   end
end)






RegisterNetEvent("s4-house:server:SetName")
AddEventHandler("s4-house:server:SetName",function(id, name)
   local xPlayer = ESX.GetPlayerFromId(source)
   if CheckAuth(id, xPlayer.identifier) == true then 
      CacheHouses[id].name = name
      TriggerClientEvent('s4-house:client:updateHouses', -1, CacheHouses, id, true)
      MySQL.Async.execute("UPDATE `s4-house` SET name = '"..name.."' WHERE id = '"..id.."'  ")
   end
end)


RegisterNetEvent("s4-house:server:outgarage")
AddEventHandler("s4-house:server:outgarage",function(id, garage)
   local xPlayer = ESX.GetPlayerFromId(source)
   CacheHouses[id].garage = garage
   TriggerClientEvent('s4-house:client:updateHouses', -1, CacheHouses)
   MySQL.Async.execute("UPDATE `s4-house` SET garage = '"..json.encode(CacheHouses[id].garage).."' WHERE id = '"..id.."'  ")
end)


RegisterNetEvent("s4-house:server:addGarage")
AddEventHandler("s4-house:server:addGarage",function(id, props, plate, model)
   local xPlayer = ESX.GetPlayerFromId(source)

   if GetGarageAvailable(id) == 0 then return end


   vehdata = MySQL.Sync.fetchAll("SELECT * FROM `owned_vehicles` WHERE owner = '"..xPlayer.identifier.."' AND plate = '"..plate.."'  ")
 
   if #vehdata ~= Config.PutOnlyOwnedVehicleInGarage then 
      -- if #CacheHouses[id].garage ~= CacheHouses[id].garage_stock then 
         CacheHouses[id].garage[GetGarageAvailable(id)] = { id = GetGarageAvailable(id), props = props, plate = plate, model = model }
         -- table.insert(CacheHouses[id].garage, { id = #CacheHouses[id].garage, props = props, plate = plate, model = model })
         TriggerClientEvent('s4-house:client:updateHouses', -1, CacheHouses)
         MySQL.Async.execute("UPDATE `s4-house` SET garage = '"..json.encode(CacheHouses[id].garage).."' WHERE id = '"..id.."'  ")
      -- end
   end
end)

RegisterNetEvent("s4-house:server:addGarageSlot")
AddEventHandler("s4-house:server:addGarageSlot",function(id, slot, props, plate, model)
   local xPlayer = ESX.GetPlayerFromId(source)
 
   if GetGarageAvailable(id) == 0 then return end

   vehdata = MySQL.Sync.fetchAll("SELECT * FROM `owned_vehicles` WHERE owner = '"..xPlayer.identifier.."' AND plate = '"..plate.."'  ")
   CacheHouses[id].garage[slot] = { id = slot, props = props, plate = plate, model = model }
   -- table.insert(CacheHouses[id].garage, { id = slot, props = props, plate = plate, model = model })
   TriggerClientEvent('s4-house:client:updateHouses', xPlayer.source, CacheHouses)
   TriggerClientEvent('s4-house:client:updateHouses', -1, CacheHouses)
   MySQL.Async.execute("UPDATE `s4-house` SET garage = '"..json.encode(CacheHouses[id].garage).."' WHERE id = '"..id.."'  ")
   TriggerClientEvent('s4-house:client:switch', xPlayer.source, id, "ginv_d")
end)

CheckAuth = function(id, idf)
   house = GetHouseFromId(tonumber(id))
   auth = false

   if house.owner == idf then 
      auth = true
   end

   for i,val in pairs(house.friends) do
      if val.id == idf then  
         auth = true
      end
   end

   return auth
end


GetHouseFromId = function(id)
   for k,v in pairs(CacheHouses) do
      if k == id then 
         return v
      end
   end
end

GetGarageAvailable = function(id) 
   house = GetHouseFromId(tonumber(id))
   
   for i=1, house.garage_stock  do
     if type(house.garage[i]) == "nil" then 
        return i
     end
   end

   return 0
end



Citizen.CreateThread(__init__)