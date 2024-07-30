--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

Config = {
    Framework = "ESX", -- QBCore, ESX, Other... For other frameworks make sure to replace all the Framework functions first.
    --AdminCommand = "vehicleshop", -- Command used to open the admin panel and modify vehicles
    AdminRank = "admin", -- Permission needed to open adminpanel, check the docs > vehicleshop > permissions if it says you aren't admin!
    Categories = {}, -- Don't edit/remove this.
    AVTuning = false, -- True if you are running my tuning script https://av-scripts.tebex.io/package/5365050
    DriveTestTime = 1, -- Time (in minutes) for vehicle drive test.
    VehicleTestPlates = "TEST", -- Plates used for vehicle drive test (max 8 characters).
    Text3D = true, -- false if you don't want 3D text, make sure to follow the docs for adding zones.
    SpeedUnit = "mph", -- "mph" or "kph" (miles or kilometers)
    OldTimer = false -- true/false use old timer, if you have ox_lib change it to false (client/framework.lua line 77) and uncomment the ox_lib import from fxmanifest.lua
}