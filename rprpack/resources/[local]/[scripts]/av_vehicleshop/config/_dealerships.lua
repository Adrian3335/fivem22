--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

Config.Dealerships = {
    ['pdm_dealership'] = { -- dealership key index, should be unique for each dealership.
        job = false, -- Job ("string") or false
        garage = "Legion Square", -- Where the vehicle will be stored.
        money_account = "bank", -- Account used for purchase.
        money_sign = "$", -- For price display of the vehicle: $, €, £, ¥, etc... or leave it empty ""
        categories = {"compact", "coupe", "cycle", "motorcycle", "muscle", "offroad", "openwheel", "sedan", "service", "sport"}, -- Categories the dealership can sell.
        test_vehicles = true, -- False if you don't want players be able to test vehicles... prevent trolls from testing helicopters and crashing?.
        test_coords = {x = -12.65, y = -1088.88, z = 27.04, h = 156.6}, -- Where the test vehicle spawns.
        text_zones = { -- Zones where clients can access the catalogue.
            {x = -40.63, y = -1094.69, z = 27.27, distance = 2.0},
            {x = -38.56, y = -1100.12, z = 27.27, distance = 2.0},
            {x = -46.82, y = -1095.8, z = 27.27, distance = 2.0},
            {x = -51.38, y = -1094.86, z = 27.27, distance = 2.0},
            {x = -51.21, y = -1087.35, z = 27.27, distance = 2.0},
        },
        preview_vehicle_coords = {x = -1333.68, y = 144.24, z = -99.51, h = 268.77}, -- Spawn coords for vehicle preview (x, y, z, heading)
        preview_vehicle_camera = {x = -1333.94, y = 149.83, z = -99.19, rotation = 180.0, fov = 50.0}, -- Camera coords, rotation and field of view
        buy_vehicle = true, -- Enable/Disable the buy vehicle option... maybe you just want a dealership to display vehicles and not sell them?
        purchased_vehicle_spawn = {x = -33.82, y = -1080.45, z = 27.04, h = 68.2}, -- Where the vehicle/player will be spawned after purchased a vehicle.
        av_vip = false, -- True = If player has VIP the Buy Vehicle button will be enabled, false = you don't need VIP. Requires: https://av-scripts.tebex.io/package/4422968
        blip = {
            label = "Dealer Samochodów",
            icon = 227, -- https://docs.fivem.net/docs/game-references/blips/#blips
            color = 5, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
            scale = 0.7,
            coords = {x = -46.62, y = -1094.36, z = 27.3}
        }
    },
    
   
}