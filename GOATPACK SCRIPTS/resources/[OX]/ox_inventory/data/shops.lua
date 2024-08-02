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
	
	


	--vector4(-1813.873, -1213.438, 13.0175, 216.7009)

	





	Lodziarnia = {
		name = 'Lodziarnia',
		label = "Otwórz Sklep",
	    inventory = {
			{ name = 'lwloski', price = 85 },
			{ name = 'lczekoladowy', price = 50 },
			{ name = 'ltruskawkowy', price = 50 },
			{ name = 'swaniliowy', price = 75 },
		}, locations = {}, targets = {
			vec3(-467.2690, -31.8669, 46.9647)
		}, targets = {
			{ loc = vec3(-467.2690, -31.8669, 46.9647), length = 1.0, width = 2.0, heading = 266.8946, distance = 2.5 }
		}
	},



	VendingMachineDrinks = {
		name = 'Automat z jedzeniem',
		label = "Skorzystaj z automatu",
		inventory = {
			{ name = 'water', price = 3 },
			{ name = 'burger', price = 3 },
			{ name = 'hamburger', price = 10 },
		},
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`, `prop_vend_snak_01`,  `prop_vend_snak_01_tu`,
		}
	},
	

	Meechanik = {
        name = 'Szafke',
        groups = {
			['mechanic'] = 0
		},
		icon = "fas fa-box",
        inventory = {
			
            { name = "gps", price = 0, buyLimit = 1, itemLimit = 1 },
            { name = 'radio', price = 0, buyLimit = 1, itemLimit = 1 },
            { name = 'WEAPON_STUNGUN', price = 0, buyLimit = 1, itemLimit = 1},
			{ name = 'fixtool', price = 0, buyLimit = 1, itemLimit = 1},
			{ name = 'carotool', price = 0, buyLimit = 1, itemLimit = 1},
			{ name = 'gazbottle', price = 0, buyLimit = 1, itemLimit = 1},
        },    
locations = {}, targets = {
			vec3(559.0712, -170.7212, 53.3049)
		}, targets = {
			{ loc = vec3(559.0712, -170.7212, 53.3049), length = 1.0, width = 2.0, heading = 266.8946, distance = 2.5 }
		}

 },

	Kebab = {
        name = 'SzafkaKebab',
        groups = {
			['kebab'] = 0
		},
		icon = "fas fa-box",
        inventory = {
			
            { name = "pitamala", price = 3, buyLimit = 10, itemLimit = 10 },
            { name = 'pitaduza', price = 5, buyLimit = 10, itemLimit = 10 },
            { name = 'kebabbox', price = 5, buyLimit = 10, itemLimit = 10},
			{ name = 'megarollo', price = 8, buyLimit = 10, itemLimit = 10},
			{ name = 'persian', price = 7, buyLimit = 10, itemLimit = 10},
        }, locations = {}, targets = {
			vec3(383.5358, -934.8926, 29.4069)
		}, targets = {
			{ loc = vec3(383.5358, -934.8926, 29.4069), length = 1.0, width = 2.0, heading = 266.8946, distance = 2.5 }
		}
    },

	MexCafe = {
        name = 'Szafka Mex-Cafe',
        groups = {
			['mechanic'] = 0
		},
		icon = "fas fa-box",
        inventory = {
			
             { name = "gps", price = 0, buyLimit = 1, itemLimit = 1 },
            { name = 'radio', price = 0, buyLimit = 1, itemLimit = 1 },
            { name = 'WEAPON_STUNGUN', price = 0, buyLimit = 1, itemLimit = 1},
			{ name = 'fixtool', price = 0, buyLimit = 1, itemLimit = 1},
			{ name = 'carotool', price = 0, buyLimit = 1, itemLimit = 1},
			{ name = 'gazbottle', price = 0, buyLimit = 1, itemLimit = 1},

			
        }, locations = {}, targets = {
			vec3(559.0712, -170.7212, 53.3049)
		}, targets = {
			{ loc = vec3(559.0712, -170.7212, 53.3049), length = 1.0, width = 2.0, heading = 266.8946, distance = 2.5 }
		}
    },


	ArcadeBar = {
        name = 'Szafka Arcade',
        groups = {
			['arcade'] = 0
		},
		icon = "fas fa-box",
        inventory = {
			
            { name = "beer", price = 4, buyLimit = 10, itemLimit = 10 },
            { name = 'wine', price = 4, buyLimit = 10, itemLimit = 10 },
            { name = 'vodka', price = 6, buyLimit = 10, itemLimit = 10},
			{ name = 'tequilla', price = 3, buyLimit = 10, itemLimit = 10},
        }, locations = {}, targets = {
			vec3(-1294.2247, -300.1151, 36.0508)
		}, targets = {
			{ loc = vec3(-1294.2247, -300.1151, 36.0508), length = 1.0, width = 2.0, heading = 266.8946, distance = 2.5 }
		}
    },

	WaterDispensers = {
		name = 'Dystrybutor wody',
		inventory = {
			{ name = 'water', price = 3 },
		},
		model = {
			-742198632, -1691644768
		}
	},

	PoliceArmoury = {
        name = 'Zbrojownia',
        groups = {
			['police'] = 0
		},
		icon = "fas fa-box",
        inventory = {
			
            { name = "gps", price = 0, buyLimit = 1, itemLimit = 1 },
            { name = 'radio', price = 0, buyLimit = 1, itemLimit = 1 },
            { name = "handcuffs", price = 0, buyLimit = 1, itemLimit = 1 },
			{ name = "bodycam", price = 0, buyLimit = 1, itemLimit = 1 },
			{ name = "dashcam", price = 0, buyLimit = 1, itemLimit = 1 },
			{ name = "kamzapdsmall", price = 0, buyLimit = 2, itemLimit = 2 },
			{ name = "kamzapdbig", price = 0, buyLimit = 2, itemLimit = 2 },
            { name = 'ammo-9', price = 10, grade = 1, buyLimit = 80, itemLimit = 80},
			{ name = 'WEAPON_COMBATPISTOL', price = 1000, buyLimit = 1, itemLimit = 1 },
			{ name = 'WEAPON_GLOCK', price = 1000, buyLimit = 1, itemLimit = 1 },
            { name = 'WEAPON_FLASHLIGHT', price = 0, buyLimit = 1, itemLimit = 1 },
            { name = 'WEAPON_NIGHTSTICK', price = 0, buyLimit = 1, itemLimit = 1 },
            { name = 'WEAPON_STUNGUN', price = 0, buyLimit = 1, itemLimit = 1},
			{ name = 'WEAPON_SMOK2GRENADE', price = 300, buyLimit = 4, itemLimit = 4},
			{ name = 'WEAPON_FLASHBANG', price = 300, buyLimit = 4, itemLimit = 4},
			{ name = 'at_suppressor_light', price = 0, grade = 1, buyLimit = 1, itemLimit = 1 },
		}, locations = {
            vec3(609.8990, 1.6522, 87.8173),
        }, targets = {
            { loc = vec3(609.2990, 1.6522, 87.8173), length = 0.8, width = 2.2, heading = 76.0, minZ = 87.1, maxZ = 87.6, distance = 2.5 },
        }
    },

	AmbulanceArmoury = {
        name = 'Szafke Medyka',
        groups = {
            ['ambulance'] = 0
        },
		icon = "fas fa-box",
        inventory = {
            { name = 'medicalbag', price = 0, buyLimit = 10, itemLimit = 10 },
			{ name = 'bandage', price = 0, buyLimit = 40, itemLimit = 40 },
            { name = "gps", price = 0, buyLimit = 1, itemLimit = 1 },
            { name = 'stretcher', price = 0, buyLimit = 1, itemLimit = 1 },
			{ name = 'defibrillator', price = 0, buyLimit = 1, itemLimit = 1},
            { name = 'radio', price = 0, buyLimit = 1, itemLimit = 1 },
{ name = 'tweezers', price = 0, buyLimit = 1, itemLimit = 1 },

{ name = 'burncream', price = 0, buyLimit = 1, itemLimit = 1 },

{ name = 'suturekit', price = 0, buyLimit = 1, itemLimit = 1 },
{ name = 'icepack', price = 0, buyLimit = 1, itemLimit = 1 },

{ name = 'emstablet', price = 0, buyLimit = 1, itemLimit = 1 },


        }, locations = {
            vec3(306.6933, -601.8708, 43.2840),
        }, targets = {
            { loc = vec3(306.6933, -601.8708, 43.2840), length = 0.8, width = 2.2, heading = 340.0, minZ = 31.1, maxZ = 33.6, distance = 2.5 },
        }
    },

	DarkShop = {
		name = 'DarkShop',
		inventory = {
			--[[{ name = 'WEAPON_PISTOL', price = 220000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_GLOCK', price = 200000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_VINTAGEPISTOL', price = 290000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SNSPISTOL_MK2', price = 290000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SNSPISTOL', price = 180000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_HEAVYPISTOL', price = 380000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_PISTOL_MK2', price = 370000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'ammo-9', price = 60, currency = 'black_money' },
			{ name = 'ammo-45', price = 60, currency = 'black_money' },--]]
			{ name = 'handcuffs', price = 1300, currency = 'black_money' },
			{ name = 'trojan_usb', price = 1300, currency = 'black_money' },
			{ name = 'drill', price = 1300, currency = 'black_money' },
			{ name = 'bomba', price = 1300, currency = 'black_money' },
			{ name = 'pendrive', price = 1300, currency = 'black_money' },
			{ name = 'WEAPON_CROWBAR', price = 1300, currency = 'black_money' },
			{ name = 'dysk', price = 1300, currency = 'black_money' },
			{ name = 'moneywash_ticket', price = 2000, currency = 'black_money' },
			{ name = 'zlecenieamm', price = 3500, currency = 'black_money' },
			{ name = 'kamzacrime', price = 5000, currency = 'black_money' },
			{ name = 'weapon_dagger', price = 4500, currency = 'black_money' },
			{ name = 'weapon_knuckle', price = 2000, currency = 'black_money' },
			{ name = 'weapon_machete', price = 7500, currency = 'black_money' },
			{ name = 'weapon_bat', price = 4000, currency = 'black_money' },
			{ name = 'WEAPON_KNIFE', price = 4500, currency = 'black_money' },
			{ name = 'WEAPON_SWITCHBLADE', price = 5500, currency = 'black_money' },
			{ name = 'weed_processing_table', price = 1000, currency = 'black_money' },
			{ name = 'coca_seed', price = 1000, currency = 'black_money' },
			{ name = 'cocaine_processing_table', price = 1100, currency = 'black_money' },
		}, locations = {
			vec3(-678.2236, 5792.9023, 17.3309)
		},		model = {
			`g_m_m_chicold_01`
		}
	},

	DarkShoppacyfik1 = {
		name = 'DarkShop - Pacyfik 1',
		inventory = {
			--[[{ name = 'WEAPON_PISTOL', price = 220000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_GLOCK', price = 200000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_VINTAGEPISTOL', price = 290000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SNSPISTOL_MK2', price = 290000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SNSPISTOL', price = 180000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_HEAVYPISTOL', price = 380000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_PISTOL_MK2', price = 370000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'ammo-9', price = 60, currency = 'black_money' },
			{ name = 'ammo-45', price = 60, currency = 'black_money' },--]]
			{ name = 'drill', price = 400, currency = 'black_money' },
			{ name = 'bag', price = 250, currency = 'black_money' },
			{ name = 'cutter', price = 250, currency = 'black_money' },
			{ name = 'c4_bomb', price = 1200, currency = 'black_money' },
			{ name = 'thermite_bomb', price = 500, currency = 'black_money' },
			{ name = 'laptop', price = 200, currency = 'black_money' },
			{ name = 'hack_usb', price = 200, currency = 'black_money' },
		}, --[[locations = {
			vec3(-678.2236, 5792.9023, 17.3309)
		},--]] 		model = {
			`s_m_y_armymech_01`
		}
	},

	DarkShopbank1 = {
		name = 'DarkShop Bank',
		inventory = {
			--[[{ name = 'WEAPON_PISTOL', price = 220000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_GLOCK', price = 200000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_VINTAGEPISTOL', price = 290000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SNSPISTOL_MK2', price = 290000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SNSPISTOL', price = 180000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_HEAVYPISTOL', price = 380000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_PISTOL_MK2', price = 370000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'ammo-9', price = 60, currency = 'black_money' },
			{ name = 'ammo-45', price = 60, currency = 'black_money' },--]]
			{ name = 'dysk', price = 4000, currency = 'black_money' },
		}, --[[locations = {
			vec3(-678.2236, 5792.9023, 17.3309)
		},--]] 		model = {
			`s_m_m_ccrew_01`
		}
	},

	--[[DarkShopbank2 = {
		name = 'DarkShop Bank - 2',
		inventory = {
			{ name = 'WEAPON_PISTOL', price = 220000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_GLOCK', price = 200000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_VINTAGEPISTOL', price = 290000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SNSPISTOL_MK2', price = 290000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SNSPISTOL', price = 180000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_HEAVYPISTOL', price = 380000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_PISTOL_MK2', price = 370000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'ammo-9', price = 60, currency = 'black_money' },
			{ name = 'ammo-45', price = 60, currency = 'black_money' },
			{ name = 'keyb', price = 3500, currency = 'black_money' },
			{ name = 'keyc', price = 3500, currency = 'black_money' },
			{ name = 'keya', price = 3500, currency = 'black_money' },
		}, locations = {
            vec3(503.5754699707, -2124.3862304688, 6.0769395828247),
        }, targets = {
            { loc = vec3(503.5754699707, -2124.3862304688, 6.0769395828247), length = 0.8, width = 2.2, heading = 38.0, minZ = 5.1, maxZ = 7.6, distance = 2.5 },
        }
    },

	DarkShopbank3 = {
		name = 'DarkShop Bank - 3',
		inventory = {
			{ name = 'WEAPON_PISTOL', price = 220000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_GLOCK', price = 200000, metadata = { registered = false	}, currency = 'black_money' },
			{ name = 'WEAPON_VINTAGEPISTOL', price = 290000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SNSPISTOL_MK2', price = 290000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_SNSPISTOL', price = 180000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_HEAVYPISTOL', price = 380000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'WEAPON_PISTOL_MK2', price = 370000, metadata = { registered = false }, currency = 'black_money' },
			{ name = 'ammo-9', price = 60, currency = 'black_money' },
			{ name = 'ammo-45', price = 60, currency = 'black_money' },
			{ name = 'laptop_h', price = 500, currency = 'black_money' },
		}, locations = {
            vec3(1251.7667236328, -2578.1896972656, 42.918308258057),
        }, targets = {
            { loc = vec3(1251.7667236328, -2578.1896972656, 42.918308258057), length = 0.8, width = 2.2, heading = 38.0, minZ = 41.1, maxZ = 43.6, distance = 2.5 },
        }
    },--]]

	-- Ammunation = {
	-- 	name = 'Ammunation',
	-- 	blip = {
	-- 		id = 110, colour = 69, scale = 0.8
	-- 	}, inventory = {
	-- 		{ name = 'ammo-9', price = 80, license = 'weapon' },
	-- 		{ name = 'WEAPON_PISTOL', price = 32000, license = 'weapon' },
	-- 		{ name = 'WEAPON_GLOCK', price = 35000, metadata = { registered = true }, license = 'weapon' },
	-- 		{ name = 'WEAPON_KNIFE', price = 3500 },
	-- 		{ name = 'WEAPON_MACHETE', price = 6000 },
	-- 		{ name = 'WEAPON_KNUCKLE', price = 4000 },
	-- 		{ name = 'WEAPON_BAT', price = 4500 },
	-- 	}, locations = {
	-- 		vec3(-662.180, -934.961, 21.829),
	-- 		vec3(810.25, -2157.60, 29.62),
	-- 		vec3(1693.44, 3760.16, 34.71),
	-- 		vec3(-330.24, 6083.88, 31.45),
	-- 		vec3(252.63, -50.00, 69.94),
	-- 		vec3(22.56, -1109.89, 29.80),
	-- 		vec3(2567.69, 294.38, 108.73),
	-- 		vec3(-1117.58, 2698.61, 18.55),
	-- 		vec3(842.44, -1033.42, 28.19)
	-- 	}, targets = {
	-- 		{ loc = vec3(-660.92, -934.10, 21.94), length = 0.6, width = 0.5, heading = 180.0, minZ = 21.8, maxZ = 22.2, distance = 2.0 },
	-- 		{ loc = vec3(808.86, -2158.50, 29.73), length = 0.6, width = 0.5, heading = 360.0, minZ = 29.6, maxZ = 30.0, distance = 2.0 },
	-- 		{ loc = vec3(1693.57, 3761.60, 34.82), length = 0.6, width = 0.5, heading = 227.39, minZ = 34.7, maxZ = 35.1, distance = 2.0 },
	-- 		{ loc = vec3(-330.29, 6085.54, 31.57), length = 0.6, width = 0.5, heading = 225.0, minZ = 31.4, maxZ = 31.8, distance = 2.0 },
	-- 		{ loc = vec3(252.85, -51.62, 70.0), length = 0.6, width = 0.5, heading = 70.0, minZ = 69.9, maxZ = 70.3, distance = 2.0 },
	-- 		{ loc = vec3(23.68, -1106.46, 29.91), length = 0.6, width = 0.5, heading = 160.0, minZ = 29.8, maxZ = 30.2, distance = 2.0 },
	-- 		{ loc = vec3(2566.59, 293.13, 108.85), length = 0.6, width = 0.5, heading = 360.0, minZ = 108.7, maxZ = 109.1, distance = 2.0 },
	-- 		{ loc = vec3(-1117.61, 2700.26, 18.67), length = 0.6, width = 0.5, heading = 221.82, minZ = 18.5, maxZ = 18.9, distance = 2.0 },
	-- 		{ loc = vec3(841.05, -1034.76, 28.31), length = 0.6, width = 0.5, heading = 360.0, minZ = 28.2, maxZ = 28.6, distance = 2.0 }
	-- 	}
	-- },
}
