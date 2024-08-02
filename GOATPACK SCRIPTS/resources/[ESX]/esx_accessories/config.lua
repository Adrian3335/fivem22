Config = {}

Config.Locale = 'en'

Config.Price = 10

Config.EnableControls = true


Config.DrawDistance = 100.0
Config.Size   = {x = 1.5, y = 1.5, z = 1.0}
Config.Color  = {r = 0, g = 128, b = 255}
Config.Type   = 1


-- Fill this if you want to see the blips,
-- If you have esx_clothesshop you should not fill this
-- more than it's already filled.
Config.ShopsBlips = {
	Ears = {
		Pos = nil,
		Blip = nil
	},
	Mask = {
		Pos = nil,
		Blip = nil
	},
	Helmet = {
		Pos = nil,
		Blip = nil
	},
	Glasses = {
		Pos = nil,
		Blip = nil
	}
}

Config.Zones = {
	Ears = {
		Pos = {
			{x= 80.374,	 y= -1389.493,	z= -128.406},
		}
		
	},
	
	--[[Mask = {
		Pos = {
			{x = -1338.129, y = -1278.200, z = 4.0},
		}
	},]]
	
	Helmet = {
		Pos = {
			{x= 81.576,	 y= -1400.602,	z= -128.406},
		}
	},
	
	Glasses = {
		Pos = {
			{x= 75.287,	 y= -1391.131,	z= -128.406},
		}
	}

}

-- buty
-- clothingshoes try_shoes_positive_d

-- okulary
-- clothingspecs put_on
-- clothingspecs take_off

-- koszulka
-- mp_clothing@female@shirt try_shirt_positive_a
-- clothingshirt try_shirt_positive_a

-- maska
-- mp_masks@standard_car@rds@ put_on_mask

-- kask/czapka
-- missheistdockssetup1hardhat@ put_on_hat
-- missheist_agency2ahelmet take_off_helmet_stand

-- spodnie
-- clothingtrousers try_trousers_neutral_c
