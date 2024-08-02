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
    ['mechanic'] = true,
}

Config.ToggleMDT = {
    key = 'DELETE',
    commandName = 'mech_mdt',
    keymappingLabel = 'Otwórz tablet Mechanika'
}

Config.Tariff = {
    {
        label = 'Kat. 1',
        data = {
            {
                label = 'Cos np bandaze',
                fine = 12000,
                jail = 0
            },
        }
    },
    {
        label = 'Kat. 2',
        data = {
            {
                label = 'Napad na Kasetkę',
                fine = 25000,
                jail = 0
            },

        }
    },
    {
        label = 'Kat. 3',
        data = {
            {
                label = 'Porwanie',
                fine = 55000,
                jail = 0
            },
        }
    },
    {
        label = 'Kat. 4',
        data = {
            {
                label = 'Kradzież pojazdu',
                fine = 35000,
                jail = 0
            },
        }
    },
    {
        label = 'Kat. 5',
        data = {
            {
                label = 'Napaść',
                fine = 30000,
                jail = 0
            },
        }
    },
    {
        label = 'Kat. 6',
        data = {
            {
                label = 'Bezpodstawne użycie broni',
                fine = 30000,
                jail = 0
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
    'MARY',
    'BOY',
    'TASK'
}

Config.Vehicles = {
    '[ADAM] Crown Victoria 2011',
    '[ADAM] Dodge Charger 2014',
    '[ADAM] Chervrolet Caprice 2011',
    '[ADAM] Dodge Charger 2018',
    '[ADAM] Dodge Challenger',
    '[ADAM] Ford Mustang',
    '[MARY] Rower',
    '[MARY] Harley',
    '[MARY] Cross',
    '[MARY] Quad',
    '[BOY] GMC',
    '[BOY] Ford Explorer 2016',
    '[BOY] Chevrolet Silverado',
    '[BOY] Ford Explorer 2020',
    '[TASK] Autobus Transportowy'
}