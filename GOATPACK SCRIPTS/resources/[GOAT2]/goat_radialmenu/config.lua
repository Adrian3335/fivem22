Config = {}

Config.MenuItems = {
    {
        id = 'needrp-menuglowne',
        tip = 'Menu Główne Postaci',
        displayName = 'Menu Główne',
        key = 'F1',
        enableMenu = function()
            return true
        end,
        items = {}
    },
}

Config.MenuAdd = {
    -- TELEFON
    {
        id = "needrp-menuglowne",
        addElement = function()
            return true
        end,
        item ="phone",
        items = {
            {
                id = "telefon",
                title = "Telefon",
                icon = "#phone",
                type = "client",
                event = "gks:use",
                shouldClose = true,
            },
        }
    },
    -- {
    --     id = "needrp-menuglowne",
    --     addElement = function()
    --         return true
    --     end,
    --     items = {
    --         {
    --             id = "sklep",
    --             title = "Sklep",
    --             icon = "#shop",
    --             type = "client",
    --             event = "goat_itemshop:open",
    --             shouldClose = true,
    --         },
    --     }
    -- },

    {
        id = "needrp-menuglowne",
        addElement = function()
            return true
        end,
        items = {
            {
                id = "skille",
                title = "Statystyki",
                icon = "#sport",
                type = "client",
                event = "pokastaty-skxxs",
                shouldClose = true,
            },
        }
    },
    -- MENU POJAZDU
    {
        id = "needrp-menuglowne",
        addElement = function()
            return IsPedSittingInAnyVehicle(PlayerPedId())
        end,
        items = {
            {
                id = "pojazd",
                title = "Menu Pojazdu",
                icon = "#car",
                items = {
                    {
                        id = "sterowaniepojazdem",
                        title = "Sterowanie Pojazdem",
                        icon = "#car",
                        items = {
                            {
                                id = "menupojazdu-maska",
                                title = "Maska",
                                icon = "#car_door",
                                type = "client",
                                event = "need_radialmenu:toggleDoor",
                                eventData = {what = 4},
                                shouldClose = false,
                            },
                            {
                                id = "menupojazdu-przednielewedrzwi",
                                title = "Lewe Przednie Drzwi",
                                icon = "#car_door",
                                type = "client",
                                event = "need_radialmenu:toggleDoor",
                                eventData = {what = 0},
                                shouldClose = false,
                            },
                            {
                                id = "menupojazdu-przednieprawedrzwi",
                                title = "Prawe Przednie Drzwi",
                                icon = "#car_door",
                                type = "client",
                                event = "need_radialmenu:toggleDoor",
                                eventData = {what = 1},
                                shouldClose = false,
                            },
                            {
                                id = "menupojazdu-tylnielewedrzwi",
                                title = "Lewe Tylnie Drzwi",
                                icon = "#car_door",
                                type = "client",
                                event = "need_radialmenu:toggleDoor",
                                eventData = {what = 2},
                                shouldClose = false,
                            },
                            {
                                id = "menupojazdu-tylnieprawedrzwi",
                                title = "Prawe Tylnie Drzwi",
                                icon = "#car_door",
                                type = "client",
                                event = "need_radialmenu:toggleDoor",
                                eventData = {what = 3},
                                shouldClose = false,
                            },
                            {
                                id = "menupojazdu-bagaznik",
                                title = "Bagażnik",
                                icon = "#car_door",
                                type = "client",
                                event = "need_radialmenu:toggleDoor",
                                eventData = {what = 5},
                                shouldClose = false,
                            },
                        }
                    },
                    {
                        id = "menupojazdu-przesiadanie",
                        title = "Zmień miejsce",
                        icon = "#car_seat",
                        items = {

                            {
                                id = "menupojazdu-bagaznik",
                                title = "Siedzenie kierowcy",
                                icon = "#car_seat",
                                type = "client",
                                event = "need_radialmenu:seat1",
                                eventData = {what = 1},
                                shouldClose = true,
                            }, 
                            {
                                id = "menupojazdu-bagaznik",
                                title = "Siedzenie pasażera",
                                icon = "#car_seat",
                                type = "client",
                                event = "need_radialmenu:seat2",
                                eventData = {what = 2},
                                shouldClose = true,
                            }, 
                            {
                                id = "menupojazdu-bagaznik",
                                title = "Siedzenie z tyłu lewa strona",
                                icon = "#car_seat",
                                type = "client",
                                event = "need_radialmenu:seat3",
                                eventData = {what = 3},
                                shouldClose = true,
                            }, 
                            {
                                id = "menupojazdu-bagaznik",
                                title = "Siedzenie z tyłu prawa strona",
                                icon = "#car_seat",
                                type = "client",
                                event = "need_radialmenu:seat4",
                                eventData = {what = 4},
                                shouldClose = true,
                            }, 
                        }
                    },
                    {
                        id = "menupojazdu-schowek",
                        title = "Samochodowe",
                        icon = "#carradio",
                        type = "client",
                        event = "radio",
                        shouldClose = true,
                    },
                }
            },
        }
    },

    {
        id = "needrp-menuglowne",
        addElement = function()
            return IsPedSittingInAnyVehicle(PlayerPedId())
        end,
        item = 'lithium',
        items = {
            {
                id = "pojazd",
                title = "Gotuj mete",
                icon = "#lancuch",
                type = "client",
                event = "randol_methvan:radial",
                shouldClose = true,
            },
            },
        },
    


    -- ANIMIACJE
    {
        id = "needrp-menuglowne",
        addElement = function()
            return true
        end,
        items = {
            {
                id = "animacje",
                title = "Animacje",
                icon = "#animacje",
                type = "client",
                event = 'goat_animations:openMenu',
                shouldClose = true,
            },
           
        }
    },
    -- MENU UBRAŃ
    {
        id = "needrp-menuglowne",
        addElement = function()
            return true
        end,
        items = {
            {
                id = "postac",
                title = "Postać",
                icon = "#person",
                items = { 
                    {
                        id = "ubrania",
                        title = "Ubrania",
                        icon = "#akcesoria",
                        items = { 
                            {
                                id    = 'czapka',
                                title = 'Czapka',
                                icon = '#czapka',
                                type = 'client',
                                event = 'czapka',
                                shouldClose = true
                            },

                            {
                                id    = 'maska',
                                title = 'Maska',
                                icon = '#maska',
                                type = 'client',
                                event = 'maska',
                                shouldClose = true
                            },

                            {
                                id    = 'torso',
                                title = 'Tulow',
                                icon = '#ubranko',
                                type = 'client',
                                event = 'koszulka',
                                shouldClose = true
                            },

                            {
                                id    = 'spodnie',
                                title = 'Spodnie',
                                icon = '#spodnie',
                                type = 'client',
                                event = 'jeans',
                                shouldClose = true
                            },
                            {
                                id    = 'uszy',
                                title = 'Uszy',
                                icon = '#ears',
                                type = 'client',
                                event = 'uszy',
                                shouldClose = true
                            },

                            {
                                id    = 'torba',
                                title = 'Torba',
                                icon = '#bag',
                                type = 'client',
                                event = 'torba',
                                shouldClose = true
                            },

                            {
                                id    = 'okulary',
                                title = 'Okulary',
                                icon = '#okulary',
                                type = 'client',
                                event = 'okulary',
                                shouldClose = true
                            },
                         
                        }               
                    },
                    {
                        id = "dokumenty",
                        title = "Dokumenty",
                        icon = "#dokumenty",
                        items = { 
                            {
                                id    = 'dowod',
                                title = 'Licencje',
                                icon = '#dokumenty',
                                type = 'client',
                                event = 'needrp:pokazdowod',
                                shouldClose = true
                            },
                         
                        }               
                    },
                }
            },
        }
    },


  
    {
        id = "needrp-menuglowne",
        addElement = function()
            return true
        end,
        items = {
            {
                id = "rockstarmenu",
                title = "Rockstar Editor",
                icon = "#camera",
                items = { 
                    {
                        id = "zacznij-rockstar",
                        title = "Rozpocznij clipa",
                        icon = "#camera-start",
                        type = "client",
                        event = "rockstar:rozpocznijnagrywanie",
                        shouldClose = true,
                    },
                    {
                        id = "zapisz-rockstar",
                        title = "Zapisz clipa",
                        icon = "#camera-stop",
                        type = "client",
                        event = "rockstar:zapisznagranie",
                        shouldClose = true,
                    },
                    {
                        id = "usun-rockstar",
                        title = "Usuń clipa",
                        icon = "#camera-remove",
                        type = "client",
                        event = "rockstar:deleteclip",
                        shouldClose = true,
                    },
                    {
                        id = "edytor-rockstar",
                        title = "Edytuj clipa",
                        icon = "#camera-edit",
                        type = "client",
                        event = "rockstar:editor",
                        shouldClose = true,
                    },
                }
            },
        }
    },
    -- DOKUMENTY

    {
        id = "needrp-menuglowne",
        addElement = function()
            return ESX.PlayerData.job.name == "ambulance"
        end,
        items = {
            {
                id = "menupracy-ems",
                title = "Menu Pracy EMS",
                icon = "#job",
                items = {
                    {
                        id = "tablet-ems",
                        title = "Tablet EMS",
                        icon = "#tablet",
                        type = "client",
                        event = "cc-tablet:ems",
                        shouldClose = true,
                    },
                    {
                        id = "legitymacja-ems",
                        title = "Legitymacja",
                        icon = "#odznaka",
                        type = "client",
                        event = "needrp:pokazlegitke",
                        shouldClose = true,
                    },
                    {
                        id = "radio-lst",
                        title = "Radio",
                        icon = "#radio_person",
                        items = {
                            {
                                id = "radio-OFF-ems",
                                title = "OFF",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 0},
                                shouldClose = true,
                            },
                            {
                                id = "radio-3-ems",
                                title = "EMS (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 5},
                                shouldClose = true,
                            },
                            {
                                id = "radio-4-ems",
                                title = "EMS (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 6},
                                shouldClose = true,
                            },
                            {
                                id = "radio-1-ems",
                                title = "LSPD (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 1},
                                shouldClose = true,
                            },
                            {
                                id = "radio-2-ems",
                                title = "LSPD (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 2},
                                shouldClose = true,
                            },
                            {
                                id = "radio-2-ems",
                                title = "LSPD (#3)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 3},
                                shouldClose = true,
                            },
                            {
                                id = "radio-2-ems",
                                title = "LSPD (#4)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 4},
                                shouldClose = true,
                            },
                            {
                                id = "radio-5-ems",
                                title = "LSCM (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 7},
                                shouldClose = true,
                            },
                            {
                                id = "radio-6-ems",
                                title = "LSCM (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 8},
                                shouldClose = true,
                            },
                        }
                    },

                }
            },
        }
    },

    {
        id = "needrp-menuglowne",
        addElement = function()
            return ESX.PlayerData.job.name == "doj"
        end,
        items = {
            {
                id = "menupracy-doj",
                title = "Menu Pracy DOJ",
                icon = "#job",
                items = {
                    {
                        id = "tablet-doj",
                        title = "Tablet DOJ",
                        icon = "#tablet",
                        type = "client",
                        event = "esx_dojmdt:OpenMDT",
                        shouldClose = true,
                    },
                    {
                        id = "legitka-lscm",
                        title = "Legitymacja",
                        icon = "#odznaka",
                        type = "client",
                        event = "needrp:pokazlegitke",
                        shouldClose = true,
                    },
                    {
                        id = "radio-lst",
                        title = "Radio",
                        icon = "#radio_person",
                        items = {
                            {
                                id = "radio-OFF-doj",
                                title = "OFF",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 0},
                                shouldClose = true,
                            },
                            {
                                id = "radio-3-doj",
                                title = "DOJ (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 9},
                                shouldClose = true,
                            },
                            {
                                id = "radio-3-doj",
                                title = "DOJ (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 10},
                                shouldClose = true,
                            },
                            {
                                id = "radio-3-doj",
                                title = "EMS (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 5},
                                shouldClose = true,
                            },
                            {
                                id = "radio-4-doj",
                                title = "EMS (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 6},
                                shouldClose = true,
                            },
                            {
                                id = "radio-1-doj",
                                title = "LSPD (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 1},
                                shouldClose = true,
                            },
                            {
                                id = "radio-2-doj",
                                title = "LSPD (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 2},
                                shouldClose = true,
                            },
                            {
                                id = "radio-2-doj",
                                title = "LSPD (#3)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 3},
                                shouldClose = true,
                            },
                            {
                                id = "radio-2-doj",
                                title = "LSPD (#4)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 4},
                                shouldClose = true,
                            },
                            {
                                id = "radio-5-doj",
                                title = "LSCM (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 7},
                                shouldClose = true,
                            },
                            {
                                id = "radio-6-lscm",
                                title = "LSCM (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 8},
                                shouldClose = true,
                            },
                        }
                    },
                }
            },
        }
    },

    {
        id = "needrp-menuglowne",
        addElement = function()
            return ESX.PlayerData.job.name == "police" or ESX.PlayerData.job.name == 'lssd'
        end,
        items = {
            {
                id = "menupracy-lspd",
                title = "Menu Pracy ",
                icon = "#job",
                items = {
                    {
                        id = "tablet-lspd",
                        title = "Tablet ",
                        icon = "#tablet",
                        type = "client",
                        event = "cc-tablet:lspd",
                        shouldClose = true,
                    },
                    {
                        id = "odznaka-lspd",
                        title = "Odznaka",
                        icon = "#odznaka",
                        type = "client",
                        event = "needrp:pokazodznake",
                        shouldClose = true,
                    },
                    {
                        id = "kod-zagrozenia",
                        title = "Kod Zagrożenia",
                        icon = "#blips",
                        type = "client",
                        event = "otworzkodzagrozenia",
                        shouldClose = true,
                    },
                    {
                        id = "radio-lst",
                        title = "Radio",
                        icon = "#radio_person",
                        items = {
                            {
                                id = "radio-OFF-lspd",
                                title = "OFF",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 0},
                                shouldClose = true,
                            },
                            {
                                id = "radio-1-lspd",
                                title = "LSPD (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 1},
                                shouldClose = true,
                            },
                            {
                                id = "radio-2-lspd",
                                title = "LSPD (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 2},
                                shouldClose = true,
                            },
                            {
                                id = "radio-2-lspd",
                                title = "LSSD (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 3},
                                shouldClose = true,
                            },
                            {
                                id = "radio-222-lspd",
                                title = "LSSD (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 4},
                                shouldClose = true,
                            },
                            {
                                id = "radio-3-lspd",
                                title = "EMS (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 5},
                                shouldClose = true,
                            },
                            {
                                id = "radio-4-lspd",
                                title = "EMS (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 6},
                                shouldClose = true,
                            },
                            {
                                id = "radio-5-lspd",
                                title = "LSCM (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 7},
                                shouldClose = true,
                            },
                            {
                                id = "radio-6-lspd",
                                title = "LSCM (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 8},
                                shouldClose = true,
                            },
                            {
                                id = "radio-7-lspd",
                                title = "DOJ (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 9},
                                shouldClose = true,
                            },
                            {
                                id = "radio-8-lspd",
                                title = "DOJ (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 10},
                                shouldClose = true,
                            },
                        }
                    },
                }
            },
        }
    },

    {
        id = "needrp-menuglowne",
        addElement = function()
            return ESX.PlayerData.job.name == "mechanic"
        end,
        items = {
            {
                id = "menupracy-mechanic",
                title = "Menu Pracy LSCM",
                icon = "#job",
                items = {
                    {
                        id = "tablet-lscm",
                        title = "Tablet LSCM",
                        icon = "#tablet",
                        type = "client",
                        event = "cc-tablet:lsc",
                        shouldClose = true,
                    },
                    {
                        id = "legitka-lscm",
                        title = "Odznaka",
                        icon = "#odznaka",
                        type = "client",
                        event = "needrp:pokazlegitke",
                        shouldClose = true,
                    },
                    {
                        id = "radio-lst",
                        title = "Radio",
                        icon = "#radio_person",
                        items = {
                            {
                                id = "radio-OFF-lscm",
                                title = "OFF",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 0},
                                shouldClose = true,
                            },
                            {
                                id = "radio-3-lscm",
                                title = "EMS (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 5},
                                shouldClose = true,
                            },
                            {
                                id = "radio-4-lscm",
                                title = "EMS (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 6},
                                shouldClose = true,
                            },
                            {
                                id = "radio-1-lscm",
                                title = "LSPD (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 1},
                                shouldClose = true,
                            },
                            {
                                id = "radio-2-lscm",
                                title = "LSPD (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 2},
                                shouldClose = true,
                            },
                            {
                                id = "radio-2-lscm",
                                title = "LSPD (#3)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 3},
                                shouldClose = true,
                            },
                            {
                                id = "radio-2-lscm",
                                title = "LSPD (#4)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 4},
                                shouldClose = true,
                            },
                            {
                                id = "radio-5-lscm",
                                title = "LSCM (#1)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 7},
                                shouldClose = true,
                            },
                            {
                                id = "radio-6-lscm",
                                title = "LSCM (#2)",
                                icon = "#radio_person",
                                type = "client",
                                event = "need_radialmenu:setRadioChannel",
                                eventData = {channel = 8},
                                shouldClose = true,
                            },
                        }
                    },
                }
            },
        }
    },

 {
            id = "needrp-menuglowne",
            addElement = function()
                return ESX.PlayerData.job.name == "mechanic" or ESX.PlayerData.job.name == "cybermecano"
            end,
            items = {
                {
                    id = "tuningmenu-ottos",
                    type = "client",
                    title = "Menu Tuningowania",
                    icon = "#tuning",
                    event = "rey_tuning:TuningMenu",--"esx_sunnyjobs:LSCustoms"
                    shouldClose = true,
                },
            }
        },


    -- MECHANIC
    {
        id = "needrp-menuglowne",
        addElement = function()
            return GetResourceState("esx_mechanicjob") == "started" and ESX.PlayerData.job.name == "mechanic" and exports["esx_mechanicjob"]:CanOpenTuningMenu()
        end,
        items = {
            {
                id = "tuningmenu",
                title = "Menu Tuningowania",
                icon = "#tuning",
                type = "client",
                event = 'esx_mechanicjob:openTuningMenu',
                shouldClose = true
            },
        }
    },

    



   
}