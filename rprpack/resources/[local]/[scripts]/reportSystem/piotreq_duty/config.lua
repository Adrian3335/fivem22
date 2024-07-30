Config = {}

Config.AntiAfk = true
Config.MaxAfk = 600 -- 10 minut max na afku

Config.Zones = {
    {
        coords = vector3(-335.9409, -133.4601, 39.0097), 
        size = vector3(30.0, 30.0, 30.0), 
        rotation = 252.7759, 
        job = 'mechanic', 
        task = function() -- co się stanie gdy nas wyrzuci ze służby
            print('kick')
            --exports['piotreq_radial']:RemoveRadial('mechanic_menu')
        end,
    }
}