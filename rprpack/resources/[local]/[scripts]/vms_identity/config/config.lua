Config                  = {}

Config.MaxNameLength = 20 -- Max Name Length.
Config.LimitHeight = {120, 220} -- minimum and maximum
Config.LimitYear = {1900, 2010} -- minimum and maximum

Config.EnableBlur = true

Config.Multichars = true
Config.UseCustomSkinCreator = false -- If you want this you must set Config.Multichars = false 

Config.Notification = function(title, message, type)
	if type == "success" then
		ESX.ShowNotification(message)
		
	elseif type == "error" then
		ESX.ShowNotification(message)
		
	elseif type == "info" then
		ESX.ShowNotification(message)
		
	end
end

Config.Translate = {
	['cmd.opened_register'] = 'Successfully opened register menu for player %s',
	['cmd.help_id'] = 'id',
	['cmd.help_register'] = 'Open a register menu for a player',

	['register_notify'] = 'Register',
  	['register_success'] = 'Registration successful!',
  	['already_registered'] = 'You have already registered character.',
  	['invalid_firstname'] = 'Invalid format of <b>First Name</b>.',
  	['invalid_lastname'] = 'Invalid format of <b>Last Name</b>.',
  	['invalid_sex'] = 'Invalid format of <b>Sex</b>.',
  	['invalid_dob'] = 'Invalid format of <b>DOB</b>.',
  	['invalid_height'] = 'Invalid format of <b>Height</b>.',
}