Config              = {}

Config.DrawDistance = 15.0
Config.Size         = {x = 1.5, y = 1.5, z = 1.5}
Config.Color        = {r = 173, g = 39, b = 90}
Config.Type         = 27
Config.LockCam      = false

Config.ClearPrice   = 250

Config.Locale       = 'en'

Config.Target = true

if not Config.Target then
	Config.Zones = {
		{x = 1322.645,  y = -1651.976, z = 51.30},
		{x = -1153.676, y = -1425.68,  z = 3.954},
		{x = 322.139,   y = 180.467,   z = 102.687},
		{x = -3170.071, y = 1075.059,  z = 19.929},
		{x = 1864.633,  y = 3747.738,  z = 32.032},
		{x = -293.713,  y = 6200.04,   z = 30.487},
		{x = -1054.54,  y = -2744.12,   z = 13.66},
		{x = -1343.3804,  y = -1245.8096,   z = 4.9906}
	}
else
	Config.Zones = {
		{
			PedCoords = {["x"] = -3172.25, ["y"] = 1074.77, ["z"] = 20.83, ["h"] = 244.98, ["hash"] = "u_m_y_tattoo_01"},
			MenuCoords = {["x"] = -3169.23, ["y"] = 1077.35, ["z"] = 20.83, ["h"] = 152.58, time = 3000}
		},
		{
			PedCoords = {["x"] = 1325.42, ["y"] = -1652.44, ["z"] = 52.28, ["h"] = 36.56, ["hash"] = "u_m_y_tattoo_01"},
			MenuCoords = {["x"] = 1321.08, ["y"] = -1653.81, ["z"] = 52.28, ["h"] = 308.69, time = 3000}
		},
		{
			PedCoords = {["x"] = -1151.55, ["y"] = -1426.21, ["z"] = 4.96, ["h"] = 35.50, ["hash"] = "u_m_y_tattoo_01"},
			MenuCoords = {["x"] = -1155.88, ["y"] = -1426.97, ["z"] = 4.96, ["h"] = 308.46, time = 3000}
		},
		{
			PedCoords = {["x"] = 1864.05, ["y"] = 3750.67, ["z"] = 33.03, ["h"] = 119.64, ["hash"] = "u_m_y_tattoo_01"},
			MenuCoords = {["x"] = 1864.34, ["y"] = 3746.57, ["z"] = 33.03, ["h"] = 31.39, time = 3000}
		},
		{
			PedCoords = {["x"] = -293.02, ["y"] = 6197.24, ["z"] = 31.49, ["h"] = 314.17, ["hash"] = "u_m_y_tattoo_01"},
			MenuCoords = {["x"] = -294.30, ["y"] = 6201.09, ["z"] = 31.48, ["h"] = 224.65, time = 3000}
		},
	}
end