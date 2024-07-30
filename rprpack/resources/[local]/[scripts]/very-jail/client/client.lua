local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = exports['es_extended']:getSharedObject()
Many = exports['very-base']

PlayerData = {}

local jailTime = 0

Citizen.CreateThread(function()
	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(newData)
	PlayerData = newData

	Citizen.Wait(25000)

	ESX.TriggerServerCallback("very-jail:retrieveJailTime", function(inJail, newJailTime)
		if inJail then

			jailTime = newJailTime

			JailLogin()
		end
	end)
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(response)
	PlayerData["job"] = response
end)

RegisterNetEvent("very-jail:openJailMenu")
AddEventHandler("very-jail:openJailMenu", function()
	OpenJailMenu()
end)

RegisterNetEvent("very-jail:jailPlayer")
AddEventHandler("very-jail:jailPlayer", function(newJailTime)
	jailTime = newJailTime

	Cutscene()
end)

RegisterNetEvent("very-jail:unJailPlayer")
AddEventHandler("very-jail:unJailPlayer", function()
	jailTime = 0

	UnJail()
end)

function JailLogin()
	local JailPosition = Config.JailPositions["Cell"]
	SetEntityCoords(PlayerPedId(), JailPosition["x"], JailPosition["y"], JailPosition["z"] - 1)

	InJail()
end

function UnJail()
	InJail()

	ESX.Game.Teleport(PlayerPedId(), Config.Teleports["Boiling Broke"])

	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)

	DishWork = false
	ElectricWork = false
	SweepFloors = false
	ESX.ShowNotification("Zostałeś wypuszczony z więzienia!")
end

function InJail()
	Citizen.CreateThread(function()
		while jailTime > 0 do
			jailTime = jailTime - 1
			ESX.ShowNotification("Pozostało ci " .. jailTime .. " miesięcy w więzieniu!")
			TriggerServerEvent("very-jail:updateJailTime", jailTime)
			if jailTime == 0 or jailTime < 0 then
				UnJail()
				TriggerServerEvent("very-jail:updateJailTime", 0)
			end
			Citizen.Wait(60000)
		end
	end)
end

local DishWork = false
local SweepFloors = false
local ElectricWork = false

RegisterNetEvent('very-jail:Dishes')
AddEventHandler('very-jail:Dishes', function()
	if lib.progressBar({
		duration = 45000,
		label = 'Zmywanie...',
		useWhileDead = false,
		canCancel = true,
		disable = {
			car = true,
			move = true,
			combat = true,
		},
		anim = {
			dict = 'timetable@floyd@clean_kitchen@base',
			clip = 'base',
		},
		prop = {
			model = `prop_sponge_01`,
			pos = vec3(0.0, 0.0, -0.01),
			rot = vec3(90.0, 0.0, 0.0),
			bone = 28422
		},
	}) then
		if jailTime > 3 then
		jailTime = jailTime - 3
		TriggerServerEvent('very-jail:updateJailTime', jailTime)
		Wait(100)
		ESX.ShowNotification("Pozostało ci " .. jailTime .. " miesięcy w więzieniu!")
		elseif jailTime < 3 then
		UnJail()
		TriggerServerEvent("very-jail:updateJailTime", 0)
		end
	else
		ESX.ShowNotification('Przestałeś zmywać naczynia')
	end
end)

RegisterNetEvent('very-jail:Floors')
AddEventHandler('very-jail:Floors', function()
	if lib.progressBar({
		duration = 45000,
		label = 'Mycie podłogi...',
		useWhileDead = false,
		canCancel = true,
		disable = {
			car = true,
			move = true,
			combat = true,
		},
		anim = {
			dict = 'missfbi_s4mop',
			clip = 'idle_scrub',
			flag = 1
		},
		prop = {
			model = `prop_cs_mop_s`,
			pos = vec3(0.0, 0.0, -0.01),
			rot = vec3(0.0, 0, 0.0),
		},
	}) then
		if jailTime > 3 then
		jailTime = jailTime - 3
		TriggerServerEvent('very-jail:updateJailTime', jailTime)
		Wait(100)
		ESX.ShowNotification("Pozostało ci " .. jailTime .. " miesięcy w więzieniu!")
		elseif jailTime < 3 then
		UnJail()
		TriggerServerEvent("very-jail:updateJailTime", 0)
		end
	else
		ESX.ShowNotification('Przestałeś zmywać naczynia')
	end
end)

RegisterNetEvent('very-jail:ElectricWork')
AddEventHandler('very-jail:ElectricWork', function()
	if lib.progressBar({
		duration = 45000,
		label = 'Naprawianie elektryki...',
		useWhileDead = false,
		canCancel = true,
		disable = {
			car = true,
			move = true,
			combat = true,
		},
		anim = {
			scenario = 'WORLD_HUMAN_WELDING'
		},
	}) then
		if jailTime > 3 then
		jailTime = jailTime - 3
		TriggerServerEvent('very-jail:updateJailTime', jailTime)
		Wait(100)
		ESX.ShowNotification("Pozostało ci " .. jailTime .. " miesięcy w więzieniu!")
		elseif jailTime < 3 then
		UnJail()
		TriggerServerEvent("very-jail:updateJailTime", 0)
		end
	else
		ESX.ShowNotification('Przestałeś zmywać naczynia')
	end
end)

exports['qtarget']:AddBoxZone("JailWork", vector3(1760.3, 2494.47, 45.82), 0.8, 0.8, {
	name="JailWork",
	heading=30,
	minZ=45.12,
	maxZ=46.32,
	}, {
		options = {
			{
				action = function()
					DishWork = true
					SweepFloors = false
					ElectricWork = false
					Many:Notify('inform', 'Udaj się do kuchni!')
				end,
				icon = "fas fa-water",
				label = "Zmywaj Naczynia",
				canInteract = function()
					if jailTime > 0 then
						return true
					end
					return false
				end,
			},
			{
				action = function()
					SweepFloors = true
					DishWork = false
					ElectricWork = false
					Many:Notify('inform', 'Udaj się do kuchni!')
				end,
				icon = "fas fa-broom",
				label = "Myj Podłogi",
				canInteract = function()
					if jailTime > 0 then
						return true
					end
					return false
				end,
			},
			{
				action = function()
					SweepFloors = false
					DishWork = false
					ElectricWork = true
					Many:Notify('inform', 'Udaj się do skrzynki elektrycznej!')
				end,
				icon = "fas fa-hard-hat",
				label = "Naprawiaj elektryke",
				canInteract = function()
					if jailTime > 0 then
						return true
					end
					return false
				end,
			},
		},
		distance = 2.0
})

exports['qtarget']:AddBoxZone("JailDishes", vector3(1785.41, 2565.89, 45.67), 1.3, 0.7, {
	name="JailDishes",
	heading=90,
	minZ=45.27,
	maxZ=45.97,
	}, {
		options = {
			{
				event = "very-jail:Dishes",
				icon = "fas fa-water",
				label = "Zmywaj Naczynia",
				canInteract = function()
					if DishWork then
						return true
					end
					return false
				end,
			},
		},
		distance = 2.0
})

exports['qtarget']:AddBoxZone("JailSweep", vector3(1784.42, 2546.72, 45.67), 3, 3, {
	name="JailSweep",
	heading=0,
	minZ=43.57,
	maxZ=45.37,
	}, {
		options = {
			{
				event = "very-jail:Floors",
				icon = "fas fa-broom",
				label = "Myj Podłoge",
				canInteract = function()
					if SweepFloors then
						return true
					end
					return false
				end,
			},
		},
		distance = 2.0
})

exports['qtarget']:AddBoxZone("JailElectric", vector3(1700.77, 2474.15, 45.56), 2.8, 1.2, {
	name="JailElectric",
	heading=315,
	minZ=45.06,
	maxZ=45.86,
	}, {
		options = {
			{
				event = "very-jail:ElectricWork",
				icon = "fas fa-hard-hat",
				label = "Napraw Elektryke",
				canInteract = function()
					if ElectricWork then
						return true
					end
					return false
				end,
			},
		},
		distance = 2.0
})

Citizen.CreateThread(function()
    while true do
        if SweepFloors then
            DrawMarker(2, 1784.1858, 2546.6108, 45.8729, 0, 0, 0, 0, 0, 0, 0.451, 0.451, 0.341, 255, 230, 17, 155 ,0 ,0 ,0 ,0)
        end
		if DishWork then
            DrawMarker(2, 1785.4438, 2566.0127, 46.6160, 0, 0, 0, 0, 0, 0, 0.451, 0.451, 0.341, 255, 230, 17, 155 ,0 ,0 ,0 ,0)
        end
		if ElectricWork then
            DrawMarker(2, 1700.7733, 2474.1514, 48.1180, 0, 0, 0, 0, 0, 0, 0.451, 0.451, 0.341, 255, 230, 17, 155 ,0 ,0 ,0 ,0)
        end
		Citizen.Wait(0)
    end
end)

RegisterNetEvent('very-jail:Call')
AddEventHandler('very-jail:Call', function()
	local input = lib.inputDialog('Budka telefoniczna', {'Numer telefonu'})

	if not input then return end
	local phoneNumber = input[1]
	exports.npwd:startPhoneCall(phoneNumber)
end)

exports['qtarget']:AddBoxZone("JailPhone", vector3(1831.99, 2579.92, 46.01), 0.5, 0.5, {
	name="JailPhone",
	heading=0,
	minZ=45.81,
	maxZ=46.51,
	}, {
		options = {
			{
				event = "very-jail:Call",
				icon = "fas fa-phone",
				label = "Zadzwoń",
			},
		},
		distance = 3.5
})
