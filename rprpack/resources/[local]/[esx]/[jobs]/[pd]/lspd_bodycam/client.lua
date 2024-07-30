local PlayerData = {}
ESX = nil
bodycama = false

local bodycamProp = 0
local bodycamModel = "prop_spycam"

local currentStatus = 'out'
local lastDict = nil
local lastAnim = nil
local lastIsFreeze = false

local ANIMS = {
	['cellphone@'] = {
		['out'] = {
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_call_listen_base',
		},
		['text'] = {
			['out'] = 'cellphone_text_out',
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_text_to_call',
		},
		['call'] = {
			['out'] = 'cellphone_call_out',
			['text'] = 'cellphone_call_to_text',
			['call'] = 'cellphone_text_to_call',
		}
	},
	['anim@cellphone@in_car@ps'] = {
		['out'] = {
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_call_in',
		},
		['text'] = {
			['out'] = 'cellphone_text_out',
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_text_to_call',
		},
		['call'] = {
			['out'] = 'cellphone_horizontal_exit',
			['text'] = 'cellphone_call_to_text',
			['call'] = 'cellphone_text_to_call',
		}
	}
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function supBodycamAnimation()
    local player = GetPlayerPed(-1)
    local playerID = PlayerId()
    local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
    local phoneRspawned = CreateObject(GetHashKey(oObjectProp), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
    local netid = ObjToNet(phoneRspawned)
    local ad = "amb@world_human_stand_mobile@female@text@enter"
    local ad2 = "amb@world_human_stand_mobile@female@text@base"
    local ad3 = "amb@world_human_stand_mobile@female@text@exit"
  
    if (DoesEntityExist(player) and not IsEntityDead(player)) then
        loadAnimDict(ad)
        RequestModel(GetHashKey(oObjectProp))
        if oIsAnimationOn == true then
            --EnableGui(false)
            TaskPlayAnim(player, ad3, "exit", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
            Wait(1840)
            DetachEntity(NetToObj(oObject_net), 1, 1)
            DeleteEntity(NetToObj(oObject_net))
            Wait(750)
            ClearPedSecondaryTask(player)
            oObject_net = nil
            oIsAnimationOn = false
        else
            oIsAnimationOn = true
            Wait(500)
            --SetNetworkIdExistsOnAllMachines(netid, true)
            --NetworkSetNetworkIdDynamic(netid, true)
            --SetNetworkIdCanMigrate(netid, false)
            TaskPlayAnim(player, ad, "enter", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
            Wait(1360)
            AttachEntityToEntity(phoneRspawned,GetPlayerPed(playerID),GetPedBoneIndex(GetPlayerPed(playerID), 28422),-0.005,0.0,0.0,360.0,360.0,0.0,1,1,0,1,0,1)
            oObject_net = netid
            Wait(200)
            --EnableGui(true)
        end
    end
  end

  function newBodycamProp()
	deleteBodycam()
	RequestModel(bodycamModel)
	while not HasModelLoaded(bodycamModel) do
		Citizen.Wait(1)
	end
	bodycamProp = CreateObject(bodycamModel, 1.0, 1.0, 1.0, 1, 1, 0)
	local bone = GetPedBoneIndex(myPedId, 28422)
	AttachEntityToEntity(bodycamProp, myPedId, bone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
end

function deleteBodycam ()
	if bodycamProp ~= 0 then
		Citizen.InvokeNative(0xAE3CBE5BF394C9C9 , Citizen.PointerValueIntInitialized(bodycamProp))
		bodycamProp = 0
	end
end

function BodycamPlayAnim (status, freeze, force)
	if currentStatus == status and force ~= true then
		return
	end

	myPedId = GetPlayerPed(-1)
	local freeze = freeze or false

	local dict = "cellphone@"
	if IsPedInAnyVehicle(myPedId, false) then
		dict = "anim@cellphone@in_car@ps"
	end
	loadAnimDict(dict)

	local anim = ANIMS[dict][currentStatus][status]
	if currentStatus ~= 'out' then
		StopAnimTask(myPedId, lastDict, lastAnim, 1.0)
	end
	local flag = 50
	if freeze == true then
		flag = 14
	end
	TaskPlayAnim(myPedId, dict, anim, 3.0, -1, -1, flag, 0, false, false, false)

	if status ~= 'out' and currentStatus == 'out' then
		Citizen.Wait(380)
		newBodycamProp()
	end

	lastDict = dict
	lastAnim = anim
	lastIsFreeze = freeze
	currentStatus = status

	if status == 'out' then
		Citizen.Wait(180)
		deleteBodycam()
		StopAnimTask(myPedId, lastDict, lastAnim, 1.0)
	end

end

function BodycamPlayOut ()
	BodycamPlayAnim('out')
end

function BodycamPlayText ()
	BodycamPlayAnim('text')
end

function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
end

RegisterNetEvent("sup_bodycam:show")
AddEventHandler("sup_bodycam:show", function(daner, job)
    local year , month, day , hour , minute , second  = GetLocalTime()

    if bodycama == true then
        if string.len(tostring(minute)) < 2 then
            minute = '0' .. minute
        end
        if string.len(tostring(second)) < 2 then
            second = '0' .. second
        end
        SendNUIMessage({
            date = day .. '/'.. month .. '/' .. year .. ' ' .. hour .. ':' .. minute .. ':' .. second,
            daneosoby = daner,
            ranga = job,
            open = true,
        })
    end
end)

RegisterCommand("bodycam", function()
    ESX.TriggerServerCallback('sove:item', function(qtty)
        if qtty > 0 then
            if not bodycama then
                bodycama = true
                BodycamPlayText()
                newBodycamProp()
                TriggerEvent('sup_bodycam:show')
                TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'bodycam', 0.02)
                -- Citizen.Wait(1000)
                BodycamPlayOut()
                deleteBodycam()
                -- Citizen.Wait(1000)
                --ExecuteCommand('e kravatbağla')
                exports.dopeNotify:SendNotification({					
					text = '<b><i class="fas fa-bell"></i> POWIADOMIENIE</span></b></br><span style="color: #a9a29f;">Włączono bodycam!<span style="color: #ffffff;">',
					type = "info",
					timeout = 3000,
					layout = "topRight"
				})
                --SetPedComponentVariation(GetPlayerPed(-1), 9, 13, 0, 2)
            else
                bodycama = false
                -- Citizen.Wait(1000)
                --SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0, 2)
                -- Citizen.Wait(1000)
                BodycamPlayText()
                newBodycamProp()
				exports.dopeNotify:SendNotification({					
					text = '<b><i class="fas fa-bell"></i> POWIADOMIENIE</span></b></br><span style="color: #a9a29f;">Wyłączono bodycam!<span style="color: #ffffff;">',
					type = "info",
					timeout = 3000,
					layout = "topRight"
				})
                TriggerEvent('sup_bodycam:close')
                TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'bodycam', 0.02)
                BodycamPlayOut()
                deleteBodycam()
            end
        else
            exports.dopeNotify:SendNotification({					
				text = '<b><i class="fas fa-bell"></i> POWIADOMIENIE</span></b></br><span style="color: #a9a29f;">Nie posiadasz  bodycama!<span style="color: #ffffff;">',
				type = "info",
				timeout = 3000,
				layout = "topRight"
			})
        end
    end, 'bodycam')
end, false)

RegisterNetEvent("sup_bodycam:close")
AddEventHandler("sup_bodycam:close", function()
    SendNUIMessage({
        open = false
    })
    --SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0, 2)
end)

RegisterNetEvent('sup_bodycam:bodycam')
AddEventHandler('sup_bodycam:bodycam', function()
    ExecuteCommand('bodycam')
end)

function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
end