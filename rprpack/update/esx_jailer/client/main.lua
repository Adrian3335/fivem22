local JailTime = 0
local JailLocation = Config.JailLocation
local isCutscene = false
local jobDestination = nil
local CurrentAction = nil
local hasAlreadyEnteredMarker = false
local jobBlip = nil
local jobNumber = nil
local isWorking = false
local working = false


local css = "<style>.message{display:-webkit-box;display:-ms-flexbox;display:-webkit-flex;display:flex;-webkit-box-align:center;-ms-flex-align:center;-webkit-align-items:center;align-items:center;flex-direction:row;width:100%;margin:20px 0;padding-left:5px;}.message .icon{display:-webkit-box;display:-ms-flexbox;display:flex;-webkit-box-align:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:justify;-ms-flex-pack:justify;justify-content:center;flex-direction:column;min-width:20px;max-width:20px;height:20px;padding:15px;border-radius:10px;margin:0 10px 0 0;box-shadow:0 0 20px #00000069;transform:rotate(0deg)}.message .icon i{font-size:16px;transform:rotate(0deg)}.message .info{display:block;width:calc(100% - 109px);background:#1f1f1f;margin:0 0 0 -25px;padding:18px 10px 10px 35px;position:relative;z-index:-1;border-radius:10px!important}.message .info .chat--title{font-size:13px;display:block;position:absolute;top:-10px;transform:none;margin:0;padding:3px 12px;background:#1f1f1f;border-radius:7px;left:7%}.message .info .chat--desc{margin:0;font-size:13px!important}.twitter .icon{background:url(images/chat_bg--twitter.png) center no-repeat #1f1f1f;background-size:110% 110%} .darkweb .icon{background:url(images/chat_bg--darkweb.png) center no-repeat #1f1f1f;background-size:110% 110%} .chat .icon{background:url(images/chat_bg--chat.png) center no-repeat #1f1f1f;background-size:110% 110%} .reportsystem .icon{background:url(images/chat_bg--reportsystem.png) center no-repeat #1f1f1f;background-size:110% 110%} .news .icon{background:url(images/chat_bg--news.png) center no-repeat #1f1f1f;background-size:110% 110%} .me .icon{background:url(images/chat_bg--me.png) center no-repeat #1f1f1f;background-size:110% 110%} .do .icon{background:url(images/chat_bg--do.png) center no-repeat #1f1f1f;background-size:110% 110%} .try .icon{background:url(images/chat_bg--try.png) center no-repeat #1f1f1f;background-size:110% 110%} .adminchat .icon{background:url(images/chat_bg--adminchat.png) center no-repeat #1f1f1f;background-size:110% 110%} .privatedm .icon{background:url(images/chat_bg--privatedm.png) center no-repeat #1f1f1f;background-size:110% 110%} .indrop .icon{background:url(images/chat_bg--indrop.png) center no-repeat #1f1f1f;background-size:110% 110%}</style>"


function getJailStatus()
	return JailTime > 0
end


RegisterNetEvent('xunjail:notify')
AddEventHandler('xunjail:notify', function(id)

	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

		local name = data.firstname .. ' ' .. data.lastname
		
		TriggerEvent('chat:addMessage', {
			template = "⚖️ <span style='font-weight: bold; color: rgb(69, 124, 1);'>{0}</span>: {1}",
			args = { '^*^2[SW]^7', (name..' ^7wyszedł z więzienia.')}
		})

	end, id)

end)


RegisterNetEvent('xjail:notify')
AddEventHandler('xjail:notify', function(fine, id, powod, jailtime, przedrostek)

	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		local name = data.firstname .. ' ' .. data.lastname
		
		TriggerEvent('chat:addMessage', {
			template = "<div class='message indrop'><div class='icon'><i class='fas fa-shopping-basket'></i></div><div class='info'><h2 class='chat--title'>&nbsp;&nbsp;{0}</h2><p class='chat--desc'>{1}</p></div></div>" .. css,
			-- template = "⚖️ <span style='font-weight: bold; color: rgb(69, 124, 1);'>{0}</span>: {1}",
			args = { 'Służba Wiezienna', (name..' ^7został/a skazany/a na: ^2'..fine..' miesięcy ^7^1| ^7Powód: ^2'..powod) }
		})
	end, id)

end)

RegisterNetEvent('esx_jailer:jailhype')
AddEventHandler('esx_jailer:jailhype', function(jailTime, cutscene)
	local sourcePed = PlayerPedId()
	SetCanAttackFriendly(sourcePed, false, false)
	NetworkSetFriendlyFireOption(false)

	SetRelationshipBetweenGroups(1, GetHashKey("PRISONER"), GetHashKey('PLAYER'))
	if JailTime > 0 then
		return
	end

	JailTime = math.floor(jailTime)
	if DoesEntityExist(sourcePed) then
		CreateThread(function()
			TriggerEvent('skinchanger:getSkin', function(skin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms['prison_wear'].male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms['prison_wear'].female)
				end
			end)
			
			if cutscene then
				-- TriggerEvent('route68:kino_state', true)
				isCutscene = true
				Cutscene()
				isCutscene = false
				TriggerEvent('route68:kino_state', false)
			end
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 3, "wiezienie", 1.0)
			
			Citizen.InvokeNative(0xCEA04D83135264CC, sourcePed, 0)
			ClearPedBloodDamage(sourcePed)
			ResetPedVisibleDamage(sourcePed)
			ClearPedLastWeaponDamage(sourcePed)
			ResetPedMovementClipset(sourcePed, 0)
			
			SetEntityCoords(sourcePed, JailLocation.x, JailLocation.y, JailLocation.z)
			TriggerEvent('eternal_multichar:SwitchRadar', true)
			while JailTime > 0 do
				sourcePed = PlayerPedId()
				
				Citizen.InvokeNative(0xF25DF915FA38C5F3, sourcePed, true)
				if IsPedInAnyVehicle(sourcePed, false) then
					Citizen.InvokeNative(0xAAA34F8A7CB32098, sourcePed)
				end

				for i = 1, 10 do
					JailTime = JailTime - 1
					Citizen.Wait(1000)
				end
				
				if #(GetEntityCoords(sourcePed) - vec3(JailLocation.x, JailLocation.y, JailLocation.z)) > 130.0000 then 
					SetEntityCoords(sourcePed, JailLocation.x, JailLocation.y, JailLocation.z)
					--exports["eternal_notification"]:AddNotification(3000, "alert", "Prokurator", "Nie możesz uciekać z więzienia")
				end
			end

			TriggerServerEvent('esx_jailer:unjailTitestmehype', -1)
			SetEntityCoords(sourcePed, Config.JailBlip.x, Config.JailBlip.y, Config.JailBlip.z)

			TriggerEvent('eternal_multichar:SwitchRadar', false)

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end)
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(1)

		if JailTime > 0 then
			draw2dText(_U('remaining_msg', ESX.Round(JailTime / 60)), { 0.025, 0.975 } )
		else
			Citizen.Wait(1000)
		end
	end
end)

RegisterNetEvent('esx_jailer:unjailhype')
AddEventHandler('esx_jailer:unjailhype', function(source)
	JailTime = 0
	working = false
	
	RemoveBlip(jobBlip)
	jobNumber = nil
	jobDestination = nil
	
	SetCanAttackFriendly(PlayerPedId(), true, false)
	NetworkSetFriendlyFireOption(true)	
end)

function draw2dText(text, pos)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	BeginTextCommandDisplayText('STRING')
	-- AddTextComponentSubstringPlayerName(text)
	AddTextComponentSubstringPlayerName("".. text .."" )
	EndTextCommandDisplayText(table.unpack(pos))
end

CreateThread(function()
	while true do
		Citizen.Wait(1)
		if JailTime > 0 and not isCutscene then
			if not working then
				CreateJob()
			else
				local isInMarker = false
				local coords = GetEntityCoords(PlayerPedId())	
				if #(coords - vec3(jobDestination.Pos.x, jobDestination.Pos.y, jobDestination.Pos.z)) < 100 then
					DrawMarker(1, jobDestination.Pos.x, jobDestination.Pos.y, jobDestination.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 119, 118, 255, 100, false, true, 2, false, false, false, false)
					if #(coords - vec3(jobDestination.Pos.x, jobDestination.Pos.y, jobDestination.Pos.z)) < 1.5 then
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby rozpocząć ~p~pracę~s~')
						if IsControlJustReleased(0, 38) and not isWorking then
							StartWork()
						end
					else
					end
				end
			end
		else
			Citizen.Wait(1000)			
		end
	end
end)

function CreateJob()
	local newJob
	repeat
		newJob = math.random(1, #Config.Jobs.List)
		Citizen.Wait(1)
	until newJob ~= jobNumber

	working = true
	if jobBlip then
		RemoveBlip(jobBlip)
	end
	
	jobNumber = newJob
	jobDestination = Config.Jobs.List[jobNumber]
	jobBlip = AddBlipForCoord(jobDestination.Pos.x, jobDestination.Pos.y, jobDestination.Pos.z)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Praca więzienna ' .. jobDestination.Name)
	EndTextCommandSetBlipName(jobBlip)
end

function StartWork()
	isWorking = true
	local delay = math.random(5000, 10000)
	ESX.ShowNotification("Rozpoczynasz pracę")
	FreezeEntityPosition(PlayerPedId(), true)

	CreateThread(function()
		Citizen.Wait(delay)
		isWorking = false
		FreezeEntityPosition(PlayerPedId(), false)
		if JailTime == 0 then
			return
		end
		local minusTime = math.random(15,30)
		ESX.ShowNotification("Od twojej odsiadki odjęto " .. minusTime .. " dni")
		JailTime = JailTime - minusTime
		CreateJob()
	end)
end

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.001+ factor, 0.03, 41, 11, 41, 90)
end

-- When player respawns / joins
AddEventHandler('esx:onPlayerSpawn', function(spawn)
	local status = 0
	while true do
		if status == 0 then
			status = 1
			TriggerEvent('inter:load', function(result)
				if result == 3 then
					status = 2
				else
					status = 0
				end
			end)
		end
		
		Citizen.Wait(200)
		if status == 2 then
			break
		end
	end
			
	TriggerServerEvent('esx_jailer:checkJailhype')
end)

CreateThread(function()
	Citizen.Wait(5000)
	TriggerServerEvent('esx_jailer:checkJailhype')
end)