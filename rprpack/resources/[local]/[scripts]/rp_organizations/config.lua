Config = {}
Config.DefaultSlots = 50
Config.DefaultWeight = 50000
Config.DefaultMembers = 10
Config.UpgradesPrice = {
    ["membersCount"] = 5000,
    ["warehouseSlots"] = 10000,
    ["warehouseWeight"] = 15000
}

Config.Permissions = {
    {
        name = "permissionsManage",
        label = "uprawnienia"
    },
    {
        name = "hireMembers",
        label = "zatrudnianie"
    },
    {
        name = "fireMember",
        label = "wyrzucanie"
    },
    {
        name = "upgrades",
        label = "ulepszenia"
    },
    {
        name = "noteAdd",
        label = "notatki"
    },
    {
        name = "safe",
        label = "sejf"
    },
    {
        name = "warehouse",
        label = "magazyn"
    },
    {
        name = "wardrobeOpen",
        label = "garderoba"
    },
    {
        name = "wardrobeAdd",
        label = "dodawanie ubrań"
    },
    {
        name = "wardrobeRemove",
        label = "usuwanie ubrań"
    }
}

Config.BlipsCircle = {
    {
        title = "Vagos",
        sprite = 9,
        coords = vec3(345.7749, -2049.4741, 20.6531),
        color = 46,
        display = 8,
        alpha = 120
    },
    {
        title = "Ballas",
        sprite = 9,
        coords = vec3(119.32, -1969.78, 21.33),
        color = 27,
        display = 8,
        alpha = 120
    },
    {
        title = "Lost",
        sprite = 9,
        coords = vec3(979.3651, -123.0585, 73.0996),
        color = 37,
        display = 8,
        alpha = 120
    },
    {
        title = "Famillies",
        sprite = 9,
        coords = vec3(-156.3082, -1615.2767, 32.6994),
        color = 69,
        display = 8,
        alpha = 120
    },
    {
        title = "Marabunta",
        sprite = 9,
        coords = vec3(1258.1376, -1570.7284, 57.4016),
        color = 63,
        display = 8,
        alpha = 120
    },
}



Config.Organizations = {
    -- HOODRP
    ["ballas"] = {
        label = "Ballas",
        owner = "char1:12",

        Blip = vec3(119.32, -1969.78, 21.33),
        Safe = {
            coords = vector3(119.32, -1969.78, 21.33),
            size = vector3(0.5, 0.5, 1.0),
            rotation = 318.0
        },
        Storage = {
            coords = vector3(120.77, -1969.02, 21.33),
            size = vector3(0.6, 0.6, 1.0),
            rotation = 318.0
        },
        Wardrobe = {
            coords = vector3(118.6514, -1965.9135, 21.3276),
            size = vector3(2.2, 0.6, 1.0),
            rotation = 230.0
        }
    },
    ["vagos"] = {
        label = "Vagos",
        owner = "char1:12",

        Blip = vec3(332.8076, -1989.1744, 23.2578),
        Safe = {
            coords = vector3(118.6514, -1965.9135, 21.3276),
            size = vector3( 2.2, 0.8, 1.0),
            rotation = 320.0
        },
        Storage = {
            coords = vector3(120.77, -1969.02, 21.33),
            size = vector3(0.6, 0.6, 1.0),
            rotation = 320.0
        },
        Wardrobe = {
            coords = vector3(118.6514, -1965.9135, 21.3276),
            size = vector3(2.2, 0.6, 2.0),
            rotation = 230.0
        }
    },
    ["families"] = {
        label = "Families",
        owner = "char1:12",

        Blip = vec3(-157.0381, -1616.7047, 32.6994),
        Safe = {
            coords = vector3(-163.93, -1619.61, 33.85),
            size = vector3(0.6, 0.6, 0.6),
            rotation = 340.0
        },
        Storage = {
            coords = vector3(-158.96, -1608.36, 33.65),
            size = vector3(2.2, 0.6, 2.0),
            rotation = 340.0
        },
        Wardrobe = {
            coords = vector3(-162.9, -1613.6, 33.65),
            size = vector3(2.8, 0.6, 2.0),
            rotation = 340.0
        }
    },
    ["lost"] = {
        label = "Lost",
        owner = "char1:12",

        Blip = vec3(974.3788, -119.4971, 73.3864),
        Safe = {
            coords = vector3(977.59, -104.65, 74.65),
            size = vector3(1.0, 0.8, 1.2),
            rotation = 310.0
        },
        Storage = {
            coords = vector3(987.35, -93.43, 74.85),
            size = vector3(0.8, 2.2, 2.0),
            rotation = 315.0
        },
        Wardrobe = {
            coords = vector3(972.17, -97.62, 74.87),
            size = vector3(0.4, 3.8, 2.0),
            rotation = 310.0
        }
    },
    ["marabunta"] = {
        label = "Marabunta",
        owner = "char1:12",

        Blip = vec3(1258.1376, -1570.7284, 57.4016),
        Safe = {
            coords = vector3(1251.25, -1580.72, 58.55),
            size = vector3(0.6, 0.6, 0.6),
            rotation = 305.0
        },
        Storage = {
            coords = vector3(1254.59, -1572.07, 58.75),
            size = vector3(1, 2.6, 2.0),
            rotation = 305.0
        },
        Wardrobe = {
            coords = vector3(1254.62, -1576.37, 58.15),
            size = vector3(0.6, 1.4, 1.0),
            rotation = 305.0
        }
    },
    ["cartel"] = {
        label = "De La Cosa",
        owner = "char1:12",

        Blip = vec3(1403.78, 1144.02, 114.33),
        Safe = {
            coords = vector3(1394.74, 1150.37, 115.33),
            size = vector3(0.8, 1.6, 2),
            rotation = 0.0
        },
        Storage = {
            coords = vector3(1403.78, 1144.02, 114.33),
            size = vector3(0.6, 3.0, 2.0),
            rotation = 0.0
        },
        Wardrobe = {
            coords = vector3(1400.4, 1139.73, 114.33),
            size = vector3(1.4, 0.6, 2.2),
            rotation = 0.0
        }
    },
    ["mafia"] = {
        label = "La Cosa Nostra",
        owner = "char1:12",

        Blip = vec3(-1474.8168, -37.0909, 56.9416),
        Safe = {
            coords = vector3(-1472.38, -57.69, 58.4),
            size = vector3(1.0, 1.6, 1),
            rotation = 310.0
        },
        Storage = {
            coords = vector3(-1474.47, -34.21, 57.89),
            size = vector3(0.6, 1.4, 2.0),
            rotation = 40.0
        },
        Wardrobe = {
            coords = vector3(-1466.2, -47.46, 58.67),
            size = vector3(0.8, 3.4, 2.2),
            rotation = 40.0
        }
    },
    ["sinister"] = {
        label = "The Sinister",
        owner = "char1:12",

        Blip = vector3(568.26, -2780.87, 6.09),
        Safe = {
            coords = vector3(519.56, -2757.89, 6.64),
            size = vector3(2.6, 1, 1),
            rotation = 330.0
        },
        Storage = {
            coords = vector3(506.36, -2756.69, 3.07),
            size = vector3(4.0, 1, 2.0),
            rotation = 330.0
        },
        Wardrobe = {
            coords = vector3(568.26, -2780.87, 6.09),
            size = vector3(3.0, 1, 2.2),
            rotation = 330.0
        }
    },
}

