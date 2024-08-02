CreateThread(function()
	for model, config in pairs(Config.Beds) do
		RequestAnimDict(config.dict)
		while not HasAnimDictLoaded(config.dict) do Citizen.Wait(0) end
	end

	exports.qtarget:AddTargetModel(Config.Chairs, {
		options = {
			{
				event = "goat_sit:sit",
				icon = "fas fa-user-tie",
				label = "Usiądź"
			},
		},
		distance = 2
	})

	RegisterNetEvent("goat_sit:sit", function(data)
		local playerPed = PlayerPedId()
		local objectPos = GetEntityCoords(data.entity)
		local objectCfg = Config.ChairOffsets[GetEntityModel(data.entity)]
		local objectOfs = (objectCfg.offset or objectCfg)
		local objectScn = (objectCfg.scenario or 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER')
		
		FreezeEntityPosition(data.entity, true)
		TaskStartScenarioAtPosition(playerPed, objectScn, objectPos.x - objectOfs.x, objectPos.y - objectOfs.y, objectPos.z - objectOfs.z, GetEntityHeading(data.entity) + 180.0, -1, (data.sitanim or 0), true)
	end)

	for model, config in pairs(Config.Beds) do
		exports.qtarget:AddTargetModel(model, {
			options = {
				{
					event = "goat_sit:slep",
					icon = "fas fa-user-tie",
					label = "Połóż się",
					config = config
				},
			},
			distance = 2
		})
	end

	RegisterNetEvent("goat_sit:slep", function(data)
		local playerPed = PlayerPedId()
		local BedCoords, BedHeading = GetEntityCoords(data.entity), GetEntityHeading(data.entity)
		
		SetEntityCoords(playerPed, BedCoords)
		SetEntityHeading(playerPed, (BedHeading+180))
		TaskPlayAnim(playerPed, data.config.dict, data.config.anim, 8.0, -8.0, -1, 1, 0, false, false, false)
	end)
end)
