ESX = exports.es_extended.getSharedObject()

local CharCount, VehCount, LiczbaMandatowPrzezMiesiac, LiczbaMandatowPrzezTydzien, PhoneNumber, KartotekaSearch, Doj, OstatnieMandatySelect, VehiclesByPlate, VehiclesByIdentifier, PropertiesByIdentifier, NotepadSelect, NotepadInsert, NotepadUpdate, OgloszeniaSelect, OgloszeniaInsert, OgloszeniaDelete, RaportySelect, RaportyInsert, RaportDelete, JudgmentsSelect, JudgmentsInsert, JudgmentsDelete, PoszukiwaniaSelect, PoszukiwaniaInsert, PoszukiwaniaDelete, KartotekaNotatkiSelect, KartotekaNotatkiInsert, KartotekaNotatkiDelete = -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

MySQL.ready(function() -- done
    Properties = {}
    PhoneNumber = MySQL.Sync.store("SELECT `phone_number` FROM `users` WHERE `identifier` = ?")
    CharCount = MySQL.Sync.store("SELECT COUNT(*) FROM `users`");
    VehCount = MySQL.Sync.store("SELECT COUNT(*) FROM `owned_vehicles`");
    LiczbaMandatowPrzezMiesiac = MySQL.Sync.store("SELECT COUNT(*) FROM `dojmdt_judgments`WHERE date between date_sub(now(),INTERVAL 1 MONTH) and now();")
    LiczbaMandatowPrzezTydzien = MySQL.Sync.store("SELECT COUNT(*) FROM `dojmdt_judgments` WHERE date between date_sub(now(),INTERVAL 1 WEEK) and now();")
    MySQL.Async.store("SELECT `identifier`, `firstname`, `lastname`, `dateofbirth`, `phone_number` FROM `users` WHERE `firstname` = ? AND `lastname` = ?", function(storeId)
        KartotekaSearch = storeId
    end)
    MySQL.Async.store("SELECT * FROM `dojmdt_judgments` WHERE date between date_sub(now(),INTERVAL 1 WEEK) and now() ORDER BY id DESC;", function(storeId)
		OstatnieMandatySelect = storeId
	end)
    MySQL.Async.store('SELECT users.firstname, users.lastname, users.phone_number, owned_vehicles.vehicle, owned_vehicles.plate FROM owned_vehicles INNER JOIN users ON owned_vehicles.owner = users.identifier WHERE owned_vehicles.plate LIKE ?;', function(storeId)
		VehiclesByPlate = storeId
	end)
    MySQL.Async.store('SELECT `vehicle`, `plate` FROM `owned_vehicles` WHERE `owner` = ?', function(storeId)
		VehiclesByIdentifier = storeId
	end)

    MySQL.Async.store("SELECT `notatka` FROM `dojmdt_notatki` WHERE `identifier` = ?", function(storeId)
		NotepadSelect = storeId
	end)
    MySQL.Async.store('INSERT INTO `dojmdt_notatki`(`identifier`, `notatka`) VALUES (?,?)', function(storeId)
        NotepadInsert = storeId
    end)
    MySQL.Async.store('UPDATE `dojmdt_notatki` SET `notatka` = ? WHERE `identifier` = ?', function(storeId)
        NotepadUpdate = storeId
    end)
    MySQL.Async.store("SELECT * FROM `dojmdt_ogloszenia`", function(storeId)
		OgloszeniaSelect = storeId
	end)
    MySQL.Async.store('INSERT INTO `dojmdt_ogloszenia`(`fp`, `ogloszenie`) VALUES (?,?)', function(storeId)
        OgloszeniaInsert = storeId
    end)
    MySQL.Async.store('DELETE FROM `dojmdt_ogloszenia` WHERE `fp` = ? AND `ogloszenie` = ?', function(stroeId)
        OgloszeniaDelete = stroeId
    end)
    MySQL.Async.store("SELECT * FROM `dojmdt_raporty`", function(storeId)
		RaportySelect = storeId
	end)
    MySQL.Async.store('INSERT INTO `dojmdt_raporty`(`fp`, `raport`) VALUES (?,?)', function(storeId)
        RaportyInsert = storeId
    end)
    MySQL.Async.store('DELETE FROM `dojmdt_raporty` WHERE `fp` = ? AND `raport` = ?', function(stroeId)
        RaportDelete = stroeId
    end)
    MySQL.Async.store("SELECT * FROM `dojmdt_judgments` WHERE `identifier` = ?", function(storeId)
		JudgmentsSelect = storeId
	end)
    MySQL.Async.store('INSERT INTO `dojmdt_judgments`(`identifier`, `charname`, `fp`, `reason`, `fee`, `length`) VALUES (?,?,?,?,?,?)', function(storeId)
        JudgmentsInsert = storeId
    end)
    MySQL.Async.store('DELETE FROM `dojmdt_judgments` WHERE `id` = ? AND `identifier` = ?', function(storeId)
        JudgmentsDelete = storeId
    end)
    MySQL.Async.store("SELECT * FROM `dojmdt_poszukiwani` WHERE `identifier` = ?", function(storeId)
		PoszukiwaniaSelect = storeId
	end)
    MySQL.Async.store('INSERT INTO `dojmdt_poszukiwani`(`identifier`, `fp`, `reason`) VALUES (?,?,?)', function(storeId)
        PoszukiwaniaInsert = storeId
    end)
    MySQL.Async.store('DELETE FROM `dojmdt_poszukiwani` WHERE `identifier` = ? AND `reason` = ?', function(storeId)
        PoszukiwaniaDelete = storeId
    end)
    MySQL.Async.store("SELECT * FROM `dojmdt_kartoteka_notatki` WHERE `identifier` = ?", function(storeId)
		KartotekaNotatkiSelect = storeId
	end)
    MySQL.Async.store('INSERT INTO `dojmdt_kartoteka_notatki`(`identifier`, `notatka`, `fp`) VALUES (?,?,?)', function(storeId)
        KartotekaNotatkiInsert = storeId
    end)
    MySQL.Async.store('DELETE FROM `dojmdt_kartoteka_notatki` WHERE `identifier` = ? AND `notatka` = ?', function(storeId)
        KartotekaNotatkiDelete = storeId
    end)


	
    Dojs = MySQL.Sync.fetchAll("SELECT `identifier`, `firstname`, `lastname`, `phone_number` FROM `users` WHERE `job` = ?", {"doj"})
    
	for k,v in pairs(Dojs) do
        v.duty_status = 1
        v.color = "red"
    end
end) 

AddEventHandler('playerDropped', function(reason) -- done
	local playerId = source 
    if playerId ~= nil then
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer ~= nil then
            if xPlayer.job.name == 'doj' then
                for k,v in pairs(Dojs) do
                    if xPlayer.identifier == v.identifier then
                        v.duty_status = 1
                        v.color = "red"
                    end
                end
            end
        end
    end
end)

ESX.RegisterServerCallback('esx_dojmdt:GetVehicleByPlate', function(source, cb, plate) -- done
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
        MySQL.Async.fetchAll(VehiclesByPlate, {plate..'%'}, function(result)
            local vehdata = {}
            
            for k,v in pairs(result) do
                local vehicle = json.decode(v.vehicle)
                local numer_telefonu = exports.high_phone:getPlayerPhoneNumber(source)
				
                if (numer_telefonu == "") then
                    numer_telefonu = "Brak"
                end
				
                local veharray = {
                    ownername = v.firstname.." "..v.lastname,
                    plate = v.plate,
                    model = vehicle.model,
                    phone_number = numer_telefonu
                }
				
                table.insert(vehdata, veharray)
            end
			
            cb(vehdata)
        end)
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

ESX.RegisterServerCallback('esx_dojmdt:SearchNumber', function(source, cb, numer) -- done
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil and xPlayer.job.name == 'doj' then	
		local numerarray = {
			ownername = 'Brak',
			phone_number = numer
		}
		
		local findNumber = MySQL.Sync.fetchAll("SELECT identifier FROM users WHERE phone_number LIKE '%"..numer.."%'", {})	
		
		if findNumber[1] ~= nil then
			local xPlayerSQL = MySQL.Sync.fetchAll('SELECT firstname, lastname, phone_number FROM users WHERE identifier = @identifier', {
				['@identifier']	= findNumber[1].identifier
			})		
			numerarray.ownername = xPlayerSQL[1].firstname .. " " .. xPlayerSQL[1].lastname
            numerarray.phone_number = exports.high_phone:getPlayerPhoneNumber(source)
		end
				
		cb(numerarray)	
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

ESX.RegisterServerCallback('esx_dojmdt:SearchPersonKartoteka', function(source, cb, data) -- done
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
        MySQL.Async.fetchAll(KartaSearch, {data.firstname, data.lastname}, function(result)
            cb(result)
        end)
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)


RegisterServerEvent('esx_dojmdt:WystawMandat')
AddEventHandler('esx_dojmdt:WystawMandat', function(data) -- done
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xTarget = ESX.GetPlayerFromId(data.id)
    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
		local xPlayerSQL = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
			['@identifier']	= xPlayer.identifier
		})		

		local xTargetSQL = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
			['@identifier']	= xTarget.identifier
		})	
		
		if xPlayerSQL[1] ~= nil and xTargetSQL[1] ~= nil then
			local fp = xPlayerSQL[1].firstname.." "..xPlayerSQL[1].lastname
			local name = xTargetSQL[1].firstname..' '..xTargetSQL[1].lastname
			local mandat = tonumber(data.fee)
			MySQL.Async.execute(JudgmentsInsert, {xTarget.identifier, xTargetSQL[1].firstname.." "..xTargetSQL[1].lastname, fp, data.text, mandat, 0})
				
			xTarget.removeAccountMoney('bank', mandat)

			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..xPlayer.job.name, function(account)
				if account then
					account.addMoney(mandat * 0.80)
				end
			end)
			
            TriggerClientEvent("chat:addMessage", -1, { 
                templateId = "message",
                multiline = true,
                args = { "78, 245, 66", "fa-solid fa-gavel", "Fakura ", "" .. name .. " otrzymał fakturę w wysokosci " .. mandat .. " za " .. data.text .. " od ".. fp}
            })
            exports['dbl_logs']:SendLog(_source, "Wystawił fakture: " ..name.. "o wysokości " .. mandat .. " za " ..  data.text, 'tablet-ems')
		end
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

RegisterNetEvent('esx_dojmdt:WystawWiezienie')
AddEventHandler('esx_dojmdt:WystawWiezienie', function(data) -- done
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local xTarget = ESX.GetPlayerFromId(data.id)

    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
		local xPlayerSQL = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
			['@identifier']	= xPlayer.identifier
		})		

		local xTargetSQL = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
			['@identifier']	= xTarget.identifier
		})	
		
		if xPlayerSQL[1] ~= nil and xTargetSQL[1] ~= nil then
			local fp = xPlayerSQL[1].firstname.." "..xPlayerSQL[1].lastname
			local name = xTargetSQL[1].firstname..' '..xTargetSQL[1].lastname
			local mandat = tonumber(data.fee)

			MySQL.Async.execute(JudgmentsInsert, {xTarget.identifier, xTargetSQL[1].firstname.." "..xTargetSQL[1].lastname, fp, data.text, mandat, data.length})

			xTarget.removeAccountMoney('bank', mandat)

			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..xPlayer.job.name, function(account)
				if account then
					account.addMoney(mandat * 0.80)
				end
			end)

			-- TriggerEvent("esx_jtestailer:sendToJailPanelhype", xTarget.source, data.length * 60, data.text) (our trigger)
            TriggerEvent('xlem0n_jailer:wpierdolchuja', _source, xTarget.source, data.length * 60)
            -- exports['fullrp_logs']:SendLog(_source, 'TABLET DOJ: `'..GetPlayerName(_source)..'` ('..xPlayer.identifier..') WWJEBAŁ DO WIĘCIENIA `'..xTarget.source..'` na `'..(data.length*60)..'` (data): `'..json.encode(data)..'`', 'nowe-tablety')
		end
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)


RegisterServerEvent("esx_dojmdt:SendMdtData")
AddEventHandler("esx_dojmdt:SendMdtData", function() -- done
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil then
        if xPlayer.job.name == 'doj' then	
			local xPlayerSQL = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
				['@identifier']	= xPlayer.identifier
			})		
		
			if xPlayerSQL[1] ~= nil then
				local MdtData = {
					charCount = MySQL.Sync.fetchScalar(CharCount),
					vehCount = MySQL.Sync.fetchScalar(VehCount),
					mandatyMiesiac = MySQL.Sync.fetchScalar(LiczbaMandatowPrzezMiesiac);
					mandatyTydzien = MySQL.Sync.fetchScalar(LiczbaMandatowPrzezTydzien);
					OstatnieMandaty = MySQL.Sync.fetchAll(OstatnieMandatySelect),
					Player = {
						firstname = xPlayerSQL[1].firstname,
						lastname = xPlayerSQL[1].lastname,
						job = xPlayer.job,
					},
					Doj = Dojs,
					Notepad = MySQL.Sync.fetchScalar(NotepadSelect, {xPlayer.identifier}),
					Ogloszenia = MySQL.Sync.fetchAll(OgloszeniaSelect),
					Raporty = MySQL.Sync.fetchAll(RaportySelect),
					Taryfikator = Config.Taryfikator
				}	
				TriggerClientEvent("esx_dojmdt:SendMdtData", _source, MdtData)
                -- exports['fullrp_logs']:SendLog(_source, 'TABLET doj: `'..GetPlayerName(_source)..'` ('..xPlayer.identifier..') WYSTAWIŁ FAKTURE (data): `'..json.encode(MdtData)..'`', 'nowe-tablety')
			end
        else
            exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
        end
	end
end)

RegisterServerEvent("esx_dojmdt:UpdateDojStatus")
AddEventHandler("esx_dojmdt:UpdateDojStatus", function(type) -- done
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil then
		local jestwtablicy = false
		
		if type == 'insert' then
			for k,v in pairs(Dojs) do
				if xPlayer.identifier == v.identifier then
					v.duty_status = 2
					v.color = "green"
					jestwtablicy = true
					break
				end
			end
			
			if jestwtablicy == false then
				local xPlayerSQL = MySQL.Sync.fetchAll('SELECT firstname, lastname, phone_number  FROM users WHERE identifier = @identifier', {
					['@identifier']	= xPlayer.identifier
				})
			
				if xPlayerSQL[1] ~= nil then
					table.insert(Dojs, {
						identifier = xPlayer.identifier,
						firstname = xPlayerSQL[1].firstname,
						lastname = xPlayerSQL[1].lastname,
						phone_number = exports.high_phone:getPlayerPhoneNumber(source),
						duty_status = 2,
						color = "green"
					})
				end
			end
		elseif type == 'remove' then
			for k,v in pairs(Dojs) do
				if xPlayer.identifier == v.identifier then
					if xPlayer.job.name == 'offduty' then
						v.duty_status = 1
						v.color = "red"
						break
					else
						table.remove(Dojs, k)
						break
					end
				end
			end
		end
        table.sort(Dojs, function(a, b)
            if a ~= nil and b ~= nil and a.duty_status ~= b.duty_status then
                return tonumber(a.duty_status) > tonumber(b.duty_status)
            end
        end)
	end
end)

RegisterServerEvent("esx_dojmdt:UpdateNotepad")
AddEventHandler("esx_dojmdt:UpdateNotepad", function(note) -- done
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
        if note ~= nil then        
            MySQL.Async.fetchAll(NotepadSelect, {
                xPlayer.identifier,
            }, function(notepad)
                if notepad[1] then
                    MySQL.Async.execute(NotepadUpdate, {note, xPlayer.identifier})
                else
                    MySQL.Async.execute(NotepadInsert, {xPlayer.identifier, note})
                end		
            end)
        end
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)


ESX.RegisterServerCallback('esx_dojmdt:SendAnnounce', function(source, cb, text) -- done
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil and xPlayer.job.name == 'doj' or xPlayer.job.grade_name == 'boss' then
        if(text ~= nil and text ~= "") then
			local xPlayerSQL = MySQL.Sync.fetchAll('SELECT firstname, lastname, phone_number FROM users WHERE identifier = @identifier', {
				['@identifier']	= xPlayer.identifier
			})
			
			if xPlayerSQL[1] ~= nil then
				local announcedata = {
					owner = xPlayerSQL[1].firstname.." "..xPlayerSQL[1].lastname,
					text = text,
					date = os.time(os.date("!*t"))
				}
				MySQL.Async.execute(OgloszeniaInsert, {announcedata.owner, announcedata.text})
				cb(announcedata)
			end
        end
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

RegisterServerEvent("esx_dojmdt:RemoveAnnounce")
AddEventHandler("esx_dojmdt:RemoveAnnounce", function(data) -- -- done
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer ~= nil and xPlayer.job.name == 'doj' or xPlayer.job.grade_name == 'boss' then
        if(data.fp ~= nil and data.ogloszenie ~= nil) then
            MySQL.Async.execute(OgloszeniaDelete, {data.fp, data.ogloszenie})
        end
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end

end)

ESX.RegisterServerCallback('esx_dojmdt:SendRaport', function(source, cb, text) -- done
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
        if(text ~= nil and text ~= "") then
			local xPlayerSQL = MySQL.Sync.fetchAll('SELECT firstname, lastname, phone_number FROM users WHERE identifier = @identifier', {
				['@identifier']	= xPlayer.identifier
			})
			
			if xPlayerSQL[1] ~= nil then
				local raportdata = {
					owner = xPlayerSQL[1].firstname.." "..xPlayerSQL[1].lastname,
					text = text,
					date = os.time(os.date("!*t"))
				}
				MySQL.Async.execute(RaportyInsert, {raportdata.owner, raportdata.text})
				cb(raportdata)
			end
        end
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

RegisterServerEvent('esx_dojmdt:RemoveRaport')
AddEventHandler('esx_dojmdt:RemoveRaport', function(data) -- done
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer ~= nil and xPlayer.job.name == 'doj' or xPlayer.job.grade_name == 'boss' then
        if(data.fp ~= nil and data.raport ~= nil) then
            MySQL.Async.execute(RaportDelete, {data.fp, data.raport})
        end

    else 
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

ESX.RegisterServerCallback('esx_dojmdt:PersonMoreInfo', function(source, cb, data) -- done
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
        local identifier = data.identifier
        local vehdata = {}
		local licensesdata = {}
		
        MySQL.Async.fetchAll(VehiclesByIdentifier, {identifier}, function(result)
            for k,v in pairs(result) do
                local vehicle = json.decode(v.vehicle)
                table.insert(vehdata, {
                    model = vehicle.model,
                    plate = v.plate
                })
            end
        end)
		
		local licenses = MySQL.Sync.fetchAll('SELECT * FROM user_licenses WHERE owner = @identifier', {
			['@identifier']	= identifier
		})
		
        -- local houses = MySQL.Sync.fetchAll(PropertiesByIdentifier, {
        --     identifier
        -- })

        local houses = "nieznane"
        
        local temphouse = {}
        
        -- for k,v in ipairs(houses) do
        --     local house = Properties[v.name]
            
        --     if house then
        --         table.insert(temphouse, {
        --             label = house.label,
        --             coords = house.coords
        --         })
        --     end
        -- end
        local moreinfodata = {
            mandaty = MySQL.Sync.fetchAll(JudgmentsSelect, {identifier}),
            poszukiwania = MySQL.Sync.fetchAll(PoszukiwaniaSelect, {identifier}),
            pojadzy = vehdata,
            mieszkania = temphouse,
            notatki = MySQL.Sync.fetchAll(KartotekaNotatkiSelect, {identifier}),
            licenses = licenses
        }
        cb(moreinfodata)
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

ESX.RegisterServerCallback('esx_dojmdt:AddPoszukiwaniaKartoteka', function(source, cb, data) -- done
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
        local identifier = data.identifier
		local xPlayerSQL = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
			['@identifier']	= xPlayer.identifier
		})
		
		if xPlayerSQL[1] ~= nil then
			local poszukiwaniadata = {
				reason = data.reasonarea,
				fp = xPlayerSQL[1].firstname.." "..xPlayerSQL[1].lastname,
				date = os.time(os.date("!*t"))
			}
			cb(poszukiwaniadata)
			MySQL.Async.execute(PoszukiwaniaInsert, {identifier, poszukiwaniadata.fp, poszukiwaniadata.reason})
		end
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

ESX.RegisterServerCallback('esx_dojmdt:AddNotatkaKartoteka', function(source, cb, data) -- done
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
        local identifier = data.identifier
		local xPlayerSQL = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
			['@identifier']	= xPlayer.identifier
		})
		
		if xPlayerSQL[1] ~= nil then
			local notedata = {
				notatka = data.note,
				fp = xPlayerSQL[1].firstname.." "..xPlayerSQL[1].lastname,
				date = os.time(os.date("!*t"))
			}
			cb(notedata)
			MySQL.Async.execute(KartotekaNotatkiInsert, {identifier, notedata.notatka, notedata.fp})
		end
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end

end)


RegisterServerEvent('esx_dojmdt:licencjaDodaj')
AddEventHandler('esx_dojmdt:licencjaDodaj', function(data) -- done
    local _source = source
    local identifier = data.identifier
    local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromIdentifier(identifier)
    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
		MySQL.Async.execute('INSERT INTO user_licenses (type, owner) VALUES (@type, @owner)', {
			['@type']  = data.type,
			['@owner'] = identifier
		})
			
		if xTarget ~= nil then
			xTarget.showNotification('Otrzymałeś licencje: ' .. changekLicenseName(data.type))
		end
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

RegisterServerEvent('esx_dojmdt:licencjaUsun')
AddEventHandler('esx_dojmdt:licencjaUsun', function(data) -- done
    local _source = source
    local identifier = data.identifier
    local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromIdentifier(identifier)
    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
		MySQL.Async.execute('DELETE FROM user_licenses WHERE type = @type AND owner = @owner', {
			['@type']  = data.type,
			['@owner'] = identifier
		})
	
		if xTarget ~= nil then
			xTarget.showNotification('Straciłeś licencje: ' .. changekLicenseName(data.type))
		end
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

RegisterServerEvent('esx_dojmdt:RemoveMandatKartoteka')
AddEventHandler('esx_dojmdt:RemoveMandatKartoteka', function(data) -- done
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
        local id = data.id
        local identifier = data.identifier
        MySQL.Async.execute(JudgmentsDelete, {id, identifier})
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

RegisterServerEvent('esx_dojmdt:RemovePoszukiwaniaKartoteka')
AddEventHandler('esx_dojmdt:RemovePoszukiwaniaKartoteka', function(data) -- done
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
        local identifier = data.identifier
        local reason = data.reason
        MySQL.Async.execute(PoszukiwaniaDelete, {identifier, reason})
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end
end)

RegisterServerEvent('esx_dojmdt:RemoveNotatkiKartoteka')
AddEventHandler('esx_dojmdt:RemoveNotatkiKartoteka', function(data) -- done
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer ~= nil and xPlayer.job.name == 'doj' then
        local identifier = data.identifier
        local note = data.note

        MySQL.Async.execute(KartotekaNotatkiDelete, {identifier, note})
    else
        exports["vProtection"]:fg_BanPlayer(source, "diablo developer", true)
    end

end)

function changekLicenseName(licencja)
	local name = "";
	if(licencja == "drive_bike" ) then
		name = "prawo jazdy kat. A"
		return name
	elseif (licencja == "drive" ) then
		name = "prawo jazdy kat. B"
		return name
	elseif (licencja == "drive_truck" ) then
		name = "prawo jazdy kat. C"
		return name
	elseif (licencja == "weapon" ) then
		name = "licencję na broń krótką"
		return name
	elseif (licencja == 'test_psycho') then
		name = "Test psychologiczny:"
		return name		
	end
end

