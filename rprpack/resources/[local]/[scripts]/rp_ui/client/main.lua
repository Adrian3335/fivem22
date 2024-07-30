CreateThread(function()
    DisplayRadar(false)
    while not ESX.PlayerLoaded do
        Wait(100)
    end
    Main.HUD.StartNUI()
    CreateThread(Main.HUD.MainThread)
end)