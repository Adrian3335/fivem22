ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('dhm-drugs:drugcb',function(source,cb,type,item,amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if type == 'joint' then
		local jointitem1 = xPlayer.getInventoryItem('dhm-weedbud').count
    local jointitem2 = xPlayer.getInventoryItem('dhm-rollpaper').count

    if jointitem1 > 1 and jointitem2 > 0 then
        cb(true)
    else
        cb(false)
    end

	elseif type == 'methbag' then
		local methbagitem1 = xPlayer.getInventoryItem('dhm-meth').count
    local methbagitem2 = xPlayer.getInventoryItem('dhm-baggie').count

    if methbagitem1 >= 2 and methbagitem2 >= 1 then
        cb(true)
    else
        cb(false)
    end

	elseif type == 'mixer' then
		local mixeritem1 = xPlayer.getInventoryItem('dhm-vpowder').count
    local mixeritem2 = xPlayer.getInventoryItem('dhm-cocaleaf').count

    if mixeritem1 >= 1 and mixeritem2 >= 1 then
        cb(true)
    else
        cb(false)
    end

	elseif type == 'heroin' then
		local heroinitem1 = xPlayer.getInventoryItem('dhm-opium').count
		local heroinitem2 = xPlayer.getInventoryItem('dhm-fentanyl').count
		local heroinitem3 = xPlayer.getInventoryItem('dhm-needle').count
	
		if heroinitem1 > 0 and heroinitem2 > 0 and heroinitem3 > 0 then
			cb(true)
		else
			cb(false)
		end

	elseif type == 'amount' then
		local itemamount = xPlayer.getInventoryItem(item).count
		cb(itemamount)

	elseif type == 'carry' then
		cb(xPlayer.canCarryItem(item, amount))
	end
end)

RegisterServerEvent('dhm-drugs:receive')
AddEventHandler('dhm-drugs:receive', function(type)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local coords = xPlayer.getCoords(true)

	if type == 'cocaleaf' then
		local dist = #(coords - Config.CocaPlants.coords)
		if dist < 40 then
  		xPlayer.addInventoryItem('dhm-cocaleaf', 1)
		end
	
	elseif type == 'acid' then
		local dist = #(coords - Config.AcidCollect.coords)
		if dist < 10 then
			xPlayer.addInventoryItem('dhm-acid', 1)
		end
	
	elseif type == 'vic' then
		local dist = #(coords - Config.VicodinCrush.coords)
		if dist < 10 then
			if xPlayer.getInventoryItem('dhm-vicodin').count > 0 then
				xPlayer.removeInventoryItem('dhm-vicodin', 1)
				xPlayer.addInventoryItem('dhm-vpowder', 1)
			end
		end

	elseif type == 'methbag' then
		local dist = #(coords - Config.MethTable.coords)
		if dist < 5 then
			local meth = xPlayer.getInventoryItem('dhm-meth').count
			local baggie = xPlayer.getInventoryItem('dhm-baggie').count
			if meth >= 2 and baggie >= 1 then
				xPlayer.removeInventoryItem('dhm-baggie', 1)
				xPlayer.removeInventoryItem('dhm-meth', 2)
				xPlayer.addInventoryItem('dhm-pmeth', 1)
			else
				TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.methitemsnotenough)
			end
		end
	
	elseif type == 'methchemical' then
		local dist = #(coords - Config.MethChem.coords)
		if dist < 40 then
			local chance = math.random(1, 5)
			if chance == 1 then
				TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.didntfind)
			elseif chance >= 2 and chance <= 3 then
				xPlayer.addInventoryItem('dhm-ephedrine', 1)
			elseif chance >= 4 and chance <= 5 then
				xPlayer.addInventoryItem('dhm-ammonia', 1)
			end
		end

	elseif type == 'weedbud' then
		local dist = #(coords - Config.WeedDry.coords)
		if dist < 10 then
			local weedamt = xPlayer.getInventoryItem('dhm-weed').count
			if weedamt >= 2 then
				if xPlayer.canSwapItem('dhm-weed', 2, 'dhm-weedbud', 1) then
					xPlayer.removeInventoryItem('dhm-weed', 2)
					xPlayer.addInventoryItem('dhm-weedbud', 1)
				else
					TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.nospace)
				end
			else
				TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.notenoughweed)
			end
		end

	elseif type == 'joint' then
		local weedbudamt = xPlayer.getInventoryItem('dhm-weedbud').count
    local rollpaperamt = xPlayer.getInventoryItem('dhm-rollpaper').count

    if weedbudamt >= 2 then
        if rollpaperamt > 0 then
            xPlayer.removeInventoryItem('dhm-weedbud', 2)
            xPlayer.removeInventoryItem('dhm-rollpaper', 1)
            xPlayer.addInventoryItem('dhm-weedjoint', 1)
        else
            TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.notenoughpaper)
        end
    else
        TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.notenoughbuds)
    end

	elseif type == 'opium' then
		local poppyamt = xPlayer.getInventoryItem('dhm-poppypod').count
		local dist = #(coords - Config.OpiumTable.coords)

		if dist < 5 then
    	if poppyamt > 1 then
				xPlayer.removeInventoryItem('dhm-poppypod', 2)
				xPlayer.addInventoryItem('dhm-opium', 1)
			else
				TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.notenoughpods)
			end
		end

	elseif type == 'heroin' then
		local dist = #(coords - Config.HeroinTable.coords)
  
		local opiumamt = xPlayer.getInventoryItem('dhm-opium').count
		local fentanylamt = xPlayer.getInventoryItem('dhm-fentanyl').count
		local needleamt = xPlayer.getInventoryItem('dhm-needle').count

		if dist < 5 then
			if opiumamt > 0 and fentanylamt > 0 and needleamt > 0 then
				xPlayer.removeInventoryItem('dhm-fentanyl', 1)
				xPlayer.removeInventoryItem('dhm-opium', 1)
				xPlayer.removeInventoryItem('dhm-needle', 1)
				xPlayer.addInventoryItem('dhm-heroin', 1)
			else
				TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.moreitems)
			end
    end
	
	elseif type == 'heroinchemical' then
		local dist = #(coords - Config.HeroinChem.coords)

		if dist < 40 then
			local chance = math.random(1, 5)
			if chance == 1 then
				TriggerClientEvent('dhm-drugs:notif', source, Config.Translations.didntfind)
			else
				xPlayer.addInventoryItem('dhm-fentanyl', 1)
			end
    end
	end
end)

function CheckCoord(crd, tbl)
	if tbl ~= nil then
		local validate = true

		for k, v in pairs(tbl) do
			if #(crd - vector3(v.coords.x,v.coords.y+0.5,v.coords.z)) < 5 then
				validate = false
			end
		end

		return validate
	else
		return true
	end
end

function genid(tbl)
    id = math.random(10000,99999)
    valid = true
	for k,v in pairs(tbl) do
        if k == id then
            valid = false
        end
    end
    if valid then
        return id
    else
        genid(tbl)
    end
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
  end