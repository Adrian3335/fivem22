---wip types

---@class OxStash
---@field name string
---@field label string
---@field owner? boolean | string | number
---@field slots number
---@field weight number
---@field groups? string | string[] | { [string]: number }
---@field blip? { id: number, colour: number, scale: number }
---@field coords? vector3
---@field target? { loc: vector3, length: number, width: number, heading: number, minZ: number, maxZ: number, distance: number, debug?: boolean, drawSprite?: boolean }

return {
	{
		coords = vec3(-584.08, -1062.05, 21.54),  
		target = {
			loc = vec3(-584.08, -1062.05, 21.54), 
			length = 0.9,
			width = 0.9,
			heading = 340,
			minZ = 21.34,
			maxZ = 23.34,
			label = 'Sprawdz tace'
		},
		name = 'kawka2',
		label = 'Taca #1',
		owner = false,
		slots = 5,
		weight = 70000,
	},
	
	
	{
		coords = vec3(-583.88, -1059.23, 21.54),  
		target = {
			loc = vec3(-583.88, -1059.23, 21.54), 
			length = 0.9,
			width = 0.9,
			heading = 340,
	minZ = 21.34,
	maxZ = 23.34,
			label = 'Sprawdz tace'
		},
		name = 'kawka1',
		label = 'Taca #1',
		owner = false,
		slots = 5,
		weight = 70000,
	},
	
		{
		coords = vec3(-598.34, -1063.11, 21.34),
		target = {
			loc = vec3(-598.34, -1063.11, 21.34),
			length = 5.0,
			width = 2.0,
			heading = 0,
			minZ = 20.34,
			maxZ = 23.34,
			label = 'Otwórz Magazyn'
		},
		name = 'kawiarnia_l',
		label = 'Magazyn',
		owner = false,
		slots = 50,
		weight = 70000,
		groups = {['kawiarnia'] = 0}
	},

	{
		coords = vec3(301.3, -600.23, 43.28),
		target = {
			loc = vec3(301.82, -600.99, 43.29),
			length = 0.6,
			width = 1.8,
			heading = 340,
			minZ = 43.34,
			maxZ = 44.74,
			label = 'Open personal locker'
		},
		name = 'emslocker',
		label = 'Personal Locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['ambulance'] = 0}
	},
}
