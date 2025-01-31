config = {}

-- How much ofter the player position is updated ?
config.RefreshTime = 50

-- default sound format for interact
config.interact_sound_file = "ogg"

-- is emulator enabled ?
config.interact_sound_enable = true

-- how much close player has to be to the sound before starting updating position ?
config.distanceBeforeUpdatingPos = 40

-- Message list
config.Messages = {
    ["streamer_on"]  = "Streamer mode is on. From now you will not hear any music/sound.",
    ["streamer_off"] = "Streamer mode is off. From now you will be able to listen to music that players might play.",

    ["no_permission"] = "You cant use this command, you dont have permissions for it!",
}

-- Addon list
-- True/False enabled/disabled
config.AddonList = {
    gksphone = true,
}

-- Can hear sometimes music even if you're not around?
-- Try enable this testing feature that might solve the problem.
config.muteMusicTestFeature = false