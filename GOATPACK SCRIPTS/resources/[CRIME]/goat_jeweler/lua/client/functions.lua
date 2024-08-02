loadAnimDict = function(dict)  
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end 

vetrineAnim = function(v)
    local complete = false
    PlaySoundFromCoord(-1, "Glass_Smash", v.x, v.y, v.z, "", 0, 0, 0)

    if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
        RequestNamedPtfxAsset("scr_jewelheist")
    end
    while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
        Citizen.Wait(0)
    end
    SetPtfxAssetNextCall("scr_jewelheist")
    StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", v.x, v.y, v.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    
    -- TaskPlayAnim(, "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
    FreezeEntityPosition(PlayerPedId(), true)
    if lib.progressBar({
        duration = 5 * 1000,
        label = 'Rabowanie',
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = false
        },
        anim = {
            dict = 'missheist_jewel',
            clip = 'smash_case'
        }
    }) then
        FreezeEntityPosition(PlayerPedId(), false)
        complete = true
    else
        FreezeEntityPosition(PlayerPedId(), false)
    end
    return complete
end