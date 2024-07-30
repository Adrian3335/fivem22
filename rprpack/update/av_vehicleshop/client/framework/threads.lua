--[[
    decrypted for reason: scamming
    opiumdev owns all
]]

CreateThread(function()
    local w = 1000
    while Config.Text3D do
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Dealerships) do
            local coords = v['text_zones']
            for i, j in pairs(coords) do
                if #(playerCoords - vector3(j['x'], j['y'], j['z'])) <= j['distance'] and not inMenu then
                    w = 1
                    if v['job'] then
                        if v['job'] == GetJob() then
                            DrawText3D(j['x'], j['y'], j['z'], Lang['3d_text'])
                            if IsControlJustPressed(0,38) then
                                TriggerEvent("av_vehicleshop:open",k)
                            end
                        end
                    else
                        DrawText3D(j['x'], j['y'], j['z'], Lang['3d_text'])
                        if IsControlJustPressed(0,38) then
                            TriggerEvent("av_vehicleshop:open",k)
                        end
                    end
                end
            end
        end
        Wait(w)
        w = 1000
    end
end)

local radar = true
CreateThread(function()
    while true do
        if inMenu and radar then
            radar = false
            DisplayRadar(radar)
            TriggerEvent('hide_hud_event')
        end
        if not inMenu and not radar then
            radar = true
            DisplayRadar(radar)
            TriggerEvent('display_hud_event')
        end
        Wait(2000)
    end
end)