
--Bossmenu
Citizen.CreateThread(function()
    exports['qtarget']:AddBoxZone("mechanic-bossmenu", vector3(559.2793, -199.3148, 57.2026), 1.0, 2.6, {
        name="mechanic-bossmenu",
        heading=0,
        minZ=27.5,
        maxZ=30.5
        }, {
            options = {
                {
                    event = "goat_mechanicjob:openbossmenu",
                    label = "Komputer",
                    icon = "fas fa-sign-in-alt",
                    job = "mechanic",
                },
                {
                    event = "goat_mechanicjob:client:giveBadge",
                    icon = "fa-solid fa-display",
                    label = "Nadaj odznake",
                    job = "mechanic",
                },
            },
            distance = 1.5
    })
end)

--Clothesmenu 
Citizen.CreateThread(function()
    exports.qtarget:AddBoxZone("mechanic-clothesmenu", vector3(539.6004, -166.4145, 54.0598), 0.8, 2.8, {
        name="mechanic-clothesmenu",
        heading=0,
        minZ=28.5,
        maxZ=30.5
        }, {
            options = {
                {
                    event = "need_mechanics:openJobClothes",
                    icon = "fas fa-tshirt",
                    label = "Ubrania robocze",
                    job = "mechanic",
                },
                {
                    event = "need_mechanics:returnLastSkin",
                    icon = "fas fa-tshirt",
                    label = "Ubranie prywatne",
                    job = "mechanic",
                },
                {
                    event = "need_mechanics:createUniform",
                    icon = "fas fa-tshirt",
                    label = "Stwórz wlasny ubiór",
                    job = "mechanic",
                },
            },
            distance = 1.5
    })
end)

-- Stock Item 
Citizen.CreateThread(function()
exports.qtarget:AddBoxZone("mechanic-putitem", vector3(559.0712, -170.7212, 53.3049), 1, 1, {
	name="mechanic-putitem",
    heading=0,
    minZ=28.7,
    maxZ=31.7
	}, {
		options = {
			{
				event = "need_mechanics:openStash",
				icon = "fas fa-square",
				label = "Otwórz magazyn",
				job = "mechanic",
			},
		},
    })
end)
	

-- Vehiclemenu vec4(-193.1915, -1293.6831, 30.3465, 272.11187744141)
Citizen.CreateThread(function()
    exports['qtarget']:AddBoxZone("mechanic-vehiclemenu", vector3(540.2059, -186.0369, 52.6605), 0.8, 0.8, {
        name="mechanic-vehiclemenu",
        heading=0,
        debugPoly = false,
        minZ=23.13,
        maxZ=26.13
        }, {
            options = {
                {
                    event = "goat_mechanicjob:vehiclepspawnermenu",
                    label = "Wyjmij pojazd",
                    icon = "fas fa-sign-in-alt",
                    job = "mechanic",
                    num = 1
                },
                {
                    event = "goat_mechanicjob:schowajauto",
                    label = "Schowaj pojazd",
                    icon = "fas fa-sign-in-alt",
                    job = "mechanic",
                    num = 2
                },
            },
            distance = 1.5
    })
end)

-- Zarządzanie pojazdem
Citizen.CreateThread(function()
    exports.qtarget:Vehicle({
        options = {
            {
                event = "esx_repairkit:onUse",
                icon = "fas fa-wrench",
                label = "Napraw silnik",
                canInteract = function()
                    return not IsBusy and (exports.ox_inventory:Search('count', 'fixkit') > 0)
                end
            },
            {
                event = "esx_mechanicjob:onWash",
                icon = "fas fa-wrench",
                label = "Umyj auto",
                canInteract = function()
                    return not IsBusy and (exports.ox_inventory:Search('count', 'sponge') > 0)
                end
            },
            {
                event = "esx_mechanicjob:onCarokit",
                icon = "fas fa-wrench",
                label = "Napraw karoserię",
                canInteract = function()
                    return not IsBusy and (exports.ox_inventory:Search('count', 'carokit') > 0)
                end
            },
        },
        distance = 1.5
    })
end)

-- Harvestmenu
Citizen.CreateThread(function()
    exports['qtarget']:AddBoxZone("mechanic-harvestmenu", vector3(559.0712, -170.7212, 53.3049), 1.2, 1, {
        name="mechanic-harvestmenu",
        heading=0,
        minZ=27.5,
        maxZ=30.5
        }, {
            options = {
                {
                    event = "goat_mechanicjob:odzyskajwytrych",
                    label = "Odzyskaj wytrych",
                    icon = "fas fa-sign-in-alt",
                    job = "mechanic",
                },
                {
                    event = "goat_mechanicjob:sponge",
                    label = "Przygotuj narzędzia do mycia",
                    icon = "fas fa-sign-in-alt",
                    job = "mechanic",
                },
                {
                    event = "goat_mechanicjob:odzyskajwfixkit",
                    label = "Odzyskaj części naprawcze",
                    icon = "fas fa-sign-in-alt",
                    job = "mechanic",
                },
                {
                    event = "goat_mechanicjob:odzyskajcarokit",
                    label = "Odzyskaj części karoserii",
                    icon = "fas fa-sign-in-alt",
                    job = "mechanic",
                },
            },
            distance = 1.5
    })
end)

-- CreateHarvest
Citizen.CreateThread(function()
	exports['qtarget']:AddBoxZone("mechanic-createharvest2", vector3(559.0712, -170.7212, 53.3049), 1.8, 1, {
		name="mechanic-createharvest2",
        heading=5,
        minZ=28.3,
        maxZ=31.3
		}, {
			options = {
				{
					event = "goat_mechanicjob:stworzwytrych",
					label = "Stwórz Wytrych",
					icon = "fas fa-sign-in-alt",
					job = "mechanic",
					canInteract = function()
						return (exports.ox_inventory:Search('count', 'toolwytrych') > 0)
					end
				},
				{
					event = "goat_mechanicjob:stworznaprawke",
					label = "Stwórz Zestaw Naprawczy",
					icon = "fas fa-sign-in-alt",
					job = "mechanic",
					canInteract = function()
						return (exports.ox_inventory:Search('count', 'toolfixkit') > 0)
					end
				},
				{
					event = "goat_mechanicjob:stworzkaroserie",
					label = "Stwórz Zestaw Naprawczy Karoserii",
					icon = "fas fa-sign-in-alt",
					job = "mechanic",
					canInteract = function()
						return (exports.ox_inventory:Search('count', 'toolcarokit') > 0)
					end
				},
			},
			distance = 1.5
	})
end)
