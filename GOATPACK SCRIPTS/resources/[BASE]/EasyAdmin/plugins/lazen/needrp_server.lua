RegisterServerEvent("EasyAdmin:CallThePlayer", function(id, reason)
    if DoesPlayerHavePermission(source, "player.call") then
        TriggerClientEvent("EasyAdmin:CallThePlayer", id, "[" .. source .. "] " .. GetPlayerName(source), reason)
    end
end)

RegisterServerEvent("EasyAdmin:ReviveTarget", function(id)
    if DoesPlayerHavePermission(source, "esx.revive") then
        TriggerClientEvent("esx_ambulancejob:revive", id)
    end
end)

RegisterServerEvent("EasyAdmin:HealTarget", function(id)
    if DoesPlayerHavePermission(source, "esx.heal") then
        TriggerClientEvent("esx_basicneeds:healPlayer", id)
    end
end)

RegisterServerEvent("EasyAdmin:FeedTarget", function(id)
    if DoesPlayerHavePermission(source, "esx.feed") then
        TriggerClientEvent("esx_basicneeds:resetStatus", id)
    end
end)

RegisterServerEvent("EasyAdmin:HandcuffPlayer", function(id, type)
    if DoesPlayerHavePermission(source, "esx.handcuff") then
        local HandcuffStatus = Player(id).state.IsHandcuffed
        if type == 1 and HandcuffStatus then
            return TriggerClientEvent("esx:showNotification", source, "Ten gracz jest już zakuty!")
        end
        
        if type == 2 and not HandcuffStatus then
            return TriggerClientEvent("esx:showNotification", source, "Ten gracz jest już rozkuty!")
        end

        local trigger = (type == 1 and "cuffPlayer" or "uncuffPlayer")
        TriggerClientEvent("goat_handcuff:" .. trigger, id, source)
    end
end)

RegisterServerEvent("EasyAdmin:HeadbagPlayer", function(id, type)
    if DoesPlayerHavePermission(source, "esx.headbag") then
        local HeadbagStatus = Player(id).state.HasHeadbag
        if type == 1 and HeadbagStatus then
            return TriggerClientEvent("esx:showNotification", source, "Ten gracz ma już worek na głowie!")
        end
        
        if type == 2 and not HeadbagStatus then
            return TriggerClientEvent("esx:showNotification", source, "Ten gracz nie ma worka na głowie!")
        end

        local trigger = (type == 1 and "putOnHead" or "takeOffHead")
        TriggerClientEvent("goat_headbag:" .. trigger, id, source)
    end
end)

RegisterServerEvent("EasyAdmin:OpenInventory", function(id)
    if DoesPlayerHavePermission(source, "esx.inventory") then
        exports.ox_inventory:forceOpenInventory(source, "player", id)
    end
end)