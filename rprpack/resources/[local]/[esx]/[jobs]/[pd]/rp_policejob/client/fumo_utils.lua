createBlips = function()
    for k,v in pairs(cfg.info.blips) do
        local blip = AddBlipForCoord(v.pos)

        SetBlipSprite (blip, v.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.7)
        SetBlipColour (blip, v.colour)
        SetBlipAsShortRange(blip, true)
    
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName("Posterunek Policji" )
        EndTextCommandSetBlipName(blip)
    end
end

createZones = function()
    for k,v in pairs(cfg.zones) do
        local zone = {
            coords = v.pos,
            radius = v.radius,
            options = {}
        }

        for i=1, #v.options do
            zone.options[#zone.options+1] = {
                event = v.options[i].event,
                icon = v.options[i].icon,
                label = v.options[i].label,
                groups = v.options[i].job
            }
        end
        exports.ox_target:addSphereZone(zone)
    end
end

playArrestingAnim = function()
    loadDict("mp_arresting")
	TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, -8, 3000, 49, 0, 0, 0, 0)
end

loadDict = function(animDict)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(100)

    end
    return animDict
end

actionProgbar = function(title, duration, anim, move)
    isBusy = true

    if lib.progressBar({
        duration = duration,
        label = title,
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = move,
            combat = true,
            car = true,
        },
        anim = anim,
    }) then
        isBusy = false
        return true
    else
        isBusy = false
        return false
    end
end