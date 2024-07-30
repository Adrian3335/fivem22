---wip types

---@class OxShop
---@field name string
---@field label? string
---@field blip? { id: number, colour: number, scale: number }
---@field inventory { name: string, price: number, count?: number, currency?: string }
---@field locations? vector3[]
---@field targets? { loc: vector3, length: number, width: number, heading: number, minZ: number, maxZ: number, distance: number, debug?: boolean, drawSprite?: boolean }[]
---@field groups? string | string[] | { [string]: number }
---@field model? number[]

return {



    PoliceArmoury = {
		name = 'Zbrojownia',
		groups = shared.police,
		blip = {
			id = 110, colour = 84, scale = 0
		}, inventory = {
			{ name = 'ammo-9', price = 0, },
			{ name = 'ammo-rifle', price = 0, },
			{ name = 'ammo-shotgun', price = 0, },
			{ name = 'WEAPON_FLASHLIGHT', price = 0 },
			{ name = 'WEAPON_NIGHTSTICK', price = 0 },
			{ name = 'handcuffs', price = 0 },
			{ name = 'gps', price = 0 },
			{ name = 'bodycam', price = 0 },
			{ name = 'radio', price = 0 },
			{ name = 'armour', price = 0 },
			{ name = 'weapon_pistol', price = 0 },
			{ name = 'weapon_heavypistol', price = 0 },
			{ name = 'WEAPON_CARBINERIFLE', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 3 },
			{ name = 'weapon_combatpdw', price = 0 },
			{ name = 'WEAPON_ASSAULTSHOTGUN', price = 0 },
			{ name = 'WEAPON_STUNGUN', price = 0, metadata = { registered = true, serial = 'POL'} }
		}, locations = {
			vec3(488.44, -997.08, 30.69),
			vec3(361.93, -1603.82, 25.45)
		}, targets = {
			{ loc = vec3(-549.6627, -110.1154, 37.8657), length = 2, width = 2, heading = 0, minZ = 27.49, maxZ = 31.49, distance = 4 },
			{ loc = vec3(361.93, -1603.82, 25.45), length = 1, width = 2, heading = 0, minZ = 24.49, maxZ = 26.49, distance = 4 }
		}
	},

YouTool = {
		name = 'Sklep Techniczny',
		blip = {
			id = 402, colour = 69, scale = 0.9
		}, inventory = {
			{ name = 'fixkit', price = 350 },
			{ name = 'paperbag', price = 100 },
			{ name = 'torba', price = 500 },
			{ name = 'zapalniczka', price = 55 },
			{ name = 'linka', price = 350 },
			{ name = 'detector', price = 1750 },
			{ name = 'weapon_battleaxe', price = 700 },
			{ name = 'starburst', price = 350 },
			{ name = 'shotburst', price = 1750 },
			{ name = 'fountain', price = 1100 },
			{ name = 'trailburst', price = 770 },
		}, locations = {
			vec3(2748.0, 3473.0, 55.67),
			vec3(342.99, -1298.26, 32.51)
		}, targets = {
			{ loc = vec3(55.3032, -1739.5057, 29.5901), length = 1.9, width = 1.8, heading = 233.265, minZ = 29.50, maxZ = 29.99, distance = 3.0 }
		}
	},

BurgerShot = {
		name = 'BurgerShot',
		blip = {
			id = 103, colour = 47, scale = 0.9
		}, inventory = {
			{ name = 'waniliashake', price = 20 },
			{ name = 'morelshake', price = 10 },
			{ name = 'bsfries', price = 15 },
			{ name = 'chickenburger', price = 15 },
			{ name = 'cheeseburger', price = 15 },
			{ name = 'bswrap', price = 15 },
			{ name = 'bsnuggets', price = 15 },
		}, locations = {
			vec3(-1194.3062, -891.9728, 13.9952)
		}, targets = {
			{ loc = vec3(-1194.4426, -892.0577, 13.9952), length = 2.1, width = 2.3, heading = 126.6940, minZ = 13.80, maxZ = 14.35, distance = 1.5 },
		}
	},

	General = {
		name = 'Sklep',
		blip = {
			id = 59, colour = 69, scale = 0.7
		}, inventory = {
			{ name = 'burger', price = 30 },
			{ name = 'water', price = 10 },
			{ name = 'cola', price = 10 },
			{ name = 'phone', price = 300 },
                        { name = 'bread', price = 15 },
                        { name = 'burger', price = 15 },
                         { name = 'sandwich', price = 15 },
			                      
		}, locations = {
			vec3(25.7, -1347.3, 29.49),
			vec3(-3038.71, 585.9, 7.9),
			vec3(-3241.47, 1001.14, 12.83),
			vec3(1728.66, 6414.16, 35.03),
			vec3(1697.99, 4924.4, 42.06),
			vec3(1961.48, 3739.96, 32.34),
			vec3(547.79, 2671.79, 42.15),
			vec3(2679.25, 3280.12, 55.24),
			vec3(2557.94, 382.05, 108.62),
			vec3(373.55, 325.56, 103.56),

			vec3(-48.41, -1759.08, 29.42),
			vec3(1164.36, -324.75, 69.21),
			vec3(-706.66, -915.45, 19.22),
		}, targets = {
			{ loc = vec3(25.06, -1347.32, 29.5), length = 0.7, width = 0.5, heading = 0.0, minZ = 29.5, maxZ = 29.9, distance = 1.5 },
			{ loc = vec3(-3039.18, 585.13, 7.91), length = 0.6, width = 0.5, heading = 15.0, minZ = 7.91, maxZ = 8.31, distance = 1.5 },
			{ loc = vec3(-3242.2, 1000.58, 12.83), length = 0.6, width = 0.6, heading = 175.0, minZ = 12.83, maxZ = 13.23, distance = 1.5 },
			{ loc = vec3(1728.39, 6414.95, 35.04), length = 0.6, width = 0.6, heading = 65.0, minZ = 35.04, maxZ = 35.44, distance = 1.5 },
			{ loc = vec3(1698.37, 4923.43, 42.06), length = 0.5, width = 0.5, heading = 235.0, minZ = 42.06, maxZ = 42.46, distance = 1.5 },
			{ loc = vec3(1960.54, 3740.28, 32.34), length = 0.6, width = 0.5, heading = 120.0, minZ = 32.34, maxZ = 32.74, distance = 1.5 },
			{ loc = vec3(548.5, 2671.25, 42.16), length = 0.6, width = 0.5, heading = 10.0, minZ = 42.16, maxZ = 42.56, distance = 1.5 },
			{ loc = vec3(2678.29, 3279.94, 55.24), length = 0.6, width = 0.5, heading = 330.0, minZ = 55.24, maxZ = 55.64, distance = 1.5 },
			{ loc = vec3(2557.19, 381.4, 108.62), length = 0.6, width = 0.5, heading = 0.0, minZ = 108.62, maxZ = 109.02, distance = 1.5 },
			{ loc = vec3(373.13, 326.29, 103.57), length = 0.6, width = 0.5, heading = 345.0, minZ = 103.57, maxZ = 103.97, distance = 1.5 },

			{ loc = vec3(-48.41, -1759.08, 29.42), length = 1, width = 1, heading = 345.0, minZ = 28.57, maxZ = 30.97, distance = 1.5 },
			{ loc = vec3(1164.36, -324.75, 69.21), length = 1, width = 1, heading = 345.0, minZ = 68.57, maxZ = 70.97, distance = 1.5 },
			{ loc = vec3(-706.66, -915.45, 19.22), length = 1, width = 1, heading = 345.0, minZ = 18.57, maxZ = 20.97, distance = 1.5 },
		}
	},

	Liquor = {
		name = 'Sklep',
		blip = {
			id = 93, colour = 69, scale = 0.7
		}, inventory = {
			{ name = 'water', price = 10 },
			{ name = 'cola', price = 10 },
			{ name = 'burger', price = 15 },
			{ name = 'phone', price = 300 },
			{ name = 'scratchplus', price = 1500 },
			{ name = 'scratch', price = 15 },
                        { name = 'sandwich', price = 15 },
		}, locations = {
			vec3(1135.808, -982.281, 46.415),
			vec3(-1222.915, -906.983, 12.326),
			vec3(-1487.553, -379.107, 40.163),
			vec3(-2968.243, 390.910, 15.043),
			vec3(1166.024, 2708.930, 38.157),
			vec3(1392.562, 3604.684, 34.980),
			vec3(-1393.409, -606.624, 30.319)
		}, targets = {
			{ loc = vec3(1134.9, -982.34, 46.41), length = 0.5, width = 0.5, heading = 96.0, minZ = 46.4, maxZ = 46.8, distance = 1.5 },
			{ loc = vec3(-1222.33, -907.82, 12.43), length = 0.6, width = 0.5, heading = 32.7, minZ = 12.3, maxZ = 12.7, distance = 1.5 },
			{ loc = vec3(-1486.67, -378.46, 40.26), length = 0.6, width = 0.5, heading = 133.77, minZ = 40.1, maxZ = 40.5, distance = 1.5 },
			{ loc = vec3(-2967.0, 390.9, 15.14), length = 0.7, width = 0.5, heading = 85.23, minZ = 15.0, maxZ = 15.4, distance = 1.5 },
			{ loc = vec3(1165.95, 2710.20, 38.26), length = 0.6, width = 0.5, heading = 178.84, minZ = 38.1, maxZ = 38.5, distance = 1.5 },
			{ loc = vec3(1393.0, 3605.95, 35.11), length = 0.6, width = 0.6, heading = 200.0, minZ = 35.0, maxZ = 35.4, distance = 1.5 }
		}
	},



	UwuCafe = {
		name = 'Szafka',
		groups = {
			['kawiarnia'] = 0
		},
		inventory = {
			{ name = 'paperbag', price = 0 },
		}
	},

	Medicine = {
		name = 'Sklep medyczny',
		groups = {
			['ambulance'] = 0
		},
		inventory = {
			{ name = 'wheelchair', price = 0 },
			{ name = 'bandage', price = 0 },
			{ name = 'medikit', price = 0 },
			{ name = "gps", price = 0 },
			{ name = "radio", price = 0 },
		}
	},

	Mecanic = {
		name = 'Czesci',
		groups = {
			['mechanic'] = 0
		},
		 inventory = {
			{ name = 'toolcarokit', price = 0, },
			{ name = 'toolwytrych', price = 0, },
			{ name = 'toolfixkit', price = 0, },
			{ name = 'radio', price = 0 },
			{ name = 'sponge', price = 0 },
			
		},  targets = {
			{ loc = vec3(152.2877, -3010.8354, 7.0409), length = 2, width = 2, heading = 0, minZ = 27.49, maxZ = 31.49, distance = 4 },
			
		}
	},
	Ambulance = {
		name = 'Wyposażenie',
		groups = {
			['ambulance'] = 0
		},
		 inventory = {
			{ name = 'apteczka', price = 0, },
			{ name = 'bandaz', price = 0, },
			{ name = 'radio', price = 0 },
			{ name = 'gps', price = 0 },
			
		},  targets = {
			{ loc = vec3(302.1060, -594.0617, 43.2698), length = 2, width = 2, heading = 0, minZ = 42.49, maxZ = 42.90, distance = 4 },
			
		}
	},


	VendingMachineDrinks = {
		name = 'Automat',
		inventory = {
			{ name = 'water', price = 10 },
			{ name = 'cola', price = 10 },
		},
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`
		}
	},


Drugs = {
		name = 'Apteka',
		blip = {
			id = 403, colour = 75, scale = 0.9
		}, inventory = {
			{ name = 'dhm-rollpaper', price = 100 },
			{ name = 'water', price = 20 },
			{ name = 'dhm-baggie', price = 50 },
			{ name = 'dhm-vicodin', price = 25 },
			{ name = 'dhm-needle', price = 125 },
			{ name = 'dhm-poppypod', price = 15 }
		}, locations = {
			vec3(-509.04, 291.73, 83.39)
		}, targets = {

			{ loc = vec3(-509.04, 291.73, 83.39), length = 0.8, width = 1, heading = 0,  minZ = 79.99, maxZ = 83.99, distance = 5 }

		}
	},

	Ocean = {
		name = 'Ocean Club',
		blip = {
			id = 176, colour = 19, scale = 0.9
		}, inventory = {
			{ name = 'coffee', price = 100 },
			{ name = 'tequila', price = 130 },
			{ name = 'cydr', price = 150 },
			{ name = 'koniak', price = 500 },
			{ name = 'shot', price = 20 },
			
		}, locations = {
			vec3(-2060.7202, -548.5636, 10.8573)
		}, targets = {

			{ loc = vec3(-2053.1460, -548.2388, 10.8573), length = 1.8, width = 2, heading = 0,  minZ = 9.99, maxZ = 11.99, distance = 5 }

		}
	},


	Ammunation = {
		name = 'Ammunation',
		blip = {
			id = 110, colour = 69, scale = 0.8
		}, inventory = {
			{ name = 'ammo-9', price = 50, license = 'weapon'},
			{ name = 'WEAPON_SWITCHBLADE', price = 600 },
			{ name = 'WEAPON_KNIFE', price = 700 },
			{ name = 'WEAPON_BAT', price = 500 },
			{ name = 'WEAPON_PISTOL', price = 10000, metadata = { registered = true }, license = 'weapon' }
		}, locations = {
			vec3(-662.180, -934.961, 21.829),
			vec3(810.25, -2157.60, 29.62),
			vec3(1693.44, 3760.16, 34.71),
			vec3(-330.24, 6083.88, 31.45),
			vec3(252.63, -50.00, 69.94),
			vec3(22.56, -1109.89, 29.80),
			vec3(2567.69, 294.38, 108.73),
			vec3(-1117.58, 2698.61, 18.55),
			vec3(842.44, -1033.42, 28.19)
		}, targets = {
			{ loc = vec3(-660.92, -934.10, 21.94), length = 0.6, width = 0.5, heading = 180.0, minZ = 21.8, maxZ = 22.2, distance = 2.0 },
			{ loc = vec3(808.86, -2158.50, 29.73), length = 0.6, width = 0.5, heading = 360.0, minZ = 29.6, maxZ = 30.0, distance = 2.0 },
			{ loc = vec3(1693.57, 3761.60, 34.82), length = 0.6, width = 0.5, heading = 227.39, minZ = 34.7, maxZ = 35.1, distance = 2.0 },
			{ loc = vec3(-330.29, 6085.54, 31.57), length = 0.6, width = 0.5, heading = 225.0, minZ = 31.4, maxZ = 31.8, distance = 2.0 },
			{ loc = vec3(252.85, -51.62, 70.0), length = 0.6, width = 0.5, heading = 70.0, minZ = 69.9, maxZ = 70.3, distance = 2.0 },
			{ loc = vec3(23.68, -1106.46, 29.91), length = 0.6, width = 0.5, heading = 160.0, minZ = 29.8, maxZ = 30.2, distance = 2.0 },
			{ loc = vec3(2566.59, 293.13, 108.85), length = 0.6, width = 0.5, heading = 360.0, minZ = 108.7, maxZ = 109.1, distance = 2.0 },
			{ loc = vec3(-1117.61, 2700.26, 18.67), length = 0.6, width = 0.5, heading = 221.82, minZ = 18.5, maxZ = 18.9, distance = 2.0 },
			{ loc = vec3(841.05, -1034.76, 28.31), length = 0.6, width = 0.5, heading = 360.0, minZ = 28.2, maxZ = 28.6, distance = 2.0 }
		}
	}
}
