-- THIS COMMAND IS FOR USE ONLY THROUGH THE CONSOLE OR THROUGH THE TEBEX API
RegisterCommand("addslots", function(source, args)
    if (source == 0) then
		local formatIdentifier = Config.Identifier == 'license' and string.gsub(args[1], "license:", "") or Config.Identifier == 'steam' and string.gsub(args[1], "steam:", "")
		MySQL.Async.fetchAll('SELECT slots FROM multichars_slots WHERE identifier = ?', {formatIdentifier}, function(result)
			if result[1] then
				MySQL.update('UPDATE `multichars_slots` SET `slots` = ? WHERE `identifier` = ?', {result[1].slots + tonumber(args[2]), formatIdentifier})
			else
				MySQL.update('INSERT INTO `multichars_slots` (`identifier`, `slots`) VALUES (?, ?)', {formatIdentifier, Config.Slots + tonumber(args[2])})
			end
		end)
    end
end, false)

-- ADMIN COMMANDS

ESX.RegisterCommand('deletecharacter', 'admin', function(xPlayer, args, showError)
    MySQL.update("DELETE FROM `users` WHERE identifier = ?", {args.identifier})
    MySQL.update("DELETE FROM `owned_vehicles` WHERE owner = ?", {args.identifier})
    MySQL.update("DELETE FROM `user_licenses` WHERE owner = ?", {args.identifier})
    MySQL.update("DELETE FROM `datastore_data` WHERE owner = ?", {args.identifier})
    -- Here you can add more tables that you want it to delete when deleting a character.
    
    xPlayer.triggerEvent('vms_multichars:notification', (Config.Translate['cmd.success_deleted_character']):format(args.identifier), 5500, 'success')
end, true, {help = Config.Translate['cmd.help_deletecharacter'], validate = true, arguments = {
	{name = 'identifier', help = Config.Translate['cmd.help_identifier'], type = 'string'},
}})

ESX.RegisterCommand('setslots', 'admin', function(xPlayer, args, showError)
	MySQL.Async.fetchAll('SELECT slots FROM multichars_slots WHERE identifier = ?', {args.identifier}, function(result)
		if result[1] then
			MySQL.update('UPDATE `multichars_slots` SET `slots` = ? WHERE `identifier` = ?', {args.slots, args.identifier})
			xPlayer.triggerEvent('vms_multichars:notification', (Config.Translate['slots_edited']):format(args.slots, args.identifier), 5500, 'success')
		else
			MySQL.update('INSERT INTO `multichars_slots` (`identifier`, `slots`) VALUES (?, ?)', {args.identifier, args.slots})
			xPlayer.triggerEvent('vms_multichars:notification', (Config.Translate['slots_added']):format(args.slots, args.identifier), 5500, 'success')
		end
	end)
end, true, {help = Config.Translate['cmd.setslots'], validate = true, arguments = {
	{name = 'identifier', help = Config.Translate['cmd.help_identifier_only_numbers'], type = 'string'},
	{name = 'slots', help = Config.Translate['cmd.help_slots'], type = 'number'}
}})

ESX.RegisterCommand('removeslots', 'admin', function(xPlayer, args, showError)
	MySQL.Async.fetchAll('SELECT slots FROM multichars_slots WHERE identifier = ?', {args.identifier}, function(result)
		if result[1] then
			MySQL.update('DELETE FROM `multichars_slots` WHERE `identifier` = ?', {args.identifier})
			xPlayer.triggerEvent('vms_multichars:notification', (Config.Translate['slots_removed']):format(args.identifier), 5500, 'success')
		end
	end)
end, true, {help = Config.Translate['cmd.removeslots'], validate = true, arguments = {
	{name = 'identifier', help = Config.Translate['cmd.help_identifier_only_numbers'], type = 'string'}
}})

ESX.RegisterCommand('enablechar', 'admin', function(xPlayer, args, showError)
	MySQL.update('UPDATE `users` SET `disabled` = 0 WHERE identifier = ?', {args.identifier}, function(result)
		if result > 0 then
			xPlayer.triggerEvent('vms_multichars:notification', Config.Translate['charenabled']:format(args.identifier), 5500, 'success')
		else
			xPlayer.triggerEvent('vms_multichars:notification', Config.Translate['charnotfound']:format(args.identifier), 5500, 'error')
		end
	end)
end, true, {help = Config.Translate['cmd.help_enablechar'], validate = true, arguments = {
	{name = 'identifier', help = Config.Translate['cmd.help_identifier'], type = 'string'},
}})

ESX.RegisterCommand('disablechar', 'admin', function(xPlayer, args, showError)
	MySQL.update('UPDATE `users` SET `disabled` = 1 WHERE identifier = ?', {args.identifier}, function(result)
		if result > 0 then
			xPlayer.triggerEvent('vms_multichars:notification', Config.Translate['chardisabled']:format(args.identifier), 5500, 'success')
		else
			xPlayer.triggerEvent('vms_multichars:notification', Config.Translate['charnotfound']:format(args.identifier), 5500, 'error')
		end
	end)
end, true, {help = Config.Translate['cmd.help_disablechar'], validate = true, arguments = {
	{name = 'identifier', help = Config.Translate['cmd.help_identifier'], type = 'string'},
}})