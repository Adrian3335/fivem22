local loaded = false
RegisterCommand('shaders', function() 
	if not loaded then
		loaded = true
		for key, value in pairs(Config.Visuals) do
			SetVisualSettingFloat(key, value)
		end
		
		ESX.ShowNotification("Shadery zostały włączone, jeżeli chcesz wyłaczyć zrób relog'a")
	end
end)