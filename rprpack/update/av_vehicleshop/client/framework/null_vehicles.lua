--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

-- This file is for people who have addon vehicles and haven't registered them in Fivem client side.
-- If you don't register your addon vehicles, they will be displayed as NULL.

local myAddonVehicles = {
    -- spawnName = is the code that you use to spawn the code (example: sultan)
    -- label = the vehicle model that will be displayed in game
    {spawnName = "gtr", label = "阿斯顿·马丁Cygnet"}, -- This is an example. copy/paste it and replace the values for every of your addon vehicles
    {spawnName = "gtrc", label = "宾利Brooklands"}, -- This is an example. copy/paste it and replace the values for every of your addon vehicles
}

CreateThread(function()
    for k, v in pairs(myAddonVehicles) do
	    AddTextEntry(v['spawnName'], v['label'])
    end
end)