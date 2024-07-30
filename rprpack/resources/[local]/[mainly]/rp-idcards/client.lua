local PlayerData              = {}
local ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
	while ESX.GetPlayerData().job == nil do
		Wait(100)
		PlayerData = ESX.GetPlayerData()
	end
end)

function idshowanim()  
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) then
        RequestAnimDict("random@atmrobberygen")
    while (not HasAnimDictLoaded("random@atmrobberygen")) do Citizen.Wait(0) end
        TaskPlayAnim(ped, "random@atmrobberygen", "a_atm_mugging", 8.0, 3.0, 2000, 0, 1, false, false, false)
        Citizen.Wait(1500)
	    ClearPedSecondaryTask(ped) 
    end
end

RegisterCommand('idcard', function()
    showId("id")
    idshowanim()  
end, false)

RegisterCommand('businesscard', function()
    showId("businesscard")
    idshowanim()  
end, false)

function showId(idtype)
    local userId = PlayerId()
    local pedId = PlayerPedId()
    local playersInArea = ESX.Game.GetPlayersInArea(GetEntityCoords(pedId), 5.0)
    local players = {}

    for i=1, #playersInArea, 1 do
	table.insert(players, GetPlayerServerId(playersInArea[i]))
    end

    local id = GetPlayerServerId(userId)

    if #players > 0 then 
        TriggerServerEvent('bagieta_idcards:showIDtoplayers', id, players, idtype)

    end
    TriggerEvent('bagieta_idcards:createId', id, idtype)
end

RegisterNetEvent('bagieta_idcards:createId')
AddEventHandler('bagieta_idcards:createId', function (idDowodu, idtype)
    if idtype == "id" then 
        ESX.TriggerServerCallback('bagieta_idcards:createID', function(card)
	        local playerIdx = GetPlayerFromServerId(idDowodu)
            local ped = GetPlayerPed(playerIdx)
            local photo = exports["MugShotBase64"]:GetMugShotBase64(ped, false)
            SendNUIMessage({
                action = "show_id2",
                lang = Config.Language,
                firstname = card.firstName,
                lastname = card.lastName,
                birth = card.dateofbirth,
                sex = card.sex,
                lickab = card.lickab,
                lickac = card.lickac,
                lickaa = card.lickaa,
                caroc = card.caroc,
                med = card.med,
                photo = photo
            })
        end, idDowodu, idtype)
    elseif idtype == "businesscard" then
        while PlayerData.job == nil do
            Wait(100)
            PlayerData = ESX.GetPlayerData()
        end
        ESX.TriggerServerCallback('bagieta_idcards:createID', function(business)
            SendNUIMessage({
                action = "show_business",
                lang = Config.Language,
                firstname = business.firstName,
                lastname = business.lastName,
                bank = business.bankacc,
                phone = business.phone,
                job = PlayerData.job.label,
                jobgrade = PlayerData.job.grade_label
            })
        end, idDowodu, idtype)
    end
end)