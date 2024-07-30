Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

Config = {}

Config.MenuItems = {

    {
        id = 'mainmenu',
        tip = 'Menu Główne Postaci',
        displayName = 'Menu Główne',
        key = 'F1',
        enableMenu = function()
            return true
        end,
        
        items = {
                    {
                        id    = 'Telefon',
                        title = 'Telefon',
                        icon = '#phone',
                        type = 'client',
                        event = 'gcPhone:forceOpenPhone',
                        shouldClose = true,
                    },

            {
                id    = 'dokumenty',
                title = 'Dokumenty',
                icon = '#dokumenty',
                items = {
                    {
                        id    = 'dowod',
                        title = 'Dowód Osobisty',
                        icon = '#dokumenty',
                        type = 'client',
                        event = 'sv-radialmenu:dowod',
                        shouldClose = true,
                    },
                    {
                        id    = 'wizytowka',
                        title = 'Wizytówka',
                        icon = '#dokumenty',
                        type = 'client',
                        event = 'sv-radialmenu:wiz',
                        shouldClose = true,
                    },
                }
            },
            {
                id    = 'ubrania',
                title = 'Rozbieranie',
                icon = '#ubranko',
                items = {
                    {
                        id = 'dodatki',
                        title = 'Akcesoria',
                        icon = '#akcesoria',
                        items = {
                            {
                                id    = 'bag',
                                title = 'Torba',
                                icon = '#bag',
                                type = 'client',
                                event = 'sv-clothing:bag',
                                shouldClose = false,
                            },
                            {
                                id    = 'glasses',
                                title = 'Okulary',
                                icon = '#glasses',
                                type = 'client',
                                event = 'sv-clothing:glasses',
                                shouldClose = false,
                            },
                            {
                                id    = 'ears',
                                title = 'Uszy',
                                icon = '#ears',
                                type = 'client',
                                event = 'sv-clothing:ears',
                                shouldClose = false,
                            },
                            {
                                id    = 'neck',
                                title = 'Naszyjnik',
                                icon = '#necklace',
                                type = 'client',
                                event = 'sv-clothing:neck',
                                shouldClose = false,
                            },
                            {
                                id    = 'watch',
                                title = 'Zegarek',
                                icon = '#watch',
                                type = 'client',
                                event = 'sv-clothing:watch',
                                shouldClose = false,
                            },
                            {
                                id    = 'bracelet',
                                title = 'Bransoletka',
                                icon = '#bracelet',
                                type = 'client',
                                event = 'sv-clothing:bracelet',
                                shouldClose = false,
                            },
                            {
                                id    = 'vest',
                                title = 'Kamizelka',
                                icon = '#vest',
                                type = 'client',
                                event = 'sv-clothing:vest',
                                shouldClose = false,
                            },
                            {
                                id    = 'gloves',
                                title = 'Rękawiczki',
                                icon = '#gloves',
                                type = 'client',
                                event = 'sv-clothing:gloves',
                                shouldClose = false,
                            },
                        }
                    },
                    {
                        id    = 'shirt',
                        title = 'Góra',
                        icon = '#jacket',
                        type = 'client',
                        event = 'sv-clothing:torso',
                        shouldClose = false,
                    },
                    {
                        id    = 'legs',
                        title = 'Spodnie',
                        icon = '#jeans',
                        type = 'client',
                        event = 'sv-clothing:jeans',
                        shouldClose = false,
                    },
                    {
                        id    = 'mask',
                        title = 'Maska',
                        icon = '#mask',
                        type = 'client',
                        event = 'sv-clothing:mask',
                        shouldClose = false,
                    },
                    {
                        id    = 'shoes',
                        title = 'Buty',
                        icon = '#shoes',
                        type = 'client',
                        event = 'sv-clothing:shoes',
                        shouldClose = false,
                    },
                    {
                        id    = 'hat',
                        title = 'Czapka',
                        icon = '#kapelusz',
                        type = 'client',
                        event = 'sv-clothing:hat',
                        shouldClose = false,
                    },
                    {
                        id    = 'hair',
                        title = 'Włosy',
                        icon = '#hair',
                        type = 'client',
                        event = 'sv-clothing:hair',
                        shouldClose = false,
                    },
                }
            },
        }
    },
}




Config.MenuEvents = {
}

Config.MenuAdd = {

    {
        id = 'mainmenu',
        addElement = function()
            return IsPedSittingInAnyVehicle(GetPlayerPed(-1)) == false
        end,
        items = {
            {
                id    = 'animacje',
                title = 'Animacje',
                icon = '#kidos',
                type = 'client',
                event = 'sv-radialmenu:AnimMenu',
                shouldClose = true, 
            },
        }
    },

    {
        id = 'mainmenu',
        addElement = function()
            return IsPedSittingInAnyVehicle(GetPlayerPed(-1))
        end,
        items = {
            {
                id    = 'zarzadzanieautem',
                title = 'Pojazd',
                icon = '#general-keys-give',
                items = {
                    {
                        id = 'vehcontrol',
                        title = 'Zarządzaneie pojazdem',
                        icon ='#spike',
                        type = 'client',
                        event = 'vehcontrol:openExternal',
                        shouldClose = true,
                    },
                    {
                        id = 'carradio',
                        title = 'Radio Samochodowe',
                        icon = '#muzyka',
                        type = 'server',
                        event = 'sv-radialmenu:radiocar',
                        shouldClose = true,
                    },
                }
            },
        }
    },

    
    {
        id = 'mainmenu',
        addElement = function()
        return ESX.PlayerData.job.name == 'taxi'
    end,
    items = {
        {
            id = 'menu-pracy',
            title = 'Menu Pracy',
            icon = '#main',
            items = {
                {
                    id = 'npc_mission',
                    title = 'Rozpocznij prace',
                    icon = '#tablet',
                    type = 'client',
                    event = 'maze_taxi:takeZlecenie',
                    shouldClose = true,
                },
              }
           }

        }   
    },
    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'police'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'odznaka',
                        title = 'Odznaka',
                        icon = '#main',
                        type = 'client',
                        event = 'rp_documents:police',
                        shouldClose = true,
                    },
                    {
                        id    = 'mdc',
                        title = 'MDT',
                        icon = '#tablet',
                        type = 'client',
                        event = 'mdt-pol:open',
                        shouldClose = true,
                    },

 {
                        id    = 'mdc',
                        title = 'Dodaj auto',
                        icon = '#tablet',
                        type = 'client',
                        event = 'mj_zarzadzanie',
                        shouldClose = true,
                    },

                          {
                        id    = 'dispatch',
                        title = 'Dispatch',
                        icon = '#dispatch',
                        type = 'client',
                        event = 'esx_dispatch:OpenUI',
                        shouldClose = true,
                    },
                    {
                        id    = 'animacje',
                        title = 'Obiekty',
                        icon = '#object',
                        items = {
                            {
                                id    = 'kolczatka',
                                title = 'Kolczatka',
                                icon = '#spike',
                                type = 'client',
                                event = 'loaf_spikestrips:placeSpikestrip',
                                shouldClose = true,
                            },
                        }
                    },

                    {
                        id = "radio-lst",
                        title = "Radio",
                        icon = "#radio_person",
                        items = {
                            {
                                id    = 'off',
                                title = 'OFF',
                                icon = '#off-radio',
                                type = 'client',
                                event = 'Tomci0:SetRadioOff',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'LSPD #MAIN',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio1',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'LSPD #2',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio2',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'LSPD #3',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio3',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'EMS #1',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio4',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'EMS #2',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio5',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'LSCM #1',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio6',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'LSCM #2',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio7',
                                shouldClose = true, 
                            },

                            {
                                id    = 'off',
                                title = 'DOJ #1',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio8',
                                shouldClose = true, 
                            },
                        }
                    },
                },
            }
        }
    },

    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'sheriff'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'odznaka',
                        title = 'Odznaka',
                        icon = '#main',
                        type = 'server',
                        event = 'odznaka',
                        shouldClose = true,
                    },
                    {
                        id    = 'mdc',
                        title = 'MDC',
                        icon = '#main',
                        type = 'client',
                        event = 'tabletpol',
                        shouldClose = true,
                    },
                    {
                        id = '10-13menu',
                        title = 'Powiadomienia',
                        icon = '#main',
                        items = {
                            {
                                id    = '10-13a',
                                title = '10-13A',
                                icon = '#main',
                                type = 'client',
                                event = 'break_10-13srp:notifya',
                                shouldClose = true,
                            },
                            {
                                id    = '10-13b',
                                title = '10-13B',
                                icon = '#main',
                                type = 'client',
                                event = 'break_10-13srp:notifyb',
                                shouldClose = true,
                            },
                        }
                    },

                },
            }
        }
    },

    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'offpolice'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'odznaka',
                        title = 'Odznaka',
                        icon = '#main',
                        type = 'server',
                        event = 'odznaka',
                        shouldClose = true,
                    },

                },
            }
        }
    },

    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'offsheriff'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'odznaka',
                        title = 'Odznaka',
                        icon = '#main',
                        type = 'server',
                        event = 'odznaka',
                        shouldClose = true,
                    },

                },
            }
        }
    },


    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'mechanic'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'tablet',
                        title = 'MDT',
                        icon = '#main',
                        type = 'client',
                        event = 'billingmech',
                        shouldClose = true,
                    },
                         
                    {
                        id = "radio-lst",
                        title = "Radio",
                        icon = "#radio_person",
                        items = {
                            {
                                id    = 'off',
                                title = 'OFF',
                                icon = '#off-radio',
                                type = 'client',
                                event = 'Tomci0:SetRadioOff',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'LSPD #MAIN',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio1',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'LSPD #2',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio2',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'LSPD #3',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio3',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'EMS #1',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio4',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'EMS #2',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio5',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'LSCM #1',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio6',
                                shouldClose = true, 
                            },
                            {
                                id    = 'off',
                                title = 'LSCM #2',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio7',
                                shouldClose = true, 
                            },

                            {
                                id    = 'off',
                                title = 'DOJ #1',
                                icon = '#radio_person',
                                type = 'client',
                                event = 'Tomci0:SetRadio8',
                                shouldClose = true, 
                            },
                        }
                    },
                }
            }
        }
    },

    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'doj'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'tablet',
                        title = 'MDT',
                        icon = '#main',
                        type = 'client',
                        event = 'esx_dojmdt:OpenMDT',
                        shouldClose = true,
                    },
                          {
                        id    = 'legitymacja',
                        title = 'Legitymacja',
                        icon = '#main',
                        type = 'client',
                        event = 'rp_documents:legitymka',
                        shouldClose = true,
                    },
                }
            }
        }
    },

   
   
   
    {
        id = 'mainmenu',
        addElement = function()
            return ESX.PlayerData.job.name == 'ambulance'
        end,
        items = {
            {
                id = 'menu-pracy',
                title = 'Menu Pracy',
                icon = '#main',
                items = {
                    {
                        id    = 'mdc',
                        title = 'MDT',
                        icon = '#main',
                        type = 'client',
                        event = 'tabletmed',
                        shouldClose = true,
                    },
                    {
                        id    = 'legitymka',
                        title = 'Legitymacja',
                        icon = '#dispatch',
                        type = 'client',
                        event = 'rp_documents:legitymka',
                        shouldClose = true,
                         },

                         {
                            id = "radio-lst",
                            title = "Radio",
                            icon = "#radio_person",
                            items = {
                                {
                                    id    = 'off',
                                    title = 'OFF',
                                    icon = '#off-radio',
                                    type = 'client',
                                    event = 'Tomci0:SetRadioOff',
                                    shouldClose = true, 
                                },
                                {
                                    id    = 'off',
                                    title = 'LSPD #MAIN',
                                    icon = '#radio_person',
                                    type = 'client',
                                    event = 'Tomci0:SetRadio1',
                                    shouldClose = true, 
                                },
                                {
                                    id    = 'off',
                                    title = 'LSPD #2',
                                    icon = '#radio_person',
                                    type = 'client',
                                    event = 'Tomci0:SetRadio2',
                                    shouldClose = true, 
                                },
                                {
                                    id    = 'off',
                                    title = 'LSPD #3',
                                    icon = '#radio_person',
                                    type = 'client',
                                    event = 'Tomci0:SetRadio3',
                                    shouldClose = true, 
                                },
                                {
                                    id    = 'off',
                                    title = 'EMS #1',
                                    icon = '#radio_person',
                                    type = 'client',
                                    event = 'Tomci0:SetRadio4',
                                    shouldClose = true, 
                                },
                                {
                                    id    = 'off',
                                    title = 'EMS #2',
                                    icon = '#radio_person',
                                    type = 'client',
                                    event = 'Tomci0:SetRadio5',
                                    shouldClose = true, 
                                },
                                {
                                    id    = 'off',
                                    title = 'LSCM #1',
                                    icon = '#radio_person',
                                    type = 'client',
                                    event = 'Tomci0:SetRadio6',
                                    shouldClose = true, 
                                },
                                {
                                    id    = 'off',
                                    title = 'LSCM #2',
                                    icon = '#radio_person',
                                    type = 'client',
                                    event = 'Tomci0:SetRadio7',
                                    shouldClose = true, 
                                },

                                {
                                    id    = 'off',
                                    title = 'DOJ #1',
                                    icon = '#radio_person',
                                    type = 'client',
                                    event = 'Tomci0:SetRadio8',
                                    shouldClose = true, 
                                },
                            }
                        },

                    },
                }
            }
        },
}