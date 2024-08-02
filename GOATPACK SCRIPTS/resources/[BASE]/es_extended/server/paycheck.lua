function StartPayCheck()
	CreateThread(function()
		while true do
			Wait(Config.PaycheckInterval)
			local xPlayers = ESX.GetExtendedPlayers()
			for _, xPlayer in pairs(xPlayers) do
				local salary = xPlayer.job.grade_salary
				if salary > 0 then
					xPlayer.addAccountMoney('bank', salary)
					-- TriggerClientEvent('esx:showNotification', xPlayer.source, 'Otrzymano wypłatę w wysokości '..salary..'$')
					exports["dbl_notify"]:notify(xPlayer.source, "bank", "Bank", "Otrzymano wypłatę w wysokości "..salary..'$')
				end
			end
		end
	end)
end