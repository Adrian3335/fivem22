local radios = {}

RegisterNetEvent("pma-voice:setPlayerRadio", function(_radioChannel)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local radioChannel = tonumber(_radioChannel)

    TriggerClientEvent("dbl_radiolist:connected", _source, radioChannel)

    local _lastRadioChannel = Player(_source).state.lastRadioChannel
    local lastRadioChannel = tonumber(_lastRadioChannel)

    if lastRadioChannel and lastRadioChannel ~= 0 and lastRadioChannel ~= radioChannel then
        local findUser = false
        for i = 1, #(radios[lastRadioChannel]) do
            if radios[lastRadioChannel][i].source == _source then
                findUser = i
                break
            end
        end

        if findUser then
            table.remove(radios[lastRadioChannel], findUser)
            Player(_source).state.lastRadioChannel = 0
            TriggerClientEvent("dbl_radiolist:updateList", -1, lastRadioChannel, radios[lastRadioChannel])
        end
    end

    if radioChannel and radioChannel ~= 0 then
        if not radios[radioChannel] then
            radios[radioChannel] = {}
        end

        local findUser2 = false
        for i = 1, #(radios[radioChannel]) do
            if radios[radioChannel][i].source == _source then
                findUser2 = i
                break
            end
        end

        if not findUser2 then
            local name = "[" .. _source .. "]"
            if radioChannel <= 10 then
                local badge = MySQL.scalar.await('SELECT badge FROM users WHERE identifier = ?', {xPlayer.identifier})
                name = "[" .. badge .. "] " .. xPlayer.get("firstName") .. " " .. xPlayer.get("lastName")
            end
            table.insert(radios[radioChannel], {name = name, talking = false, source = _source})
            Player(_source).state.lastRadioChannel = radioChannel
            TriggerClientEvent("dbl_radiolist:updateList", -1, radioChannel, radios[radioChannel])
        end
    end
end)


AddEventHandler('playerDropped', function(reason)
	local playerId = source
	local xPlayer = ESX.GetPlayerFromId(playerId)

    if not xPlayer then
		return
	end

    local _lastRadioChannel = Player(playerId).state.lastRadioChannel
    local lastRadioChannel = tonumber(_lastRadioChannel)

    if lastRadioChannel and lastRadioChannel ~= 0 then
        local findUser = false
        for i = 1, #(radios[lastRadioChannel]) do
            if radios[lastRadioChannel][i].source == playerId then
                findUser = i
                break
            end
        end

        if findUser then
            table.remove(radios[lastRadioChannel], findUser)
            Player(playerId).state.lastRadioChannel = 0
            TriggerClientEvent("dbl_radiolist:updateList", -1, lastRadioChannel, radios[lastRadioChannel])
        end
    end
end)

RegisterNetEvent("pma-voice:setTalkingOnRadio", function(boolean)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local radioChannel = Player(_source).state.radioChannel
    for i = 1, #(radios[radioChannel]) do
        if radios[radioChannel].source == _source then
            radios[radioChannel].talking = boolean
            break
        end
    end
    TriggerClientEvent("dbl_radiolist:setTalkingOnRadio", -1, radioChannel, _source, boolean)
end)