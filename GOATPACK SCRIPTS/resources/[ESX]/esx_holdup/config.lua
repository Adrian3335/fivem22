Config = {}

Config.MaxDistance = 10.0
Config.TimerBeforeNewRob = 1800
Config.TimeInside = 150 -- 2.5 minuty
Config.NeedCops = 0
Config.HackItem = {
    name = "dysk",
    label = "Dysk z danymi",
}

Config.Banks = {
    ["fleeca_1"] = {
        bank = "fleeca_1",
        doorsID = 54,
    -- Ogólne
        doors = vec3(147.95, -1044.65, 29.36),
        label = "Bank Fleeca",
        doorHeading = {200.0, 200.0},
        wozki = {
            { coords = vec3(150.03, -1045.11, 29.36 - 1), heading = 162.68, loot = false },
            { coords = vec3(151.06, -1046.72, 29.36 - 1), heading = 71.48, loot = false },
        },
    -- Hackowanie Drzwi Od Sejfu
        pos = vec3(146.74, -1046.28, 29.37),
        length = 0.4,
        width = 0.2,
        name = "hack_fleeca_1",
        heading = 161.0,
        minZ = 29.28,
        maxZ = 29.88,
    -- Hackowanie Drzwi w Sejfie
        pos2 = vec3(148.47, -1046.61, 29.35),
        length2 = 0.4,
        width2 = 0.2,
        name2 = "hack2_flecca_1",
        heading2 = 160.0,
        minZ2 = 29.28,
        maxZ2 = 29.88,
    -- Zbieranie kasy z wózka
        pos3 = vec3(149.677414, -1050.602539, 28.368906),
        length3 = 1.4,
        width3 = 1.2,
        name3 = "grab_flecca_1",
        heading3 = 100.0,
        minZ3 = 27.28,
        maxZ3 = 29.98,
    },
    -- ["fleeca_2"] = {
    --     bank = "fleeca_2",
    --     -- Ogólne
    --     doors = vec3(312.358002, -282.730103, 54.303646),
    --     label = "Bank Fleeca",
    --     doorHeading = {200.0, 200.0},
    --     wozki = {
    --         { coords = vec3(314.07006835938, -283.39105224609, 54.164714813232 - 1), heading = 158.53, loot = false },
    --         { coords = vec3(315.38592529297, -285.00067138672, 54.164714813232 - 1), heading = 69.86, loot = false },
    --     },
    -- -- Hackowanie Drzwi Od Sejfu
    --     pos = vec3(311.07, -284.69, 54.16),
    --     length = 0.4,
    --     width = 0.2,
    --     name = "hack_fleeca_2",
    --     heading = 340.0,
    --     minZ = 54.07,
    --     maxZ = 54.67,
    -- },
    ["fleeca_3"] = {
        bank = "fleeca_3",
        doorsID = 59,
    -- Ogólne
        doors = vec3(-1211.260864, -334.559601, 37.919891),
        label = "Bank Fleeca",
        doorHeading = {247.0, 247.0},
        wozki = {
            { coords = vec3(-1209.7725830078, -333.6940612793, 37.780948638916 - 1), heading = 211.32109069824, loot = false },
            { coords = vec3(-1207.5013427734, -333.7805480957, 37.780975341797 - 1), heading = 117.65316009521, loot = false },
        },
    -- Hackowanie Drzwi Od Sejfu
        pos = vec3(-1210.69, -336.87, 37.78),
        length = 0.2,
        width = 0.4,
        name = "hack_fleeca_3",
        heading = 295.0,
        minZ = 37.69,
        maxZ = 38.29,
    -- Hackowanie Drzwi w Sejfie
        pos2 = vec3(-1209.27, -335.83, 37.78),
        length2 = 0.2,
        width2 = 0.4,
        name2 = "hack2_flecca_3",
        heading2 = 296.0,
        minZ2 = 37.69,
        maxZ2 = 38.29,
    -- Zbieranie kasy z wózka
        pos3 = vec3(-1205.57, -337.61, 37.78),
        length3 = 1.0,
        width3 = 1.0,
        name3 = "grab_flecca_3",
        heading3 = 332.0,
        minZ3 = 36.69,
        maxZ3 = 38.29,
    },













    -- ["fleeca_4"] = {
    --     bank = "fleeca_2",
    --     -- Ogólne
    --     doors = vec3(-2958.538574, 482.270569, 15.835944),
    --     label = "Bank Fleeca",
    --     doorHeading = {358.0, 358.0},
    --     wozki = {
    --         { coords = vec3(-2958.54, 484.10, 15.67 - 1), heading = 265.43, loot = false },
    --         { coords = vec3(-2957.38, 485.81, 15.67 - 1), heading = 182.02, loot = false },
    --     },
    -- -- Hackowanie Drzwi Od Sejfu
    --     pos = vec3(),
    --     length = ,
    --     width = ,
    --     name = "hack_fleeca_4",
    --     heading = ,
    --     minZ = ,
    --     maxZ = ,
    -- },
}
-- minZ = -00.09
-- minZ = +00.51

Trolly = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s'
    },
    ['animations'] = {
        {'intro', 'bag_intro'},
        {'grab', 'bag_grab', 'cart_cash_dissapear'},
        {'exit', 'bag_exit'}
    },
    ['scenes'] = {}
}