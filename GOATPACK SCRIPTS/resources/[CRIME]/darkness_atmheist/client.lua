ESX = exports['es_extended']:getSharedObject()
Many = exports['x-base']
RNE = RegisterNetEvent
AEH = AddEventHandler
TSE = TriggerServerEvent

exports.qtarget:AddTargetModel({'prop_atm_03', 'prop_fleeca_atm', 'prop_atm_01', 'prop_atm_02'}, {
	options = {
		
        {
            action = function()
                if crowbar() then
                    TriggerEvent('x-atmheist:StartDestroy')
                end
            end,
			icon = "fas fa-hammer",
			label = "Zniszcz",
            item = 'WEAPON_CROWBAR'
		},
	},
	distance = 2
})

RegisterNetEvent('bankomat')
AddEventHandler('bankomat', function(target, coords, location, type, hour)
	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'lssd' then
		exports["goat_notifications"]:policeNotify({
			playerId = target,
			coords = coords,
			textColor = "#fff",
			bgColor = "#06a5ff",
			title1 = "10-90",
			title2 = "Zgłoszenie",
			blip = {
				name = "Bankomat",
				sprite = 10,
				scale = 0.9,
				colour = 2,
				timeToDelete = 20000
			},
			sound = {
				file = "PoliceDispatch",
				volume = 0.3
			},
			content = {
				{
					type = "location",
					text = location
				},
				{
					type = "close",
					text = 'Wlamanie'
				},
				{
					type = "msg",
					text = "Wlamanie do bankomatu: " .. hour
				}
			}
		})
	end
end)


RNE('x-atmheist:StartDestroy')
AEH('x-atmheist:StartDestroy', function()
    local coords = GetEntityCoords(ESX.PlayerData.ped, true)
    ESX.TriggerServerCallback('x-atmheist:PoliceCount', function(status)
        if status then
            ESX.TriggerServerCallback('x-atmheist:CheckTime', function(time)

                if time then
                    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                    TriggerServerEvent('bankomat', {x = coords.x, y = coords.y, z = coords.y}, GetStreetNameFromHashKey(s1), name)
                    if lib.progressBar({
                        duration = 12000,
                        label = 'Rozwalanie bankomatu...',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                            combat = true,
                        },
                        anim = {
                            dict = "melee@large_wpn@streamed_core",
                            clip = "ground_attack_on_spot",
                            flags = 49,
                        }
                    }) then
                        if lib.progressBar({
                            duration = 13000,
                            label = 'Zbieranie pieniędzy...',
                            useWhileDead = false,
                            canCancel = true,
                            disable = {
                                car = true,
                                move = true,
                                combat = true,
                            },
                            anim = {
                                dict = 'oddjobs@shop_robbery@rob_till',
                                clip = 'loop', 
                            }
                        }) then
                    TSE('x-atmheist:Reward', 'full')
                        end
                    end
                end
            end)
        end
    end)
end)

function crowbar()
    local ped = PlayerPedId()
    local pedWeapon = GetSelectedPedWeapon(ped)

    for k, v in pairs(Config.Weapon) do
        if pedWeapon == k then
            return true
        end
    end

    --Many:Notify('inform', 'Musisz trzymać łom w ręku!')
end

