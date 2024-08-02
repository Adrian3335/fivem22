Config = {}

Config.SecurityToken = 't6resz6879tfg+1azxc@AASD!asd!$f' ---- random text to avoid cheaters

Config.Blips = {
    {
        ["Label"] = "~r~#Dorywcza ~w~Dostawa",
        ["Coords"] = {["x"] = 1145.3842773438, ["y"] = -1000.0510864258, ["z"] = 45.293842315674, ["h"] = 77.117256164551},
        ["Sprite"] = 478,
        ["Display"] = 4,
        ["Scale"] = 0.8,
        ["Colour"] = 1
    },
}

Config.LegalDeliveriesNotify3D = 'W końcu już nie mogłem się tego doczekać!'
Config.LegalDeliveriesAsLabel = 'Podaj zamówienię'
Config.IllegalyDeliveriesLabel = 'Podaj'
Config.IllegalyDeliveriesNotify3D = 'W końcu już nie mogłem wytrzymać bez tego'
Config.FirstCustomer = 'Zaznaczono pierwszego klienta'
Config.NewCustomer = 'Zaznaczono kolejnego klienta'
Config.LastCustomer = 'Zaznaczono ostatniego klienta'
Config.EndDeliveries = 'Zakończono dostawę'
Config.CustomerBlipName = '#Klient'
Config.WrongItem = 'Nie posiadasz mojego zamówienia!'
Config.MachanieAnimDict = 'random@mugging5'
Config.MachanieAnim = '001445_01_gangintimidation_1_female_idle_b'
Config.SellAnimDict = 'mp_common'
Config.SellAnim = 'givetake1_a'
Config.AddMoneyFirst = 'Otrzymano'
Config.Valute = '$'
Config.Cash = 'gotówki'
Config.StartLegal = 'Rozpocznij legalną dostawę'
Config.StartIllegal = 'Rozpocznij nielegalną dostawę'
Config.UseEsxDispatch = true

Config.UseMeText = true
Config.IllegalyMeText = 'Wyciaga towar z kieszeni'
Config.LegalMeText = 'Wyciąga paczkę z plecaka'

Config.LegalAwardMax = 150
Config.LegalAwardMin = 70

Config.IllegalyAwardMax = 350
Config.IllegalyAwardMin = 150
Config.ItemsPrice = 350
Config.CantAffordItems = 'Nie masz wystarzcająco siana'

Config.LegalItem = 'deliveries_pack'
Config.IllegalItem = 'weed'

Config.DeliveryStarted = 'Rozpoczęto Dostawę'
Config.DeliveryAlreadyStarted = 'Już rozpoczęto dostawę'

Config.LegalMainNotify = 'Tylko nie zgub tych paczek!'
Config.IllegalMainNotify = 'Jak zgubisz ten towar to nie żyjesz!'



Config.LegalDeliveries = {

        Ped1 = {
            ped = {x = 996.767578125, y = -729.61376953125, z = 57.816005706787, h = 315.04067993164, ["hash"] = "s_m_o_busker_01"},
            blip = vector3(996.76, -729.61, 57.81),
        },
		Ped2 = {
            ped = {x = 930.64038085938, y = -245.01197814941, z = 69.002555847168, h = 223.33926391602, ["hash"] = "csb_hugh"},
            blip =  vector3(930.64038085938, -245.01197814941, 69.002555847168),
        },
		Ped3 = {
            ped = {x = 1389.0915527344, y = -569.46264648438, z = 74.496520996094, h = 115.71928405762, ["hash"] = "csb_jackhowitzer"},
            blip =  vector3(1389.0915527344, -569.46264648438, 74.496520996094),
        },
		Ped4 = {
            ped = {x = 1070.8614501953, y = -780.36291503906, z = 58.348644256592, h = 88.663963317871, ["hash"] = "csb_ortega"},
            blip =  vector3(1070.8614501953, -780.36291503906, 58.348644256592),
        },
		Ped5 = {
            ped = {x = 1006.4895019531, y = -510.84924316406, z = 60.992691040039, h = 120.69695281982, ["hash"] = "csb_porndudes"},
            blip =  vector3(1006.4895019531, -510.84924316406, 60.992691040039),
        },
}

Config.IllegalDeliveries = {

    Ped1 = {
        ped = {x = 1433.7556152344, y = 3628.4829101563, z = 35.745971679688, h = 204.02407836914, ["hash"] = "g_m_y_lost_01"},
        blip = vector3(1433.7556152344, 3628.4829101563, 35.745971679688),
    },
    Ped2 = {
        ped = {x = 1704.2158203125, y = 3845.9621582031, z = 34.932582855225, h = 251.56359863281, ["hash"] = "g_m_y_famfor_01"},
        blip =  vector3(1704.2158203125, 3845.9621582031, 34.932582855225),
    },
    Ped3 = {
        ped = {x = 1936.8937988281, y = 3269.8825683594, z = 45.671451568604, h = 197.23669433594, ["hash"] = "g_m_y_mexgoon_02"},
        blip =  vector3(1936.8937988281, 3269.8825683594, 45.671451568604),
    },
    Ped4 = {
        ped = {x = 1359.0122070313, y = 3614.3444824219, z = 34.887313842773, h = 27.461765289307, ["hash"] = "csb_sol"},
        blip =  vector3(1359.0122070313, 3614.3444824219, 34.887313842773),
    },
    Ped5 = {
        ped = {x = 1964.5183105469, y = 3818.7346191406, z = 32.39693069458, h = 302.64138793945, ["hash"] = "g_f_y_vagos_01"},
        blip =  vector3(1964.5183105469, 3818.7346191406, 32.39693069458),
    },
}

Config.PedsMain = {
    ['legal'] = {
        carSpawner = {
            ped = {x = 1144.7879638672, y = -999.92852783203, z = 45.313510894775, h = 278.32305908203, ["hash"] = "csb_avery"},
        },
    },
}

Config.PedsMain2 = {
    ['illegal'] = {
        carSpawner = {
            ped = {x = 1503.2802734375, y = 3574.5439453125, z = 35.4348487854, h = 303.47589111328, ["hash"] = "g_m_m_armboss_01"},
        },
    }
}
