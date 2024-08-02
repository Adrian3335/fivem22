Config = {}

Config.ElevatorMarker = {
	Size  = { x = 0.4, y = 0.7, z = 0.4 },
	Color = { r = 0, g = 204, b = 255 },
	Type  = 2, -- https://docs.fivem.net/docs/game-references/markers/
}

Config.Distance = 2.0

Config.TextUI = false
Config.ShowHelpNotification = true

-- Here's a template that you can you for creating new elevators
-- ["NAME"] = {	 -- This represent the elevator, while the sub objects are the single floors inside the elevator
-- 		{
-- 			coords = vector4(0,0,0,0),
-- 			label = "1^ Floor",
-- 			description = "Description"
-- 		},
-- 		{
-- 			coords = vector4(0,0,0,0),
-- 			label = "2^ Floor",
-- 			description = "Description"
-- 		},		
-- },

Config.Elevator = {
	['Departament'] = {	

{
			coords = vector4(618.0708, -2.3413, 70.6284, 149.2828),
			label = "-2 ",
			description = "Garaz"
		},	

		{ 
			coords = vector4(618.2349, -2.1195, 77.4974, 154.7219),
			label = "-1",
			description = "Cele, przesluchania , magazyn dowodow"
		},

		{ 
			coords = vector4(618.1637, -1.5212, 84.3921, 151.6661),
			label = "1",
			description = "Recepcja"
		},

		{ 
			coords = vector4(618.1296, -2.0237, 90.4702, 159.8950),
			label = "2",
			description = "Biura"
		},


			
	},

	['Szpital'] = {	

{
			coords = vector4(332.4516, -595.5956, 43.2840, 57.5368),
			label = "0 ",
			description = "Recepcja"
		},	

		{ 
			coords = vector4(338.7127, -583.8596, 74.1656, 251.9229),
			label = "1",
			description = "Dach"
		},

		
			
	},


}

Config.ElevatorNotification = "Winda" -- this will appear when the player is near to a elevator


-----------------
--- FUNCTIONS ---
-----------------

function ShowTextUI(msg)
	--- Your text ui export
	exports['esx_textui']:TextUI(msg)
end	

function HideTextUI()
	--- Your text ui export
	exports['esx_textui']:HideUI()
end

function ShowHelpNotification(msg)
	-- your showHelpNotification export
	ESX.ShowHelpNotification(msg)
end