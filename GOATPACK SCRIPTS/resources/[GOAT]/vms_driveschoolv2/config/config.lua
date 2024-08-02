Config = {}

-- █▀ █▀▄ ▄▀▄ █▄ ▄█ ██▀ █   █ ▄▀▄ █▀▄ █▄▀
-- █▀ █▀▄ █▀█ █ ▀ █ █▄▄ ▀▄▀▄▀ ▀▄▀ █▀▄ █ █
Config.Core = "ESX" -- "ESX" / "QB-Core"
Config.CoreExport = function()
    return exports["es_extended"]:getSharedObject()

    -- return exports['qb-core']:GetCoreObject()
end

Config.PlayerLoaded = 'esx:playerLoaded'
-- @Config.PlayerLoaded for ESX: 'esx:playerLoaded'
-- @Config.PlayerLoaded for QB-Core: 'QBCore:Client:OnPlayerLoaded'

Config.Notification = function(message, type)
    if type == "success" then
        TriggerEvent('esx:showNotification', message)
        -- TriggerEvent('QBCore:Notify', message, 'success', 5000)
    elseif type == "error" then
        TriggerEvent('esx:showNotification', message)
        -- TriggerEvent('QBCore:Notify', message, 'error', 5000)
    end
end

Config.Interact = {
    Enabled = false,
    Open = function(message)
        exports["interact"]:Open("E", message) -- Here you can use your TextUI or use my free one - https://github.com/vames-dev/interact
        -- exports['qb-core']:DrawText(message, 'right')
    end,
    Close = function()
        exports["interact"]:Close() -- Here you can use your TextUI or use my free one - https://github.com/vames-dev/interact
        -- exports['qb-core']:HideText()
    end,
}


-- ▀█▀ █▀▄ ▄▀▄ █▄ █ ▄▀▀ █   ▄▀▄ ▀█▀ ██▀
--  █  █▀▄ █▀█ █ ▀█ ▄██ █▄▄ █▀█  █  █▄▄
Config.Translate = {
    ['open_menu'] = "Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu",
    ['menu.title'] = {icon = '', label = "Wybierz egzamin"},
    ['menu.theory_a'] = {icon = 'far fa-file-alt', label = "Teoria A(%s$)"},
    ['menu.practical_a'] = {icon = 'fas fa-motorcycle', label = "Praktyka A (%s$)"},
    ['menu.theory_b'] = {icon = 'far fa-file-alt', label = "Teoria B (%s$)"},
    ['menu.practical_b'] = {icon = 'fas fa-car-side', label = "Praktyka B (%s$)"},
    ['menu.theory_c'] = {icon = 'far fa-file-alt', label = "Teoria C (%s$)"},
    ['menu.practical_c'] = {icon = 'fas fa-truck', label = "Praktyka C (%s$)"},

    ['exceeded_speed_limit'] = "Przekroczyłeś limit prędkości (%s/%s), limit prędkości wynosi %s km/h",
    ['vehicle_was_damaged'] = "Pojazd został uszkodzony (%s/%s)",
    ['exceeded_error_limit'] = "Przekroczyłeś limit błędów, musisz wrócić do szkoły jazdy.",
    ['started_practical'] = "Rozpocząłeś egzamin praktyczny, postępuj zgodnie z instrukcjami egzaminatorów.",
    ['complete_theory'] = "Naciśnij ~INPUT_CONTEXT~, aby zakończyć egzamin teoretyczny.",
    
    ['success_practical'] = "Gratulacje, zdałeś egzamin na prawo jazdy.",
    ['failed_practical'] = "Niestety, nie zdałeś egzaminu na prawo jazdy.",
    
    ['the_maneuvering_area_is_occupied'] = "Obszar manewrowy jest zajęty.", -- Config.CheckIsManeuveringAreaIsOccupied
    
    ['not_enough_cash'] = "Nie masz wystarczającej ilości pieniędzy na ten egzamin",
    ['not_enough_cash_and_bank'] = "Nie masz wystarczającej ilości gotówki i pieniędzy na koncie bankowym na ten egzamin",
    }    


-- █▄ ▄█ ▄▀▄ █ █▄ █   ▄▀▀ ██▀ ▀█▀ ▀█▀ █ █▄ █ ▄▀  ▄▀▀
-- █ ▀ █ █▀█ █ █ ▀█   ▄██ █▄▄  █   █  █ █ ▀█ ▀▄█ ▄██
Config.AccessOnMarker = false -- Do you want to use access to the exam selection menu as E in marker?
Config.UseTarget = true
Config.TargetResource = 'ox_target'
Config.Target = function()
    exports[Config.TargetResource]:addBoxZone({
        coords = vec(Config.Zones["menu"].coords.x, Config.Zones["menu"].coords.y, Config.Zones["menu"].coords.z+0.35),
        size = vec(4.0, 4.0, 4.0),
        debug = false,
        useZ = true,
        rotation = 60,
        distance = 9.0,
        options = {
            {
                name = 'driveschoolv2',
                event = 'vms_driveschoolv2:openMenu',
                icon = 'fa-regular fa-file-lines',
                label = "Nauka Jazdy"
            }
        }
    })
end


Config.UseSoundsUI = true -- Do you want to use interaction sounds in the UI?
Config.EnableBlur = true -- Do you want to blur the background in the game when you have the UI running?

Config.PossibleChargeByBank = true -- if you set it true, when the player does not have enough cash, it will try to take it from his bank account

Config.EnableMaxSpeedLoop = true
Config.MaxSpeedLoopTimeout = 1000 -- if Config.EnableMaxSpeedLoop = true and exceeds the maximum speed, will have 1 second (1000 milliseconds) to reduce the speed, otherwise another error will be charged
Config.MaxSpeed = 50 -- if you don't want a speed limit set nil
Config.SpeedMultiplier = 3.6 -- kmh = 3.6 / mph = 2.236936

Config.MaxDriveErrors = 5 -- How much maximum a player can get bugs for vehicle damage, on 5 will require going back to driving school and failing the test

Config.CheckIsManeuveringAreaIsOccupied = true -- If the maneuvering area is occupied, the practical exam will not start and the player will receive notification about it

Config.Examiner = {
    Enabled = true, -- Do you want to use a ped as an examiner who sits with the player in the vehicle?
    SpokenCommands = true,
    SpokenLanguage = "EN", -- "EN", "DE", "BG", "ES", "FR", "PT"
    PedModel = 'ig_fbisuit_01' -- https://wiki.rage.mp/index.php?title=Peds
}

Config.Licenses = {
    Theory = {
        ['A'] = {name = 'theory_a', price = 150, enabled = true},
        ['B'] = {name = 'theory_b', price = 100, enabled = true},
        ['C'] = {name = 'theory_c', price = 500, enabled = true}
    },
    Practical = {
        ['A'] = {name = 'drive_a', price = 450, enabled = true},
        ['B'] = {name = 'drive_b', price = 400, enabled = true},
        ['C'] = {name = 'drive_c', price = 1500, enabled = true}
    }
}

Config.Questions = {
    ['A'] = {
        QuestionsCount = 18, -- Number of all questions for the draw pool
        QuestionToAnswer = 18, -- Questions the player will have to answer
        NeedAnswersToPass = 1, -- Number of questions a player must answer correctly to pass the theory exam
    },
    ['B'] = {
        QuestionsCount = 17,
        QuestionToAnswer = 17,
        NeedAnswersToPass = 1,
    },
    ['C'] = {
        QuestionsCount = 5,
        QuestionToAnswer = 5,
        NeedAnswersToPass = 3,
    },
}

Config.Tasks = {
    {label = "Uruchom silnik", id = 1}, 
    -- DE: Starte den Motor
    -- BG: ??????????? ?????????
    -- ES: Encender el motor
    -- FR: D�marre le moteur
    -- PT: Ligue o Motor

    {label = "Wlacz swiatla", id = 2}, 
    -- DE: Schalte die Scheinwerfer ein
    -- BG: ???????? ?????????? ?? ??????????
    -- ES: Enciende las luces
    -- FR: Allume les phares
    -- PT: Ligue as luzes

    {label = "Jedz prosto", id = 3}, 
    -- DE: Fahre die Rampe hoch
    -- BG: ?????? ?? ?? ??????????
    -- ES: Sube a la elevaci�n
    -- FR: Monte sur la plateforme
    -- PT: Dirija-se para a rampa

    {label = "Zaparkuj tylem na skos", id = 4}, 
    -- DE: Parke in die Parkl�cke ein
    -- BG: ?????????? ?? ?????? ??????
    -- ES: Parquea en la inclinaci�n trasera
    -- FR: Gare toi en biais arriere
    -- PT: Estacione de marcha-atr�s

    {label = "Zaparkuj rownolegle przodem", id = 5}, 
    -- DE: Parke dort in Fahrtrichtung ein
    -- BG: ?????????? ????????? ??????
    -- ES: Parquea paralelo en el frente
    -- FR: Gare toi en parallele a l'avant
    -- PT: Estacione paralelamente de frente

    -- {label = "ID 6 N'A PAS DE MANOUVRES SP�CIALES", id = 6},

    {label = "Zaparkuj rownolegle tylem", id = 7}, 
    -- DE: Parke r�ckw�rts ein
    -- BG: ?????????? ????????? ?????
    -- ES: Parquea paralelo al rev�s
    -- FR: Gare toi en parallele a l'arriere
    -- PT: Estacione paralelamente de marcha-atr�s

    {label = "Opusc strefe manewrow", id = 8}, 
    -- DE: Verlasse den Verkehrs�bungsplatz
    -- BG: ????????? ?????? ?? ???????????
    -- ES: Deja el �rea de maniobra
    -- FR: Quitte la zone de manouvre
    -- PT: Saia da zona de manobras

    {label = "Wjedz na droge publiczna", id = 9}, 
    -- DE: Fahre auf die Stra�e
    -- BG: ????????? ?? ?? ????????? ???
    -- ES: Sube a una carretera p�blica
    -- FR: Emprunte une route publique
    -- PT: Entre na estrada

    {label = "Zatrzymaj sie przed przejsciem dla pieszych", id = 10}, 
    -- DE: Halte am Stoppschild
    -- BG: ?????? ????? ????a?a ?? ????????
    -- ES: Detente antes de los carriles
    -- FR: Arrete-toi avant le passage pi�ton
    -- PT: Pare antes da linha

    {label = "Wolna jazda <span>0,00</span>km / 2,00km", id = 11},

    {label = "Wroc do szkoly jazdy", id = 12}, 
    -- DE: Fahre zur�ck zur Fahrschule
    -- BG: ??????? ?? ? ???????????
    -- ES: Volver a la escuela de conducci�n
    -- FR: Retourne a l'�cole de conduite
    -- PT: Volte para a escola de condu�ao
}

Config.Zones = {
    ["menu"] = {
        menuType = "ox_lib", -- "esx_menu_default" / "esx_context" / "qb-menu" / "ox_lib"
        menuPosition = 'left', -- only for esx_menu_default and esx_context
        coords = vector3(-893.67, -2402.06, 14.125),
        marker = {
            id = 36, -- https://docs.fivem.net/docs/game-references/markers/
            color = {115, 255, 115, 120}, -- R(ed), G(reen), B(lue), A(lpha)
            scale = vec(0.65, 0.65, 0.65),
            bobUpAndDown = false, -- jumping marker
            rotate = true -- rotating marker
        },
        blip = { -- https://docs.fivem.net/docs/game-references/blips/
            sprite = 315,
            display = 4,
            scale = 0.8,
            color = 46,
            name = "Nauka Jazdy"
        }
    },
    ["return_vehicle"] = {
        coords = vector3(-890.08, -2377.37, 12.94),
        marker = {
            id = 1, -- https://docs.fivem.net/docs/game-references/markers/
            color = {255, 0, 0, 120}, -- R(ed), G(reen), B(lue), A(lpha)
            scale = vec(1.5, 1.5, 0.75),
            bobUpAndDown = false, -- jumping marker
            rotate = true -- rotating marker
        },
        blip = { -- https://docs.fivem.net/docs/game-references/blips/
            sprite = 467,
            display = 4,
            scale = 1.0,
            color = 2,
            routeColor = 2,
            name = "Return to Drive School"
        }
    }
}

Config.Practical = {
    ['Vehicles'] = { -- https://docs.fivem.net/docs/game-references/vehicle-models/
        A = 'pcj',
        B = 'premier',
        C = 'boxville_vms',
    },
    ['Marker'] = { -- https://docs.fivem.net/docs/game-references/markers/
        id = 20, 
        size = vec(0.35, 0.35, 0.35),
        rotate = {0.0, 180.0, 0.0},
        rgba = {255, 255, 0, 140},
        rotataing = true
    },
    ['Blip'] = { -- https://docs.fivem.net/docs/game-references/blips/
        sprite = 270,
        display = 4,
        scale = 0.8,
        color = 28,
        routeColor = 28,
        name = "Point"
    },
    ['SpawnPoint'] = vector4(-723.38, -2210.23, 4.9, 49.79),
}

Config.PracticalTest = { -- if you don't know what each action does, don't touch it to avoid spoiling the exam route
    [1] = {
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_1.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                if GetIsVehicleEngineRunning(myVehicle) then
                    SetVehicleLightsMode(myVehicle, 1)
                    SendNUIMessage({action = 'updateTasks', done = 1})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [2] = {
        action = function()
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local _, lights, highbeams = GetVehicleLightsState(myVehicle)
                if lights then
                    setBlipToPoint(3)
                    SendNUIMessage({action = 'updateTasks', done = 2})
                    FreezeEntityPosition(myVehicle, false)
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [3] = {
        coords = vector3(-744.0247, -2192.9700, 5.2),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_test.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local current = Config.PracticalTest[3]
                local distance = #(myCoords - current.coords)
                DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.35), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                if distance < 1.5 then
                    setBlipToPoint(4)
                    --FreezeEntityPosition(myVehicle, true)
                    --Citizen.Wait(2000)
                    --FreezeEntityPosition(myVehicle, false)
                    SendNUIMessage({action = 'updateTasks', done = 3})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [4] = {
        coords = vector3(-763.08, -2205.39, 5.2),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_4.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myCoords = GetEntityCoords(PlayerPedId())
                local current = Config.PracticalTest[4]
                local distance = #(myCoords - current.coords)
                DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.25), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                if distance < 1.5 then
                    setBlipToPoint(5)
                    SendNUIMessage({action = 'updateTasks', done = 4})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [5] = {
        coords = vector4(-774.34, -2215.93, 5.2, 141.49),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_5.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local current = Config.PracticalTest[5]
                local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.25), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                if distance < 1.5 then
                    setBlipToPoint(6)
                    SetEntityCoords(myVehicle, current.coords.x, current.coords.y, current.coords.z)
                    SetEntityHeading(myVehicle, current.coords.w)
                    SendNUIMessage({action = 'updateTasks', done = 5})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [6] = {
        coords = vector3(-782.78, -2221.99, 5.2),
        action = function()
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myCoords = GetEntityCoords(PlayerPedId())
                local current = Config.PracticalTest[6]
                local distance = #(myCoords - current.coords)
                DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.25), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                if distance < 1.5 then
                    setBlipToPoint(7)
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [7] = {
        coords = vector4(-775.85, -2217.02, 5.2, 138.45),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_7.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local current = Config.PracticalTest[7]
                local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.25), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                if distance < 1.5 then
                    setBlipToPoint(8)
                    SetEntityCoords(myVehicle, current.coords.x, current.coords.y, current.coords.z)
                    SetEntityHeading(myVehicle, current.coords.w)
                    SendNUIMessage({action = 'updateTasks', done = 7})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [8] = {
        coords = vector3(-713.93, -2224.48, 5.1),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_8.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myCoords = GetEntityCoords(PlayerPedId())
                local current = Config.PracticalTest[8]
                local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.25), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                if distance < 1.5 then
                    setBlipToPoint(9)
                    SendNUIMessage({action = 'updateTasks', done = 8})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [9] = {
        coords = vector3(-688.92, -2219.61, 5.24),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_9.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myCoords = GetEntityCoords(PlayerPedId())
                local current = Config.PracticalTest[9]
                local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.4), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                if distance < 1.5 then
                    setBlipToPoint(10)
                    SendNUIMessage({action = 'updateTasks', done = 9})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [10] = {
        coords = vector3(-624.89, -2258.02, 5.23),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_10.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myCoords = GetEntityCoords(PlayerPedId())
                local current = Config.PracticalTest[10]
                local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.4), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                if distance < 1.5 then
                    local veh = GetVehiclePedIsIn(PlayerPedId(),false)
                    RequestModel(GetHashKey('a_m_m_polynesian_01'))
                    while not HasModelLoaded(GetHashKey('a_m_m_polynesian_01')) do
                        Wait(1)
                    end
                    local npc = CreatePed(4, GetHashKey('a_m_m_polynesian_01'), vector3(-624.91, -2268.52, 4.95), 321.79, false, true)
                    TaskPedSlideToCoord(npc, vector3(-610.01, -2248.67, 5.1), 321.79, 1.0)
                    FreezeEntityPosition(veh, true)
                    Citizen.Wait(11500)
                    FreezeEntityPosition(veh, false)
                    setBlipToPoint(11)
                    SendNUIMessage({action = 'updateTasks', done = 10})
                    Citizen.Wait(2500)
                    DeletePed(npc)
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [11] = {
        action = function()
            local hasKM = 0
            while currentExam and driveErrors < Config.MaxDriveErrors do
                Citizen.Wait(50)
                if not ((IsControlPressed(0,71) and IsControlPressed(0,63)) or (IsControlPressed(0,71) and IsControlPressed(0,64))) then
                    local veh = GetVehiclePedIsIn(PlayerPedId(),false)
                    Citizen.Wait(1)
                    showKM = math.floor(hasKM * 1.33)/1000
                    local oldPos = GetEntityCoords(PlayerPedId())
                    Citizen.Wait(1000)
                    local curPos = GetEntityCoords(PlayerPedId())
                    if IsVehicleOnAllWheels(veh) then
                        dist = GetDistanceBetweenCoords(oldPos.x, oldPos.y, oldPos.z, curPos.x, curPos.y, curPos.z, true)
                    else
                        dist = 0
                    end
                    hasKM = hasKM + dist/1000
                    SendNUIMessage({action = 'updateDriveProgress', count =  hasKM, id = 11})
                    if hasKM > 1.00 then
                        SendNUIMessage({action = 'updateDriveProgress', count = 1.00, id = 11})
                        SendNUIMessage({action = 'updateTasks', done = 11})
                        setBlipToSchool(true)
                        break
                    end
                end
            end
        end
    },
    [12] = {
        action = function()
            local inRange = false
            local shown = false
            if Config.Examiner.SpokenCommands and currentExam and (driveErrors < Config.MaxDriveErrors or driveErrors >= Config.MaxDriveErrors) then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_12.mp3'})
            end
            while currentExam do
                inRange = false
                local sleep = true
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                if myVehicle then
                    local myCoords = GetEntityCoords(myVehicle)
                    local returnTable = Config.Zones["return_vehicle"]
                    local distance = #(myCoords - returnTable.coords)
                    if distance < 25.0 then
                        sleep = false
                        DrawMarker(returnTable.marker.id, returnTable.coords.x, returnTable.coords.y, returnTable.coords.z, 0, 0, 0, 0, 0, 0, returnTable.marker.scale, returnTable.marker.color[1], returnTable.marker.color[2], returnTable.marker.color[3], returnTable.marker.color[4], returnTable.marker.bobUpAndDown, false, false, returnTable.marker.rotate, false, false, false)
                        if distance < 1.5 then
                            inRange = true
                            if Config.Core == "ESX" and not Config.Interact.Enabled then
                                ESX.ShowHelpNotification(Config.Translate['complete_theory'])
                            end
                            if IsControlJustPressed(0, 38) then
                                DeleteVehicle(myVehicle)
                                if Config.Examiner.Enabled then
                                    DeletePed(examinerPed)
                                end
                                setBlipToSchool(false)
                                SendNUIMessage({action = 'updateTasks', done = 12})
                                SendNUIMessage({action = 'closeTasks'})
                                if Config.Interact.Enabled then
                                    Config.Interact.Close()
                                end
                                break
                            end
                        end
                    end
                    if Config.Interact.Enabled then
                        if inRange and not shown then
                            shown = true
                            Config.Interact.Open(Config.Translate['complete_theory'])
                        elseif not inRange and shown then
                            shown = false
                            Config.Interact.Close()
                        end
                    end
                end
                Citizen.Wait(sleep and 1000 or 1)
            end
        end
    },
}