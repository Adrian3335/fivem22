Config = {}

Config.Targets = {
    {
        coords = vec4(-267.5753, -739.3439, 34.4167, 61.0905),
        length = 3.6,
        width = 2.8,
        name = "freeproperty_enter",
        minZ=27.42,
        debugPoly = true,
        maxZ=31.42,
        options = {
            {
                event = "need_property:enter",
                icon = "fas fa-sign-in-alt",
                label = "Wejdź",
            },
        }
    },
    {
        coords = vector4(-277.8981, -733.5248, 113.6542, 73.3140),
        length = 1.0,
        width = 1.0,
        name = "freeproperty_exit",
        minZ = -160.1532,
        maxZ = -158.1532,
        options = {
            {
                event = "need_property:exit",
                icon = "fas fa-sign-out-alt",
                label = "Wyjdź",
            },
        }
    },
    {
        coords = vector4(-272.7209, -744.6517, 113.6612, 179.7815),
        length = 1.4,
        width = 1.0,
        name = "freeproperty_stash",
        minZ = -160.1532,
        maxZ = -158.1532,
        options = {
            {
                event = "need_property:stash",
                icon = "fas fa-box-open",
                label = "Otwórz szafkę",
            },
            {
                event = "need_property:getClothes",
                icon = "fas fa-shirt",
                label = "Przebierz się",
            },
            {
                event = "need_property:removeClothes",
                icon = "fas fa-shirt",
                label = "Usuń ubranie",
            },
            {
                event = "need_property:addClothes",
                icon = "fas fa-shirt",
                label = "Dodaj ubranie",
            },
        }
    },
}


Config.Enter = vector4(-277.0352, -733.8745, 113.6585, 258.3726)

Config.Exit = vector4(-266.9182, -739.9302, 34.4167, 239.0370)
