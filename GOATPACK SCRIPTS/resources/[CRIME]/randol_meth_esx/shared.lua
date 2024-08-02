ESX = exports["es_extended"]:getSharedObject()

Config = {
    ProductionInterval = 2000, -- i put 5 seconds between each minigame cycle.
    UseOxRadial = true, -- if false, will call for qb-radialmenu
    Minigames = { -- percentage based and rounded to the nearest threshold.
        [0] = { circles = 1, speed = 10, },
        [10] = { circles = 1, speed = 20, },
        [20] = { circles = 2, speed = 30, },
        [30] = { circles = 2, speed = 30, },
        [40] = { circles = 2, speed = 30, },
        [50] = { circles = 2, speed = 40, },
        [60] = { circles = 3, speed = 45, },
        [70] = { circles = 3, speed = 55, },
        [80] = { circles = 3, speed = 60, },
        [90] = { circles = 3, speed = 80, },
    },
}