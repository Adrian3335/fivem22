name = GetCurrentResourceName()
cfg = {}

cfg.info = {
    blips = {
        {
            pos = vec3(-546.6232, -122.0138, 51.9871),
            sprite = 60,
            colour = 3,
            name = "LSPD"
        },
		
    },
}

cfg.bell = 5*60*1000 -- co ile mozna uzywac dzwonka

cfg.gps = {
    ['police'] = {
        ['colors'] = {
            ['free'] = 38,
            ['inWay'] = 39,
            ['inService'] = 40,
        },
        ['numbers'] = {}
    },
    ['ambulance'] = {
        ['colors'] = {
            ['free'] = 1,
            ['inWay'] = 35,
            ['inService'] = 19,
        },
        ['numbers'] = {}
    },
	['lssd'] = {
        ['colors'] = {
            ['free'] = 38,
            ['inWay'] = 39,
            ['inService'] = 40,
        },
        ['numbers'] = {}
    },
}

cfg.peds = {

}

cfg.zones = {
    ['bell'] = {
        name = 'fumoPolice:bell',
        pos = vec3(441.7097, -981.5314, 30.0451),
        radius = 0.5,
		debugPoly = true,
        distance = 1.5,
        options = {
            {
                event = "fumoPolice:bell",
                icon = "fa-solid fa-bell",
                label = "Wezwij policjantów",
            },
        }
    },
    ['armory2'] = {
        name = 'fumoPolice:armory2',
        pos = vec3(-549.0841, -113.8006, 37.8657),
        radius = 1.0,
        distance = 1.5,
        options = {
            {
                event = "fumoPolice:armory2",
                icon = "fa-solid fa-gun",
                label = "Otwórz zbrojownie",
                job = "police"
            },
        }
    },
    ['evidence'] = {
        name = 'fumoPolice:evidence',
        pos = vec3(-545.9015, -110.8816, 37.8657),
        radius = 1.0,
        distance = 1.5,
        options = {
            {
                event = "fumoPolice:evidence",
                icon = "fa-solid fa-folder-open",
                label = "Otwórz dowody",
                job = "police"
            },
        }
    },
    ['cloakroom'] = {
        name = 'fumoPolice:uniform',
        pos = vec3(-539.3540, -130.0792, 39.3523),
        radius = 1.5,
        distance = 2.5,
        options = {
            {
                event = "fumoPolice:uniform",
                icon = "fa-solid fa-door-open",
                label = "Otwórz szafkę",
                job = "police"
            },
			{
                event = "need_property:getClothes",
                icon = "fa-solid fa-tshirt",
                label = "Zapisane stroje",
                job = "police"
            },

			{
                event = "esx_skin:openRestrictedMenu",
                icon = "fa-solid fa-tshirt",
                label = "Modyfikuj strój",
                job = "police"
            },
        }
    },
    ['bossMenu'] = {
        name = 'fumoPolice:bossMenu',
        pos = vec3(-545.6984, -125.9226, 42.0352),
        radius = 1.0,
        distance = 1.5,
        options = {
            {
                event = "fumoPolice:bossMenu",
                icon = "fa-solid fa-display",
                label = "Uruchom komputer",
                job = {["police"] = 10},
            },
            {
                event = "fumoPolice:giveBadge",
                icon = "fa-solid fa-display",
                label = "Nadaj odznake",
                job = {["police"] = 14},
            },
            {
                event = "fumoPolice:manageLicenses",
                icon = "fa-solid fa-display",
                label = "Zarządzaj Licencjami",
                job = {["police"] = 12},

            }
        }
    },
		--Davis
	['bossMenu1'] = {
		name = 'fumoPolice:bossMenu',
		pos = vec3(359.4158, -1591.0247, 31.8804-1),
		radius = 1.0,
		distance = 1.5,
		options = {
			{
				event = "fumoPolice:bossMenuLSSD",
				icon = "fa-solid fa-display",
				label = "Uruchom komputer",
				job = {["lssd"] = 6},
			},
			{
				event = "fumoPolice:giveBadgeLSSD",
				icon = "fa-solid fa-display",
				label = "Nadaj odznake",
				job = {["lssd"] = 6},
			},
			{
				event = "fumoPolice:manageLicensesLSSD",
				icon = "fa-solid fa-display",
				label = "Zarządzaj Licencjami",
				job = {["lssd"] = 6},

			}
		}
	},
	['armory'] = {
		name = 'fumoPolice:armory',
		pos = vec3(-549.0841, -113.8006, 37.8657),
		radius = 1.0,
		distance = 1.5,
		options = {
			{
				event = "fumoPolice:armory",
				icon = "fa-solid fa-gun",
				label = "Otwórz zbrojownie",
				job = "lssd"
			},
		}
	},
	['evidence1'] = {
		name = 'fumoPolice:evidence',
		pos = vec3(370.0065, -1593.7285, 25.4517),
		radius = 1.0,
		distance = 1.5,
		options = {
			{
				event = "fumoPolice:evidence",
				icon = "fa-solid fa-folder-open",
				label = "Otwórz dowody",
				job = "lssd"
			},
		}
	},
	['cloakroom1'] = {
		name = 'fumoPolice:uniform',
		pos = vec3(361.9469, -1590.671, 25.4517),
		radius = 1.5,
		distance = 2.5,
		options = {
			{
				event = "fumoPolice:uniform",
				icon = "fa-solid fa-door-open",
				label = "Otwórz szafkę",
				job = "lssd"
			},
		}
	},
}

cfg.spawners = {
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vec4(-563.0033, -110.4903, 32.7545, 70.0043),
		spawnCoords = {
			vec4(-570.0422, -108.5491, 33.7545, 26.9213),
			vec4(-573.2797, -101.8680, 33.7545, 26.0196),
			vec4(-578.5910, -95.6312, 33.7545, 114.7803),
			vec4(445.4739, -986.2005, 25.6998, 290.0956),
			vec4(-580.0664, -108.1635, 33.7545, 208.5368),
			vec4(-582.9244, -109.3400, 33.7545, 191.2163)
		},
		name = "mrpd_spawner_1",
		options = {
            {
                event = "fumoPolice:openGarage",
                icon = "fas fa-square",
                label = "Wyciągnij Pojazd",
				groups = {"lssd","police"},
                type = "vehiclesGarage"
            },
			{
                event = "fumoPolice:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Pojazd",
				groups = {"lssd","police"},
            },
        },
	},
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(-550.0548, -115.1309, 50.9871, 195.8473),
		spawnCoords = {
			vec4(-546.6232, -122.0138, 51.9871, 112.5408)
		},
		name = "mrpd_spawner_heli",
		options = {
            {
                event = "fumoPolice:openGarage",
                icon = "fas fa-square",
                label = "Wyciągnij helikopter",
				groups = {"lssd","police"},
                type = "helicoptersGarage"
            },
			{
                event = "fumoPolice:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Helikopter",
				groups = {"lssd","police"},
            },
        }
	},

    -- Sandy Sheriff Department
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(1833.42, 3668.11, 32.98, 210.58),
		spawnCoords = {
			vector4(1819.792, 3657.594, 33.03795, 209.468),
			vector4(1823.144, 3658.895, 33.01855, 213.1335),
			vector4(1826.347, 3661.051, 33.01105, 214.3627),
			vector4(1829.704, 3662.916, 32.94443, 213.399),
			vector4(1832.817, 3664.691, 32.9112, 209.0799),
			vector4(1845.466, 3672.152, 32.77117, 209.1647),
			vector4(1853.24, 3677.036, 32.79562, 209.4771),
		},
		name = "sandy_spawner_1",
		options = {
            {
                event = "fumoPolice:openGarage",
                icon = "fas fa-square",
                label = "Wyciągnij Pojazd",
				groups = {"lssd","police"},
                type = "vehiclesGarage"
            },
			{
                event = "fumoPolice:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Pojazd",
				groups = {"lssd","police"},
            },
        },
	},
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(1839.04, 3688.74, 32.97, 300.76),
		spawnCoords = {
			vector4(1865.561, 3692.998, 32.97462, 117.0226),
			vector4(1863.538, 3696.23, 32.97462, 115.7863),
			vector4(1861.732, 3699.58, 32.97462, 119.51),
			vector4(1848.271, 3682.806, 32.97462, 300.33),
			vector4(1846.443, 3686.072, 32.97462, 298.3774),
			vector4(1844.682, 3689.518, 32.97462, 303.9698),
		},
		name = "sandy_spawner_2",
		options = {
            {
                event = "fumoPolice:openGarage",
                icon = "fas fa-square",
                label = "Wyciągnij Pojazd",
				groups = {"lssd","police"},
                type = "vehiclesGarage"
            },
			{
                event = "fumoPolice:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Pojazd",
				groups = {"lssd","police"},
            },
        },
	},
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(1821.98, 3680.5, 33.19, 30.39),
		spawnCoords = {
			vector4(1834.8, 3690.811, 32.97462, 24.12484),
			vector4(1831.571, 3689.013, 32.97462, 29.68286),
			vector4(1828.23, 3687.17, 32.97462, 20.87093),
			vector4(1824.91, 3685.214, 32.97462, 26.10589),
			vector4(1818.207, 3681.431, 32.97462, 27.06157),
			vector4(1814.839, 3679.722, 32.97462, 21.62266)
		},
		name = "sandy_spawner_3",
		options = {
            {
                event = "fumoPolice:openGarage",
                icon = "fas fa-square",
                label = "Wyciągnij Pojazd",
				groups = {"lssd","police"},
                type = "vehiclesGarage"
            },
			{
                event = "fumoPolice:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Pojazd",
				groups = {"lssd","police"},
            },
        },
	},
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(1861.85, 3703.41, 32.97, 120),
		spawnCoords = {
			vector4(1853.372, 3706.322, 33.9746, 30.73395)
		},
		name = "sandy_spawner_heli",
		options = {
            {
                event = "fumoPolice:openGarage",
                icon = "fas fa-square",
                label = "Wyciągnij helikopter",
				groups = {"lssd","police"},
                type = "helicoptersGarage"
            },
			{
                event = "fumoPolice:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Helikopter",
				groups = {"lssd","police"},
            },
        }
	},

    -- Paleto Sheriff Department
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(-457.99, 6033.67, 30.34, 45.3),
		spawnCoords = {
			vector4(-454.3435, 6041.482, 30.34039, 138.2233),
			vector4(-457.4596, 6044.763, 30.34039, 139.6038),
			vector4(-460.8936, 6048.025, 30.34039, 137.885),
			vector4(-469.2004, 6039.017, 30.34038, 229.1963),
			vector4(-472.7794, 6035.434, 30.34038, 229.8445),
			vector4(-476.3775, 6031.832, 30.34038, 226.7684),
			vector4(-479.7412, 6028.158, 30.34038, 225.4633),
			vector4(-483.0227, 6025.095, 30.34038, 222.6299),
		},
		name = "paleto_spawner_1",
		options = {
            {
                event = "fumoPolice:openGarage",
                icon = "fas fa-square",
                label = "Wyciągnij Pojazd",
				groups = {"lssd","police"},
                type = "vehiclesGarage"
            },
			{
                event = "fumoPolice:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Pojazd",
				groups = {"lssd","police"},
            },
        },
	},
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(-449.67, 6042.02, 30.49, 317.43),
		spawnCoords = {
			vector4(-445.7052, 6056.001, 30.3404, 206.3669),
			vector4(-449.7235, 6053.219, 30.3404, 216.3429),
			vector4(-453.6385, 6050.608, 30.34039, 211.3609),
		},
		name = "paleto_spawner_2",
		options = {
            {
                event = "fumoPolice:openGarage",
                icon = "fas fa-square",
                label = "Wyciągnij Pojazd",
				groups = {"lssd","police"},
                type = "vehiclesGarage"
            },
			{
                event = "fumoPolice:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Pojazd",
				groups = {"lssd","police"},
            },
        },
	},
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(-444.9, 6023.95, 30.49, 315.06),
		spawnCoords = {
			vector4(-436.7364, 6022.793, 30.34038, 43.38369),
			vector4(-434.3956, 6025.495, 30.34038, 46.78217),
			vector4(-431.9195, 6027.8, 30.34038, 47.7371),
		},
		name = "paleto_spawner_3",
		options = {
            {
                event = "fumoPolice:openGarage",
                icon = "fas fa-square",
                label = "Wyciągnij Pojazd",
				groups = {"lssd","police"},
                type = "vehiclesGarage"
            },
			{
                event = "fumoPolice:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Pojazd",
				groups = {"lssd","police"},
            },
        },
	},
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(-454.07, 5993.76, 30.49, 136.99),
		spawnCoords = {
			vector4(-475.3594, 5988.456, 31.33647, 314.549)
		},
		name = "paleto_spawner_heli",
		options = {
            {
                event = "fumoPolice:openGarage",
                icon = "fas fa-square",
                label = "Wyciągnij helikopter",
				groups = {"lssd","police"},
                type = "helicoptersGarage"
            },
			{
                event = "fumoPolice:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Helikopter",
				groups = {"lssd","police"},
            },
        }
	},
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(376.9857, -1622.5, 28.29208, 142.8884),
		spawnCoords = {
			vector4(392.9666, -1628.575, 29.29208, 44.7673),
			vector4(395.1218, -1626.012, 29.29208, 50.02766),
			vector4(397.0918, -1623.721, 29.29208, 49.83561),
			vector4(399.2709, -1621.413, 29.29208, 49.95647),
			vector4(400.9953, -1618.86, 29.29208, 47.95273),
			vector4(402.9145, -1616.536, 29.29226, 47.53574),
		},
		name = "davis_spawner_1",
		options = {
			{
                event = "fumoPolice:openGarage",
                icon = "fas fa-square",
                label = "Wyciągnij Pojazd",
				groups = {"lssd","police"},
                type = "vehiclesGarage"
            },
			{
                event = "fumoPolice:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Pojazd",
				groups = {"lssd","police"},
            },
        }
	},
}

cfg.vehiclesGarage = {
   
    
   
	{
		label = "ADAM",
		grade = -1,
		vehicles = {
			{
				label = "Stainer",
				model = "lspdstanier",
				livery = 4,
				extras = {0},
				grade = -1
			},
			
			{
				label = "Buffalo 1",
				model = "lspddbuffs",
				livery = 1,
				extras = {},
				grade = {1,2,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
			},
			{
				label = "Fugitive",
				model = "lspdfugitive",
				livery = 1,
				extras = {1, 2, 3},
				grade = {1,2,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
			},
			{
				label = "Interceptor",
				model = "lspdinterceptor",
				livery = 1,
				extras = {1, 2, 3},
				grade = {1,2,3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
			},
        }
    },
	{
		label = "OFFROAD",
		grade = -1,
		vehicles = {
			{
				label = "Alamo",
				model = "lspdalamo",
				livery = 1,
				extras = {},
				grade = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
			},
			{
				label = "Scout",
				model = "lspdscoutnew",
				livery = 1,
				extras = {1, 3, 6, 0, 12},
				grade = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
			},
			{
				label = "Stalker",
				model = "lspdstalker",
				livery = 1,
				extras = {1, 3, 6, 0, 12},
				grade = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
			},
			{
				label = "Everon",
				model = "lspdeveron",
				livery = 1,
				extras = {1, 3, 6, 0, 12},
				grade = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
			},
			
        }
    },
    {
		label = "EDWARD",
		grade = -1,
		vehicles = {
			{
				label = "Buffalo STX",
				model = "lspdbuffstx1",
				livery = 0,
				extras = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				grade = {2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
           
        }
    },

	{
		label = "UNMARKED",
		grade = -1,
		vehicles = {
			{
				label = "Buffalo STX",
				model = "umkbuffstx",
				livery = 0,
				extras = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				grade = {2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},

			{
				label = "Scout",
				model = "umkscout",
				livery = 0,
				extras = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				grade = {2,3,4,5,6,7,8,9,10,11,12,13,14,15}
			},
           
        }
    },
    {
		label = "KATEGORIA SWAT",
		grade = -1,
        required = "police_swat",
		vehicles = {
			{
				label = "Bearcat",
				model = "centurionlspd",
				livery = 0,
				extras = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				grade = {2,3,4,5,6,7,8,9,10,11,12,13,14,15},
                required = "police_swat"
			},

			{
				label = "Granger",
				model = "specgranger",
				livery = 0,
				extras = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				grade = {2,3,4,5,6,7,8,9,10,11,12,13,14,15},
                required = "police_swat"
			},

			{
				label = "Bison",
				model = "specbison",
				livery = 0,
				extras = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				grade = {2,3,4,5,6,7,8,9,10,11,12,13,14,15},
                required = "police_swat"
			},

			
        }
    }
}

cfg.helicoptersGarage = {
    {
		label = "EAGLE",
		grade = -1,
		vehicles = {
			{
				label = "HELIKOPTER 1",
				model = "polmav",
				livery = 0,
				extras = {1,2,3,4,5,6,7,8,9},
				grade = -1
			},
			
        }
    }
}
cfg.VehiclesMenu = {
	vector3(450.9315, -975.5176, 25.6998),
	vector3(383.03, -1621.14, 29.29)
}