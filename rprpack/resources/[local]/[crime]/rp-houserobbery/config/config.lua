Config = {
    
    ESX = {
        enable = true,
        trigger = "esx:getSharedObject"
    },

    Lockpick_Item = "lockpick",

    rprogress = true,

    Police = {
        job = "police",
        house_robbery = 1
    },

    Tempo = 20

}

Config.Marker = {
    lester = {
        id = 20,
        key = 'E',
        distance = 5,
        colour = { r = 209, b = 255, g = 20 },
        scale = vector3(0.5,0.5,0.5)
    },
    house_robbery = {
        id = 20,
        key = 'E',
        distance = 5,
        colour = { r = 209, b = 255, g = 20 },
        scale = vector3(0.5,0.5,0.5)
    }
}

Config.House = { 
    [1] = { x = -762.07550048828, y = 430.88497924805, z = 100.19686889648 },
    [2] = { x = -1405.4432373047, y = 526.73651123047, z = 123.83127593994 },
    [3] = { x = -1828.2795410156, y = 311.75357055664, z = 89.71174621582 },
    [4] = { x = -1019.3823852539, y = 719.32873535156, z = 163.99633789063 },
    [5] = { x = -1056.3074951172, y = 761.43280029297, z = 167.31596374512 },
    [6] = { x = -999.56268310547, y = 816.92211914063, z = 173.04965209961 },
    [7] = { x = -912.43334960938, y = 777.05603027344, z = 187.10447692871 },
    [8] = { x = -559.67620849609, y = 664.51953125, z = 145.4868927002 },
    [9] = { x = -580.41497802734, y = 491.47445678711, z = 108.90292358398 },
    [10] = { x = -595.76190185547, y = 393.05990600586, z = 101.88256835938 }
} 

Config.Lester = {
    marker = { x = 1275.2830810547, y = -1710.6309814453, z = 54.771480560303 },
    ped = { x = 1275.7313232422, y = -1710.3173828125, z = 53.771446228027, h = 120.0, id = 0xB594F5C3 }
}

Config.OggettidaTrovare = {
    [1] = {id = "money", label = 'Gotówka', quantity = math.random(1300, 2500), chance = 5},
    [2] = {id = "black_money", label = 'Brudne pieniądze', quantity = math.random(1300, 4500), chance = 10},
    [3] = {id = "null", chance = 40}
}


Lang = {
    ["lester"] = "Naciśnij [~r~E~w~], aby porozmawiać z Lesterem",
    ["house"] = "Naciśnij [~r~E~w~], aby obrabować dom!",
    ["esci_rapina"] = "Naciśnij [~r~E~w~], aby opuścić dom!",
    ["blip_lester"] = "Lester",
    ["rapinaon"] = "Już rozpocząłeś włamanie!",
    ["police"] = "Za mało policji, spróbuj ponownie później!",
    ["veicolo"] = "Musisz opuścić pojazd, aby wejść do domu!",
    ["progressbar"] = "Przygotowuję napad",
    ["house_blip"] = "Dom do obrabowania",
    ["start_robbery"] = "Lester znalazł dla ciebie dom do obrabowania! Sprawdź nawigację GPS",
    ["lockpick"] = "Musisz mieć wytrych, aby włamać się do domu!",
    ["scassinando"] = "Włamywanie się do zamka",
    ["door_broke"] = "Włamałeś się do domu, przeszedłeś przez drzwi!",
    ["rapinaoff"] = "Już włamałeś się do tego domu!",
    ["cercaoff"] = "Już przeszukałeś to miejsce!",
    ["cercandon"] = "Przeszukiwanie",
    ["allerta"] = "Poruszaj się ostrożnie, aby nie zwracać uwagi policjantów",
    ["allerta1"] = "Zostałeś wykryty przez policję! UWAŻAJ!!!",
    ["allerta2"] = "Włączono alarm włamania! Udaj się do oznaczonego miejsca na GPS!",
    ["null"] = "Nic nie znalazłeś! :(",
    ["aspetta"] = "Ostatnio rozpocząłeś włamanie do domu, poczekaj zanim zaczniesz kolejne!"
}