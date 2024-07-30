local name = GetPlayerName(PlayerId())

Citizen.CreateThread(function()
	while true do 
		name = GetPlayerName(PlayerId())
        id = GetPlayerServerId(PlayerId())

		Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', "<font face='Poppins-Medium' size= '24'>~r~ LifeStories.pl ~w~| ~w~gg./soon ~w~| ~o~ID: ".. GetPlayerServerId(PlayerId()) .." ~w~| " .. name .. "")

		SetDiscordAppId(1228756128796774611)
		SetDiscordRichPresenceAsset('rppack1024')
		SetDiscordRichPresenceAssetText('gg/q4BdysTwty');
		SetRichPresence("" .. name .." | ID: " .. id .. "")
		SetDiscordRichPresenceAction(1, "Discord!", "https://discord.gg/q4BdysTwty")
		Citizen.Wait(5000)
	end
end)

