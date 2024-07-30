isBusy, isHandcuffed, currentVehicle = false, false, nil

Citizen.CreateThread(function()
    createBlips()
    createZones()
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        if isHandcuffed then
            sleep = 0
            DisableControlAction(0, 24, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 263, true)
            DisableControlAction(0, 45, true)
            DisableControlAction(0, 22, true)
			DisableControlAction(0, 44, true)
            DisableControlAction(0, 26, true)
			DisableControlAction(0, 73, true)
            DisableControlAction(0, 288, true)
			DisableControlAction(0, 289, true)
			DisableControlAction(0, 170, true)
			DisableControlAction(0, 167, true)
            DisableControlAction(0, 140, true)
            if not IsEntityPlayingAnim(PlayerPedId(), 'mp_arresting', 'idle', 3) then
                Citizen.Wait(500)
                loadDict("mp_arresting")
                TaskPlayAnim(PlayerPedId(), "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('otworzkodzagrozenia', function()
	PoziomMenu()
end)

function PoziomMenu()

    ESX.UI.Menu.CloseAll()
   
     ESX.UI.Menu.Open(
       'default', GetCurrentResourceName(), 'kod',
       {
         title    = 'Poziom Zagrożenia',
         align    = 'center',
         elements = {
           {label = '🟢', value = '1'},
           {label = '🟠', value = '2'},
           {label = '🔴', value = '3'},
           {label = '⚫', value = '4'}
         }
       },
       function(data, menu)
        
         if data.current.value == '1' then
           TriggerServerEvent("dbl_scoreboard:server:setCode", 1) --Server event
         end
         if data.current.value == '2' then
           TriggerServerEvent("dbl_scoreboard:server:setCode", 2) --Server event
         end
         if data.current.value == '3' then
           TriggerServerEvent("dbl_scoreboard:server:setCode", 3) --Server event
         end
         if data.current.value == '4' then
           TriggerServerEvent("dbl_scoreboard:server:setCode", 4) --Server event
         end
         menu.close()
       end,
       function(data, menu)
         menu.close()
       end
     )
   end
ExtrasMenuFunction = function()
  ESX.UI.Menu.CloseAll()

  local elements = {}
  local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

  local VehicleLiveryMax = GetVehicleLiveryCount(vehicle)
  if VehicleLiveryMax ~= -1 then
    elements[#elements + 1] = {label = "Malowanie", value = GetVehicleLivery(vehicle), type = 'slider', min = 1, max = VehicleLiveryMax}
  end

  for id = 1, 20, 1 do
    if DoesExtraExist(vehicle, id) then
      local state = IsVehicleExtraTurnedOn(vehicle, id) 

      if state then
        elements[#elements + 1] = {label = "Dodatek - "..id.." | ✅", ziutek = id, value = id, state = not state}
      else
        elements[#elements + 1] = {label = "Dodatek - "..id.." | ❌", ziutek = id, value = id, state = not state}
      end
    end
  end
  
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'extra_actions', {
    title    = "Dodatki do pojazdów",
    align    = 'right',
    elements = elements
  }, function(data, menu)
    if data.current.type == "slider" then
      SetVehicleLivery(vehicle, data.current.value)
    else
      SetVehicleExtra(vehicle, data.current.value, not data.current.state)

      local newData = data.current
      if data.current.state then
        newData.label = "Dodatek - "..data.current.value.." | ✅"
      else
        newData.label = "Dodatek - "..data.current.value.." | ❌"
      end
      newData.state = not data.current.state

      menu.update({ziutek = data.current.value}, newData)
      menu.refresh()
    end
  end, function(data, menu)
    menu.close()
  end)
end
CreateThread(function()
  while not ESX.PlayerData do
    Wait(1000)
  end

	while true do
		local tick = 500
		if ESX.PlayerData.job and ESX.PlayerData.job.name == "police" or ESX.PlayerData.job.name == "lssd" and GetVehiclePedIsIn(PlayerPedId()) ~= 0 then
			local PlayerCoords = GetEntityCoords(PlayerPedId())
			for i = 1, #(cfg.VehiclesMenu) do
				local MenuCoords = cfg.VehiclesMenu[i]
				local Distance = #(PlayerCoords - MenuCoords)
				local Color = {r = 196, g = 1, b = 255}
				if Distance < 15.0 then
					tick = 0
					if Distance < 1.8 then
						Color = {r = 146, g = 1, b = 255}
						ESX.ShowHelpNotification("Naciśnij ~INPUT_CONTEXT~ aby otworzyć menu")
						if IsControlJustPressed(0, 38) then
							ExtrasMenuFunction()
						end
					end
					DrawMarker(6, MenuCoords.x, MenuCoords.y, MenuCoords.z - 1.0, 0.0, 0.0, 0.0, 270.0, 0.0, 0.0, 3.5, 3.5, 3.5, Color.r, Color.g, Color.b, 50, false, true, 2, nil, nil, false)
				end
			end
		end
		Wait(tick)
	end
end)
