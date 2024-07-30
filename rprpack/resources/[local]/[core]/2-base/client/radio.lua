function setRadio()
	if ESX.PlayerData.job and (ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'ambulance' or ESX.PlayerData.job.name == 'mecano') then
		exports["rp-radio"]:GivePlayerAccessToFrequency(1)
		exports["rp-radio"]:GivePlayerAccessToFrequency(2)
		exports["rp-radio"]:GivePlayerAccessToFrequency(3)
		exports["rp-radio"]:GivePlayerAccessToFrequency(4)
		exports["rp-radio"]:GivePlayerAccessToFrequency(5)
		exports["rp-radio"]:GivePlayerAccessToFrequency(6)
	else
		exports["rp-radio"]:RemovePlayerAccessToFrequency(1)
		exports["rp-radio"]:RemovePlayerAccessToFrequency(2)
		exports["rp-radio"]:RemovePlayerAccessToFrequency(3)
		exports["rp-radio"]:RemovePlayerAccessToFrequency(4)
		exports["rp-radio"]:RemovePlayerAccessToFrequency(5)
		exports["rp-radio"]:RemovePlayerAccessToFrequency(6)
	end
end