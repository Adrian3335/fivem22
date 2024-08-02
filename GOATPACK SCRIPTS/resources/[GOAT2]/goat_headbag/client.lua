local Objects = {}
local BlockHeadBag = false
RegisterNetEvent("goat_headbag:useItem", function()
    if BlockHeadBag then
        ESX.ShowNotification("Nie możesz tak często używać worka")
        return
    end

    BlockHeadBag = true
    if ESX.UI.Inventory.Area.Check(2.0) then
        ESX.UI.Inventory.Area.Build(2.0, false, false, function(target, _, npc)
            if target then
                if not Player(target).state.HasHeadbag then
                    TriggerServerEvent("goat_headbag:putOnHead", target)
                else
                    TriggerServerEvent("goat_headbag:takeOffHead", target)
                end
            else
                ESX.ShowNotification("Brak obywateli w pobliżu")
            end
        end, true, false)
    else
        ESX.ShowNotification("Brak obywateli w pobliżu")
    end
    Wait(5000)
    BlockHeadBag = false
end)

RegisterNetEvent("goat_headbag:putOnHead", function(_target)
    if not LocalPlayer.state.IsHandcuffed and lib.skillCheck({"medium", "medium", "medium"}, {tostring(math.random(1, 3)), tostring(math.random(1, 3)), tostring(math.random(1, 3))}) then
        TriggerServerEvent("goat_headbag:putFailed", _target)
        return
    end

    ESX.ShowNotification("Obywatel " .. _target .. " założył Ci worek na głowę")
    LocalPlayer.state:set("HasHeadbag", true, true)
    SendNUIMessage({
        action = "put"
    })

    local PlayerPed = ESX.PlayerData.ped
    local number = #Objects + 1
    Objects[number] = CreateObject(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(Objects[number], PlayerPed, GetPedBoneIndex(PlayerPed, 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
    SetEntityCompletelyDisableCollision(Objects[number], false, true)
end)

RegisterNetEvent("goat_headbag:putFailed", function()
    ESX.ShowNotification("Obywatel wyrwał się")
end)

RegisterNetEvent("goat_headbag:takeOffHead", function(_target)
    ESX.ShowNotification("Obywatel " .. _target .. " zdjął Ci worek z głowy")
    LocalPlayer.state:set("HasHeadbag", false, true)
    SendNUIMessage({
        action = "take"
    })

    for i = 1, #(Objects) do
        DeleteEntity(Objects[i])
    end
    Objects = {}
end)

CreateThread(function()
    LocalPlayer.state:set("HasHeadbag", false, true)
end)