ESX = exports['es_extended']:getSharedObject()

lib.callback.register('piotreq_radiolist:GetUsers', function()
    local players = exports['pma-voice']:getPlayersInRadioChannel(Player(source).state['radioChannel'])
    local list = {}
    for player, isTalking in pairs(players) do
        local list2 = {player = GetRPName(player), isTalking = isTalking, badge = GetPlayerBadge(player)}
        table.insert(list, list2)
    end
    return list
end)

function GetRPName(player)
    local xPlayer = ESX.GetPlayerFromId(player)
    local fullname = xPlayer.getName()
    return fullname
end

function GetPlayerBadge(player)
    local xPlayer = ESX.GetPlayerFromId(player)
    local badge = MySQL.query.await('SELECT badge FROM users WHERE identifier = ?', {xPlayer.identifier})[1].badge
    if (badge == '') then badge = 'Brak' end
    if (badge == nil) then badge = 'Brak' end

    return badge
end

exports('GetPlayerBadge', GetPlayerBadge)