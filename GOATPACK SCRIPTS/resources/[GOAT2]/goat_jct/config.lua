Config = {}
Config.AddKeysPrice = 50000


Config.Zones = {
    {
		coords = vector4(-235.31, -921.15, 32.51, 70.0),
		length = 8.25,
		width = 3.4,
		name = "jct_idcard",
		minZ = 32.81,
		maxZ = 34.31,
		options = {
			{
				event = "goat_jct:openJct",
				icon = "fas fa-sign-in-alt",
				label = "Zatrudnij się"
			},
			{
				event = "goat_jct:vehicleManage",
				icon = "fas fa-sign-in-alt",
				label = "Zarządzaj pojazdami"
			},
			-- {
			-- 	serverEvent = "goat_jct:makeIdCard",
			-- 	icon = "fas fa-sign-in-alt",
			-- 	label = "Wyrób dowód osobisty"
			-- },
		}
	},
}