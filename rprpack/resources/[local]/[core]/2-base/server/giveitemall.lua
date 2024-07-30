ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('giveitemall', function(source, args)
            if source == 0 then 
            local Players = ESX.GetPlayers()
            local itemki = args[1]
            local gramy = args[2]

            for i=1, #Players, 1 do
                local gracze = ESX.GetPlayerFromId(Players[i])

                gracze.addInventoryItem(itemki, gramy)
                gracze.showNotification("Dostałeś ".. itemki .." w ilosci ".. gramy .."x.")
                
        end
        print("Dales kazdemu na serwerze ".. itemki .." w ilosci ".. gramy .."")
    end
end) 