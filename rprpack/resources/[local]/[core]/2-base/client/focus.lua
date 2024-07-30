Citizen.CreateThread(function()
	while true do
		InvalidateIdleCam()
		InvalidateVehicleIdleCam()
		Wait(5000)
	end
end)

-- wypierdolenie focusa ktory sie odpala przy afku