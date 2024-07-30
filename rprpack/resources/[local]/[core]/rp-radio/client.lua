ESX = nil
local PlayerData = {}

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

	Citizen.Wait(5000)
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('esx:setHiddenJob')
AddEventHandler('esx:setHiddenJob', function(hiddenjob)
    PlayerData.hiddenjob = hiddenjob
end)

local Radio = {
    Has = true,
    Open = false,
    On = false,
    Enabled = true,
    Handle = nil,
    Prop = `prop_cs_hand_radio`,
    Bone = 28422,
    Offset = vector3(0.0, 0.0, 0.0),
    Rotation = vector3(0.0, 0.0, 0.0),
    Dictionary = {
        "cellphone@",
        "cellphone@in_car@ds",
        "cellphone@str",    
        "amb@code_human_police_investigate@idle_a",  
    },
    Animation = {
        "cellphone_text_in",
        "cellphone_text_out",
        "cellphone_call_listen_a",
        "idle_b",
    },
    Clicks = true, -- Radio clicks
}
Radio.Labels = {        
    { "FRZL_RADIO_HELP", "~s~" .. ("~" .. radioConfig.Controls.Activator.Name .. "~") .. " aby ukryć menu~n~~" .. radioConfig.Controls.Toggle.Name .. "~ aby ~g~włączyć~s~ radio~n~~" .. radioConfig.Controls.Input.Name .. "~ aby wybrać częstotliwość~n~~" .. radioConfig.Controls.ToggleClicks.Name .. "~ aby ~a~ dźwięk~n~~n~Częstotliwość: ~1~ MHz" },
    { "FRZL_RADIO_HELP2", "~s~" .. ("~" .. radioConfig.Controls.Activator.Name .. "~") .. " aby ukryć menu~n~~" .. radioConfig.Controls.Toggle.Name .. "~ aby wyłączyć~s~ radio~n~~n~Częstotliwość: ~1~ MHz" },
    { "FRZL_RADIO_INPUT", "Częstotliwość" },
}

RegisterNetEvent('rp-radio:toogle')
AddEventHandler('rp-radio:toogle', function()
	local playerPed = PlayerPedId()
	local isFalling = IsPedFalling(playerPed)
	local isDead = IsEntityDead(playerPed)

    if not isFalling and Radio.Enabled and Radio.Has and not isDead then
        ESX.UI.Menu.CloseAll()
		Radio:Toggle(not Radio.Open)
    elseif (Radio.Open or Radio.On) and ((not Radio.Enabled) or (not Radio.Has) or isDead) then
        ESX.UI.Menu.CloseAll()
		Radio:Toggle(false)
		Radio.On = false
		Radio:Remove()
		exports["pma-voice"]:SetMumbleProperty("radioEnabled", false)
    elseif Radio.Open and isFalling then
        ESX.UI.Menu.CloseAll()
		Radio:Toggle(false)
	end
end)

Radio.Commands = {
    {
        Enabled = false, -- Add a command to be able to open/close the radio
        Name = "radio", -- Command name
        Help = "Toggle hand radio", -- Command help shown in chatbox when typing the command
        Params = {},
        Handler = function(src, args, raw)
            local playerPed = PlayerPedId()
            local isFalling = IsPedFalling(playerPed)
            local isDead = IsEntityDead(playerPed)

            if not isFalling and Radio.Enabled and Radio.Has and not isDead then
                Radio:Toggle(not Radio.Open)
            elseif (Radio.Open or Radio.On) and ((not Radio.Enabled) or (not Radio.Has) or isDead) then
                Radio:Toggle(false)
                Radio.On = false
                Radio:Remove()
                exports["pma-voice"]:SetMumbleProperty("radioEnabled", false)
            elseif Radio.Open and isFalling then
                Radio:Toggle(false)
            end            
        end,
    }
}

-- Setup each radio command if enabled
for i = 1, #Radio.Commands do
    if Radio.Commands[i].Enabled then
        RegisterCommand(Radio.Commands[i].Name, Radio.Commands[i].Handler, false)
        TriggerEvent("chat:addSuggestion", "/" .. Radio.Commands[i].Name, Radio.Commands[i].Help, Radio.Commands[i].Params)
    end
end

-- RegisterCommand("openradio", function()
--     TriggerEvent("rp-radio:toogle")
-- end)

-- Create/Destroy handheld radio object
function Radio:Toggle(toggle)
    local playerPed = PlayerPedId()
    local count = 0

    if not self.Has or IsEntityDead(playerPed) then
        self.Open = false
        
        DetachEntity(self.Handle, true, false)
        DeleteEntity(self.Handle)
        
        return
    end

    if self.Open == toggle then
        return
    end

    self.Open = toggle

    if self.On and not radioConfig.AllowRadioWhenClosed then
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", toggle)
    end

    local dictionaryType = 1 + (IsPedInAnyVehicle(playerPed, false) and 1 or 0)
    local animationType = 1 + (self.Open and 0 or 1)
    local dictionary = self.Dictionary[dictionaryType]
    local animation = self.Animation[animationType]

    RequestAnimDict(dictionary)

    while not HasAnimDictLoaded(dictionary) do
        Citizen.Wait(150)
    end

    if self.Open then
        RequestModel(self.Prop)

        while not HasModelLoaded(self.Prop) do
            Citizen.Wait(150)
        end

        self.Handle = Citizen.InvokeNative(0x509D5878EB39E842, self.Prop, 0.0, 0.0, 0.0, true, true, false)

        local bone = GetPedBoneIndex(playerPed, self.Bone)

        SetCurrentPedWeapon(playerPed, `weapon_unarmed`, true)
        AttachEntityToEntity(self.Handle, playerPed, bone, self.Offset.x, self.Offset.y, self.Offset.z, self.Rotation.x, self.Rotation.y, self.Rotation.z, true, false, false, false, 2, true)

        SetModelAsNoLongerNeeded(self.Handle)

        TaskPlayAnim(playerPed, dictionary, animation, 4.0, -1, -1, 50, 0, false, false, false)
    else
        TaskPlayAnim(playerPed, dictionary, animation, 4.0, -1, -1, 50, 0, false, false, false)

        Citizen.Wait(700)

        StopAnimTask(playerPed, dictionary, animation, 1.0)

        NetworkRequestControlOfEntity(self.Handle)

		while not NetworkHasControlOfEntity(self.Handle) and count < 5000 do
            Citizen.Wait(0)
            count = count + 1
        end
        
        DetachEntity(self.Handle, true, false)
        DeleteEntity(self.Handle)
    end
end

-- Add player to radio channel
function Radio:Add(id)
    exports["pma-voice"]:SetRadioChannel(id)
end

-- Remove player from radio channel
function Radio:Remove()
    exports["pma-voice"]:SetRadioChannel(0)
end

-- Generate list of available frequencies
function GenerateFrequencyList()
    radioConfig.Frequency.List = {}

    for i = radioConfig.Frequency.Min, radioConfig.Frequency.Max do
        if not radioConfig.Frequency.Private[i] or radioConfig.Frequency.Access[i] then
            radioConfig.Frequency.List[#radioConfig.Frequency.List + 1] = i
        end
    end
end

-- Check if radio is open
function IsRadioOpen()
    return Radio.Open
end

-- Check if radio is switched on
function IsRadioOn()
    return Radio.On
end

-- Check if player has radio
function IsRadioAvailable()
    return Radio.Has
end

-- Check if radio is enabled or not
function IsRadioEnabled()
    return not Radio.Enabled
end

-- Check if radio can be used
function CanRadioBeUsed()
    return Radio.Has and Radio.On and Radio.Enabled
end

-- Set if the radio is enabled or not
function SetRadioEnabled(value)
    if type(value) == "string" then
        value = value == "true"
    elseif type(value) == "number" then
        value = value == 1
    end
    
    Radio.Enabled = value and true or false
end

-- Set if player has a radio or not
function SetRadio(value)
    if type(value) == "string" then
        value = value == "true"
    elseif type(value) == "number" then
        value = value == 1
    end

    Radio.Has = value and true or false
end

-- Set if player has access to use the radio when closed
function SetAllowRadioWhenClosed(value)
    radioConfig.Frequency.AllowRadioWhenClosed = value

    if Radio.On and not Radio.Open and radioConfig.AllowRadioWhenClosed then
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
    end
end

-- Add new frequency
function AddPrivateFrequency(value)
    local frequency = tonumber(value)

    if frequency ~= nil then
        if not radioConfig.Frequency.Private[frequency] then -- Only add new frequencies
            radioConfig.Frequency.Private[frequency] = true

            GenerateFrequencyList()
        end
    end
end

-- Remove private frequency
function RemovePrivateFrequency(value)
    local frequency = tonumber(value)

    if frequency ~= nil then
        if radioConfig.Frequency.Private[frequency] then -- Only remove existing frequencies
            radioConfig.Frequency.Private[frequency] = nil

            GenerateFrequencyList()
        end
    end
end

-- Give access to a frequency
function GivePlayerAccessToFrequency(value)
    local frequency = tonumber(value)

    if frequency ~= nil then
        if radioConfig.Frequency.Private[frequency] then -- Check if frequency exists
            if not radioConfig.Frequency.Access[frequency] then -- Only add new frequencies
                radioConfig.Frequency.Access[frequency] = true

                GenerateFrequencyList()
            end
        end
    end 
end

-- Remove access to a frequency
function RemovePlayerAccessToFrequency(value)
    local frequency = tonumber(value)

    if frequency ~= nil then
        if radioConfig.Frequency.Access[frequency] then -- Check if player has access to frequency
            radioConfig.Frequency.Access[frequency] = nil

            GenerateFrequencyList()
        end
    end 
end

-- Give access to multiple frequencies
function GivePlayerAccessToFrequencies(...)
    local frequencies = { ... }
    local newFrequencies = {}
    
    for i = 1, #frequencies do
        local frequency = tonumber(frequencies[i])

        if frequency ~= nil then
            if radioConfig.Frequency.Private[frequency] then -- Check if frequency exists
                if not radioConfig.Frequency.Access[frequency] then -- Only add new frequencies
                    newFrequencies[#newFrequencies + 1] = frequency
                end
            end
        end
    end

    if #newFrequencies > 0 then
        for i = 1, #newFrequencies do
            radioConfig.Frequency.Access[newFrequencies[i]] = true
        end

        GenerateFrequencyList()
    end
end

-- Remove access to multiple frequencies
function RemovePlayerAccessToFrequencies(...)
    local frequencies = { ... }
    local removedFrequencies = {}

    for i = 1, #frequencies do
        local frequency = tonumber(frequencies[i])

        if frequency ~= nil then
            if radioConfig.Frequency.Access[frequency] then -- Check if player has access to frequency
                removedFrequencies[#removedFrequencies + 1] = frequency
            end
        end
    end

    if #removedFrequencies > 0 then
        for i = 1, #removedFrequencies do
            radioConfig.Frequency.Access[removedFrequencies[i]] = nil
        end

        GenerateFrequencyList()
    end
end

-- Define exports
exports("IsRadioOpen", IsRadioOpen)
exports("IsRadioOn", IsRadioOn)
exports("IsRadioAvailable", IsRadioAvailable)
exports("IsRadioEnabled", IsRadioEnabled)
exports("CanRadioBeUsed", CanRadioBeUsed)
exports("SetRadioEnabled", SetRadioEnabled)
exports("SetRadio", SetRadio)
exports("SetAllowRadioWhenClosed", SetAllowRadioWhenClosed)
exports("AddPrivateFrequency", AddPrivateFrequency)
exports("RemovePrivateFrequency", RemovePrivateFrequency)
exports("GivePlayerAccessToFrequency", GivePlayerAccessToFrequency)
exports("RemovePlayerAccessToFrequency", RemovePlayerAccessToFrequency)
exports("GivePlayerAccessToFrequencies", GivePlayerAccessToFrequencies)
exports("RemovePlayerAccessToFrequencies", RemovePlayerAccessToFrequencies)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, count, showNotification)
    if item == 'krotkofalowka' then
        Radio:Remove()
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", false)
        Radio:Toggle(false)
        Radio.On = false
    end
end)

CreateThread(function()
    -- Add Labels
    for i = 1, #Radio.Labels do
        AddTextEntry(Radio.Labels[i][1], Radio.Labels[i][2])
    end

    GenerateFrequencyList()

    while true do
        Citizen.Wait(0)
        -- Init local vars
        local playerPed = PlayerPedId()
        local isActivatorPressed = IsControlJustPressed(0, radioConfig.Controls.Activator.Key)
        local isFalling = IsPedFalling(playerPed)
        local isDead = IsEntityDead(playerPed)
        local minFrequency = radioConfig.Frequency.List[1]

        -- Open radio settings
        if isActivatorPressed and not isFalling and Radio.Enabled and Radio.Has and not isDead then
			if Radio.Open ~= false then
				Radio:Toggle(not Radio.Open)
			end
        elseif (Radio.Open or Radio.On) and ((not Radio.Enabled) or (not Radio.Has) or isDead) then
            Radio:Remove()
            exports["pma-voice"]:SetMumbleProperty("radioEnabled", false)
            Radio:Toggle(false)
            Radio.On = false
        elseif Radio.Open and isFalling then
            Radio:Toggle(false)
        end
        
        -- Remove player from private frequency that they don't have access to
        if not radioConfig.Frequency.Access[radioConfig.Frequency.Current] and radioConfig.Frequency.Private[radioConfig.Frequency.Current] and Radio.On then
            Radio:Remove()
            radioConfig.Frequency.CurrentIndex = 1
            radioConfig.Frequency.Current = minFrequency
            Radio:Add(radioConfig.Frequency.Current)
        end

        -- Check if player is holding radio
        if Radio.Open then
            local dictionaryType = 1 + (IsPedInAnyVehicle(playerPed, false) and 1 or 0)
            local openDictionary = Radio.Dictionary[dictionaryType]
            local openAnimation = Radio.Animation[1]
            local isPlayingOpenAnim = IsEntityPlayingAnim(playerPed, openDictionary, openAnimation, 3)
            local hasWeapon, currentWeapon = GetCurrentPedWeapon(playerPed, 1)

            -- Remove weapon in hand as we are using the radio
            if currentWeapon ~= `weapon_unarmed` then
                SetCurrentPedWeapon(playerPed, `weapon_unarmed`, true)
            end

            -- Display help text
            BeginTextCommandDisplayHelp(Radio.Labels[Radio.On and 2 or 1][1])

            if not Radio.On then
                AddTextComponentSubstringPlayerName(Radio.Clicks and "wyłączyć~w~" or "~g~włączyć~w~")
            end

            AddTextComponentInteger(radioConfig.Frequency.Current)
            EndTextCommandDisplayHelp(false, false, false, -1)

            
            -- Play default animation
            if not isPlayingOpenAnim then
                RequestAnimDict(openDictionary)
    
                while not HasAnimDictLoaded(openDictionary) do
                    Citizen.Wait(150)
                end

                TaskPlayAnim(playerPed, openDictionary, openAnimation, 4.0, -1, -1, 50, 0, false, false, false)
            end

            -- Turn radio on/off
            if IsControlJustPressed(0, radioConfig.Controls.Toggle.Key) then
                if not Radio.On then
					if radioConfig.Frequency.Access[radioConfig.Frequency.Current] then
						local found = false
						for i=1, #radioConfig.Frequency.Access[radioConfig.Frequency.Current], 1 do
							if PlayerData.job.name == radioConfig.Frequency.Access[radioConfig.Frequency.Current][i] or PlayerData.hiddenjob.name == radioConfig.Frequency.Access[radioConfig.Frequency.Current][i] then
								found = true
								break
							end
						end
						
						if found == true then
							PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
							Citizen.Wait(400)
							PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
							Citizen.Wait(400)
							PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
							Citizen.Wait(550)
							PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
							Radio.On = not Radio.On
							exports["pma-voice"]:SetMumbleProperty("radioEnabled", Radio.On)
							Radio:Add(radioConfig.Frequency.Current)
						else
							PlaySoundFrontend(-1, "Hack_Failed", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
							ESX.ShowNotification("Nie masz dostępu do tej częstotliwości")
                            -- exports['fc_notify']:DoHudText('error', 'Nie masz dostępu do tej częstotliwości')
						end
					else
						PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
						Citizen.Wait(400)
						PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
						Citizen.Wait(400)
						PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
						Citizen.Wait(550)
						PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
						Radio.On = not Radio.On
                        exports["pma-voice"]:SetMumbleProperty("radioEnabled", Radio.On)
                        Radio:Add(radioConfig.Frequency.Current)
					end
                else
					PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
					Citizen.Wait(400)
					PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
					Citizen.Wait(400)
					PlaySoundFrontend(-1, "Hack_Failed", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
					Radio.On = not Radio.On
					exports["pma-voice"]:SetMumbleProperty("radioEnabled", Radio.On)
                    Radio:Remove()
                end
            end

            -- Change radio frequency
            if not Radio.On then
                DisableControlAction(0, radioConfig.Controls.ToggleClicks.Key, false)

                if not radioConfig.Controls.Input.Pressed then
                    if IsControlJustPressed(0, radioConfig.Controls.Input.Key) then
                        radioConfig.Controls.Input.Pressed = true
                        CreateThread(function()
                            DisplayOnscreenKeyboard(1, Radio.Labels[3][1], "", radioConfig.Frequency.Current, "", "", "", 2)

                            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                                Citizen.Wait(150)
                            end

                            local input = nil

                            if UpdateOnscreenKeyboard() ~= 2 then
                                input = GetOnscreenKeyboardResult()
                            end

                            Citizen.Wait(500)
                            
                            input = tonumber(input)

                            if input ~= nil then
                                if input >= minFrequency and input <= radioConfig.Frequency.List[#radioConfig.Frequency.List] and input == math.floor(input) then
                                    if not radioConfig.Frequency.Private[input] or radioConfig.Frequency.Access[input] then
                                        local idx = nil

                                        for i = 1, #radioConfig.Frequency.List do
                                            if radioConfig.Frequency.List[i] == input then
                                                idx = i
                                                break
                                            end
                                        end

                                        if idx ~= nil then
                                            radioConfig.Frequency.CurrentIndex = idx
                                            radioConfig.Frequency.Current = input
                                        end
                                    end
                                end
                            end
                            
                            radioConfig.Controls.Input.Pressed = false
                        end)
                    end
                end
                
                -- Turn radio mic clicks on/off
                if IsDisabledControlJustPressed(0, radioConfig.Controls.ToggleClicks.Key) then
                    Radio.Clicks = not Radio.Clicks

                    SendNUIMessage({ sound = "audio_off", volume = 0.5})
                    
                    exports["pma-voice"]:SetMumbleProperty("micClicks", Radio.Clicks)
                end
            end
        end
    end
end)

CreateThread(function()
	while true do
		Citizen.Wait(0)
		if NetworkIsSessionStarted() then
            exports["pma-voice"]:SetMumbleProperty("radioClickMaxChannel", radioConfig.Frequency.Max) -- Set radio clicks enabled for all radio frequencies
            exports["pma-voice"]:SetMumbleProperty("radioEnabled", false) -- Disable radio control
			return
		end
	end
end)

RegisterNetEvent("Radio.Toggle")
AddEventHandler("Radio.Toggle", function()
    local playerPed = PlayerPedId()
    local isFalling = IsPedFalling(playerPed)
    local isDead = IsEntityDead(playerPed)
    
    if not isFalling and not isDead and Radio.Enabled and Radio.Has then
        Radio:Toggle(not Radio.Open)
    end
end)

RegisterNetEvent("Radio.Set")
AddEventHandler("Radio.Set", function(value)
    if type(value) == "string" then
        value = value == "true"
    elseif type(value) == "number" then
        value = value == 1
    end

    Radio.Has = value and true or false
end)

function SetFrequencyRadial(freq)
	if Radio.Has then
		if freq > 0 then
			local newFrequency = tonumber(freq)
			if newFrequency then
				local minFrequency = radioConfig.Frequency.List[1]
				if newFrequency >= minFrequency and newFrequency <= radioConfig.Frequency.List[#radioConfig.Frequency.List] and newFrequency == math.floor(newFrequency) then
					if not radioConfig.Frequency.Private[newFrequency] or radioConfig.Frequency.Access[newFrequency] then
						local idx = nil
			
						for i = 1, #radioConfig.Frequency.List do
							if radioConfig.Frequency.List[i] == newFrequency then
								idx = i
								break
							end
						end
			
						if idx ~= nil then
							if Radio.Enabled then
								Radio:Remove()
							end

							radioConfig.Frequency.CurrentIndex = idx
							radioConfig.Frequency.Current = newFrequency

							if Radio.On then
								Radio:Add(radioConfig.Frequency.Current)
							end
						end
					end
				end
			end
		end                    
	end
end

AddEventHandler('Tomci0:SetRadioOff', function()
	SetFrequencyRadial(0)
    ESX.ShowNotification("Wyłączyłeś/aś radio")
    -- exports['fc_notify']:DoHudText('error', 'Wyłączyłeś/aś radio'

    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
    Citizen.Wait(400)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
    Citizen.Wait(400)
    PlaySoundFrontend(-1, "Hack_Failed", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
    Radio.On = false
    exports["pma-voice"]:SetMumbleProperty("radioEnabled", Radio.On)
    Radio:Remove()
end)

AddEventHandler('Tomci0:SetRadio1', function()
    if Radio.On then
        SetFrequencyRadial(2)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość LSPD #MAIN")
    else
        Radio.On = true
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
        SetFrequencyRadial(2)
        ESX.ShowNotification('Dołączyłeś/aś na częstotliwość LSPD #1')
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(550)
        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
    end
end)

AddEventHandler('Tomci0:SetRadio2', function()
    if Radio.On then
        SetFrequencyRadial(3)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość LSPD #2")
        -- exports['fc_notify']:DoHudText('error', 'Dołączyłeś/aś na częstotliwość LSPD #2')
      

    else
        Radio.On = true
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
        SetFrequencyRadial(3)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość SASP #2")
        -- exports['fc_notify']:DoHudText('error', 'Dołączyłeś/aś na częstotliwość LSPD #2')
      
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(550)
        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
    end
end)

AddEventHandler('Tomci0:SetRadio3', function()
    if Radio.On then
        SetFrequencyRadial(4)
        -- exports['fc_notify']:DoHudText('error', 'Dołączyłeś/aś na częstotliwość LSPD #3')
        
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość LSPD #3")
    else
        Radio.On = true
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
        SetFrequencyRadial(4)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość SASP #3")
        -- exports['fc_notify']:DoHudText('error', 'Dołączyłeś/aś na częstotliwość LSPD #3')
      
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(550)
        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
    end
end)

AddEventHandler('Tomci0:SetRadio4', function()
    if Radio.On then
        SetFrequencyRadial(5)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość EMS #1")
        -- exports['fc_notify']:DoHudText('error', 'Dołączyłeś/aś na częstotliwość LSPD #4')
    
    else
        Radio.On = true
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
        SetFrequencyRadial(5)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość SASP #4")
        -- exports['fc_notify']:DoHudText('error', 'Dołączyłeś/aś na częstotliwość LSPD #4')
       
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(550)
        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
    end
end)

AddEventHandler('Tomci0:SetRadio5', function()
    if Radio.On then
        SetFrequencyRadial(6)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość #EMS 2")
        -- exports['fc_notify']:DoHudText('error', 'Dołączyłeś/aś na częstotliwość #EMS 1')
       
    else
        Radio.On = true
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
        SetFrequencyRadial(6)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość #EMS 1")
        -- exports['fc_notify']:DoHudText('error', 'DDołączyłeś/aś na częstotliwość #EMS 1')
       

        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(550)
        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
    end
end)

AddEventHandler('Tomci0:SetRadio6', function()
    if Radio.On then
        SetFrequencyRadial(7)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość #LSCM 1")
        -- exports['fc_notify']:DoHudText('error', 'DDołączyłeś/aś na częstotliwość #LSC 1')
        

    else
        Radio.On = true
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
        SetFrequencyRadial(7)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość #LSC 1")
        -- exports['fc_notify']:DoHudText('error', 'DDołączyłeś/aś na częstotliwość #LSC 1')
       

        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(550)
        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
    end
end)

AddEventHandler('Tomci0:SetRadio7', function()
    if Radio.On then
        SetFrequencyRadial(8)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość #LSCM 2")
        -- exports['fc_notify']:DoHudText('error', 'DDołączyłeś/aś na częstotliwość #LSC 1')
        

    else
        Radio.On = true
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
        SetFrequencyRadial(8)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość #LSC 1")
        -- exports['fc_notify']:DoHudText('error', 'DDołączyłeś/aś na częstotliwość #LSC 1')
       

        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(550)
        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
    end
end)

AddEventHandler('Tomci0:SetRadio8', function()
    if Radio.On then
        SetFrequencyRadial(8)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość #DOJ 1")
        -- exports['fc_notify']:DoHudText('error', 'DDołączyłeś/aś na częstotliwość #LSC 1')
        

    else
        Radio.On = true
        exports["pma-voice"]:SetMumbleProperty("radioEnabled", true)
        SetFrequencyRadial(9)
        ESX.ShowNotification("Dołączyłeś/aś na częstotliwość #LSC 1")
        -- exports['fc_notify']:DoHudText('error', 'DDołączyłeś/aś na częstotliwość #LSC 1')
       

        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(400)
        PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        Citizen.Wait(550)
        PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
    end
end)
