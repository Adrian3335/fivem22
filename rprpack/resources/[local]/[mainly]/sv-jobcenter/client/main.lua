exports.qtarget:AddBoxZone("urzadpracy", vector3(-266.280, -955.392, 31.227), 1.8, 4.0, {
	name="urzadpracy",
	heading=28.0,
	debugPoly=false,
	minZ=36.00,
	maxZ=37.05,
}, {
	options = {
		{
			action = function ()
				open()
			end,
			icon = "fas fa-briefcase",
			label = "Zatrudnij się",
		},
	},
	distance = 2.0
})

Citizen.CreateThread(function()
    local blipCoord = AddBlipForCoord(-266.280, -955.392, 31.227)
    SetBlipSprite(blipCoord, 498)
    SetBlipDisplay(blipCoord, 4)
    SetBlipScale(blipCoord, 1.0)
    SetBlipColour(blipCoord, 5)
    SetBlipAsShortRange(blipCoord, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Urząd Pracy")
    EndTextCommandSetBlipName(blipCoord)
end)

Citizen.CreateThread(function()
    RequestModel('ig_fbisuit_01')
    while not HasModelLoaded('ig_fbisuit_01') or not HasCollisionForModelLoaded('ig_fbisuit_01') do
    Wait(1)
end

local typo = CreatePed(28, 'ig_fbisuit_01', -266.280, -955.392, 30.227, 119.407, true, true)
SetEntityAsMissionEntity(typo, true, true)
SetEntityInvincible(typo, true)
SetBlockingOfNonTemporaryEvents(typo, true)
FreezeEntityPosition(typo, true)
end)

open = function ()
	SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'open'
    })
end

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
    ClearPedTasks(PlayerPedId())
    ClearAreaOfObjects(GetEntityCoords(PlayerPedId()), 1.0, 0)
end)

RegisterNUICallback("setjob", function(data)
    SetNuiFocus(false, false)
    ClearAreaOfObjects(GetEntityCoords(PlayerPedId()), 1.0, 0)
    TriggerServerEvent('sv-urzad:zatrudnijSie', data.praca)
end)