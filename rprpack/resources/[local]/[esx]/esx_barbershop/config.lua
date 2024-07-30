Config = {}

Config.Price = 250

Config.DrawDistance = 25.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor  = {r = 255, g = 112, b = 222}
Config.MarkerType   = 1

Config.Locale = 'en'

Config.Zones = {}

Config.Target = true

Config.Props = {
	303280717
}

if Config.Target then
	Config.Shops = {
		{
			Prop = {coords = vec3(-32.885971, -149.896240, 57.191048), ["hash"] = 303280717},
			MenuCoords = {["x"] = -33.34, ["y"] = -152.74, ["z"] = 57.08, ["h"] = 337.72}
		},
		{
			Prop = {coords = vec3(135.986542, -1710.393311, 29.406139), ["hash"] = 303280717},
			MenuCoords = {["x"] = 137.82, ["y"] = -1707.45, ["z"] = 29.29, ["h"] = 138.68},
		},
		{
			Prop = {coords = vec3(-1285.190796, -1117.981567, 7.104643), ["hash"] = 303280717},
			MenuCoords = {["x"] = -1281.77, ["y"] = -1117.42, ["z"] = 6.99, ["h"] = 90.43},
		},
		{
			Prop = {coords = vec3(1209.868530, -472.890045, 66.322571), ["hash"] = 303280717},
			MenuCoords = {["x"] = 1213.21, ["y"] = -473.32, ["z"] = 66.21, ["h"] = 73.71},
		},
		{
			Prop = {coords = vec3(-280.468933, 6229.313477, 31.810053), ["hash"] = 303280717},
			MenuCoords = {["x"] = -277.87, ["y"] = 6227.47, ["z"] = 31.70, ["h"] = 44.31}
		},
	}
else
	Config.Shops = {
		{x = -814.308,  y = -183.823,  z = 36.568},
		{x = 136.826,   y = -1708.373, z = 28.291},
		{x = -1282.604, y = -1116.757, z = 5.990},
		{x = 1931.513,  y = 3729.671,  z = 31.844},
		{x = -1053.976,  y = -2804.672,  z = 28.80},
		{x = 1212.840,  y = -472.921,  z = 65.208},
		{x = 1649.928,  y = 4874.6479,  z = 41.0908},
		{x = -32.885,   y = -152.319,  z = 56.076},
		{x = -278.077,  y = 6228.463,  z = 30.695}
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
