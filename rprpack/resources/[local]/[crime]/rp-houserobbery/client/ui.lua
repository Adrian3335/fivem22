function openGui(percent)
    guiEnabled = true
    local msg = "Poziom stresu"
    if percent > 80 then
        msg = "Ryzyko alarmu"
    elseif percent > 60 then
        msg = "Czujesz sie nie pewnie"
    elseif percent > 30 then
        msg = "Jestes spokojny"
    end
    if percent == 0 then
        return
    end
    SendNUIMessage({runProgress = true, Length = percent, Task = msg})
end

function closeGui()
    guiEnabled = false
    SendNUIMessage({closeProgress = true})
end

local lastmessage = false
RegisterNetEvent("SLUSHRP:avvia")
AddEventHandler("SLUSHRP:avvia", function(percent)
    if not lastmessage then
        lastmessage = true
        openGui(percent)
        Citizen.Wait(500)
        lastmessage = false
    end      
end)

RegisterNetEvent("SLUSHRP:stoppa")
AddEventHandler("SLUSHRP:stoppa", function()
    TriggerEvent("SLUSHRP:avvia", 0.01)
    closeGui()
end)