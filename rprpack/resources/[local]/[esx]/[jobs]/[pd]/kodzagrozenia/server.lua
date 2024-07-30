 

ESX = nil
local Webhook = "https://discord.com/api/webhooks/1225498371939373089/jPEZDp8zDYkLsUY648ItBKUxqGXt8LHNhgWhn7ty6pisKAJvQw1YymDdkxCQM9XXXINc"

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esentill:wyslijwebhookaZIELONY')
AddEventHandler('esentill:wyslijwebhookaZIELONY', function(information)
    local embeds = {
        {
            ["title"] = "Aktualny kod: ZIELONY",
            ["type"]="rich",
            ["color"] = 456750,
            ["fields"] = {
                {
                    ["name"] = "News",
                    ["value"] = "Zaaktualizowano kod zagrożenia na mieście.",
                    ["inline"] = true,
                },
            },
            ["thumbnail"]=  {
                ["url"] = "https://cdn.discordapp.com/attachments/723191081981968455/840362049099137074/verkus_zielony.png",
            },
        }
    }
    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({ username = "Kod zagrożenia",embeds = embeds}), { ['Content-Type'] = 'application/json' })    
end)
RegisterNetEvent('esentill:wyslijwebhookaPOMARANCZOWY')
AddEventHandler('esentill:wyslijwebhookaPOMARANCZOWY', function(information)
    local embeds = {
        {
            ["title"] = "Aktualny kod: POMARAŃCZOWY",
            ["type"]="rich",
            ["color"] = 15442208,
            ["fields"] = {
                {
                    ["name"] = "News",
                    ["value"] = "Zaaktualizowano kod zagrożenia na mieście.",
                    ["inline"] = true,
                },
            },
            ["thumbnail"]=  {
                ["url"] = "https://cdn.discordapp.com/attachments/723191081981968455/840362231774314496/verkus_pomaranczowy.png",
            },
        }
    }
    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({ username = "Kod zagrożenia",embeds = embeds}), { ['Content-Type'] = 'application/json' })    
end)
RegisterNetEvent('esentill:wyslijwebhookaCZERWONY')
AddEventHandler('esentill:wyslijwebhookaCZERWONY', function(information)
    local embeds = {
        {
            ["title"] = "Aktualny kod: CZERWONY",
            ["type"]="rich",
            ["color"] = 16061717,
            ["fields"] = {
                {
                    ["name"] = "News",
                    ["value"] = "Zaaktualizowano kod zagrożenia na mieście.",
                    ["inline"] = true,
                },
            },
            ["thumbnail"]=  {
                ["url"] = "https://cdn.discordapp.com/attachments/723191081981968455/840362396613738516/verkus_czerwony.png",
            },
        }
    }
    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({ username = "Kod zagrożenia",embeds = embeds}), { ['Content-Type'] = 'application/json' })    
end)
RegisterNetEvent('esentill:wyslijwebhookaCZARNY')
AddEventHandler('esentill:wyslijwebhookaCZARNY', function(information)
    local embeds = {
        {
            ["title"] = "Aktualny kod: CZARNY",
            ["type"]="rich",
            ["color"] = 000,
            ["fields"] = {
                {
                    ["name"] = "SWAT",
                    ["value"] = "Zaaktualizowano kod zagrożenia na mieście,prośimy o pozostanie w swoich mieszkaniach!",
                    ["inline"] = true,
                },
            },
            ["thumbnail"]=  {
                ["url"] = "https://cdn.discordapp.com/attachments/723191081981968455/840362835186810941/verkus_czarny.png",
            },
        }
    }
    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({ username = "Kod zagrożenia",embeds = embeds}), { ['Content-Type'] = 'application/json' })    
end)
RegisterServerEvent("esentill:wiadomosczielony")
AddEventHandler("esentill:wiadomosczielony", function(information)
    TriggerClientEvent('chat:addMessage', -1, {args = {"^4 👮‍♂️ LSPD: ^3Kod zagrożenia został zaaktualizowany. Obecny kod zagrożenia: ^2ZIELONY"} })
end)
RegisterServerEvent("esentill:wiadomoscpomaranczowy")
AddEventHandler("esentill:wiadomoscpomaranczowy", function(information)
    TriggerClientEvent('chat:addMessage', -1, {args = {"^4 👮‍♂️ LSPD: ^3Kod zagrożenia został zaaktualizowany. Obecny kod zagrożenia: ^8POMARAŃCZOWY"} })
end)
RegisterServerEvent("esentill:wiadomoscczerwony")
AddEventHandler("esentill:wiadomoscczerwony", function(information)
    TriggerClientEvent('chat:addMessage', -1, {args = {"^4 👮‍♂️ LSPD: ^3Kod zagrożenia został zaaktualizowany. Obecny kod zagrożenia: ^1CZERWONY"} })
end)
RegisterServerEvent("esentill:wiadomoscczarny")
AddEventHandler("esentill:wiadomoscczarny", function(information)
    TriggerClientEvent('chat:addMessage', -1, {args = {"^4 👮‍♂️ LSPD: ^3Kod zagrożenia został zaaktualizowany,prośimy o pozostanie w swoich mieszkaniach! Obecny kod zagrożenia najwyższy: ^0CZARNY"} })
end)
