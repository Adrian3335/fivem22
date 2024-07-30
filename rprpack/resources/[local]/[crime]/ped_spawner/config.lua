--FiveM's list of Ped Models can be found here: https://docs.fivem.net/docs/game-references/ped-models/
--A list of all the animations can be found here: https://alexguirre.github.io/animations-list/

Config = {}
Config.Invincible = true --Do you want the peds to be invincible?
Config.Frozen = true --Do you want the peds to be unable to move? It's probably a yes, so leave true in there.
Config.Stoic = true --Do you want the peds to react to what is happening in their surroundings?
Config.Fade = true-- Do you want the peds to fade into/out of existence? It looks better than just *POP* its there.
Config.Distance = 15.0 --The distance you want peds to spawn at


--Does the system you use for grabbing coordinates require subracting from the z axis?
--If so, set this to true. You'll have to adjust the coordinates for defaults down - 1 if you set false.
Config.MinusOne = true

Config.PedList = {
		
	----------------------------------------
	---         TRACKER         ---
	----------------------------------------
	{
		model = "cs_drfriedlander",
		coords = vector3(-1137.9479, 381.0077, 70.9032), 
		heading = 220.0, 
		gender = "male", 
			animName = "work_base",
	},

{
		model = "cs_devin",
		coords = vector3(399.9822, 67.1446, 97.9779), 
		heading = 170.0, 
		gender = "male", 
			animName = "work_base",
	},

	
}