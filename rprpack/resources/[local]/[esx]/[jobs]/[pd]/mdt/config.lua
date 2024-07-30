Config = {}

Config.ESX = {
    enabled = true, --// if you are using esx, set it to true
    frameworkScript = 'es_extended',
    frameworkExport = 'getSharedObject'
}

Config.QB = {
    enabled = false, --// if you are using qb-core, set it to true
    frameworkScript = 'qb-core',
    frameworkExport = 'GetCoreObject'
}
--
--// if you are using other / custom framework, set both framework to false and edit framework functions in server/framework.lua and client/framework.lua

Config.Language = 'en'

Config.Jobs = {
    ['police'] = true,
}

Config.ToggleMDT = {
    key = 'DELETE',
    commandName = 'mdt',
    keymappingLabel = 'Otwórz tablet LSPD'
}

Config.Tariff = {
    {
        label = 'Wykroczenia drogowe i mandaty',
        data = {
            {
                label = 'Przekroczenie prędkości',
                fine = 1000,
                jail = 0
            },
            {
                label = 'Jazda bez prawa jazdy',
                fine = 500,
                jail = 0
            },
            {
                label = 'Niewłaściwe parkowanie',
                fine = 750,
                jail = 0
            },
            {
                label = 'Jazda pojazdem niezdatnym do ruchu',
                fine = 1500,
                jail = 0
            },
            {
                label = 'Przejazd na czerownym świetle',
                fine = 250,
                jail = 0
            },
            {
                label = 'Spowodowanie wypadku',
                fine = 1500,
                jail = 0
            },
            {
                label = 'Jazda niepoprawnym pasem ruchu',
                fine = 500,
                jail = 0
            },
            {
                label = 'Fałszywe wezwanie pomocy',
                fine = 3000,
                jail = 0
            },
        }
    },
    {
        label = 'Napady i rabunki',
        data = {
            {
                label = 'Napad na Kasetkę',
                fine = 7500,
                jail = 15
            },
            {
                label = 'Napad na Sejf',
                fine = 9000,
                jail = 20
            },
            {
                label = 'Napad na Ammu-Nation',
                fine = 10000,
                jail = 30
            },
            {
                label = 'Napad na Yacht',
                fine = 15000,
                jail = 40
            },
            {
                label = 'Napad na Jubilera',
                fine = 10000,
                jail = 30
            },
            {
                label = 'Napad na Fleeca Bank',
                fine = 12500,
                jail = 40
            },
            {
                label = 'Napad na Humane Labs',
                fine = 20000,
                jail = 50
            },
            {
                label = 'Napad na Magazyn',
                fine = 20000,
                jail = 40
            },
            {
                label = 'Napad na Zbrojownię',
                fine = 20000,
                jail = 40
            },
            {
                label = 'Napad na Pacific Bank',
                fine = 25000,
                jail = 60
            },
            {
                label = 'Napad na Bazę Wojskową',
                fine = 25000,
                jail = 50
            },
            {
                label = 'Rabunek Grouppe6',
                fine = 15000,
                jail = 20
            },
        }
    },
    {
        label = 'Porwania',
        data = {
            {
                label = 'Porwanie',
                fine = 2500,
                jail = 20
            },
            {
                label = 'Porwanie funkcjonariusza publicznego',
                fine = 5000,
                jail = 25
            },
        }
    },
    {
        label = 'Kradzieże i włamania',
        data = {
            {
                label = 'Kradzież pojazdu',
                fine = 1500,
                jail = 5
            },
            {
                label = 'Kradzież radiowozu',
                fine = 3000,
                jail = 15
            },
            {
                label = 'Kradzież pojazdu z nadajnikiem',
                fine = 3000,
                jail = 20
            },
            {
                label = 'Kradzież mienia z napaścią',
                fine = 3500,
                jail = 25
            },
            {
                label = 'Włamanie na teren prywatny',
                fine = 2750,
                jail = 20
            },
        }
    },
    {
        label = 'Przemoc',
        data = {
            {
                label = 'Napaść',
                fine = 1500,
                jail = 10
            },
            {
                label = 'Napaść na funkcjonariusza publicznego',
                fine = 2000,
                jail = 15
            },
            {
                label = 'Usiłowanie zabójstwa',
                fine = 2000,
                jail = 15
            },
            {
                label = 'Usiłowanie zabójstwa funkcjonariusza',
                fine = 2500,
                jail = 20
            },
        }
    },
    {
        label = 'Broń',
        data = {
            {
                label = 'Bezpodstawne użycie broni',
                fine = 2000,
                jail = 10
            },
            {
                label = 'Posiadanie nielegalnej broni krótkiej',
                fine = 25000,
                jail = 15
            },
            {
                label = 'Posiadanie nielegalnej broni długiej',
                fine = 4000,
                jail = 35
            },
            {
                label = 'Posiadanie broni policyjnej',
                fine = 2500,
                jail = 15
            },
            {
                label = 'Posiadanie policyjnej broni długiej',
                fine = 6000,
                jail = 45
            },
            {
                label = 'Handel bronią krótką',
                fine = 5000,
                jail = 20
            },
            {
                label = 'Handel bronią długą',
                fine = 8000,
                jail = 40
            },
            {
                label = 'Groźby z użyciem broni',
                fine = 1500,
                jail = 10
            },
        }
    },
    {
        label = 'Narkotyki',
        data = {
            {
                label = 'Posiadanie Marihuany',
                fine = 2500,
                jail = 10
            },
            {
                label = 'Posiadanie Metamfetaminy',
                fine = 3000,
                jail = 15
            },
            {
                label = 'Posiadanie Kokainy',
                fine = 3000,
                jail = 15
            },
            {
                label = 'Handel narkotykami twardymi',
                fine = 4500,
                jail = 25
            },
            {
                label = 'Handel narkotykami miękkimi',
                fine = 4000,
                jail = 20
            },
        }
    },
    {
        label = 'Wykroczenia',
        data = {
            {
                label = 'Obraza funkcjonariusza',
                fine = 1000,
                jail = 0
            },
            {
                label = 'Nagminne obrazy funkcjonariusza',
                fine = 1500,
                jail = 5
            },
            {
                label = 'Niewykonywanie poleceń funkcjonariusza',
                fine = 1000,
                jail = 10
            },
            {
                label = 'Utrudnianie pracy służbom porządkowym',
                fine = 1500,
                jail = 15
            },
            {
                label = 'Ucieczka przed LSPD',
                fine = 1000,
                jail = 25
            },
        }
    },
    {
        label = 'Inne',
        data = {
            {
                label = 'Pomoc w ucieczce',
                fine = 1500,
                jail = 15
            },
            {
                label = 'Pomoc w ucieczce z konwoju',
                fine = 2000,
                jail = 25
            },
            {
                label = 'Groźby karalne',
                fine = 1500,
                jail = 5
            },
            {
                label = 'Składanie fałszywych zeznań',
                fine = 2000,
                jail = 10
            },
            {
                label = 'Współudział w przestępstwie',
                fine = 1000,
                jail = 10
            },
            {
                label = 'Prowadzenie zorganizowanej grupy przestępczej',
                fine = 5000,
                jail = 30
            },
            {
                label = 'Przynależność do zorganizowanej grupy przestępczej',
                fine = 2500,
                jail = 15
            },
            {
                label = 'Zdrada Stanu',
                fine = 12500,
                jail = 50
            },
            {
                label = 'Terroryzm',
                fine = 25000,
                jail = 100
            },
        }
    }
}

Config.CityStatuses = {
    {
        label = 'Zielony',
        color = "#92FF3C",
        textColor = 'black'
    },
    {
        label = 'Pomarańczowy',
        color = '#fc6f03',
        textColor = 'black'
    },
    {
        label = 'Czerwony',
        color = '#FF0000',
        textColor = 'black'
    },
    {
        label = 'Czarny',
        color = '#000000',
        textColor = 'white'
    },
}

Config.Units = {
    'ADAM',
    'MARRY',
    'OFFROAD',
    'EDWARD',
    'TASK',
    'AIAD',
}

Config.Vehicles = {
    '[ADAM] Victoria',
    '[ADAM] Charger',
    '[ADAM] Torence',
    '[ADAM] Buffalo',
    '[ADAM] Torrence',
    '[MARRY] Motor',
    '[OFFROAD] Exploler',
    '[OFFROAD] Granger',
    '[OFFROAD] Scout',
    '[OFFROAD] Mustang',
    '[EDWARD] Vigero',
    '[EDWARD] Vigero2',
    '[EDWARD] Viper',
    '[EDWARD] Challanger',
    '[EDWARD] Camaro',
    '[TASK] Wiezniarka',
    '[AIAD] Fugitive Unmarked',
    '[AIAD] Oracle Unmarked'
}