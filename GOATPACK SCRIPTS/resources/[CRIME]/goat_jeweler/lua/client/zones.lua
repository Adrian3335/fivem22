Citizen.CreateThread(function()

    lib.callback.await(name..':createPed')

    local blip = AddBlipForCoord(cfg.jeweleryCoords)
    SetBlipAsShortRange(blip, true)
    SetBlipSprite(blip, 439)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("<font face='Poppins-Medium' size= '11'>Napad na jubilera</font>" )
    EndTextCommandSetBlipName(blip)

    exports[cfg.target]:addSphereZone({
        coords = cfg.start,
        radius = 1.5,
        options = {
            {
                name = name..":startRobbery",
                event = name..":startRobbery",
                icon = 'fa-solid fa-vault',
                label = 'Rozpocznij napad',
                distance = 1.0,
            }
        }
    })

    exports[cfg.target]:addBoxZone({
        coords = cfg.safeDoors,
        size = vector3(0.1, 0.2, 38.46 - 38.66),
        radius = 1.5,
        rotation = 0,
        options = {
            {
                name = name..":openSafeDoor",
                event = name..":openSafeDoor",
                icon = 'fa-solid fa-vault',
                label = 'Otwórz drzwi',
                distance = 1.5,
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
        }
    })

    for k,v in pairs(cfg.vetrine) do
        exports[cfg.target]:addSphereZone({
            coords = v.pos,
            radius = 1.0,
            options = {
                {
                    name = name..":brokeVetrine",
                    vetrine = k,
                    event = name..":brokeVetrine",
                    icon = 'fa-solid fa-vault',
                    label = 'Zbij witryne',
                    distance = 1.0,
                    canInteract = function()
                        if not isBusy then
                            if canRobVetrine then
                                if not exports.ox_inventory:getCurrentWeapon() then return false end

                                if exports.ox_inventory:getCurrentWeapon().name == 'WEAPON_CROWBAR' then 
                                    if robbedVetrines[k] then
                                        return false
                                    else
                                        return true
                                    end
                                end
                            else
                                return false
                            end
                        end
                    end
                }
            }
        })
    end

end)