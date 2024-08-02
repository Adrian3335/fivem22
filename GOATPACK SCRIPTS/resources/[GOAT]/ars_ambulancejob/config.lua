lib.locale()

Config                         = {}

Config.Debug                   = false

Config.ClothingScript          = 'illenium-appearance' -- 'illenium-appearance', 'fivem-appearance' ,'core' or false -- to disable
Config.EmsJobs                 = { "ambulance", "ems" }
Config.RespawnTime             = 0                     -- in minutes
Config.WaitTimeForNewCall      = 5                     -- minutes

Config.ReviveCommand           = "revive"
Config.ReviveAreaCommand       = "revivearea"
Config.HealCommand             = "heal"
Config.HealAreaCommand         = "healarea"
Config.ReviveAllCommand        = "reviveall"

Config.AdminGroup              = "group.admin"

Config.MedicBagProp            = "xm_prop_x17_bag_med_01a"
Config.MedicBagItem            = "medicalbag"

Config.HelpCommand             = "911"
Config.RemoveItemsOnRespawn    = true
Config.KeepItemsOnRespawn      = { "money", "WEAPON_PISTOL" } -- items that will not be removed when respawed (works only when Config.RemoveItemsOnRespawn is true)

Config.BaseInjuryReward        = 150                          -- changes if the injury value is higher then 1
Config.ReviveReward            = 700

Config.ParamedicTreatmentPrice = 4000
Config.AllowAlways             = true        -- false if you want it to work only when there are only medics online

Config.AmbulanceStretchers     = 2           -- how many stretchers should an ambunalce have
Config.ConsumeItemPerUse       = 10          -- every time you use an item it gets used by 10%

Config.TimeToWaitForCommand    = 2           -- when player dies he needs to wait 2 minutes to do the ambulance command
Config.NpcReviveCommand        = "ambulance" -- this will work only when there are no medics online

Config.UsePedToDepositVehicle  = false       -- if false the vehicle will instantly despawns
Config.ExtraEffects            = true        -- false >> disables the screen shake and the black and white screen

Config.EmsVehicles             = {           -- vehicles that have access to the props (cones and ecc..)
	'ambulance',
	'ambulance2',
}

Config.Animations              = {
	["death_car"] = {
		dict = "veh@low@front_ps@idle_duck",
		clip = "sit"
	},
	["death_normal"] = {
		dict = "dead",
		clip = "dead_a"
	},
	["get_up"] = {
		dict = "get_up@directional@movement@from_knees@action",
		clip = "getup_r_0"
	}
}


Config.Hospitals = {
	["pillbox"] = {
		paramedic = {
			model = "s_m_m_scientist_01",
			pos = vector4(-487.4996, -988.2684, 23.2893, 89.3125),
		},
		zone = {
			pos = vec3(-478.5442, -1028.8702, 24.2894),
			size = vec3(200.0, 200.0, 200.0),
		},
		blip = {
			enable = true,
			name = 'Szpital',
			type = 61,
			scale = 1.0,
			color = 2,
			pos = vector3(-493.2626, -993.7395, 24.2895),
		},
		respawn = {
			{
				bedPoint = vector4(-479.2782, -1027.4390, 25.2050, 264.4272),
				spawnPoint = vector4(-479.4816, -1028.7751, 24.1793, 153.1337)
			},
			-- {
			-- 	bedPoint = vector4(346.96, -590.64, 44.12, 338.0),
			-- 	spawnPoint = vector4(348.84, -583.36, 42.32, 68.24)
			-- },

		},
		stash = {
			['ems_stash_1'] = {
				slots = 50,
				weight = 50, -- kg
				min_grade = 0,
				label = 'Ems stash',
				shared = true, -- false if you want to make everyone has a personal stash
				pos = vector3(309.96, -599.2, 43.28)
			}
		},
		pharmacy = {
			["ems_shop_1"] = {
				job = true,
				label = "Pharmacy",
				grade = 0, -- works only if job true
				pos = vector3(-483.2834, -1018.2874, 33.6893),
				items = {
					{ name = 'medicalbag',    price = 10 },
					{ name = 'bandage',       price = 10 },
					{ name = 'defibrillator', price = 10 },
					{ name = 'tweezers',      price = 10 },
					{ name = 'burncream',     price = 10 },
					{ name = 'suturekit',     price = 10 },
					{ name = 'icepack',       price = 10 },
				}
			},

		},
		garage = {
			['ems_garage_1'] = {
				pedPos = vector4(-467.3690, -1022.2053, 23.2888, 5.1278),
				model = 'mp_m_weapexp_01',
				spawn = vector4(-461.3796, -1019.0724, 24.2888, 269.2557),
				deposit = vector3(-461.3796, -1019.0724, 24.2888),
				driverSpawnCoords = vector3(-464.1704, -1021.3765, 24.2888),
				vehicles = {
					{
						label = 'Ambulance',
						spawn_code = 'ambulance',
						min_grade = 1,
						modifications = {
							livery = 3,
						}
					},
				}
			}
		},
	},
}


Config.BodyParts = {

	-- ["0"] = { id = "hip", label = "Damaged Hipbone", levels = { ["default"] = "Damaged", ["10"] = "Damaged x2", ["20"] = "Damaged x3", ["30"] = "Damaged x3", ["40"] = "Damaged x3", ["50"] = "Damaged x3" } },
	["0"] = { id = "hip", label = "Damaged Hipbone", levels = { ["default"] = "Damaged", ["10"] = "Damaged x2", ["20"] = "Damaged x3", ["30"] = "Damaged x3", ["40"] = "Damaged x3" } }, -- hip bone,
	["10706"] = { id = "rclavicle", label = "Right Clavicle", levels = { ["default"] = "Damaged" } },                                                                                 --right clavicle
	["64729"] = { id = "lclavicle", label = "Left Clavicle", levels = { ["default"] = "Damaged" } },                                                                                  --right clavicle
	["14201"] = { id = "lfoot", label = "Left Foot", levels = { ["default"] = "Damaged" } },                                                                                          -- left foot
	["18905"] = { id = "lhand", label = "Left Hand", levels = { ["default"] = "Damaged" } },                                                                                          -- left hand
	["24816"] = { id = "lbdy", label = "Lower chest", levels = { ["default"] = "Damaged" } },                                                                                         -- lower chest
	["24817"] = { id = "ubdy", label = "Upper Chest", levels = { ["default"] = "Damaged" } },                                                                                         -- Upper chest
	["24818"] = { id = "shoulder", label = "Shoulder", levels = { ["default"] = "Damaged" } },                                                                                        -- shoulder
	["28252"] = { id = "rforearm", label = "Right Forearm", levels = { ["default"] = "Damaged" } },                                                                                   -- right forearm
	["36864"] = { id = "rleg", label = "Right leg", levels = { ["default"] = "Damaged" } },                                                                                           -- right lef
	["39317"] = { id = "neck", label = "Neck", levels = { ["default"] = "Damaged" } },                                                                                                -- neck
	["40269"] = { id = "ruparm", label = "Right Upper Arm", levels = { ["default"] = "Damaged" } },                                                                                   -- right upper arm
	["45509"] = { id = "luparm", label = "Left Upper Arm", levels = { ["default"] = "Damaged" } },                                                                                    -- left upper arm
	["51826"] = { id = "rthigh", label = "Right Thigh", levels = { ["default"] = "Damaged" } },                                                                                       -- right thigh
	["52301"] = { id = "rfoot", label = "Right Foot", levels = { ["default"] = "Damaged" } },                                                                                         -- right foot
	["57005"] = { id = "rhand", label = "Right Hand", levels = { ["default"] = "Damaged" } },                                                                                         -- right hand
	["57597"] = { id = "5lumbar", label = "5th Lumbar vertabra", levels = { ["default"] = "Damaged" } },                                                                              --waist
	["58271"] = { id = "lthigh", label = "Left Thigh", levels = { ["default"] = "Damaged" } },                                                                                        -- left thigh
	["61163"] = { id = "lforearm", label = "Left forearm", levels = { ["default"] = "Damaged" } },                                                                                    -- left forearm
	["63931"] = { id = "lleg", label = "Left Leg", levels = { ["default"] = "Damaged" } },                                                                                            -- left leg
	["31086"] = { id = "head", label = "Head", levels = { ["default"] = "Damaged" } },                                                                                                -- head
}

function Config.sendDistressCall(msg)
	--[--] -- Quasar

	-- TriggerServerEvent('qs-smartphone:server:sendJobAlert', {message = msg, location = GetEntityCoords(PlayerPedId())}, "ambulance")


	--[--] -- GKS
	-- local myPos = GetEntityCoords(PlayerPedId())
	-- local GPS = 'GPS: ' .. myPos.x .. ', ' .. myPos.y

	-- ESX.TriggerServerCallback('gksphone:namenumber', function(Races)
	--     local name = Races[2].firstname .. ' ' .. Races[2].lastname

	--     TriggerServerEvent('gksphone:jbmessage', name, Races[1].phone_number, msg, '', GPS, "ambulance")
	-- end)
end

function Config.giveVehicleKeys(vehicle, plate)
    if vehicle and plate then
        print("Attempting to give key for vehicle with plate:", plate)
        local success, err = pcall(function()
            exports['sv-carkeys']:giveKey(vehicle, plate)
        end)
        
        if not success then
            print("Error giving vehicle keys:", err)
        else
            print("Successfully gave key for vehicle with plate:", plate)
        end
    else
        print("Invalid vehicle or plate provided to giveVehicleKeys")
    end
end

function Config.removeVehicleKeys(vehicle, plate)
    if vehicle and plate then
        print("Attempting to remove key for vehicle with plate:", plate)
        local success, err = pcall(function()
            exports['sv-carkeys']:removeKey(vehicle, plate)
        end)
        
        if not success then
            print("Error removing vehicle keys:", err)
        else
            print("Successfully removed key for vehicle with plate:", plate)
        end
    else
        print("Invalid vehicle or plate provided to removeVehicleKeys")
    end
end
