ESX = exports.es_extended.getSharedObject()

MdtOpened = false

local DeleteGradeMandat = 2
local MenageLicenseGrade = 4

local tabletEntity = nil
local tabletModel = "prop_cs_tablet"
local tabletDict = "amb@world_human_seat_wall_tablet@female@base"
local tabletAnim = "base"

function startTabletAnimation()
	Citizen.CreateThread(function()
	  	RequestAnimDict(tabletDict)
		while not HasAnimDictLoaded(tabletDict) do
			Citizen.Wait(0)
		end
		attachObject()
		TaskPlayAnim(PlayerPedId(), tabletDict, tabletAnim, 8.0, -8.0, -1, 50, 0, false, false, false)
	end)
end

function attachObject()
	if tabletEntity == nil then
		Citizen.Wait(380)
		RequestModel(tabletModel)
		while not HasModelLoaded(tabletModel) do
			Citizen.Wait(0)
		end
		tabletEntity = CreateObject(joaat(tabletModel), 1.0, 1.0, 1.0, 1, 1, 0)
		AttachEntityToEntity(tabletEntity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.12, 0.10, -0.13, 25.0, 170.0, 160.0, true, true, false, true, 1, true)
	end
end

function stopTabletAnimation()
	if tabletEntity ~= nil then
		StopAnimTask(PlayerPedId(), tabletDict, tabletAnim ,8.0, -8.0, -1, 50, 0, false, false, false)
		DeleteEntity(tabletEntity)
		tabletEntity = nil
	end
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	if ESX.PlayerData.job.name == 'doj' then
		TriggerServerEvent('esx_dojmdt:UpdateDojStatus', 'insert')
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	if ESX.PlayerData.job.name == 'doj' then
		TriggerServerEvent('esx_dojmdt:UpdateDojStatus', 'insert')
	else
		TriggerServerEvent('esx_dojmdt:UpdateDojStatus', 'remove')
	end
end)

RegisterNetEvent('esx_dojmdt:OpenMDT')
AddEventHandler('esx_dojmdt:OpenMDT', function()
	OpenDojMDT()
end)

function OpenDojMDT()
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'doj' then
		if(MdtOpened == false) then
			MdtOpened = true
			startTabletAnimation()
			SetCursorLocation(0.5, 0.5)
			SetNuiFocus(true, true)
			SendNUIMessage({action = 'OpenMDT'})
			TriggerServerEvent('esx_dojmdt:SendMdtData')
		end
	else
		Citizen.Wait(500)
	end
end



RegisterNetEvent("esx_dojmdt:SendMdtData")
AddEventHandler("esx_dojmdt:SendMdtData", function(data)
	if data then
		data['job'] = ESX.PlayerData.job.name
		NotepadData = data['Notepad']
		SendNUIMessage({action = 'SendMDTdata', mdtdata = data})
	end
end)

RegisterNUICallback('GetVehicleByPlate', function(data, cb)
	ESX.TriggerServerCallback("esx_dojmdt:GetVehicleByPlate", function(vehicledata)
		for k,v in ipairs(vehicledata) do
			TriggerEvent('esx_vehicleshop:getVehicles', function(base)
				local found = false
				for _, vehicle in ipairs(base) do
					if joaat(vehicle.model) == v.model then
						v.model = vehicle.name
						found = true
					end
				end
				
				if not found then
					local label = GetLabelText(v.model)
					if label ~= "NULL" then
						v.model = label
					end
				end
			end)
		end
		
		cb(vehicledata)
	end, data.plate)	
end)

RegisterNUICallback('SearchNumber', function(data, cb)
	ESX.TriggerServerCallback("esx_dojmdt:SearchNumber", function(numerdata)
		cb(numerdata)
	end, data.numer)	
end)

RegisterNUICallback('SearchPersonKartoteka', function(data, cb)
	ESX.TriggerServerCallback("esx_dojmdt:SearchPersonKartoteka", function(persondata)
		cb(persondata)
	end, data)
end)

RegisterNUICallback('AddPoszukiwaniaKartoteka', function(data, cb)
	ESX.TriggerServerCallback('esx_dojmdt:AddPoszukiwaniaKartoteka', function(poszukiwaniadata)
		cb(poszukiwaniadata)
	end, data)
end)

RegisterNUICallback('AddNotatkaKartoteka', function(data, cb)
	ESX.TriggerServerCallback('esx_dojmdt:AddNotatkaKartoteka', function(notedata)
		cb(notedata)
	end, data)
end)

RegisterNUICallback('WystawMandat', function(data)
	TriggerServerEvent('esx_dojmdt:WystawMandat', data)
end)

RegisterNUICallback('WystawWiezienie', function(data)
	TriggerServerEvent('esx_dojmdt:WystawWiezienie', data)      
end)

RegisterNUICallback('UpdateNotepad', function(data)
	if data.note ~= NotepadData then
		TriggerServerEvent('esx_dojmdt:UpdateNotepad', data.note)
	end
end)

RegisterNUICallback('SendAnnounce', function(data, cb)
	if(data.text ~= "") then
		ESX.TriggerServerCallback("esx_dojmdt:SendAnnounce", function(announcedata)
			cb(announcedata)
		end, data.text)
	end
end)

RegisterNUICallback('RemoveAnnounce', function(data)
	TriggerServerEvent('esx_dojmdt:RemoveAnnounce', data)
end)

RegisterNUICallback('SendRaport', function(data, cb)
	if(data.text ~= "") then
		ESX.TriggerServerCallback("esx_dojmdt:SendRaport", function(raportdata)
			cb(raportdata)
		end, data.text)
	end
end)

RegisterNUICallback('RemoveRaport', function(data)
	TriggerServerEvent('esx_dojmdt:RemoveRaport', data)
end)

RegisterNUICallback('NearbyPlayers', function(data, cb)
	local coords = GetEntityCoords(PlayerPedId(), true)
	local players = {}
	for _, player in ipairs(ESX.Game.GetPlayers(true)) do
		local target = GetPlayerPed(player)
		if #(GetEntityCoords(target, true) - coords) <= 10 then
			local pid = GetPlayerServerId(player)
			if pid then
				players[#players + 1]= {
					type = 'players',
					name = pid
				}
			end
		end
	end
	cb(players)
end)

RegisterNUICallback('PersonMoreInfo', function(data, cb)
	ESX.TriggerServerCallback("esx_dojmdt:PersonMoreInfo", function(moreinfodata)
		for i,v in ipairs(moreinfodata.pojadzy) do
			TriggerEvent('esx_vehicleshop:getVehicles', function(base)
				local found = false
				for _, vehicle in ipairs(base) do
					if joaat(vehicle.model) == v.model then
						v.model = vehicle.name
						found = true
					end
				end
				
				if not found then
					local label = GetLabelText(v.model)
					if label ~= "NULL" then
						v.model = label
					end
				end
			end)
		end
		
		moreinfodata.canDeleteMandaty = DeleteGradeMandat <= ESX.PlayerData.job.grade
		moreinfodata.canManageLicenses = MenageLicenseGrade <= ESX.PlayerData.job.grade
		
		cb(moreinfodata)
	end, data)
end)

RegisterNUICallback('licencjaDodaj', function(data)
	TriggerServerEvent('esx_dojmdt:licencjaDodaj', data)
end)

RegisterNUICallback('licencjaUsun', function(data)
	TriggerServerEvent('esx_dojmdt:licencjaUsun', data)
end)

RegisterNUICallback('RemoveMandatKartoteka', function(data)
	TriggerServerEvent('esx_dojmdt:RemoveMandatKartoteka', data)
end)

RegisterNUICallback('RemovePoszukiwaniaKartoteka', function(data)
	TriggerServerEvent('esx_dojmdt:RemovePoszukiwaniaKartoteka', data)
end)

RegisterNUICallback('RemoveNotatkiKartoteka', function(data)
	TriggerServerEvent('esx_dojmdt:RemoveNotatkiKartoteka', data)
end)

RegisterNUICallback('setGps', function(data)
	if data then
		SetNewWaypoint(data.coords.x, data.coords.y, data.coords.z)
		ESX.ShowNotification('~g~Zaznaczono dom na GPS')
	else
		ESX.ShowNotification('~r~Nie można zaznaczyć na GPS')
	end
end)

RegisterNUICallback('mdtclose', function()
	MdtOpened = false
	SetNuiFocus(false, false)
	stopTabletAnimation()
end)