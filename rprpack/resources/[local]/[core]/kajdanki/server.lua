ESX = nil
ESX = exports.es_extended:getSharedObject()



CreateThread(function()
    for k,v in pairs(ESX.GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(v)
        if Player(v).state.xrs_PlayerIsCuffed then
            Player(v).state.xrs_PlayerIsCuffed = false
        end
        if Player(v).state.xrs_HaveOpenedInventory then
            Player(v).state.xrs_HaveOpenedInventory = false
        end
        if Player(v).state.xrs_PlayerIsDragged then
            Player(v).state.xrs_PlayerIsDragged = false
        end
        if Player(v).state.xrs_PlayerDraggingSomeone then
            Player(v).state.xrs_PlayerDraggingSomeone = false
        end
    end
end)


RegisterNetEvent("xrs_handcuff:cuffPlayer", function(target, playerheading, coords, playerlocation)
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player)
    local targetPed = GetPlayerPed(target)

    if not DoesEntityExist(targetPed) then
        xPlayer.showNotification("Nie możesz zakuć tą osobę.")
        return
    end

    local targetCoords = GetEntityCoords(targetPed)
    local localCoords = GetEntityCoords(GetPlayerPed(player))
    local distance = #(targetCoords-localCoords)

    if distance > 3.0 then
        xPlayer.showNotification("Ta osoba jest za daleko!")
       
        return
    end

    if Player(player).state.xrs_PlayerIsCuffed then
        xPlayer.showNotification("Nie możesz zakuwać będąc zakutym")
        return
    end

    if Player(target).state.xrs_PlayerIsCuffed then
        xPlayer.showNotification("Ta osoba jest już zakuta")
        return
    end

    Player(target).state.xrs_PlayerIsCuffed = true

    if playerheading then
        TriggerClientEvent("xrs_handcuff:cuffMe", target, playerheading, coords, playerlocation)
        TriggerClientEvent("xrs_handcuff:cuffHim", player, true)
    else
        TriggerClientEvent("xrs_handcuff:cuffMe", target)
        TriggerClientEvent("xrs_handcuff:cuffHim", player, false)
    end

    xPlayer.showNotification("Skułeś ID: ["..target.."]")
    local xTarget = ESX.GetPlayerFromId(target)
    xTarget.showNotification("Zostałeś skuty przez ID: ["..player.."]")

    local targetLicense = string.gsub(GetPlayerIdentifier(player,1),"license:","")
    
end)

RegisterNetEvent("xrs_handcuff:uncuffPlayer", function(target, playerheading, coords, playerlocation)
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player)

    if Player(player).state.xrs_PlayerIsCuffed then
        xPlayer.showNotification("Nie możesz odkuwać będąc zakuty.")
        return
    end

    if not Player(target).state.xrs_PlayerIsCuffed then
        xPlayer.showNotification("Ta osoba nie jest zakuta")
        return
    end

    Player(target).state.xrs_PlayerIsCuffed = false

    TriggerClientEvent("xrs_handcuff:uncuffMe", target, playerheading, coords, playerlocation)
    TriggerClientEvent("xrs_handcuff:uncuffHim", player)

    xPlayer.showNotification("Odkułeś ID: ["..target.."]")
    local xTarget = ESX.GetPlayerFromId(target)
    xTarget.showNotification("Zostałeś odkuty przez ID: ["..player.."]")

    local targetLicense = string.gsub(GetPlayerIdentifier(player,1),"license:","")
    
end)

RegisterNetEvent("xrs_handcuff:searchInventory", function(target)
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player)
    local targetLicense = string.gsub(GetPlayerIdentifier(player,1),"license:","")
    if Player(player).state.xrs_PlayerIsCuffed then
        xPlayer.showNotification("Nie możesz przeszukiwać kiedy jesteś zakuty")
        return
    end

    local targetCoords = GetEntityCoords(GetPlayerPed(target))
    local localCoords = GetEntityCoords(GetPlayerPed(player))
    local distance = #(targetCoords-localCoords)

    if distance > 6.0 then
        xPlayer.showNotification("Ta osoba jest za daleko!")
       
        return
    end

    Player(target).state.xrs_HaveOpenedInventory = true
    Player(source).state.xrs_IsPlayerSearchingInventory = target
    TriggerClientEvent("xrs_handcuff:getInventory", player, target)

    xPlayer.showNotification("Przeszukujesz ID: ["..target.."]")
    local xTarget = ESX.GetPlayerFromId(target)
    xTarget.showNotification("Zostałeś przeszukany przez ID: ["..player.."]")

   
end)

RegisterNetEvent("xrs_handcuff:uncuffed", function()
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player)

    if Player(player).state.xrs_PlayerIsCuffed then
        Player(player).state.xrs_PlayerIsCuffed = false
        return
    end
end)

RegisterNetEvent("xrs_handcuff:dragPlayer", function(target)
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player)

    if not target then
        return
    end

    local targetCoords = GetEntityCoords(GetPlayerPed(target))
    if not targetCoords then
        return
    end
    local localCoords = GetEntityCoords(GetPlayerPed(player))
    local dist = #(targetCoords-localCoords)

    if dist > 10.0 then
        xPlayer.showNotification("Jesteś za daleko!")
        
        return
    end
    
    if Player(target).state.xrs_PlayerIsDragged then
        xPlayer.showNotification("Gracz jest już przenoszony!")
        return
    end

    Player(target).state.xrs_PlayerIsDragged = true
    Player(player).state.xrs_PlayerDraggingSomeone = true

    TriggerClientEvent("xrs_handcuff:dragMe", target, player)
end)

RegisterNetEvent("xrs_handcuff:unDragPlayer", function(target)
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player)

    if not target then
        if Player(player).state.xrs_PlayerDraggingSomeone then
            Player(player).state.xrs_PlayerDraggingSomeone = false
        end
        return
    end

    local targetCoords = GetEntityCoords(GetPlayerPed(target))
    if not targetCoords then
        return
    end
    local localCoords = GetEntityCoords(GetPlayerPed(player))
    local dist = #(targetCoords-localCoords)

    if dist > 10.0 then
        xPlayer.showNotification("Jesteś za daleko!")
        return
    end
    
    if not Player(target).state.xrs_PlayerIsDragged then
        xPlayer.showNotification("Gracz nie jest przenoszony")
        return
    end

    Player(target).state.xrs_PlayerIsDragged = false
    Player(player).state.xrs_PlayerDraggingSomeone = false

    TriggerClientEvent("xrs_handcuff:unDrag", target)
end)

RegisterNetEvent("xrs_handcuff:closeInventory", function()
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player)

    if not Player(player).state.xrs_IsPlayerSearchingInventory then
        return
    end

    if Player(player).state.xrs_IsPlayerSearchingInventory ~= 0 then
        local target = Player(player).state.xrs_IsPlayerSearchingInventory
        Player(target).state.xrs_HaveOpenedInventory = false
        Player(player).state.xrs_IsPlayerSearchingInventory = 0
    end
end)

RegisterNetEvent("xrs_handcuff:setPedIntoVehicle", function(target,vehicle,seat)
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player)
    local coords = GetEntityCoords(GetPlayerPed(player))

    local targetPed = GetPlayerPed(target)
    local targetCoords = GetEntityCoords(targetPed)

    local dist = #(coords - targetCoords)

    if dist > 10.0 then
        xPlayer.showNotification("Gracz jest za daleko")
       
        return
    end

    TriggerClientEvent("xrs_handcuff:setMeInVehicle",target,vehicle,seat)
end)

RegisterNetEvent("xrs_handcuff:lockpickDelete", function()
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player)
    local item = xPlayer.getInventoryItem("lockpick")
    if item.count > 0 then
        xPlayer.showNotification("Załamałeś wytrych")
        xPlayer.removeInventoryItem("lockpick",1)
    end
end)

RegisterNetEvent("xrs_handcuff:getPedFromVehicle", function(target)
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player)
    local coords = GetEntityCoords(GetPlayerPed(player))

    local targetPed = GetPlayerPed(target)
    local targetCoords = GetEntityCoords(targetPed)

    local dist = #(coords - targetCoords)

    if dist > 10.0 then
        xPlayer.showNotification("Gracz jest za daleko")
        return
    end

    TriggerClientEvent("xrs_handcuff:leaveVehicle",target)
end)
