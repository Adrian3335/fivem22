ESX = exports["es_extended"]:getSharedObject()


RegisterNetEvent('goat_handcuff:handcuff', function(target, type)
    local _source = source
    local coords = GetEntityCoords(GetPlayerPed(_source))
    local tCoords = GetEntityCoords(GetPlayerPed(target))

    if #(coords-tCoords) < 3.0 then
        if type == nil then
            cuff(target, type)
        else
            TriggerClientEvent('goat_handcuff:handcuffAresster', _source)
            TriggerClientEvent('goat_handcuff:handcuffAressted', target, _source, type)
        end
    end
end)

RegisterNetEvent('goat_handcuff:handcuffForce', function(type)
    local _source = source
    Player(_source).state.handcuff = type  
    TriggerClientEvent('goat_handcuff:handcuff', _source, type)
end)


RegisterNetEvent('goat_handcuff:unhandcuff', function()
    local _source = source
    Player(_source).state.handcuff = nil   
    TriggerClientEvent('goat_handcuff:unhandcuff', _source)
end)


function cuff(target, type)
    if Player(target).state.handcuff or type == nil then
        Player(target).state.handcuff = nil
    else
        Player(target).state.handcuff = 'handcuff' 
    end
    
    TriggerClientEvent('goat_handcuff:handcuff', target, Player(target).state.handcuff)
end

RegisterNetEvent('goat_handcuff:drag', function(target)
    local _source = source
    TriggerClientEvent('goat_handcuff:drag', target, _source)
    TriggerClientEvent('goat_handcuff:isDragging', _source, target)
end)

RegisterNetEvent('goat_handcuff:dragUpdate', function(target)
    local _source = source
    TriggerClientEvent('goat_handcuff:isDragging', target, false)
end)

RegisterNetEvent('goat_handcuff:putInVehicle', function(target)
    local _source = source
    TriggerClientEvent('goat_handcuff:putInVehicle', target)
end)

RegisterNetEvent('goat_handcuff:OutVehicle', function(target)
    local _source = source
    local coords = GetEntityCoords(GetPlayerPed(_source))
    TriggerClientEvent('goat_handcuff:OutVehicle', target, coords)
end)

RegisterNetEvent('goat_handcuff:putInTrunk', function(target)
    local _source = source

    TriggerClientEvent('bagaznik:forceInFast', target, target)
end)

RegisterNetEvent('goat_handcuff:putOutTrunk', function(target)
    local _source = source
    TriggerClientEvent('bagaznik:forceOutFast', target, target)
end)

RegisterCommand('zakuj', function(source, args, rawCommand)
    cuff(tonumber(args[1]), 'handcuffs')
end, true)

ESX.RegisterServerCallback('esx_skin:getPlayerSkintarget', function(source, cb, target)

	local xPlayer = ESX.GetPlayerFromId(target)
  
	MySQL.Async.fetchAll(
	  'SELECT * FROM users WHERE identifier = @identifier',
	  {
		['@identifier'] = xPlayer.identifier
	  },
	  function(users)
  
		local user = users[1]
		local skin = nil
  
		if user.skin ~= nil then
		  skin = json.decode(user.skin)
		end
  
		cb(skin)
  
	  end
	)
  
end)

RegisterServerEvent('esx_policejob:ubierzciuchydefault', function(target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(target)
	TriggerClientEvent('esx_policejob:ubierzciuchydefault', target)				
end)


RegisterNetEvent('goat_handcuff:askForClothes', function(target)
    local _source = source
    TriggerClientEvent('goat_handcuff:askForClothes', target, _source)
end)

RegisterNetEvent('goat_handcuff:wearClothes', function(target)
    local _source = source
    TriggerClientEvent('goat_handcuff:wearClothes', target, _source)
end)


