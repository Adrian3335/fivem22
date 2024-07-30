Config = {}

Config.CanDelete = true

Config.WeatherSync = "vSync" -- "cd_easytime", "qb-weathersync", "vSync"
Config.Weather = 'CLEAR' -- weather type

Config.SelectFirstChar = true -- it will select first possible player character by first connection on the server

Config.UseCustomSkinCreator = false -- if you use esx_skin / fivem-appearance for character creator set it to false, if you use custom character creator set it to true and change in @vms_multichars/config/config_client.lua function openCharacterCreator(skin)
Config.RelogCommand = true -- @vms_multichars/config/config_client.lua:60

Config.UseCustomSpawnSelector = true --  @vms_multichars/config/config_client.lua function openSpawnSelector()

Config.ToLeft = vector3(912.74, 0.01, 110.28) -- This coords is on the Diamond Casino, if you didnt have build with this, its not works, you need to change the coords
Config.Spawn = vector4(915.43, -0.22, 110.28, 146.93) -- This coords is on the Diamond Casino, if you didnt have build with this, its not works, you need to change the coords
Config.FromRight = vector3(916.96, -2.41, 110.28) -- This coords is on the Diamond Casino, if you didnt have build with this, its not works, you need to change the coords
Config.CameraZHeight = 1.5 -- + 1.5

Config.SpawnLocation = vector3(190.24, -858.05, 30.5) -- here you can set the coordinates in which the player will spawn after creating a character ! IMPORTANT, if you use Config.UseCustomSkinCreator, it won't work, you need to set in charcreator e.g. vms_charcreator !

Config.ChangeCharacterPoint = {
	enable = false,
	coords = vector3(-1045.07, -2750.11, 21.36),
	marker = {
		id = 2, 
		rgba = {255, 215, 25, 100}, 
		size = vec(0.75, 0.75, 0.75), 
		rotate = true
	},
	blip = {
		sprite = 480, 
		color = 2, 
		scale = 1.0, 
		name = "Character Selector"
	},
}

Config.Notification = function(message, time, type)
   	if type == "success" then
		ESX.ShowNotification(message)

	elseif type == "error" then
		ESX.ShowNotification(message)

   	end
end

Config.Translate = {
	['cmd.help_identifier'] = "Player identifier (char1:1100068j5f92)",
	['cmd.help_identifier_only_numbers'] = "Player identifier (1100068j5f92)",

	['cmd.setslots'] = "Setting the available characters slots for a player",
	['cmd.help_slots'] = "Enter the number of characters slots the player is expected to have",
	['slots_added'] = "Set %s slots for player %s",
	['slots_edited'] = "You changed the slots to %s for player %s",

	['cmd.removeslots'] = "Removal of custom number of slots",
	['slots_removed'] = "Removed custom slot count for %s",

	['cmd.help_enablechar'] = "Re-enabling the character",
	['charenabled'] = "The character with the identifier %s has been enabled",
	['cmd.help_disablechar'] = "Temporary disabling of character",
	['chardisabled'] = "The character with the identifier %s has been temporarily disabled",
	['charnotfound'] = "The character with the identifier %s was not found!",

	['cmd.help_deletecharacter'] = "Permanent character removal",
	['cmd.success_deleted_character'] = "Successfully removed player character %s",
	
	['cmd.help_logout'] = "Logout",

	['cannot_remove_character'] = "You can't delete a character, for this purpose go to the administrator.", -- If you have Config.CanDelete on true, the player will receive this notification when trying to delete

	['male'] = "Male",
	['female'] = "Female",

	['helpnotification.change_character'] = "Press ~INPUT_CONTEXT~ to change the character",
}

Config.Default = {
	mom = 21,
	dad = 0,
	face_md_weight = 50,
	skin_md_weight = 50,
	nose_1 = 0,
	nose_2 = 0,
	nose_3 = 0,
	nose_4 = 0,
	nose_5 = 0,
	nose_6 = 0,
	cheeks_1 = 0,
	cheeks_2 = 0,
	cheeks_3 = 0,
	lip_thickness = 0,
	jaw_1 = 0,
	jaw_2 = 0,
	chin_1 = 0,
	chin_2 = 0,
	chin_13 = 0,
	chin_4 = 0,
	neck_thickness = 0,
	hair_1 = 0,
	hair_2 = 0,
	hair_color_1 = 0,
	hair_color_2 = 0,
	tshirt_1 = 0,
	tshirt_2 = 0,
	torso_1 = 0,
	torso_2 = 0,
	decals_1 = 0,
	decals_2 = 0,
	arms = 0,
	arms_2 = 0,
	pants_1 = 0,
	pants_2 = 0,
	shoes_1 = 0,
	shoes_2 = 0,
	mask_1 = 0,
	mask_2 = 0,
	bproof_1 = 0,
	bproof_2 = 0,
	chain_1 = 0,
	chain_2 = 0,
	helmet_1 = -1,
	helmet_2 = 0,
	glasses_1 = 0,
	glasses_2 = 0,
	watches_1 = -1,
	watches_2 = 0,
	bracelets_1 = -1,
	bracelets_2 = 0,
	bags_1 = 0,
	bags_2 = 0,
	eye_color = 0,
	eye_squint = 0,
	eyebrows_2 = 0,
	eyebrows_1 = 0,
	eyebrows_3 = 0,
	eyebrows_4 = 0,
	eyebrows_5 = 0,
	eyebrows_6 = 0,
	makeup_1 = 0,
	makeup_2 = 0,
	makeup_3 = 0,
	makeup_4 = 0,
	lipstick_1 = 0,
	lipstick_2 = 0,
	lipstick_3 = 0,
	lipstick_4 = 0,
	ears_1 = -1,
	ears_2 = 0,
	chest_1 = 0,
	chest_2 = 0,
	chest_3 = 0,
	bodyb_1 = -1,
	bodyb_2 = 0,
	bodyb_3 = -1,
	bodyb_4 = 0,
	age_1 = 0,
	age_2 = 0,
	blemishes_1 = 0,
	blemishes_2 = 0,
	blush_1 = 0,
	blush_2 = 0,
	blush_3 = 0,
	complexion_1 = 0,
	complexion_2 = 0,
	sun_1 = 0,
	sun_2 = 0,
	moles_1 = 0,
	moles_2 = 0,
	beard_1 = 0,
	beard_2 = 0,
	beard_3 = 0,
	beard_4 = 0
}