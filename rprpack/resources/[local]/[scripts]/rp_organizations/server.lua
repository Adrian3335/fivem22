local Organizations = {}

CreateThread(function()
    for name, cfg in pairs(Config.Organizations) do
        MySQL.insert.await('INSERT IGNORE INTO `organizations` (name, members_limit, warehouse_slots, warehouse_weight) VALUES (?, ?, ?, ?)', {name, Config.DefaultMembers, Config.DefaultSlots, Config.DefaultWeight})

        local row = MySQL.single.await('SELECT `account`, `members_limit`, `warehouse_slots`, `warehouse_weight` FROM `organizations` WHERE `name` = ?', {name})
        Organizations[name] = row
        
        exports.ox_inventory:RegisterStash(name, cfg.label, row.warehouse_slots, row.warehouse_weight, nil, nil)
    end
end)

local function AddOrganizationMoney(name, count)
    Organizations[name].account = Organizations[name].account + count
    MySQL.prepare('UPDATE `organizations` SET `account` = ? WHERE `name` = ?', {Organizations[name].account, name})
end

local function RemoveOrganizationMoney(name, count)
    Organizations[name].account = Organizations[name].account - count
    MySQL.prepare('UPDATE `organizations` SET `account` = ? WHERE `name` = ?', {Organizations[name].account, name})
end

lib.callback.register("dbl_organizations:getOrganizationWardrobe", function(source)
    return MySQL.query.await('SELECT * FROM `organizations_clothes` WHERE `org` = ?', {ESX.GetPlayerFromId(source).get("org").name})
end)

lib.callback.register("dbl_organizations:saveOrganizationClothes", function(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerJob = xPlayer.get("org")

    if not playerJob.permissions["wardrobeAdd"] then
        return
    end

    MySQL.insert.await('INSERT INTO `organizations_clothes` (org, label, value) VALUES (?, ?, ?)', {playerJob.name, data.label, json.encode(data.value)})
    MySQL.insert.await('INSERT INTO `organizations_logs` (org, title, time) VALUES (?, ?, ?)', {playerJob.name, xPlayer.get("firstName") .. " " .. xPlayer.get("lastName") .. " dodał strój o nazwie " .. data.label, os.date("%H:%M %d.%m.%Y")})
    return true
end)

lib.callback.register("dbl_organizations:removeOrganizationClothes", function(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerJob = xPlayer.get("org")

    if not playerJob.permissions["wardrobeRemove"] then
        return
    end

    MySQL.query.await('DELETE FROM `organizations_clothes` WHERE `id` = ?', {data.id})
    MySQL.insert.await('INSERT INTO `organizations_logs` (org, title, time) VALUES (?, ?, ?)', {playerJob.name, xPlayer.get("firstName") .. " " .. xPlayer.get("lastName") .. " usunął strój o nazwie " .. data.label, os.date("%H:%M %d.%m.%Y")})
    return true
end)

lib.callback.register("dbl_organizations:checkSafeMoney", function(source)
    return Organizations[ESX.GetPlayerFromId(source).get("org").name].account
end)

lib.callback.register("dbl_organizations:depositSafeMoney", function(source, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerJob = xPlayer.get("org")

    if not playerJob.permissions["safe"] then
        return
    end

    if xPlayer.getMoney() < count then
        return "money"
    end

    xPlayer.removeAccountMoney("money", count)
    AddOrganizationMoney(playerJob.name, count)
    MySQL.insert.await('INSERT INTO `organizations_logs` (org, title, time) VALUES (?, ?, ?)', {playerJob.name, xPlayer.get("firstName") .. " " .. xPlayer.get("lastName") .. " wsadził $" .. count .. " do sejfu", os.date("%H:%M %d.%m.%Y")})
    
    return Organizations[playerJob.name].account
end)

lib.callback.register("dbl_organizations:withdrawSafeMoney", function(source, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerJob = xPlayer.get("org")

    if not playerJob.permissions["safe"] then
        return
    end

    if Organizations[playerJob.name].account < count then
        return "money"
    end

    RemoveOrganizationMoney(playerJob.name, count)
    xPlayer.addAccountMoney("money", count)
    MySQL.insert.await('INSERT INTO `organizations_logs` (org, title, time) VALUES (?, ?, ?)', {playerJob.name, xPlayer.get("firstName") .. " " .. xPlayer.get("lastName") .. " wyciągnął $" .. count .. " z sejfu", os.date("%H:%M %d.%m.%Y")})
    
    return Organizations[playerJob.name].account
end)

local function GetMembers(name, cb)
    local members = {}
	local xPlayers = ESX.GetExtendedPlayers()
	for i=1, #(xPlayers) do
		local xPlayer = xPlayers[i]
        local job = xPlayer.get("org")
        if job.name == name then
            table.insert(members, {
                name = xPlayer.get('firstName') .. ' ' .. xPlayer.get('lastName'),
                identifier = xPlayer.identifier,
                job = job,
                online = true
            })
        end
    end

    MySQL.query("SELECT identifier, org_permissions, firstname, lastname FROM `users` WHERE `org`= ?", {name}, function(result)
        for i = 1, #(result) do
            local row = result[i]
			local alreadyInTable

            for j = 1, #(members) do
				if members[j].identifier == row.identifier then
					alreadyInTable = true
                    break
				end
			end

            if not alreadyInTable then
                table.insert(members, {
                    name = row.firstname .. ' ' .. row.lastname,
                    identifier = row.identifier,
                    job = {name = name, permissions = json.decode(row.org_permissions)},
                    online = false
                })
            end
        end
        
        cb(members)
    end)
end

ESX.RegisterServerCallback("dbl_organizations:GetTabletInfo", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.get("org")
    local callback = {
        identifier = xPlayer.identifier,
        name = Config.Organizations[job.name].label
    }

    callback.notes = MySQL.query.await('SELECT `text` FROM `organizations_notes` WHERE `org` = ?', {job.name})
    callback.money = Organizations[job.name].account
    GetMembers(job.name, function(members)
        callback.members = #members

        local membersOnline = 0
        local xPlayers = ESX.GetExtendedPlayers()
        local name = job.name
        for i=1, #(xPlayers) do
            local xPlayer = xPlayers[i]
            local org = xPlayer.get("org")
            if job.name == name then
                membersOnline = membersOnline + 1
            end
        end

        callback.membersOnline = membersOnline

        cb(callback)
    end)
end)

ESX.RegisterServerCallback("dbl_organizations:GetMembers", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.get("org")

    GetMembers(job.name, function(members)
        cb(members)
    end)
end)

ESX.RegisterServerCallback("dbl_organizations:GetLogs", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.get("org")

    MySQL.query("SELECT title, time FROM `organizations_logs` WHERE `org`= ? ORDER BY id DESC", {job.name}, function(result)
        cb(result)
    end)
end)

RegisterNetEvent("dbl_organizations:savePermissions", function(data)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)
    local playerJob = xPlayer.get("org")

    if not playerJob.permissions["permissionsManage"] then
        return
    end
    
    local xTarget = ESX.GetPlayerFromIdentifier(data.identifier)
    if xTarget then
        local targetJob = xTarget.get("org")
        if targetJob.name == playerJob.name then
            xTarget.set("org", {name = targetJob.name, permissions = data.permissions})
            TriggerClientEvent("esx:setOrg", xTarget.source, {name = targetJob.name, permissions = data.permissions})
        end
    end

    MySQL.prepare('UPDATE `users` SET `org_permissions` = ? WHERE `identifier` = ?', {json.encode(data.permissions), data.identifier})
end)

lib.callback.register("dbl_organizations:fireMember", function(source, identifier)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerJob = xPlayer.get("org")

    if not playerJob.permissions["fireMember"] then
        return
    end

    local xTarget = ESX.GetPlayerFromIdentifier(identifier)
    if xTarget then
        local targetJob = xTarget.get("org")
        if targetJob.name == playerJob.name then
            xTarget.set("org", {name = "unemployed", permissions = {}})
            TriggerClientEvent("esx:setOrg", xTarget.source, {name = "unemployed", permissions = {}})
        end
    end
    
    MySQL.prepare('UPDATE `users` SET `org` = ?, `org_permissions` = ? WHERE `identifier` = ?', {"unemployed", json.encode({}), identifier})
    
	local p = promise.new()
    GetMembers(playerJob.name, function(members)
        p:resolve(members)
    end)
    return Citizen.Await(p)
end)

lib.callback.register("dbl_organizations:hireMember", function(source, id)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerJob = xPlayer.get("org")

    if not playerJob.permissions["hireMembers"] then
        return
    end

    local xTarget = ESX.GetPlayerFromId(tonumber(id))

    if not xTarget then
        return
    end

    if xTarget.get("org").name == playerJob.name then
        return
    end

    local p = promise.new()
    GetMembers(playerJob.name, function(members)
        p:resolve(members)
    end)
    local members = Citizen.Await(p)
    if #members == Organizations[playerJob.name].members_limit then
        return xPlayer.showNotification("Nie możesz dodać więcej członków do tej organizacji!")
    end

    xTarget.set("org", {name = playerJob.name, permissions = {}})
    TriggerClientEvent("esx:setOrg", xTarget.source, {name = playerJob.name, permissions = {}})
    MySQL.prepare('UPDATE `users` SET `org` = ?, `org_permissions` = ? WHERE `identifier` = ?', {playerJob.name, json.encode({}), xTarget.identifier})

	local p = promise.new()
    GetMembers(playerJob.name, function(members)
        p:resolve(members)
    end)
    return Citizen.Await(p)
end)

lib.callback.register("dbl_organizations:buyUpgrade", function(source, data)
    if not data.type then
        return
    end

    if not data.count then
        return
    end

    data.count = tonumber(data.count)

    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.get("org")

    if not job.permissions["upgrades"] then
        return
    end

    local type = nil
    if data.type == "membersCount" then
        type = "members_limit"
    elseif data.type == "warehouseSlots" then
        type = "warehouse_slots"
    elseif data.type == "warehouseWeight" then
        type = "warehouse_weight"
    end

    data.price = (data.count * Config.UpgradesPrice[data.type])

    if Organizations[job.name].account < data.price then
        return xPlayer.showNotification("W sejfie nie ma wystarczającej ilości gotówki!")
    end

    RemoveOrganizationMoney(job.name, data.price)

    local title = ""
    if type == "members_limit" then
        Organizations[job.name][type] = Organizations[job.name][type] + data.count
        title = "ilość członków"
    elseif type == "warehouse_slots" then
        Organizations[job.name][type] = Organizations[job.name][type] + data.count
        exports.ox_inventory:SetSlotCount(job.name, Organizations[job.name][type])
        title = "ilość miejsc w schowku"
    elseif type == "warehouse_weight" then
        Organizations[job.name][type] = Organizations[job.name][type] + (data.count * 1000)
        exports.ox_inventory:SetMaxWeight(job.name, Organizations[job.name][type])
        title = "waga w schowku"
    end

    MySQL.prepare('UPDATE `organizations` SET `' .. type .. '` = ? WHERE `name` = ?', {Organizations[job.name][type], job.name})
    MySQL.insert.await('INSERT INTO `organizations_logs` (org, title, time) VALUES (?, ?, ?)', {job.name, xPlayer.get("firstName") .. " " .. xPlayer.get("lastName") .. " kupił ulepszenie: " .. title .. " w ilości: " .. data.count, os.date("%H:%M %d.%m.%Y")})

    return xPlayer.showNotification("Ulepszenie zostało nadane!")
end)

lib.callback.register("dbl_organizations:noteAdd", function(source, data)
    if not data.text then
        return
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.get("org")

    if not job.permissions["noteAdd"] then
        return
    end

    MySQL.insert.await('INSERT INTO `organizations_notes` (org, text) VALUES (?, ?)', {job.name, data.text})
    return xPlayer.showNotification("Notatka została dodana!")
end)

ESX.RegisterCommand('setorg', {'best', 'superadmin', 'admin'}, function(xPlayer, args, showError)
    if args.job == "unemployed" or Config.Organizations[args.job] then
        local permissions = {}
        for i = 1, #(Config.Permissions) do
            permissions[Config.Permissions[i].name] = true
        end

        args.playerId.set("org", {name = args.job, permissions = permissions})
        TriggerClientEvent("esx:setOrg", args.playerId.source, {name = args.job, permissions = permissions})
        MySQL.prepare('UPDATE `users` SET `org` = ?, `org_permissions` = ? WHERE `identifier` = ?', {args.job, json.encode(permissions), args.playerId.identifier})
    end
end, true, {help = ('ustaw prace organizacji dla gracza'), validate = true, arguments = {
    {name = 'playerId', help = ('id gracza'), type = 'player'},
    {name = 'job', help = ('nazwa organizacji'), type = 'string'}
}})

ESX.RegisterCommand('clearorg', {'best', 'superadmin', 'admin'}, function(xPlayer, args, showError)
    local orgName = args.orgName
    print(orgName)
    local xPlayers = ESX.GetExtendedPlayers()
    for i = 1, #(xPlayers) do
        local xPlayer = xPlayers[i]
        if xPlayer.get("org").name == orgName then
            xPlayer.set("org", {name = "unemployed", permissions = {}})
            TriggerClientEvent("esx:setOrg", xPlayer.source, {name = "unemployed", permissions = {}})
        end
    end
    
    MySQL.prepare('UPDATE `users` SET `org` = ?, `org_permissions` = ? WHERE `org` = ?', {"unemployed", json.encode({}), orgName})
    exports.ox_inventory:ClearInventory(orgName)
    exports.ox_inventory:SetSlotCount(orgName, Config.DefaultSlots)
    exports.ox_inventory:SetMaxWeight(orgName, Config.DefaultWeight)
    Organizations[orgName] = {account = 0, members_limit = Config.DefaultMembers, warehouse_slots = Config.DefaultSlots, warehouse_weight = Config.DefaultWeight} 
    MySQL.prepare('UPDATE `organizations` SET `account` = 0, `members_limit` = ?, `warehouse_slots` = ?, `warehouse_weight` = ? WHERE `name` = ?', {Config.DefaultMembers, Config.DefaultSlots, Config.DefaultWeight, orgName})
    MySQL.query.await('DELETE FROM `organizations_clothes` WHERE `org` = ?', {orgName})
    MySQL.query.await('DELETE FROM `organizations_logs` WHERE `org` = ?', {orgName})
    MySQL.query.await('DELETE FROM `organizations_notes` WHERE `org` = ?', {orgName})
end, true, {help = ('wyczyść organizacje'), validate = true, arguments = {
    {name = 'orgName', help = ('nazwa organizacji'), type = 'string'}
}})

ESX.RegisterServerCallback("dbl_organizations:getJob", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local result = MySQL.prepare.await("SELECT `org`, `org_permissions` FROM `users` WHERE identifier = ?", {xPlayer.identifier})
    local job = {name = result.org, permissions = json.decode(result.org_permissions)}

    xPlayer.set("org", job)
    cb(job)
end)

AddEventHandler('playerDropped', function(reason)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)
  
    if xPlayer then
        local job = xPlayer.get("org")
        MySQL.prepare('UPDATE `users` SET `org` = ?, `org_permissions` = ? WHERE `identifier` = ?', {job.name, json.encode(job.permissions), xPlayer.identifier})
    end
end)