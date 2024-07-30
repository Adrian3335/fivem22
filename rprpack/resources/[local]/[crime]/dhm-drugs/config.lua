Config = {}

Config.Target = 'qtarget'

function notify(text)
	TriggerEvent('esx:showNotification', text) -- Manage notification trigger
end

--WEED
/*
Config.MinWeed = 4 -- minimal amount of weed you can get from plant
Config.MaxWeed = 8 -- max amount of weed you can get from plant
Config.MinWeedGrowTime = 320 -- minimal time (seconds) of weed growing after watering
Config.MaxWeedGrowTime = 520 -- maximum time (seconds) of weed growing after watering
*/
--Testy
Config.MinWeed = 4 -- minimal amount of weed you can get from plant
Config.MaxWeed = 8 -- max amount of weed you can get from plant
Config.MinWeedGrowTime = 3 -- minimal time (seconds) of weed growing after watering
Config.MaxWeedGrowTime = 4 -- maximum time (seconds) of weed growing after watering

--Testy

Config.WeedDry = {coords = vector3(2328.64, 2570.72, 46.83), label = "Wysusz zioło", icon = "fas fa-tablets"}
Config.WeedTable = {coords = vector3(46.5, 3714.5, 39.7-1.05), h = 240.0, label = "Zwijaj jointa", icon = "fas fa-tablets"}

Config.WeedStage = {
    [1] = {prop = 'bkr_prop_weed_01_small_01c', itemneeded = 'water', itemlabel = 'Woda', text = 'Podlej rośline', icon = "fas fa-tablets"},
    [2] = {prop = 'bkr_prop_weed_01_small_01a', itemneeded = 'water', itemlabel = 'Woda', text = 'Podlej rośline', icon = "fas fa-tablets"},
    [3] = {prop = 'bkr_prop_weed_01_small_01b',itemneeded = 'water', itemlabel = 'Woda', text = 'Podlej rośline', icon = "fas fa-tablets"},
    [4] = {prop = 'bkr_prop_weed_med_01a', itemneeded = 'water', itemlabel = 'Woda', text = 'Podlej rośline', icon = "fas fa-tablets"},
    [5] = {prop = 'bkr_prop_weed_med_01b', itemneeded = 'water', itemlabel = 'Woda', text = 'Podlej rośline', icon = "fas fa-tablets"},
    [6] = {prop = 'bkr_prop_weed_lrg_01a', itemneeded = 'water', itemlabel = 'Woda', text = 'Podlej rośline', icon = "fas fa-tablets"},
    [7] = {prop = 'bkr_prop_weed_lrg_01b', text = 'Zbierz roślinke', icon = "fas fa-tablets"}
}

--METH

Config.MethChem = {coords = vector3(2580.7, 1763.4, 25.0), label = "Szukaj chemikaliów", icon = "fas fa-tablets"}
Config.MethTable = {coords = vector3(1645.7, 4838.8, 42-1.05), h = 90.0, label = "Stół do mety", icon = "fas fa-tablets"}

--HEROIN

Config.PoppyPlantZone = {coords = vector3(2640.8, 4699.9, 35.3), range = 61.0, visiblezone = false}
Config.HeroinChem = {coords = vector3(2769.7, 4868.4, 41.1), label = "Szukaj chemikaliów", icon = "fas fa-tablets"}
Config.OpiumTable = {coords = vector3(2882.4, 4459.6, 48.5-1.05), h = 60.0, label = "Wyciąg z opium", icon = "fas fa-tablets"}
Config.HeroinTable = {coords = vector3(2879.8, 4489.9, 48.2-1.05), h = 200.0, label = "Zrób dawkę heroiny", icon = "fas fa-tablets"}
Config.MinPod = 1 -- minimal amount of poppy seed pods you can get from poppy plant
Config.MaxPod = 3 -- max amount of poppy seed pods you can get from poppy plant


Config.PoppyStage = {
    [1] = {prop = 'prop_plant_01b'},
    [2] = {prop = 'prop_cs_plant_01', text = 'Zbierz rośline', icon = "fas fa-tablets"}
}

--COKE

Config.UseTeleport = true
Config.LabEntry= {coords = vector3(749.2, 4184.4, 40.79), label = "[~b~E~w~] Laboratorium Koki"}
Config.LabCoords= {coords = vector3(997.61, -3200.49, -36.4), label = "[~b~E~w~] Laboratorium Koki"}


Config.CocaPlants = {coords = vector3(2010.2, 3369.3, 44.3), label = "Zbierz liście", icon = "fas fa-tablets"}
Config.AcidCollect = {coords = vector3(1010.185, -3194.1, -39.59), label = "Zbierz kwas", icon = "fas fa-tablets"}
Config.VicodinCrush = {coords = vector3(1004.43, -3197.2, -38.99), label = "Pokrusz Vicodin na proszek", icon = "fas fa-tablets"}
Config.AcidCanister = {coords = vector3(1012.68, -3197.26, -39.99), label = "Umieść kwas", icon = "fas fa-tablets"}
Config.Mixer = {coords = vector3(1005.85, -3200.94, -38.99), label = "Umieść proszek Vicodin i liść koki", icon = "fas fa-tablets"}
Config.Heater = {coords = vector3(1002.25, -3200.63, -39.59), label = "Włącz grzejnik", labelcold = "Cold", labelheat = "Heat", icon = "fas fa-tablets", iconcold = "fas fa-tablets", iconheat = "fas fa-tablets"}
Config.Collection = {coords = vector3(1006.05, -3194.2, -39.59), label = "Zbieraj Koke", icon = "fas fa-tablets"}

Config.Translations = {
  tooclose = "Jesteś zbyt blisko innej rośliny!",
  searching = "Szukanie...",
  dryingweed = "Suszenie chwastów",
  notenoughweed = "Potrzebujesz co najmniej 2x ziele",
  harvestplant = "Roślina żniwna",
  inneed = "Potrzebujesz: ~y~",
  growth = "Wzrost: ~b~",
  harvestready = "Gotowy, aby być ~g~Zebrany!",
  growing = "Rozwój... ~b~",
  rollingjoint = "Zwijanie Jointa",
  notenoughforjoint = "Potrzebujesz co najmniej 2x Wysuszona Marichuana i 1x Papier do zwijania",
  leavesharvested = "Zebrane liście chwastów",
  noitem = "Nie masz wymaganego przedmiotu.",
  waittogrow = "Musisz poczekać, aż chwast wyrośnie.",
  notenoughweed = "Za mało chwastów",
  notenoughpaper = "Za mało papieru do zwijania",
  notenoughbuds = "Za mało pąków chwastów",
  --METH
  cookstop = "~r~Proces gotowania został zatrzymany...",
  cookisover = "Gotowanie się skończyło!",
  cookingstarted = "Gotowanie rozpoczęte!",
  nospace = "Nie ma miejsca!",
  methitemsnotenough = "Potrzebujesz co najmniej 2x meta i 1x woreczek",
  presstostart = "Naciśnij [~b~E~w~] aby rozpocząć gotowanie",
  process = "Proces ",
  noreqitems = "Nie masz wszystkich potrzebnych przedmiotów",
  bagging = "Pakowanie mety",
  didntfind = "Niczego nie znalazłeś",
  --HEROIN
  dontgrow = "Nie rosną tu rośliny maku",
  poppycollected = "Zebrano strąki maku",
  collectpods = "Zbierz strąki nasienne",
  notenoughpods = "Potrzebujesz co najmniej 2x strąków nasiennych",
  moreitems = "Potrzebujesz więcej przedmiotów",
  extractingopium = "Wydobywanie opium...",
  makingheroin = "Dokonywanie dawki heroiny...",
  --Coke
  crushingvicodin = "Kruszenie Vicodin...",
  putacidcan = "Zbieranie kwasu...",
  cocaleavespick = "Zbieranie liści...",
  acidpour = "Wlewanie kwasu...",
  pouringmix = "Mieszanka do nalewania...",
  --Sell
  reputation = 'Reputacja: ~g~',
  sold = 'Sprzedano za ~g~',
}

-- SELL

Config.MoneyAccount = 'black_money'

Config.Price = {
	['dhm-weedjoint'] = 150,
	['dhm-pcoke'] = 200,
    ['dhm-coke'] = 200,
	['dhm-heroin'] = 300,
	['dhm-pmeth'] = 500,
}

Config.HotSpotBonus = 0.15 --15%

Config.HotSpots = {
	{
			{-1367.2, -388.3, 36.4}, -- First Hot Spot
			{-1306.4, -358.8, 36.4},
			{-1249.9, -444.1, 33.2},
			{-1300.3, -493.8, 32.9}
	},
	{
			{-1433.1, -314.3, 44.0}, -- Second Hot Spot
			{-1463.6, -282.0, 47.0},
			{-1427.0, -243.7, 46.0},
			{-1404.3, -272.3, 46.1}
	}
}

-- EFFECTS

Config.Drugs = {
    Cocaine = {
        DrugDuration = 30 * 1000, -- seconds
        AddHealth = 10,
        AddArmour = 10,
        AddStamina = 45 * 1000, -- seconds
        AddSpeedMultiplier = 1.49, -- 1.0 is zero
        -- ANIMATIONS
        AnimationSet = "MOVE_M@QUICK",
        TaskScenario = "WORLD_HUMAN_SMOKING_POT",
        TimeCycle = "spectator5",
        -- EFFECTS
        Effect = "DrugsMichaelAliensFight"
    },
    Heroin = {
        DrugDuration = 30 * 1000, -- seconds
        AddHealth = 0,
        AddArmour = 0,
        AddStamina = 0, -- seconds
        AddSpeedMultiplier = 1.0, -- 1.0 is zero
        -- ANIMATIONS
        AnimationSet = "move_m@hobo@a",
        TaskScenario = "WORLD_HUMAN_SMOKING_POT",
        TimeCycle = "spectator6",
        -- EFFECTS
        Effect = "HeistCelebPass"
    },
    Marijuana = {
        DrugDuration = 30 * 1000, -- seconds
        AddHealth = 0,
        AddArmour = 0,
        AddStamina = 0, -- seconds
        AddSpeedMultiplier = 1.0, -- 1.0 is zero
        -- ANIMATIONS
        AnimationSet = "MOVE_M@DRUNK@VERYDRUNK",
        TaskScenario = "WORLD_HUMAN_SMOKING_POT",
        TimeCycle = "spectator6",
        -- EFFECTS
        Effect = "ChopVision"
    },
    Methamphetamine = {
        DrugDuration = 30 * 1000, -- seconds
        AddHealth = 0,
        AddArmour = 0,
        AddStamina = 0, -- seconds
        AddSpeedMultiplier = 1.0, -- 1.0 is zero
        -- ANIMATIONS
        AnimationSet = "move_m@drunk@slightlydrunk",
        TaskScenario = "WORLD_HUMAN_SMOKING_POT",
        TimeCycle = "spectator5",
        -- EFFECTS
        Effect = "SuccessMichael"
    },
}