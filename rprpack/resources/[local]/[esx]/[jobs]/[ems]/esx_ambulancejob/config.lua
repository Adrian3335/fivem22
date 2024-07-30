Config                            = {}
Config.DrawDistance               = 15.0
Config.MarkerColor                = { r = 56, g = 197, b = 201 }
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.Sprite  = 61
Config.Display = 4
Config.Scale   = 0.8
Config.Colour  = 11
Config.ReviveReward               = 1500
Config.AntiCombatLog              = true
Config.LoadIpl                    = false
Config.Locale = 'en'
Config.RespawnToHospitalDelay		= 300000
 
bedNames = {
	'v_med_bed2',
}
 
local second = 1000
local minute = 60 * second
 
-- How much time before auto respawn at hospital
Config.RespawnDelayAfterRPDeath   = 5 * minute
 
Config.EnablePlayerManagement       = false
Config.EnableSocietyOwnedVehicles   = false
 
Config.EarlyRespawnTimer = 60000*5
Config.EarlyRespawnTimerr = 1000


Config.RemoveWeaponsAfterRPDeath    = false
Config.RemoveCashAfterRPDeath       = false
Config.RemoveItemsAfterRPDeath      = false
 
Config.ShowDeathTimer               = true
 
Config.EarlyRespawn                 = false

Config.EarlyRespawnFine                  = false
Config.EarlyRespawnFineAmount            = 500


Config.Uniforms = {
	REKRUT = {
		hats = {
            male = { drawable = -1,  texture = 0 },
            female = { drawable = -1,  texture = 0 }
        },
        mask = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        upperBody = {
            male = { drawable = 15,  texture = 0 },
            female = { drawable = 4,  texture = 0 }
        },
        jackets = {
            male = { drawable = 35,  texture = 0 },
            female = { drawable = 23,  texture = 0 }
        },
        lowerBody = {
            male = { drawable = 144,  texture = 0 },
            female = { drawable = 41,  texture = 0 }
        },
        bags = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        scarfAndChains = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shirt = {
            male = { drawable = 18,  texture = 0 },
            female = { drawable = 15,  texture = 0 }
        },
        bodyArmor = {
            male = { drawable = 5,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shoes = {
            male = { drawable = 9,  texture = 0 },
            female = { drawable = 4,  texture = 1 }
        }
	},
	PIELEGNIARZ = {
		hats = {
            male = { drawable = -1,  texture = 0 },
            female = { drawable = -1,  texture = 0 }
        },
        mask = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        upperBody = {
            male = { drawable = 15,  texture = 0 },
            female = { drawable = 4,  texture = 0 }
        },
        jackets = {
            male = { drawable = 35,  texture = 0 },
            female = { drawable = 23,  texture = 0 }
        },
        lowerBody = {
            male = { drawable = 144,  texture = 0 },
            female = { drawable = 41,  texture = 0 }
        },
        bags = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        scarfAndChains = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shirt = {
            male = { drawable = 18,  texture = 0 },
            female = { drawable = 15,  texture = 0 }
        },
        bodyArmor = {
            male = { drawable = 5,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shoes = {
            male = { drawable = 9,  texture = 0 },
            female = { drawable = 4,  texture = 1 }
        }
	},
	RATOWNIK_MED = {
		hats = {
            male = { drawable = -1,  texture = 0 },
            female = { drawable = -1,  texture = 0 }
        },
        mask = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        upperBody = {
            male = { drawable = 15,  texture = 0 },
            female = { drawable = 4,  texture = 0 }
        },
        jackets = {
            male = { drawable = 35,  texture = 0 },
            female = { drawable = 23,  texture = 0 }
        },
        lowerBody = {
            male = { drawable = 144,  texture = 0 },
            female = { drawable = 41,  texture = 0 }
        },
        bags = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        scarfAndChains = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shirt = {
            male = { drawable = 18,  texture = 0 },
            female = { drawable = 15,  texture = 0 }
        },
        bodyArmor = {
            male = { drawable = 5,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shoes = {
            male = { drawable = 9,  texture = 0 },
            female = { drawable = 4,  texture = 1 }
        }
	},
	LEKARZ = {
		hats = {
            male = { drawable = -1,  texture = 0 },
            female = { drawable = -1,  texture = 0 }
        },
        mask = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        upperBody = {
            male = { drawable = 15,  texture = 0 },
            female = { drawable = 4,  texture = 0 }
        },
        jackets = {
            male = { drawable = 35,  texture = 0 },
            female = { drawable = 23,  texture = 0 }
        },
        lowerBody = {
            male = { drawable = 144,  texture = 0 },
            female = { drawable = 41,  texture = 0 }
        },
        bags = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        scarfAndChains = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shirt = {
            male = { drawable = 18,  texture = 0 },
            female = { drawable = 15,  texture = 0 }
        },
        bodyArmor = {
            male = { drawable = 5,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shoes = {
            male = { drawable = 9,  texture = 0 },
            female = { drawable = 4,  texture = 1 }
        }
	},
	LEKARZ2 = {
		hats = {
            male = { drawable = -1,  texture = 0 },
            female = { drawable = -1,  texture = 0 }
        },
        mask = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        upperBody = {
            male = { drawable = 15,  texture = 0 },
            female = { drawable = 4,  texture = 0 }
        },
        jackets = {
            male = { drawable = 35,  texture = 0 },
            female = { drawable = 23,  texture = 0 }
        },
        lowerBody = {
            male = { drawable = 144,  texture = 0 },
            female = { drawable = 41,  texture = 0 }
        },
        bags = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        scarfAndChains = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shirt = {
            male = { drawable = 18,  texture = 0 },
            female = { drawable = 15,  texture = 0 }
        },
        bodyArmor = {
            male = { drawable = 5,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shoes = {
            male = { drawable = 9,  texture = 0 },
            female = { drawable = 4,  texture = 1 }
        }
	},
	ZASTEPCA_ORD = {
		hats = {
            male = { drawable = -1,  texture = 0 },
            female = { drawable = -1,  texture = 0 }
        },
        mask = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        upperBody = {
            male = { drawable = 15,  texture = 0 },
            female = { drawable = 4,  texture = 0 }
        },
        jackets = {
            male = { drawable = 35,  texture = 0 },
            female = { drawable = 23,  texture = 0 }
        },
        lowerBody = {
            male = { drawable = 144,  texture = 0 },
            female = { drawable = 41,  texture = 0 }
        },
        bags = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        scarfAndChains = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shirt = {
            male = { drawable = 18,  texture = 0 },
            female = { drawable = 15,  texture = 0 }
        },
        bodyArmor = {
            male = { drawable = 5,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shoes = {
            male = { drawable = 9,  texture = 0 },
            female = { drawable = 4,  texture = 1 }
        }
	},
	ORDYNATOR = {
		hats = {
            male = { drawable = -1,  texture = 0 },
            female = { drawable = -1,  texture = 0 }
        },
        mask = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        upperBody = {
            male = { drawable = 15,  texture = 0 },
            female = { drawable = 4,  texture = 0 }
        },
        jackets = {
            male = { drawable = 35,  texture = 0 },
            female = { drawable = 23,  texture = 0 }
        },
        lowerBody = {
            male = { drawable = 144,  texture = 0 },
            female = { drawable = 41,  texture = 0 }
        },
        bags = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        scarfAndChains = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shirt = {
            male = { drawable = 18,  texture = 0 },
            female = { drawable = 15,  texture = 0 }
        },
        bodyArmor = {
            male = { drawable = 5,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shoes = {
            male = { drawable = 9,  texture = 0 },
            female = { drawable = 4,  texture = 1 }
        }
	},
	ZASTEPCA_DYR = {
		hats = {
            male = { drawable = -1,  texture = 0 },
            female = { drawable = -1,  texture = 0 }
        },
        mask = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        upperBody = {
            male = { drawable = 15,  texture = 0 },
            female = { drawable = 4,  texture = 0 }
        },
        jackets = {
            male = { drawable = 35,  texture = 0 },
            female = { drawable = 23,  texture = 0 }
        },
        lowerBody = {
            male = { drawable = 144,  texture = 0 },
            female = { drawable = 41,  texture = 0 }
        },
        bags = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        scarfAndChains = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shirt = {
            male = { drawable = 18,  texture = 0 },
            female = { drawable = 15,  texture = 0 }
        },
        bodyArmor = {
            male = { drawable = 5,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shoes = {
            male = { drawable = 9,  texture = 0 },
            female = { drawable = 4,  texture = 1 }
        }
	},
	DYREKTOR = {
		hats = {
            male = { drawable = -1,  texture = 0 },
            female = { drawable = -1,  texture = 0 }
        },
        mask = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        upperBody = {
            male = { drawable = 15,  texture = 0 },
            female = { drawable = 4,  texture = 0 }
        },
        jackets = {
            male = { drawable = 35,  texture = 0 },
            female = { drawable = 23,  texture = 0 }
        },
        lowerBody = {
            male = { drawable = 144,  texture = 0 },
            female = { drawable = 41,  texture = 0 }
        },
        bags = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        scarfAndChains = {
            male = { drawable = 0,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shirt = {
            male = { drawable = 18,  texture = 0 },
            female = { drawable = 15,  texture = 0 }
        },
        bodyArmor = {
            male = { drawable = 5,  texture = 0 },
            female = { drawable = 0,  texture = 0 }
        },
        shoes = {
            male = { drawable = 9,  texture = 0 },
            female = { drawable = 4,  texture = 1 }
        }
	},
}






Config.AuthorizedVehicles = {
	{
		grade = 0,
		model = 'ambulance',
		label = 'Karetka',
		livery = 2,
		extras = {
			[1] = 1,
			[2] = 0,
			[3] = 0,
			[4] = 0,
			[5] = 0,
			[6] = 0,
			[7] = 0,
			[8] = 0,
			[9] = 0,
			[10] = 0,
			[11] = 0,
			[12] = 0,
		}
	},
}

Config.Zones = {
	VehicleSpawnPoint = {
		Pos	= { x = 292.56210327148, y = -583.65112304688, z = 43.194694519043}, 
		Heading = 343.11846923828,
		Type = -1
	},
}


Config.Spawners = {
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(336.3411, -589.9305, 27.7969, 354.4259),
		spawnCoords = {
			vector4(331.0520, -581.1739, 28.7969, 337.6385)
		},
		name = "vmc_spawner_1",
		options = {
            {
                event = "dbl_ambulancejob:openGarage",
                icon = "fas fa-square",
                label = "Wyci¹gnij Pojazd",
				groups = {"ambulance"},
                type = "VehiclesGarage"
            },
			{
                event = "dbl_ambulancejob:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Pojazd",
				groups = {"ambulance"},
            },
        },
	},
	{
		pedModel = "ig_trafficwarden",
		pedCoords = vector4(339.4861, -581.2378, 73.1617, 249.8784),
		spawnCoords = {
			vector4(351.8333, -588.1007, 74.1618, 124.4300)
		},
		name = "vmc_spawner_heli",
		options = {
            {
                event = "dbl_ambulancejob:openGarage",
                icon = "fas fa-square",
                label = "Wyci¹gnij helikopter",
				groups = {"ambulance"},
                type = "HelicoptersGarage"
            },
			{
                event = "dbl_ambulancejob:deleteVehicle",
                icon = "fas fa-square",
                label = "Schowaj Helikopter",
				groups = {"ambulance"},
            },
        }
	},
}

Config.VehiclesGarage = {
    {
		label = "EMS",
		grade = -1,
		vehicles = {
			{
				label = "Karetka",
				model = "ambulance2",
				livery = 0,
				extras = {1,2},
				grade = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19}
			},
			{
				label = "Stalker",
				model = "emsstalker",
				livery = 0,
				extras = {1,2,3},
				grade = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19}
			},
			{
				label = "Torrence",
				model = "emstorrence",
				livery = 0,
				extras = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},
				grade = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19}
			},
			
			
		}
	}
}

Config.HelicoptersGarage = {
    {
		label = "KATEGORIA 1",
		grade = -1,
		vehicles = {
			{
				label = "Helikopter 1",
				model = "polmav",
				livery = 1,
				extras = {1,2,3,4,5,6,7,8,9},
				grade = -1
			},
			
        }
    }
}