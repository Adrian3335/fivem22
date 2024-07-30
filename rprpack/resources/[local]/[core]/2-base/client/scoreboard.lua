ESX = nil
local IsAdmin = nil
local DisplayId = false
local ZetkaPlayers = {}
local Frakcje = {}
local ShowDistance = 20.0
local Timer = 0
local stremer = {}
local colors = {
	['Gracz'] = {255, 255, 255},
	
	['Trial Support'] = {3, 121, 0},
	['Support'] = {51, 202, 0},

	['Junior Moderator'] = {159, 50, 255},
	['Moderator'] = {128, 27, 255},

	['Junior Administrator'] = {255, 188, 0},
	['Administrator'] = {255, 223, 0},

	['Head Admin'] = {255, 0, 0},

	['Zarz�d'] = {0, 0, 0},
	['Project Owner'] = {0, 0, 0},
}


ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
  end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
	TriggerServerEvent("esx_scoreboard:players")
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

CreateThread(function()
	while(1) do
		Wait(5000)
		ESX.TriggerServerCallback("esx_scoreboard:stremer", function(cb)
			stremer = cb
		end)
	end
end)

function DrawText3D(x, y, z, text, color, skala) -- skala default 2
    local onScreen, _x, _y = World3dToScreen2d(x,y,z)
	local scale = (1 / #(GetGameplayCamCoords() - vec3(x, y, z))) * skala
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    if onScreen then
        SetTextScale(1.0 * scale, 1.55 * scale)
        SetTextFont(4)
        SetTextColour(color[1], color[2], color[3], 255)
        SetTextDropshadow(0, 0, 5, 0, 255)
        SetTextDropShadow()
		SetTextOutline()
		SetTextCentre(1)
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

RegisterNetEvent("esx_scoreboard:players", function(Counter, Admin)
	Frakcje = Counter
	IsAdmin = Admin
	if IsAdmin then
		ShowDistance = 50.0
	else
		ShowDistance = 20.0
	end
end)

RegisterNetEvent("esx_scoreboard:playerShowed", function(target, boolean)
	ZetkaPlayers[target] = boolean
end)

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		for _, player in ipairs(GetActivePlayers()) do
			local playerPed = GetPlayerPed(player)
			if IsEntityVisible(playerPed) then
				local coords1 = GetPedBoneCoords(ped, 31086, -0.4, 0.0, 0.0)
				local coords2 = GetPedBoneCoords(playerPed, 31086, -0.4, 0.0, 0.0)
				if #(coords1 - coords2) < ShowDistance then
					local svId = GetPlayerServerId(player)
					if DisplayId then
						if stremer[GetPlayerServerId(player)] ~= nil then
							if colors[stremer[GetPlayerServerId(player)].groupe] then
								groupe = stremer[GetPlayerServerId(player)].groupe
							else
								groupe = 'unkown'
							end
						end

						if stremer[GetPlayerServerId(player)] ~= nil then
							if stremer[GetPlayerServerId(player)].afk then
								DrawText3D(coords2.x, coords2.y, coords2.z + -0.30, "AFK", {252, 88, 88}, 0.75)
							end
						end

						if stremer[GetPlayerServerId(player)] ~= nil then
							if stremer[GetPlayerServerId(player)].stramer then
								DrawText3D(coords2.x, coords2.y, coords2.z + 0.8, "Streamuje", {102, 51, 153}, 0.7)
							end
						end

						if stremer[GetPlayerServerId(player)] ~= nil then
							if stremer[GetPlayerServerId(player)].stramer then
								--DrawText3D(coords2.x, coords2.y, coords2.z + 0, svId, (NetworkIsPlayerTalking(player) and {0, 0, 255} or {255, 255, 255}), 1.8, true)
								DrawText3D(coords2.x, coords2.y, coords2.z + 1.05, (NetworkIsPlayerTalking(player) and '~b~' or '~w~')..svId..' ~w~|~s~ ' .. groupe, colors[groupe], 1.1)
							else
								-- DrawText3D(coords2.x, coords2.y, coords2.z + 0.8, '['..svId..'] ' .. groupe, colors[groupe], 1.0)
								DrawText3D(coords2.x, coords2.y, coords2.z + 0.85, (NetworkIsPlayerTalking(player) and '~b~' or '~w~')..svId..' ~w~|~s~ ' .. groupe, colors[groupe], 1.1)
								--DrawText3D(coords2.x, coords2.y, coords2.z + 0, svId, (NetworkIsPlayerTalking(player) and {0, 0, 255} or {255, 255, 255}), 1.8, true)
							end
						end
					end
					if svId ~= GetPlayerServerId(PlayerId()) and ZetkaPlayers[svId] then
						DrawText3D(coords2.x, coords2.y, coords2.z + (DisplayId and 1.3 or 1.0), "~r~!", {255, 0, 0}, 2.0, true)
					end
				end
			end
		end
		Wait(0)
	end
end)

RegisterNetEvent("esx_scoreboard:show", function(boolean)
	local _source = source
	TriggerClientEvent("esx_scoreboard:playerShowed", -1, _source, boolean)
end)



RegisterCommand("+scoreboard", function()
	TriggerServerEvent('esx_scoreboard:players')
	-- ESX.TriggerServerCallback("nHUD:getOnDuty", function(data)
	  DisplayId = true
	  TriggerServerEvent("esx_scoreboard:show", true)
end)


RegisterCommand("-scoreboard", function()
	TriggerServerEvent('esx_scoreboard:players')
	DisplayId = false
	TriggerServerEvent("esx_scoreboard:show", false)
end)

RegisterKeyMapping("+scoreboard", "Scoreboard", "keyboard", "Z")

Citizen.CreateThread(function()
    TriggerEvent("chat:removeSuggestion", "/+scoreboard")
    TriggerEvent("chat:removeSuggestion", "/-scoreboard")
end)