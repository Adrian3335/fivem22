Config = {}
Config.Locale = 'pl'

Config.Price = 250

Config.DrawDistance = 10.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.0}

Config.Zones = {}

Config.RemoveList = {
    [1] = {['tshirt_1'] = 57},
    [2] = {['helmet_1'] = -1},
    [3] = {['torso_1'] = 53},
    [4] = {['ears_1'] = -1},
    [5] = {['mask_1'] = -1},
}

Config.Target = true

if Config.Target then
	Config.Shops = {
		{
			Name = "Discount Store",
			BlipColor = 3,
			PedCoords = {["x"] = 77.72, ["y"] = -1387.55, ["z"] = 29.38, ["h"] = 178.25, ["hash"] = "ig_claypain"},
			MenuCoords = {["x"] = 73.94220733642, ["y"] = -1399.3041992188, ["z"] = 29.38, ["h"] = 270.71, time = 5000}
		},
		{
			Name = "Discount Store",
			BlipColor = 3,
			PedCoords = {["x"] = 1201.9027099609, ["y"] = 2707.6013183594, ["z"] = 38.22, ["h"] = 89.74, ["hash"] = "ig_claypain"},
			MenuCoords = {["x"] = 1190.2858886719, ["y"] = 2711.6745605469, ["z"] = 38.22, ["h"] = 177.31, time = 5000}
		},
		{
			Name = "Discount Store",
			BlipColor = 3,
			PedCoords = {["x"] = -1095.8406982422, ["y"] = 2712.1115722656, ["z"] = 19.11, ["h"] = 131.87, ["hash"] = "ig_claypain"},
			MenuCoords = {["x"] = -1107.2133789062, ["y"] = 2707.3178710938, ["z"] = 19.11, ["h"] = 219.26, time = 5000}
		},
		{
			Name = "Discount Store",
			BlipColor = 3,
			PedCoords = {["x"] = 1691.8797607422, ["y"] = 4817.3002929688, ["z"] = 42.07, ["h"] = 13.99, ["hash"] = "ig_claypain"},
			MenuCoords = {["x"] = 1694.3153076172, ["y"] = 4829.443359375, ["z"] = 42.07, ["h"] = 95.38, time = 5000}
		},
		{
			Name = "Discount Store",
			BlipColor = 3,
			PedCoords = {["x"] = -0.76807594299316, ["y"] = 6510.810546875, ["z"] = 31.88, ["h"] = 312.96, ["hash"] = "ig_claypain"},
			MenuCoords = {["x"] = 10.377585411072, ["y"] = 6515.5185546875, ["z"] = 31.88, ["h"] = 43.17, time = 5000}
		},
		{
			Name = "Binco",
			BlipColor = 5,
			PedCoords = {["x"] = 422.90197753906, ["y"] = -811.44775390625, ["z"] = 29.49, ["h"] = 358.82, ["hash"] = "ig_claypain"},
			MenuCoords = {["x"] = 427.20529174805, ["y"] = -800.00512695312, ["z"] = 29.49, ["h"] = 88.41, time = 5000}
		},
		{
			Name = "Binco",
			BlipColor = 5,
			PedCoords = {["x"] = -816.55419921875, ["y"] = -1073.2496337891, ["z"] = 11.33, ["h"] = 120.82, ["hash"] = "ig_claypain"},
			MenuCoords = {["x"] = -828.93939208984, ["y"] = -1075.0762939453, ["z"] = 11.33, ["h"] = 209.80, time = 5000}
		},
		{
			Name = "Ponsonbys",
			BlipColor = 22,
			PedCoords = {["x"] = -708.10296630859, ["y"] = -153.26612854004, ["z"] = 37.42, ["h"] = 119.17, ["hash"] = "csb_tomcasino"},
			MenuCoords = {["x"] = -704.72015380859, ["y"] = -151.75277709961, ["z"] = 37.42, ["h"] = 118.80, time = 5000}
		},
		{
			Name = "Ponsonbys",
			BlipColor = 22,
			PedCoords = {["x"] = -164.27558898926, ["y"] = -301.14114379883, ["z"] = 39.73, ["h"] = 251.35, ["hash"] = "csb_tomcasino"},
			MenuCoords = {["x"] = -158.49462890625, ["y"] = -297.01943969727, ["z"] = 39.73, ["h"] = 249.45, time = 5000}
		},
		{
			Name = "Suburban",
			BlipColor = 2,
			PedCoords = {["x"] = 127.50534820557, ["y"] = -222.58935546875, ["z"] = 54.56, ["h"] = 30.06, ["hash"] = "csb_avery"},
			MenuCoords = {["x"] = 123.96013641357, ["y"] = -219.53225708008, ["z"] = 54.56, ["h"] = 63.75, time = 5000}
		},
		{
			Name = "Suburban",
			BlipColor = 2,
			PedCoords = {["x"] = 613.08917236328, ["y"] = 2761.0290527344, ["z"] = 42.09, ["h"] = 289.63, ["hash"] = "csb_avery"},
			MenuCoords = {["x"] = 617.54455566406, ["y"] = 2758.9609375, ["z"] = 42.09, ["h"] = 275.34, time = 5000}
		},
		{
			Name = "Suburban",
			BlipColor = 2,
			PedCoords = {["x"] = -1195.275756835, ["y"] = -768.05847167969, ["z"] = 17.33, ["h"] = 210.88, ["hash"] = "csb_avery"},
			MenuCoords = {["x"] = -1194.5473632812, ["y"] = -773.06408691406, ["z"] = 17.32, ["h"] = 219.88, time = 5000}
		},
		{
			Name = "Suburban",
			BlipColor = 2,
			PedCoords = {["x"] = -3168.6965332031, ["y"] = 1044.7218017578, ["z"] = 20.86, ["h"] = 63.03, ["hash"] = "csb_avery"},
			MenuCoords = {["x"] = -3171.6662597656, ["y"] = 1048.5919189453, ["z"] = 20.86, ["h"] = 354.85, time = 5000}
		}
	}
else
	Config.Shops = {
		{x=72.254,    y=-1399.102, z=28.376},
		{x=-703.776,  y=-152.258,  z=36.415},
		{x=428.694,   y=-800.106,  z=28.491},
		{x=-829.413,  y=-1073.710, z=10.328},
		{x=-1447.797, y=-242.461,  z=48.820},
		{x=11.632,    y=6514.224,  z=30.877},
		{x=123.646,   y=-219.440,  z=53.557},
		{x=1696.291,  y=4829.312,  z=41.063},
		{x=618.093,   y=2759.629,  z=41.088},
		{x=1190.550,  y=2713.441,  z=37.222},
		{x=-1193.429, y=-772.262,  z=16.324},
		{x=-3172.496, y=1048.133,  z=19.863},
		{x=-1072.486, y=-2799.171,  z=28.923},
		{x= 4489.217, y=-4452.606,  z=3.41},
		{x=-724.120, y=-381.274,  z=33.873},
		{x=-1108.441, y=2708.923,  z=18.107},
		{x=921.98, y=28.24,  z=70.88}
	}
end

for i=1, #Config.Shops, 1 do
	Config.Zones['Shop_' .. i] = {
		Pos   = Config.Shops[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
