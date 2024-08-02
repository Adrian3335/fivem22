AddEventHandler("onClientMapStart", function()
	exports.spawnmanager:spawnPlayer()
	Citizen.Wait(5000)
	exports.spawnmanager:setAutoSpawn(false)
end)

local loadingStatus = 0
local pos = nil
RegisterNetEvent('esx:playerLoaded', function(xPlayer)
	print(json.encode(xPlayer.coords))
	if xPlayer.coords then
		pos = xPlayer.coords
	end

	if loadingStatus == 0 then
		SetLoadingStatus(1)
	end
end)
AddEventHandler('skinchanger:modelLoaded', function()
	if loadingStatus < 2 then
		SetLoadingStatus(2)
		Citizen.Wait(1000)
		SetLoadingStatus(3)
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if loadingStatus == 3 then
			SetLoadingStatus(4)
			
			local ped = PlayerPedId()
			
			local pozycjaloadu = 180.0
			if pos and pos.heading then
				pozycjaloadu = pos.heading
			end
			
			SetEntityCoords(ped, pos.x, pos.y, pos.z)
			
			Citizen.Wait(200)
			
			SetEntityHeading(ped, pozycjaloadu)
			
			Citizen.Wait(500)
			
			ShutdownLoadingScreenNui()
			pos = nil
			break
		end
	end
end)
Citizen.CreateThread(function()
	NetworkSetVoiceChannel(99999)
	while loadingStatus == 0 do
		Citizen.Wait(200)
		NetworkSetVoiceChannel(99999)
		Citizen.Wait(10)
		NetworkSetTalkerProximity(10.01)
	end
	NetworkClearVoiceChannel()
	NetworkSetTalkerProximity(10.01)
end)
function SetLoadingStatus(s)
	loadingStatus = s
	TriggerEvent('loading:status', s)
end