Config = {}

Config.DevMode = false

Config.Blips = {
	{
		title = "Uwu Cafe",
		sprite = 609,
		coords = vec3(-582.4583, -1061.4111, 21.3942),
		color = 0,
		display = 4
	},
}

Config.Blips1 = {
	{
		title = "Odbierz towar #1",
		sprite = 569,
		coords = vec3(2555.6545, 386.7297, 107.6729),
		color = 0,
		display = 4
	},
}


Config.Uniforms = {
	[0] = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 698,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,   arms_2 = 0,
			pants_1 = 227,   pants_2 = 0,
			shoes_1 = 7,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,    bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			bags_1 = 0,     bags_2 = 10
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 833,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms_1 = 14,   arms_2 = 0,
			pants_1 = 276,   pants_2 = 0,
			shoes_1 = 196,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			bags_1 = 0,     bags_2 = 0
		}
	},
    [1] = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 698,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,   arms_2 = 0,
			pants_1 = 227,   pants_2 = 0,
			shoes_1 = 7,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,    bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			bags_1 = 0,     bags_2 = 10
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 833,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms_1 = 14,   arms_2 = 0,
			pants_1 = 276,   pants_2 = 0,
			shoes_1 = 196,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			bags_1 = 0,     bags_2 = 0
		}
	},
    [2] = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 698,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,   arms_2 = 0,
			pants_1 = 227,   pants_2 = 0,
			shoes_1 = 7,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,    bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			bags_1 = 0,     bags_2 = 10
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 833,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms_1 = 14,   arms_2 = 0,
			pants_1 = 276,   pants_2 = 0,
			shoes_1 = 196,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			bags_1 = 0,     bags_2 = 0
		}
	},
    [3] = {
		male = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 698,   torso_2 = 3,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,   arms_2 = 0,
			pants_1 = 227,   pants_2 = 0,
			shoes_1 = 7,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			bproof_1 = 0,    bproof_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			bags_1 = 0,     bags_2 = 10
		},
		female = {
			tshirt_1 = 15,  tshirt_2 = 0,
			torso_1 = 833,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms_1 = 14,   arms_2 = 0,
			pants_1 = 276,   pants_2 = 0,
			shoes_1 = 196,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0,
			bags_1 = 0,     bags_2 = 0
		}
	},
}

Config.Targets = {
    ['stash'] = {
        name = 'dbl_uwucafe:stash',
        pos = vec3(-590.7468, -1059.5095, 22.8121),
        radius = 0.8,
        options = {
            {
                event = "dbl_uwucafe:openstash",
                icon = "fas fa-weight-hanging",
                label = "Otwórz lodówkę",
                distance = 1.5,
                groups = {"kawiarnia"}
            },
            {
                event = "dbl_uwucafe:openpapierek",
                icon = "fas fa-weight-hanging",
                label = "Wyciągnij torbę papierową",
                distance = 1.5,
                groups = {"kawiarnia"}
            },
        }
    },
    ['vehiclemenu'] = {
        name = 'dbl_uwucafe:vehiclemenu',
        pos = vec3(-592.9047, -1061.2837, 22.3942),
        radius = 0.7,
        options = {
            {
                event = "dbl_uwucake:wyciagnijauto",
                icon = "fas fa-car",
                label = "Wyciągnij auto",
                distance = 1.5,
                groups = {"kawiarnia"}
            },
            {
                event = "dbl_uwucake:schowajauto",
                icon = "fas fa-car",
                label = "Schowaj auto",
                distance = 1.5,
                groups = {"kawiarnia"}
            },
        }
    },
    ['robienieciastka'] = {
        name = 'dbl_uwucafe:robieniezestawu',
        pos = vec3(-587.8146, -1059.8307, 22.2844),
        radius = 0.5,
        options = {
            {
                event = "dbl_uwucafe:robieniezestawu",
                icon = "fa-solid fa-mug-saucer",
                label = "Przygotuj zestaw",
                groups = {"kawiarnia"}
            },
        }
    },
    ['zabieranieskladnikow'] = {
        name = 'dbl_uwucafe:zabieranieskladnikow',
        pos = vec3(-590.7615, -1067.8947, 22.5829),
        radius = 1,
        distance = 1,
        options = {
            {
                event = "dbl_uwucafe:zabieranieskladnikow",
                icon = "fa-solid fa-mug-saucer",
                label = "Przygotuj składniki",
                groups = {"kawiarnia"}
            },
        }
    },
    ['zrobkawe'] = {
        name = 'dbl_uwucafe:makecafe',
        pos = vec3(-586.9139, -1061.8887, 22.5974),
        radius = 0.4,
        options = {
            {
                event = "dbl_uwucafe:makecafe",
                icon = "fa-solid fa-mug-saucer",
                label = "Zrób kawę",
                distance = 1.5,
                groups = {"kawiarnia"},
            },
        }
    }, 
    ['mycie'] = {
        name = 'dbl_uwucafe:umyjrece',
        pos = vec3(-587.801, -1062.6101, 22.6005),
        radius = 0.4,
        options = {
            {
                event = "dbl_uwucafe:umyjrece",
                icon = "fas fa-hand-holding-water",
                label = "Umyj Ręce",
                distance = 1.5,
                groups = {"kawiarnia"}
            },
        }
    }, 
    ['wystawrachunek'] = {
        name = 'dbl_uwucafe:kasa',
        pos = vec3(-583.98, -1061.4373, 22.5464),
        radius = 0.3,
        options = {
            {
                event = "dbl_uwucafe:kasa",
                icon = "fa-solid fa-money-bill",
                label = "Wystaw rachunek",
                distance = 1,
                groups = {"kawiarnia"}
            },
        }
    },
    ['oddajtowar'] = {
        name = 'dbl_uwucafe:oddajtowar',
        pos = vec3(-595.8586, -1055.7015, 22.3787),
        radius = 1.2,
        options = {
            {
                event = "dbl_uwucafe:oddajtowar",
                icon = "fa-solid fa-truck",
                label = "Odłóż towar",
                distance = 1.5,
                groups = {"kawiarnia"}
            },
        }
    },  
    ['towarzabierz'] = {
        name = 'dbl_uwucafe:zabierasztowar',
        pos = vec3(2553.0405, 389.8804, 108.3249),
        radius = 0.8,
        options = {
            {
                event = "dbl_uwucafe:zabierasztowar",
                icon = "fa-solid fa-truck",
                label = "Zabierz towar",
                distance = 1.5,
                groups = {"kawiarnia"}
            },
        }
    },  
    ['bossmenu'] = {
        name = 'dbl_uwucafe:bossmenu',
        pos = vec3(-596.2219, -1052.2015, 22.5536),
        radius = 0.8,
        options = {
            {
                event = "dbl_uwucafe:bossmenu",
                icon = "fa-solid fa-display",
                label = "Otwórz komputer",
                distance = 1.5,
                groups = {"kawiarnia"}
            },
        }
    }, 
    ['clothes'] = {
        name = 'dbl_uwucafe:openJobClothes',
        pos = vec3(-586.5822, -1050.1423, 22.5942),
        radius = 0.8,
        options = {
            {
                event = "dbl_uwucafe:openJobClothes",
                icon = "fa-solid fa-tshirt",
                label = "Ubrania robocze",
                distance = 1.5,
                groups = {"kawiarnia"}
            },
            {
                event = "dbl_uwucafe:returnLastSkin",
                icon = "fa-solid fa-tshirt",
                label = "Ubrania prywatne",
                distance = 1.5,
                groups = {"kawiarnia"}
            },
            {
                event = "dbl_barbershop:clothesmenu",
                icon = "fa-solid fa-tshirt",
                label = "Prywatna Garderoba",
                distance = 1.5,
                groups = {"kawiarnia"}
            },
        }
    }, 
}


