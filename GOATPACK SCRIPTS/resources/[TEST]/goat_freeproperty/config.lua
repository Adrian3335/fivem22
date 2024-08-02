Config = {}

Config.Targets = {
    {
        coords = vec4(-70.4848, 141.7439, 81.8580, 218.3441),
        length = 3.6,
        width = 2.8,
        name = "freeproperty_enter",
        minZ=27.42,
        debugPoly = true,
        maxZ=31.42,
        options = {
            {
                event = "goat_property:enter",
                icon = "fas fa-sign-in-alt",
                label = "Wejdź",
            },
        }
    },
    {
        coords = vector4(354.6639, -150.9913, 73.6479, 5.9691),
        length = 1.0,
        width = 1.0,
        name = "freeproperty_exit",
        minZ = -160.1532,
        maxZ = -158.1532,
        options = {
            {
                event = "goat_property:exit",
                icon = "fas fa-sign-out-alt",
                label = "Wyjdź",
            },
        }
    },
    {
        coords = vector4(359.4730, -157.1031, 73.6479, 266.1617),
        length = 1.4,
        width = 1.0,
        name = "freeproperty_stash",
        minZ = -160.1532,
        maxZ = -158.1532,
        options = {
            {
                event = "goat_property:stash",
                icon = "fas fa-box-open",
                label = "Otwórz szafkę",
            },
            {
                event = "illenium-appearance:client:openClothingShopMenu",
                icon = "fas fa-shirt",
                label = "Przebierz się",
            },
                   }
    },
}


Config.Enter = vector4(354.6639, -150.9913, 73.6479, 5.9691)

Config.Exit = vector4(-70.4848, 141.7439, 81.8580, 218.3441)
