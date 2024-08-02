ESX = nil

LocalOwner = ""

Blips = {}

ShowBlip = true

ins_id = nil

LocalVehicles = {}

is_in_garage = false

CurId = 0


ESX = exports['es_extended']:getSharedObject()

    
   LocalOwner = ESX.PlayerData.identifier


Houses = {}



__init__ = function()

    TriggerScreenblurFadeOut(1)
  
    Houses = Config.Houses
  
    Wait(1000)
    
    while 1>0 do
          Citizen.Wait(1)	 
          if NetworkIsPlayerActive(PlayerId()) then
            TriggerServerEvent('s4-house:server:request')
            break
          end
    end
 
    TriggerServerEvent("s4-house:server:outbucket")

    DoScreenFadeIn(1000)

    __clear_ipl__()

    Wait(1000)
 
end

loaded = false

RegisterNetEvent('s4-house:client:updateHouses')
AddEventHandler('s4-house:client:updateHouses', function(HouseData, id, ref) 

    for k,v in pairs(Houses) do
        for y,x in pairs(HouseData) do
            if k == y then 
               v.name = x.name
               v.owner = x.owner
               v.friends = x.friends
               v.garage = x.garage
               v.theme = x.theme
               break
            end
         end
 
    end
 
   if id and not ref then 
      SendNUIMessage({ action = "update", house = GetHouseFromId(id), user = { cash = getCash(), bank =  getBank() } })
   end

   if id and ref == true then 
      h = GetHouseFromId(id)
      dis = #(h.coords.manage - GetEntityCoords(PlayerPedId())) 
      if dist < 20.0 then 
         __clear_ipl__()
         RequestIpl(Theme[h.theme].ipl)
         RefreshInterior(Theme[h.theme].interiorId)
      end
   end 

   if CurId then 
      if CurId == id then 
         h = GetHouseFromId(id)
         for k,v in pairs(h.extends) do
            SetTable(v.url, v.i) 
         end
      end
   end
 
   if #Houses == #HouseData and loaded == false then 
      loaded = true
      Citizen.CreateThread(MainThread)
   end
   
   MakeBlips()

end)

 

rotz = 0
Rot = function()
  
   while 1>0 do 
      
      if rotz >= 360 then 
         rotz = 0
      end

      rotz = rotz + 1

      Citizen.Wait(1)
   end

end


Citizen.CreateThread(Rot)

MakeBlips  = function()
    ClearBlips()
    if ShowBlip == true then 
      for k,v in pairs(Houses) do
       col = nil
	   
	   info = CheckAuthInfo(k)
	   
	   if info == "" then 
          col = 1
	   end
	   
	   if info == "own" then 
          col = 2
	   end
	   
	   if info == "friend" then 
          col = 3
	   end
	   
       CreateBlips(v, v.coords.house_in, col)
      end
    end
end

MainThread = function()
 
    

    Wait(2000)

    while 1>0 do 
       sleepThread = 2500

       pCoords = GetEntityCoords(PlayerPedId())

        
       
       for k,v in pairs(Houses) do

           
            
            dist = #(v.coords.house_in - pCoords)
            if dist < 3.0 then 

                if v.owner == "" then 
                   DrawText3D(v.coords.house_in.x, v.coords.house_in.y, v.coords.house_in.z + 0.2, "~o~[E] ~g~["..numWithCommas(v.price).."$]  ~w~"..v.name.." ~g~[Kupno]")
                   if dist < 1.40 and IsControlJustPressed(0, Config.OpenKey) then 
                     __house__(k, "No One")
                     Wait(1000)
                   end
			    elseif v.owner == LocalOwner then
                    DrawText3D(v.coords.house_in.x, v.coords.house_in.y, v.coords.house_in.z + 0.2, "~o~[E] ~w~"..v.name.." ~g~[Twoja posiadlosc]")
                    if dist < 1.40 and IsControlJustPressed(0, Config.OpenKey) then 
                       __house__(k, "Your Property")
                       Wait(1000)
                    end
                else
                   for i,val in pairs(v.friends) do
                        DrawText3D(v.coords.house_in.x, v.coords.house_in.y, v.coords.house_in.z + 0.2, "~o~[E] ~w~"..v.name.." ~g~[Posiadlosc twojego znajomego]")
                        if dist < 1.40 and IsControlJustPressed(0, Config.OpenKey) then 
                           __house__(k, "Your Friend")
                           Wait(1000)
                        end
                   end
                end
 
                sleepThread = 1
            end

            dist2 = #(v.coords.house_out - pCoords)

            if dist2 < 3.0 then 
               DrawText3D(v.coords.house_out.x, v.coords.house_out.y, v.coords.house_out.z + 0.2, "~o~[E] ~w~Opusc dom")
               if dist2 < 1.40 and IsControlJustPressed(0, Config.OpenKey) then 
                  DoScreenFadeOut(400)
                  Wait(500)
                  SetEntityCoords(GetPlayerPed(-1), GetHouseFromId(CurId).coords.house_in)
                  TriggerServerEvent("s4-house:server:outbucket")
                  Wait(500)
                  DoScreenFadeIn(1000)
                  Wait(1000)
                  ins_id = GetInteriorAtCoords(pCoords) 
               end
               sleepThread = 1
            end
			
			stash = #(v.coords.stash - pCoords)
			
			if stash < 3.0 then 
               DrawText3D(v.coords.stash.x, v.coords.stash.y, v.coords.stash.z + 0.2, "~o~[E] ~w~Otworz szafke")
               if stash < 1.40 and IsControlJustPressed(0, Config.OpenKey) then 
				  Config.StashFunction(k)
				  Wait(1000)
               end
               sleepThread = 1
            end


            gdist = #(v.coords.garage_in - pCoords)
            
            if gdist < 5.0 then 
               
               veh = GetVehiclePedIsIn(PlayerPedId())
               if GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1)  then 
                  DrawText3D(v.coords.garage_in.x, v.coords.garage_in.y, v.coords.garage_in.z + 0.2, "~g~[E] ~w~Wejdz do garazu")
                  if gdist < 4.40 and IsControlJustPressed(0, Config.OpenKey) then 
                     __notif__(k, "ginv")
                     Wait(1000)
                  end
               else 
                  DrawText3D(v.coords.garage_in.x, v.coords.garage_in.y, v.coords.garage_in.z + 0.2, "~g~[E] ~w~Wejdz do garazu")
                  if gdist < 4.40 and IsControlJustPressed(0, Config.OpenKey) then 
                     __notif__(k, "gin")
                     Wait(1000)
                  end
               end
               sleepThread = 1
               
            end

            
            mdist =  #(v.coords.manage - pCoords)
            if mdist < 5.0 then 
               DrawMarker(29, v.coords.manage.x, v.coords.manage.y, v.coords.manage.z , 0.0, 0.0, 0.0, 0.0, 0.0, rotz + 0.1, 1.0, 1.0, 1.0, 50, 255, 51, 50, false, false, 2, nil, nil, false)
               DrawText3D(v.coords.manage.x, v.coords.manage.y, v.coords.manage.z + 0.5, "~g~[E] ~w~Zarzadzaj")
               if mdist < 2.50 and IsControlJustPressed(0, Config.OpenKey) then 
                  __manage__(CurId)
                  Wait(1000)
               end
               sleepThread = 1
            end



            g2dist = #(v.coords.garage_out - pCoords)
         

            if g2dist < 5.0 then 
               veh = GetVehiclePedIsIn(PlayerPedId())
                  DrawText3D(v.coords.garage_out.x, v.coords.garage_out.y, v.coords.garage_out.z + 0.2, "~g~[E] ~w~Wyjdz z garazu")
                  if g2dist < 2.50 and IsControlJustPressed(0, Config.OpenKey) then 
                     __notif__(CurId, "gout")
                     Wait(1000)
                  end
               sleepThread = 1
            end
       end

       Citizen.Wait(sleepThread)
    end
   
end



__notif__ = function(id, type) 
   house = GetHouseFromId(tonumber(id))
   
   if CheckAuth(tonumber(id)) == true then 
      house.id = id
      SendNUIMessage({ action = "notif", house = house, type = type })
      SetNuiFocus(1,1)
   end
   
end


__house__ = function(id, x)
  
  house = GetHouseFromId(id)

--   if house.owner == "" then 
   house.id = id
   house.who = x
   house.infoauth = CheckAuthInfo(id)
   house.numco = numWithCommas(house.price)
   house.curidf = LocalOwner
   CurId = id
   house.perc = Perc(house.price)

   SendNUIMessage({ action = "init", house = house, user = { cash = getCash(), bank =  getBank() } })
--   end

--   if house.owner == LocalOwner then 

--   end

  TriggerScreenblurFadeIn(1)
  SetNuiFocus(1,1)

end



__manage__ = function(id) 
   house = GetHouseFromId(id)
   if CheckAuth(id) == true then 
      house.id = id
      SendNUIMessage({ action = "manage", house = house, theme = Theme })
      SetNuiFocus(1,1)
   end
end



RegisterNUICallback("close", function(data, cb)
   TriggerScreenblurFadeOut(1)
   SetNuiFocus(0,0)
   if data.id then 

      DoScreenFadeOut(400)
      Wait(500)
      if CheckAuth(tonumber(data.id)) == true then 
         house = GetHouseFromId(tonumber(data.id))
         __clear_ipl__()
         RequestIpl(Theme[house.theme].ipl)
         RefreshInterior(Theme[house.theme].interiorId)
         Wait(500)
         SetEntityCoords(GetPlayerPed(-1), house.coords.house_out)
         TriggerServerEvent("s4-house:server:setbucket", tonumber(house.id))
         Wait(500)
         DoScreenFadeIn(1000) 
      end

   end
end)

CheckAuth = function(id)
   house = GetHouseFromId(tonumber(id))
   auth = false
 
   if house.owner == LocalOwner then 
      auth = true
   end

   for i,val in pairs(house.friends) do
      if val.id == LocalOwner then  
         auth = true
         break
      end
   end

   return auth
end

CheckAuthInfo = function(id)
   house = GetHouseFromId(tonumber(id))
   auth = ""
 
   for i,val in pairs(house.friends) do
      if val.id == LocalOwner then  
         auth = "friend"
         break
      end
   end
   
   if house.owner == LocalOwner then 
      auth = "own"
   end

   return auth
end


RegisterNUICallback("GoInGarage", function(data, cb)
   veh = GetVehiclePedIsIn(PlayerPedId())
   Wait(200)
   if veh then 
      TriggerServerEvent("s4-house:server:addGarageSlot", tonumber(data.id), tonumber(data.slot), ESX.Game.GetVehicleProperties(veh), GetVehicleNumberPlateText(veh), GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1))))))
      
      is_in_garage = true
     __GAR_()
      DeleteEntity(veh)
      TriggerServerEvent("s4-house:server:setbucket", tonumber(house.id))
      Wait(1000)
	  SetEntityCoords(GetPlayerPed(-1), house.coords.garage_out)
 
      house = GetHouseFromId(tonumber(data.id))

      Citizen.CreateThread(function() 
         for k,v in pairs(house.garage) do
         
           if v.props.model and v.model then
            RequestModel(v.props.model)
            while not HasModelLoaded(v.props.model) do
               Wait(1000)
            end
            local xVehicle = CreateVehicle(v.props.model, Config.GaragePos[v.id].coord, Config.GaragePos[v.id].h, false, false)
            ESX.Game.SetVehicleProperties(xVehicle, v.props)
            SetVehicleNumberPlateText(xVehicle, v.plate)
            table.insert(LocalVehicles, xVehicle)
           end
         end
 
      end)
 
   end
end)

RegisterNUICallback("tryBuy", function(data, cb)
   ESX.TriggerServerCallback('s4-house:server:tryBuy', function(x) return cb(x) end, data)
end)


RegisterNUICallback("AddFriends", function(data, cb)
   TriggerServerEvent("s4-house:server:AddFriends", data.id, data.pid, data.name)
end)

RegisterNUICallback("RemoveFriends", function(data, cb)
   TriggerServerEvent("s4-house:server:RemoveFriends", data.id, data.pid, data.name)
end)

RegisterNUICallback("StreamFriends", function(data, cb)
   TriggerServerEvent("s4-house:server:StreamFriends")
end)



RegisterNUICallback("GetPlayers", function(data, cb)
   ESX.TriggerServerCallback('s4-house:server:GetPlayers', function(x) 
      return cb({ 
         house = GetHouseFromId(tonumber(data.id)).friends,
         all = x
      }) 
   end)
end)


RegisterNUICallback("trySell", function(data, cb)
   ESX.TriggerServerCallback('s4-house:server:trySell', function(x) return cb(x) end, data)
end)

RegisterNUICallback("SetName", function(data, cb)
   TriggerServerEvent("s4-house:server:SetName", data.id, data.name)
end)

RegisterNUICallback("table", function(data, cb) SetTable(data.turl, tonumber(data.tid)) end)

SetTable = function(url, x)

   TriggerServerEvent("s4-house:server:setExtends", CurId, { i = x, url = url })

   if url == "" then return end
 
   for i=1,8 do

      if x == 1 then 
        setIMG(url, "apa_mp_h_0"..i.."_kitchen_art", "km_v_ap_hi_art2")
      end

      if x == 2 then 
       setIMG(url, "apa_mp_h_0"..i.."_hall_art_large", "p_h_acc_artwalll_03")
       setIMG(url, "apa_mp_h_0"..i.."_int_txd", "km_v_ap_hi_art3")
       setIMG(url, "apa_mp_h_0"..i.."_int_txd", "mh_v_fh_artz2_d")
      end

   end

end

RegisterNUICallback("changeTheme", function(data, cb)
   __clear_ipl__()
   RequestIpl(Theme[data.theme].ipl)
   RefreshInterior(Theme[data.theme].interiorId)
   TriggerServerEvent("s4-house:server:setTheme", data.id, data.theme)
end)


Perc = function(price)
   yuzde = price/100
   yuzde = yuzde * 10
   return price - yuzde
end

GetHouseFromId = function(id)
    for k,v in pairs(Houses) do
       if k == id then 
          return v
       end
    end
end

GetGarageAvailable = function(id) 
   house = GetHouseFromId(id)
   
   for i=1, house.garage_stock  do
     if type(house.garage[i]) == "nil" then 
        return i
     end
   end

   return 0
end


ClearBlips = function()
    for k, v in pairs(Blips) do
       RemoveBlip(v)
    end
 end
  
CreateBlips = function(house, coord, col)
    local blip = AddBlipForCoord(coord)
     SetBlipSprite(blip, 40)
     SetBlipDisplay(blip, 4)
     SetBlipScale(blip, 0.5)
     SetBlipColour(blip, col or 64) 
     SetBlipAsShortRange(blip, true)
     BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(house.name)
     EndTextCommandSetBlipName(blip)
    table.insert(Blips, blip)
 end


DrawText3D = function (x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
   --  DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

numWithCommas = function(n)
   return tostring(math.floor(n)):reverse():gsub("(%d%d%d)","%1,")
                                 :gsub(",(%-?)$","%1"):reverse()
end


getCash = function()

   if Config.MoneyIsItem == true then
    ESX.PlayerData = ESX.GetPlayerData()
    local cash = 0
    if ESX.PlayerData.inventory then 
     for k, v in pairs(ESX.PlayerData.inventory) do
       if v.name == "cash" then
         cash = cash + v.count
       end
     end
    end
    return tonumber(cash)
  else
   ESX.PlayerData = ESX.GetPlayerData()
   local cash = 0
   if ESX.PlayerData.accounts then 
    for k, v in pairs(ESX.PlayerData.accounts) do
      if v.name == "money" then
        cash = v.money
      end
    end
   end
   return tonumber(cash)
 end
end

getBank = function()
    ESX.PlayerData = ESX.GetPlayerData()
    local cash = 0
    if ESX.PlayerData.accounts then 
     for k, v in pairs(ESX.PlayerData.accounts) do
       if v.name == "bank" then
         cash = v.money
       end
     end
    end
    return tonumber(cash)
end

 
Theme = {
   modern = {interiorId = 227841,  ipl = "apa_v_mp_h_01_c"},
   moody = {interiorId = 228609, ipl = "apa_v_mp_h_02_c"},
   vibrant = {interiorId = 229377, ipl = "apa_v_mp_h_03_c"},
   sharp = {interiorId = 230145, ipl = "apa_v_mp_h_04_c"},
   monochrome = {interiorId = 230913, ipl = "apa_v_mp_h_05_c"},
   seductive = {interiorId = 231681, ipl = "apa_v_mp_h_06_c"},
   regal = {interiorId = 232449, ipl = "apa_v_mp_h_07_c"},
   aqua = {interiorId = 233217, ipl = "apa_v_mp_h_08_c"}
}


__clear_ipl__ = function()
   for k,v in pairs(Theme) do
      if IsIplActive(Theme[k].ipl) then 
         RemoveIpl(Theme[k].ipl)
         RefreshInterior(Theme[k].interiorId)
         PinInteriorInMemory(Theme[k].interiorId)
         SetEntityCoordsNoOffset(GetPlayerPed(-1), GetEntityCoords(GetPlayerPed(-1)))
         SetEntityHeading(GetPlayerPed(-1), GetEntityHeading(GetPlayerPed(-1)))
      end
   end
end


RegisterNUICallback("tp", function(data, cb) switch(data.id, data.type) end)


RegisterNetEvent('s4-house:client:switch')
AddEventHandler('s4-house:client:switch', function(id, type) switch(id, type)  end)

__gout__ = function(id, notp)   
   for k,v in pairs(LocalVehicles) do
      DeleteEntity(v)
   end
   Wait(1000)
   Dv(GetHouseFromId(id).coords.garage_in, 50)
   if not notp then 
      SetEntityCoords(GetPlayerPed(-1), GetHouseFromId(id).coords.garage_in)
   end
end

cacheVehs = {}
 
switch = function(id, x) 
   x = x and tonumber(x) or x

   DoScreenFadeOut(100)
   Wait(500)
 
   house = GetHouseFromId(id)
   house.id = id
   CurId = house.id
 
   case = {
      ["gin_g"] = function()
         
        
         TriggerServerEvent("s4-house:server:setbucket", tonumber(house.id))
         Wait(1000)
         Citizen.CreateThread(function() 
            for k,v in pairs(house.garage) do
             
              if v.props.model and v.model then
               RequestModel(v.props.model)
               while not HasModelLoaded(v.props.model) do
                Wait(1000)
               end
               local xVehicle = CreateVehicle(v.props.model, Config.GaragePos[v.id].coord, Config.GaragePos[v.id].h, false, false)
               ESX.Game.SetVehicleProperties(xVehicle, v.props)
               SetVehicleNumberPlateText(xVehicle, v.plate)
               table.insert(LocalVehicles, xVehicle)
              end
 
            end
            is_in_garage = true
            __GAR_()
			Wait(1000)
            SetEntityCoords(GetPlayerPed(-1), house.coords.garage_out)
          end) 
      end,
      ["ginv_d"] = function()
         is_in_garage = true
         __GAR_()
		 Wait(1000)
         SetEntityCoords(GetPlayerPed(-1), house.coords.garage_out)
      end,
      ["gout"] = function()
         __gout__(id)
         TriggerServerEvent("s4-house:server:outbucket")
         is_in_garage = false
         __GAR_()
      end,
   }

 
   case[x]()
   
   Wait(1000)
   DoScreenFadeIn(1000)


 
end

__GAR_ = function()
 
   
   Citizen.CreateThread(function() 
       
      while is_in_garage == true do 
         sleepThread = 1000

         veh = GetVehiclePedIsIn(PlayerPedId())
     
         if veh ~= 0 then 
            if IsControlJustPressed(0, 71) or IsControlJustPressed(0, 72) then 
               _gout_veh_(veh)
               Wait(1000)
            end
            sleepThread = 1
         end
         
         Citizen.Wait(sleepThread)
      end

   end)

end

_gout_veh_ = function(veh)

   local veh,props
   
   if not veh then 
      Citizen.CreateThread(function()
	     while not veh or veh == 0 do 
	        veh = GetVehiclePedIsIn(PlayerPedId())
			if veh then props = ESX.Game.GetVehicleProperties(veh) end
			Citizen.Wait(1)
		 end
	  end)
   end
   
   DoScreenFadeOut(400)
   Wait(500)
   is_in_garage = false
   __GAR_()
   
   house = GetHouseFromId(CurId)
   __gout__(CurId, true)
   Wait(500)
   TriggerServerEvent("s4-house:server:outbucket")
   Wait(500)
   for k,v in pairs(house.garage) do
      if v.props.plate == props.plate then 
         house.garage[k] = nil
         local xVehicle = CreateVehicle(v.props.model, house.coords.garage_in, house.garage.garage_out_heading, true, false)
         ESX.Game.SetVehicleProperties(xVehicle, props)
         SetVehicleNumberPlateText(xVehicle, props.plate)
         SetPedIntoVehicle(PlayerPedId(), xVehicle, -1)
         TriggerServerEvent("s4-house:server:outgarage", CurId, house.garage)
         DoScreenFadeIn(1000)
         Wait(1000)
         CurId = 0
         break
      end
   end
end
 
index = function(x)
   for k,v in pairs(Theme) do
      if k == x then 
         return k
      end
   end
   return nil
end

Teleport = function(coords)
   for height = 1, 1000 do
         SetPedCoordsKeepVehicle(PlayerPedId(), coords.x, coords.y, height + 0.0)
         local foundGround, zPos = GetGroundZFor_3dCoord(coords.x, coords.y, height + 0.0)
         if foundGround then
            SetPedCoordsKeepVehicle(PlayerPedId(), coords.x, coords.y, height + 0.0)
            break
         end
      Citizen.Wait(5)
   end
end


RegisterCommand("heading", function(source, args, rawCommand)
   print(GetEntityHeading(PlayerPedId()))
end)


Dv = function(coords, radius)

	if radius and tonumber(radius) then
		radius = tonumber(radius) + 0.01
		local vehicles = ESX.Game.GetVehiclesInArea(coords, radius)

		for k,entity in ipairs(vehicles) do
			local attempt = 0

			while not NetworkHasControlOfEntity(entity) and attempt < 100 and DoesEntityExist(entity) do
				Citizen.Wait(100)
				NetworkRequestControlOfEntity(entity)
				attempt = attempt + 1
			end

			if DoesEntityExist(entity) and NetworkHasControlOfEntity(entity) then
				ESX.Game.DeleteVehicle(entity)
			end
		end
	else
		local vehicle, attempt = ESX.Game.GetVehicleInDirection(), 0

		if IsPedInAnyVehicle(ESX.PlayerData.ped, true) then
			vehicle = GetVehiclePedIsIn(ESX.PlayerData.ped, false)
		end

		while not NetworkHasControlOfEntity(vehicle) and attempt < 100 and DoesEntityExist(vehicle) do
			Citizen.Wait(100)
			NetworkRequestControlOfEntity(vehicle)
			attempt = attempt + 1
		end

		if DoesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle) then
			ESX.Game.DeleteVehicle(vehicle)
		end
	end

end

RegisterNUICallback("GetGarageAvailables", function(data, cb)
   cb(GetGarageAvailables(data.id))
end)

GetGarageAvailables = function(id) 
   house = GetHouseFromId(tonumber(id))
   g = {}
   
   for i=1, house.garage_stock  do
     if type(house.garage[i]) == "nil" then 
        table.insert(g, { slot = i, status = false  })
     else 
        table.insert(g, { slot = i, status = true  })
     end
   end

   return g
end


function setIMG(x,p,t) 
	RequestNamedPtfxAsset("core")
	local txd = CreateRuntimeTxd('texture')
	local duiObj = CreateDui(x, 512, 512)
    _G.duiObj = duiObj
    local dui = GetDuiHandle(duiObj)
    local tx = CreateRuntimeTextureFromDuiHandle(txd, '_texture', dui)
    AddReplaceTexture(p, t, 'texture', '_texture')
end

Citizen.CreateThread(__clear_ipl__)
Citizen.CreateThread(__init__)



RegisterCommand("tp", function(source, args, rawCommand)
   SetEntityCoords(GetPlayerPed(-1), tonumber(args[1]), tonumber(args[2]), tonumber(args[3]))
end)