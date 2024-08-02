ESX = exports["es_extended"]:getSharedObject()
QBCore = nil
PlayerData = nil
PlayerJob = nil
PlayerGrade = nil

local VehicleData = nil

CreateThread(function()
	while not ESX.IsPlayerLoaded() do
		Wait(100)
	end
	
	PlayerData = ESX.GetPlayerData()
	PlayerJob = PlayerData.job.name
	PlayerGrade = PlayerData.job.grade

	RegisterNetEvent("esx:setJob", function(job)
		PlayerJob = job.name
		PlayerGrade = job.grade
	end)
end)

RegisterNetEvent('many-base:flipcar')
AddEventHandler('many-base:flipcar', function()
    local ped = PlayerPedId()
    local inside = IsPedInAnyVehicle(ped, true)
    if inside then
		ESX.ShowNotification('Jesteś w pojeździe!')
	elseif not inside then
        local pedcoords = GetEntityCoords(ped)
            VehicleData = ESX.Game.GetClosestVehicle()
        local dist = #(pedcoords - GetEntityCoords(VehicleData))
        if dist <= 3 then
            RequestAnimDict('missfinale_c2ig_11')
            while not HasAnimDictLoaded("missfinale_c2ig_11") do
                Wait(10)
            end
			if lib.progressBar({
				duration = 8000,
				label = 'Przewracanie...',
				useWhileDead = false,
				canCancel = true,
				disable = {
					car = true,
					move = true,
					combat = true,
				},
				anim = {
					dict = 'missfinale_c2ig_11',
					clip = 'pushcar_offcliff_m' 
				},
			}) then
            local carCoords = GetEntityRotation(VehicleData, 2)
            SetEntityRotation(VehicleData, carCoords[1], 0, carCoords[3], 2, true)
            SetVehicleOnGroundProperly(VehicleData)
			ESX.ShowNotification('Przewróciłeś pojazd!')
            ClearPedTasks(ped)
			else
				exports['many-base']:Notify('inform', 'Przestałeś przewracać pojazd!')
			end
        else
			exports['many-base']:Notify('inform', 'Jesteś zbyt daleko pojazdu!')
        end
    else
		exports['many-base']:Notify('inform', 'Nie masz siły aby przewrócić pojazdpojazdu!')
    end
end)
