canRobVetrine = false
canRobSafe = false
robbedVetrines = {}
isBusy = false
countRobbed = 0
soundid = GetSoundId()
safeObject = nil
safeRobbed = false

local soundId = GetSoundId()

AddEventHandler(name..':startRobbery', function()
    if lib.callback.await(name..':getPoliceCount') < cfg.minPolice then
        return ESX.ShowNotification('Na serwerze jest za mało policjantów')
    end

    if lib.callback.await(name..':currentRobbery', false, 'check') then
        return ESX.ShowNotification('Obecnie gabloty są puste')
    end

    if cfg.requiredItem.remove then
        if not lib.callback.await(name..':removeItem', false, false) then
            return ESX.ShowNotification('Nie posiadasz wymaganego przedmiotu')
        end
    end

    if lib.callback.await(name..':checkCooldown', false, false) then
        return ESX.ShowNotification('Musisz trochę odczekać')
    end

    lib.callback.await(name..':currentRobbery', false, 'set', true)

    if lib.progressBar({
        duration = 2000,
        label = 'Podkładanie ładunku',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        anim = {
            dict = "anim_heist@hs3f@ig8_vault_explosives@right@male@",
            clip = "player_ig8_vault_explosive_plant_c",
            flag = 1
        },
        prop = {
            model = `prop_bomb_01_s`,
            pos = vec3(0.03, 0.03, 0.02),
            rot = vec3(0.0, 0.0, -1.5),
            bone = 28422
        },
    }) then 
        lib.callback.await(name..':removeItem', false, true)

        local bomba = CreateObject("prop_bomb_01_s", -631.2171, -237.3671, 37.6529, 1, 1, 0)
        SetEntityHeading(bomba, -60.0)

        ESX.ShowNotification('Za 10 sekund jebnie, spierdalaj!')
        Wait(10000)
        DeleteObject(bomba)
        lib.callback.await(name..':notifyPolice')
        ESX.ShowNotification('Policja otrzymała zgłoszenie!')
        AddExplosion(cfg.start.x, cfg.start.y, cfg.start.z, 2, 0.3, 1, 0, 1065353216, 0)
        lib.callback.await(name..':mainDoors')
        lib.callback.await(name..':checkCooldown', false, true)
        canRobVetrine = true
        canRobSafe = true
        safeRobbed = false
        robbedVetrines = {}

    else 
        lib.callback.await(name..':currentRobbery', false, 'set', false)
    end
end)

AddEventHandler(name..':brokeVetrine', function(data)
    if not canRobVetrine then return end
    isBusy = true

    local ptfxAsset = "scr_jewelheist"
    local particleFx = "scr_jewel_cab_smash"
    loadPtfxAsset(ptfxAsset)

    local vetrine = cfg.vetrine[data.vetrine]
    if vetrineAnim(vetrine.pos) then
        isBusy = false
        robbedVetrines[data.vetrine] = true
        lib.callback.await(name..':getReward', false, data.vetrine)
        countRobbed = countRobbed+1

        SetPtfxAssetNextCall(ptfxAsset)
        StartNetworkedParticleFxNonLoopedAtCoord(particleFx, vetrine.pos.x, vetrine.pos.y, vetrine.pos.z, 0.0, 0.0, 0.0, 2.0, 0, 0, 0)

        if countRobbed == #cfg.vetrine then
            StopSound(soundid)
            canRobVetrine = false
            if safeRobbed then
                lib.callback.await(name..':currentRobbery', false, 'set', false)
            end
        end
    else
        isBusy = false
    end

end)

AddEventHandler(name..':brokeSafe', function(data)
    if not lib.callback.await(name..':itemsCheck', false, cfg.item.drill) then
        ESX.ShowNotification('Nie posiadasz wymaganego przedmiotu')
    end

    isBusy = true

    RequestAnimDict( "amb@medic@standing@tendtodead@base" )
    while not HasAnimDictLoaded("amb@medic@standing@tendtodead@base") do 
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'amb@medic@standing@tendtodead@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)

    lib.callback.await(name..':itemsCheck', false, cfg.item.drill, true)

    Drilling.Type = 'VAULT_DRILL'
    Drilling.Start(function(status)
        if status then
            ESX.ShowNotification('Wiercenie udane')

            if lib.progressBar({
                duration = 1000 * 10,
                label = 'Zbieranie przedmiotów',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                },
            }) then 
                lib.callback.await(name..':getSafe')
                safeRobbed = true
                canRobSafe = false
                if not canRobVetrine then
                    lib.callback.await(name..':currentRobbery', false, 'set', false)
                end
                isBusy = false
                ClearPedTasks(PlayerPedId())
            else 
                ClearPedTasks(PlayerPedId())
                isBusy = false
            end
        else
            ESX.ShowNotification("Wiercenie nie udane")
            ClearPedTasks(PlayerPedId())
            isBusy = false
        end        
    end)
end)

AddEventHandler(name..':openSafeDoor', function(data)
    if not canRobSafe then return end

    if not lib.callback.await(name..':itemsCheck', false, cfg.item.doorsSafe) then
        ESX.ShowNotification('Nie posiadasz wymaganego przedmiotu')
        return
    end
    isBusy = true

    -- lib.callback.await(name..':itemsCheck', false, cfg.item.doorsSafe, true)

    local hacking = exports['hacking']:StartHacking()

    if hacking then
        ESX.ShowNotification("Drzwi otwarte")

        safeObject = CreateObject(GetHashKey('prop_ld_int_safe_01'), vec3(-631.0884, -229.5347, 37.1071), false, false)
        SetEntityHeading(safeObject, 160.0)
        FreezeEntityPosition(safeObject, true)

        exports['qtarget']:AddTargetEntity(safeObject, {
            options = {
                {
                    event = name..":brokeSafe",
                    icon = "fa-solid fa-vault",
                    label = "Dostań się do sejfu",
                    canInteract = function()
                        if not isBusy then
                            if canRobSafe then
                                if safeRobbed then
                                    return false
                                else
                                    return true
                                end
                            else
                                return false
                            end
                        end
                    end
                }
            },
            distance = 2.0
        })

        lib.callback.await(name..':safeDoors')
        isBusy = false
    else
        isBusy = false
        ESX.ShowNotification("Niestety jesteś głupi")
    end

end)

RegisterNetEvent(name..':createClientPed', function(s)
    local data = s.ped

    lib.requestModel(data.model)

    local entity = CreatePed(4, GetHashKey(data.model), data.pos.coords.x, data.pos.coords.y, data.pos.coords.z, data.pos.h, false, true)
    FreezeEntityPosition(entity, true)
    SetEntityInvincible(entity, true)
    SetBlockingOfNonTemporaryEvents(entity, true)

    exports['qtarget']:AddTargetEntity(entity, {
        options = {
            {
                event = name..":sellItems",
                icon = "fa-solid fa-comment",
                label = "Sprzedaj biżuterię",
            }
        },
        distance = 2.0
    })
end)

RegisterNetEvent(name..":syncBroke", function(vetrine)
    local currentVetrine = cfg.vetrine[vetrine]
    CreateModelSwap(currentVetrine.pos.x, currentVetrine.pos.y, currentVetrine.pos.z, 0.4, GetHashKey(currentVetrine.oldModel), GetHashKey(currentVetrine.newModel), 1)
end)

RegisterNetEvent(name..":syncFixed", function()
    for k,v in pairs(cfg.vetrine) do
        CreateModelSwap(v.pos.x, v.pos.y, v.pos.z, 0.4, GetHashKey(v.newModel), GetHashKey(v.oldModel), 1)
    end
end)

AddEventHandler(name..':sellItems', function()
    lib.callback.await(name..':sellItemsRobbery')
end)


RequestIpl("post_hiest_unload")