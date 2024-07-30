ESX = exports["es_extended"]:getSharedObject()

RegisterCommand('tp', function(source, args, rawCommand)
    if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil and tonumber(args[3]) ~= nil then
    local posx = tonumber(args[1])
    local posy = tonumber(args[2])
    local posz = tonumber(args[3])
    local coords = { x = posx, y = posy, z = posz}
    local pedal = PlayerPedId()
    ESX.TriggerServerCallback("sprawdzrange", function(ranga)
        if ranga == "admin" or ranga == "superadmin" or ranga == "mod" then
            SetEntityCoords(pedal, coords.x, coords.y, coords.z, false, true, false, false)
        else
            ESX.ShowNotification('Nie masz Permisjii')
        end
    end)
    end
end)