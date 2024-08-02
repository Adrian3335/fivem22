RegisterCommand('testkod', function()
    local playerJob = ESX.GetPlayerData().job
    if playerJob and playerJob.name == 'police' then
        lib.registerContext({
            id = 'city_status_menu',
            title = 'Wybierz status miasta',
            options = {
                {
                    title = '🟢 Zielony',
                    onSelect = function(data)
                        ExecuteCommand('ustawkod 1')
                        ExecuteCommand('lspd LSPD ogłasza, że obecnie obowiązuje kod zielony w mieście. Mieszkańcy zostają poinformowani o sytuacji i proszeni o zachowanie normalności, ale też ostrożność w swoich działaniach.')
                    end
                },
                {
                    title = '🟠 Pomarańczowy',
                    onSelect = function(data)
                        ExecuteCommand('ustawkod 2')
                        ExecuteCommand('lspd LSPD informuje, że obecnie obowiązuje kod pomarańczowy w mieście. Mieszkańcy są proszeni o zwiększenie czujności i ograniczenie niepotrzebnych podróży oraz zachowanie ostrożności w swoich działaniach.')
                    end
                },
                {
                    title = '🔴 Czerwony',
                    onSelect = function(data)
                        ExecuteCommand('ustawkod 3')
                        ExecuteCommand('lspd Z powodu wzrastającego zagrożenia, LSPD ogłasza kod czerwony w mieście. Wzywamy mieszkańców do natychmiastowego ograniczenia aktywności na zewnątrz i podjęcia środków ostrożności. Wszelkie podejrzane działania należy zgłosić odpowiednim służbom natychmiast.')
                    end
                },
                {
                    title = '⚫ Czarny',
                    onSelect = function(data)
                        ExecuteCommand('ustawkod 4')
                        ExecuteCommand('lspd Z powodu krytycznej sytuacji, LSPD ogłasza kod czarny w mieście. Mieszkańcy są proszeni o pozostanie w domach i unikanie wszelkich podróży oraz kontaktów na zewnątrz. Wszelkie niebezpieczne sytuacje należy zgłosić natychmiast służbom ratunkowym')
                    end
                }
            }
        })
        lib.showContext('city_status_menu')
    else
        TriggerEvent('chat:addMessage', { args = { '^1BŁĄD', 'Musisz być w LSPD, aby użyć tego menu.' } })
    end
end)

RegisterNetEvent('kod:fiut')
AddEventHandler('kod:fiut', function()
    ExecuteCommand('testkod')
end)