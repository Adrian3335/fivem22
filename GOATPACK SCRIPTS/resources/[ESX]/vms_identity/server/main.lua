local ESX = exports["es_extended"]:getSharedObject()
local playerIdentity = {}
local alreadyRegistered = {}

ESX.RegisterCommand('register', 'admin', function(xPlayer, args, showError)
    args.playerid.triggerEvent('vms_identity:showRegisterIdentity')
    xPlayer.triggerEvent('vms_multichars:notification', (Config.Translate['cmd.opened_register']):format(args.playerid), 5500, 'success')
end, true, {help = Config.Translate['cmd.help_register'], validate = true, arguments = {
	{name = 'playerid', help = Config.Translate['cmd.help_id'], type = 'player'},
}})

local function saveIdentityToDatabase(identifier, identity)
    MySQL.update.await('UPDATE users SET firstname = @f, lastname = @l, dateofbirth = @d, sex = @s, height = @h WHERE identifier = @i', {
        ['@f'] = identity.firstName, ['@l'] = identity.lastName, ['@d'] = identity.dateOfBirth, ['@s'] = identity.sex, ['@h'] = identity.height, ['@i'] = identifier
    })
end

local function checkDate(str)
    if string.match(str, '(%d%d)/(%d%d)/(%d%d%d%d)') ~= nil then
        local d, m, y = string.match(str, '(%d+)/(%d+)/(%d+)')
        m = tonumber(m)
        d = tonumber(d)
        y = tonumber(y)
        if ((d <= 0) or (d > 31)) or ((m <= 0) or (m > 12)) or ((y <= Config.LimitYear[1]) or (y > Config.LimitYear[2])) then
            return false
        elseif m == 4 or m == 6 or m == 9 or m == 11 then
            if d > 30 then
                return false
            else
                return true
            end
        elseif m == 2 then
            if y % 400 == 0 or (y % 100 ~= 0 and y % 4 == 0) then
                if d > 29 then
                    return false
                else
                    return true
                end
            else
                if d > 28 then
                    return false
                else
                    return true
                end
            end
        else
            if d > 31 then
                return false
            else
                return true
            end
        end
    else
        return false
    end
end

local function formatDate(str)
    local d, m, y = string.match(str, '(%d+)/(%d+)/(%d+)')
    return m.."/"..d.."/"..y
end

local function checkAlphanumeric(str)
    return (string.match(str, "%W"))
end

local function checkForNumbers(str)
    return (string.match(str, "%d"))
end

local function checkNameFormat(name)
    if not checkAlphanumeric(name) then
        if not checkForNumbers(name) then
            local stringLength = string.len(name)
            if stringLength > 0 and stringLength < Config.MaxNameLength then
                return true
            else
                return false
            end
        else
            return false
        end
    else
        return false
    end
end

local function checkDOBFormat(dob)
    local date = tostring(dob)
    if checkDate(date) then
        return true
    else
        return false
    end
end

local function checkSexFormat(sex)
    if sex == "m" or sex == "M" or sex == "f" or sex == "F" then
        return true
    else
        return false
    end
end

local function checkHeightFormat(height)
    local numHeight = tonumber(height)
    if numHeight < Config.LimitHeight[1] or numHeight > Config.LimitHeight[2] then
        return false
    else
        return true
    end
end

local function formatName(name)
    local loweredName = string.lower(name)
    local formattedName = loweredName:gsub("^%l", string.upper)
    return formattedName
end

ESX.RegisterServerCallback('vms_identity:registerIdentity', function(source, cb, data)
    local xPlayer = ESX.GetPlayerFromId(source)
	if not checkNameFormat(data.firstname) then
        return cb(Config.Translate['invalid_firstname'])
    end
    if not checkNameFormat(data.lastname) then
        return cb(Config.Translate['invalid_lastname'])
    end
    if not checkSexFormat(data.sex) then
        return cb(Config.Translate['invalid_sex'])
    end
    if not checkDOBFormat(data.dateofbirth) then
        return cb(Config.Translate['invalid_dob'])
    end
    if not checkHeightFormat(data.height) then
        return cb(Config.Translate['invalid_height'])
    end
    if xPlayer then
        if alreadyRegistered[xPlayer.identifier] then
            return cb(Config.Translate['already_registered'])
        end
        playerIdentity[xPlayer.identifier] = {
            firstName = formatName(data.firstname),
            lastName = formatName(data.lastname),
            dateOfBirth = formatDate(data.dateofbirth),
            sex = data.sex,
            height = data.height
        }
        local currentIdentity = playerIdentity[xPlayer.identifier]
        xPlayer.setName(('%s %s'):format(currentIdentity.firstName, currentIdentity.lastName))
        xPlayer.set('firstName', currentIdentity.firstName)
        xPlayer.set('lastName', currentIdentity.lastName)
        xPlayer.set('dateofbirth', currentIdentity.dateOfBirth)
        xPlayer.set('sex', currentIdentity.sex)
        xPlayer.set('height', currentIdentity.height)
        saveIdentityToDatabase(xPlayer.identifier, currentIdentity)
        alreadyRegistered[xPlayer.identifier] = true
        playerIdentity[xPlayer.identifier] = nil
    else
        TriggerEvent('esx_identity:completedRegistration', source, data)
    end
    cb(true)
end)

if not Config.Multichars then
    AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
        deferrals.defer()
        local playerId, identifier = source, ESX.GetIdentifier(source)
        Wait(40)
        MySQL.single('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = ?', {identifier}, function(result)
            if not result then
                playerIdentity[identifier] = nil
                alreadyRegistered[identifier] = false
                return deferrals.done()
            end
            if not result.firstname then
                playerIdentity[identifier] = nil
                alreadyRegistered[identifier] = false
                return deferrals.done()
            end
            playerIdentity[identifier] = {
                firstName = result.firstname,
                lastName = result.lastname,
                dateOfBirth = result.dateofbirth,
                sex = result.sex,
                height = result.height
            }
            alreadyRegistered[identifier] = true
            deferrals.done()
        end)
    end)


    RegisterNetEvent('esx:playerLoaded', function(playerId, xPlayer)
        local currentIdentity = playerIdentity[xPlayer.identifier]
        if currentIdentity and alreadyRegistered[xPlayer.identifier] then
            xPlayer.setName(('%s %s'):format(currentIdentity.firstName, currentIdentity.lastName))
            xPlayer.set('firstName', currentIdentity.firstName)
            xPlayer.set('lastName', currentIdentity.lastName)
            xPlayer.set('dateofbirth', currentIdentity.dateOfBirth)
            xPlayer.set('sex', currentIdentity.sex)
            xPlayer.set('height', currentIdentity.height)
            TriggerClientEvent('vms_identity:setPlayerData', xPlayer.source, currentIdentity)
            if currentIdentity.saveToDatabase then
                saveIdentityToDatabase(xPlayer.identifier, currentIdentity)
            end
            Wait(0)
            TriggerClientEvent('vms_identity:alreadyRegistered', xPlayer.source)
            playerIdentity[xPlayer.identifier] = nil
        else
            TriggerClientEvent('vms_identity:showRegisterIdentity', xPlayer.source)
        end
    end)
end