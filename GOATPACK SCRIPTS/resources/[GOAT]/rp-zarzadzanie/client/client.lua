
ESX = nil
PlayerData = {}

ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local isMenuOpen = false

function Zarzadzajkurwami(society)

	ESX.TriggerServerCallback('esx_society:getEmployees', function(employees)
		local elements = nil
		local identifier = ''

		elements = {
			head = {"Pracownik", "Akcje"},
			rows = {}
		}

		for i=1, #employees, 1 do
			local licki = {}

			table.insert(elements.rows, {
				data = employees[i],
				cols = {
					employees[i].name,
					'{{' .. "Dodaj pojazd" .. '|give}} {{' .. "Odbierz pojazd" .. '|take}}'
				}
			})
		end


		ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'employee_list' .. society, elements, function(data, menu)
			local employee = data.data
			local praca = ESX.PlayerData.job.name

			if data.value == 'give' then

				menu.close()
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'auteczkakochanekurwa2', {
					title = 'Nazwa modelu pojazdu'
				}, function(data2, menu2)
					local amount = data2.value
					local wartosc = ''

					if amount == nil then
						menu2.close()
					return end
					if amount ~= nil then
						local check = sprawdzPojazd(praca, amount)
						Wait(0)
					if check == true then
						wartosc = amount
					else
						ESX.ShowNotification('Nie podałeś prawidłowej nazwy modelu')
						return
					end
					end
          menu2.close()

					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'id', {
						title = 'ID Pracownika'
					}, function(data3, menu3)
						local data = data3.value
						local wartosccc = ''
						if data == nil then
							ESX.ShowNotification('Podaj ID obywatela')
							return
						end

						menu3.close()
						print(amount) -- nazwa fury
						print(data) -- id zioma 
						print(praca) -- robota


						TriggerEvent('esx_giveownedcar:spawnVehiclemj', data, wartosc)
						
						TriggerServerEvent('mj-zarzadzanie:sendlog', amount, data)


					
			 	end)
			end)
			elseif data.value == 'take' then
				menu.close()
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'licka', {
					title = 'Podaj nr rejestracyjne'
				}, function(data4, menu4)
					local amount = data4.value
					local wartosc = ''
					if amount == nil then
						ESX.ShowNotification('Podaj nr rejestracyjne')
						return
					end

					menu4.close()

					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'id2', {
						title = 'ID Pracownika'
					}, function(data5, menu5)
						local data = data5.value
						local idgeja = ''
						if data == nil then
							ESX.ShowNotification('Podaj ID obywatela')
							return
						end

						print(amount) -- blachy
						print(data) -- id ziomka


						TriggerServerEvent('mj_zarzadzenie:wyjebfure', data, amount)
		
						menu5.close()	
					 	end)
					
				end, function(data5, menu5)
					menu5.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end, 'police', society)
end

 --RegisterNetEvent('mj_zarzadzanie')
 --AddEventHandler('mj_zarzadzanie', function()
 --	local jobik = ESX.PlayerData.job.name
  -- local jobcheck = sprawdzJoba(jobik)
 --	print(jobcheck)
 --	Wait(0)
 --	if jobcheck == true then
 --		Zarzadzajkurwami(jobik)
 --	else
 --		ESX.ShowNotification('Twoja praca nie ma dostępu do tej czynności')
 --		end
 --end)


RegisterNetEvent('mj_zarzadzanie')
AddEventHandler('mj_zarzadzanie', function()
	local jobik = ESX.PlayerData.job.name
		Zarzadzajkurwami(jobik)
end)


 CreateThread(function()
	local props123 = {
		'v_corp_deskseta',
	}

	exports.qtarget:AddTargetModel(props123, {
		options = {
			{
				event = "mj_zarzadzanie",
				icon = "fas fa-car",
				label = "Pojazdy",
				num = 1
			},
					},
		job = {
			'police'
		},
		distance = 5,
	})


	Citizen.Wait(5000)
  end)



