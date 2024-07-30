Config                        = {}
Config.DrawDistance           = 15.0
Config.MarkerSize             = {x = 2.5, y = 2.5, z = 2.5}
Config.ImpoundMarkerSize      = {x = 1.5, y = 1.5, z = 1.5}
Config.MarkerColor            = {r = 0, g = 247, b = 255}
Config.ImpoundWaitingTime	  = 10 -- In seconds
Config.GarageBlipColor 		  = 25 
Config.ImpoundBlipColor 	  = 11 -- https://docs.fivem.net/docs/game-references/hud-colors/
Config.PoliceImpoundBlipColor = 26

Config.Locale = 'pl'

Config.Garages = {
    -- Garages In City / Cypress Flats
	{
		Marker  = vec3(1012.958252, -2299.661622, 29.493042),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vec3(197.6111, -1858.042, 26.57393),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vec3(1180.681274, -1544.940674, 33.688598),
		Blip	= true,
		Visible = {}
	},
	-- Garages In City / Mirror
	{
		Marker  = vec3(1021.582398, -766.773620, 56.941406),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vec3(866.162658, 2.887912, 77.750976),
		Blip	= true,
		Visible = {}
	},
	-- Garages In City / Vinewood
	{
		Marker  = vec3(699.441772, 257.169220, 92.359742),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  =  vec3(-618.685730, 282.079132, 80.649048),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  =  vec3(-366.435150, -94.707696, 44.657836),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  =  vec3(327.520874, -205.476928, 53.082764),
		Blip	= true,
		Visible = {}
	},
	-- Garages In City / Rockford HILLS
	{
		Marker  = vec3(-1392.052734, 75.138458, 52.644654),
		Blip	= true,
		Visible = {}
	},
	-- Garages In City / Centre
	{
		-- Impound
		Marker  = vec3(-209.208786, -1169.327514, 22.028564),
		Blip	= true,
		Visible = {}
	},
	{
		-- Red parking
		Marker  = vec3(-273.876922, -764.927490, 32.964112),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vec3(257.907684, -773.459350, 29.678344),
		Blip	= true,
		Visible = {}
	},
	-- Garages In City / Vespucci
	{
		Marker  = vec3(-786.514282, -806.413208, 19.619018),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vec3(-1157.393432, -1738.391236, 3.055664),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vec3(-807.336242, -1305.402222, 3.999268),
		Blip	= true,
		Visible = {}
	},
	-- Garages In City / Del Perro
	{
		Marker  = vec3(-1718.241700, -1118.215332, 12.137696),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  =  vec3(-1483.239502, -662.228576, 27.942872),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  =  vec3(-2180.175782, -383.512084, 12.272584),
		Blip	= true,
		Visible = {}
	},
	-- Garages In City / Ghetto
	{
		Marker  = vec3(388.167022, -1654.826416, 31.515014),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vec3(407.696716, -1278.606568, 29.257202),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vec3(-52.707692, -1688.558228, 28.482056),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vec3(-47.208790, -2103.481202, 15.692994),
		Blip	= true,
		Visible = {}
	},
	-- Garages In City / AIRPORT
	{
		Marker  = vec3(-953.802186, -2705.274658, 12.828614),
		Blip	= true,
		Visible = {}
	},
	-- Garages In City / Docks
	{
		Marker  = vec3(208.786804, -3027.982422, 4.875488),
		Blip	= true,
		Visible = {}
	},
	-- Paleto Bay Garages
	{
		Marker  = vec3(136.008790, 6633.178222, 30.655640),
		Blip	= true,
		Visible = {}
	},
	{
		Marker  = vec3(-291.468140, 6130.101074, 30.487182),
		Blip	= true,
		Visible = {}
	},
	-- Grapeseed Garages
	{
		Marker  = vec3(1693.780274, 4805.789062, 40.849854),
		Blip	= true,
		Visible = {}
	},
	-- Snady Garages
	{
		Marker  = vec3(1546.496704, 3782.030762, 33.048340),
		Blip	= true,
		Visible = {}
	},
	-- Harmony Garages
	{
		Marker  =  vec3(559.463746, 2727.006592, 41.052002),
		Blip	= true,
		Visible = {}
	},
	{
		-- Prison
		Marker  =  vec3(1869.415406, 2588.320800, 44.657836),
		Blip	= true,
		Visible = {}
	},
	-- Western Highway Garages
	{
		Marker  = vec3(-3030.461426, 113.907692, 10.604370),
		Blip	= true,
		Visible = {}
	}
}

Config.Impound = {
	vec3(-191.208786, -1162.206542, 22.668824),
	vec3(1530.329712, 3777.560546, 33.503296),
	vec3(120.171432, 6625.753906, 30.942138),
}

Config.PoliceImpound = {
	vec3(-141.797806, -1175.657104, 22.753174)
}