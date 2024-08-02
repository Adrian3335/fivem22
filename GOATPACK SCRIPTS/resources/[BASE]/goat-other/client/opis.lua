local opisy = {}

local displayOpisHeight = -0.1
local playerOpisDist = 20
local red = 205
local green = 255
local blue = 155

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov*1.5

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(3, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		World3dToScreen2d(x,y,z, 0) 
        DrawText(_x,_y)
    end
end

function DrawText3DOpis(x,y,z, text)
    z = z + 0.1
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2,3
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov*0.4

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(1, 0, 0, 0, 255)
        SetTextEdge(5, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		    World3dToScreen2d(x,y,z, 0) 
        DrawText(_x,_y)
    end
end

RegisterNetEvent('many-base:opis')
AddEventHandler('many-base:opis', function(player, opis)
    local info = opis
    local id = player
    opisy[id] = info
end)

RegisterNetEvent('many-base:opisGraczy')
AddEventHandler('many-base:opisGraczy', function()
    local Id = GetPlayerServerId(PlayerId())
    local opis = opisy[Id]
    TriggerServerEvent('many-base:opis:serwer', id, opis)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for _, player in ipairs(GetActivePlayers()) do
            N_0x31698aa80e0223f8(player)
        end
        for _, player2 in ipairs(GetActivePlayers()) do
            local id = GetPlayerServerId(player2)
            if (opisy[id] ~= nil and tostring(opisy[id]) ~= '') then

                ped = GetPlayerPed( player2 )
                blip = GetBlipFromEntity( ped )

                xx1, yy1, zz1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                xx2, yy2, zz2 = table.unpack( GetEntityCoords( GetPlayerPed( player2 ), true ) )
                distance2 = math.floor(GetDistanceBetweenCoords(xx1,  yy1,  zz1,  xx2,  yy2,  zz2,  true))

                if ((distance2 < playerOpisDist)) then
                    local tekst = tostring(opisy[id])
                    local words = {}
                    for word in tekst:gmatch("%w+") do table.insert(words, word) end
                    if #tekst > 40 then
                        local part1 = ''
                        local part2 = ''
                        local srodek = math.floor(#words * 0.5)
                        local srodek2 = srodek + 1
                        for i=1, srodek do
                            part1 = part1..words[i]..' '
                        end
                        for i=srodek+1, #words do
                            if i ~= #words then
                                part2 = part2..words[i]..' '
                            elseif i ==  #words then
                                part2 = part2..words[i]
                            end
                        end
                        DrawText3DOpis(xx2, yy2, zz2 + displayOpisHeight, part1..''..part2)
                    else
                        DrawText3DOpis(xx2, yy2, zz2 + displayOpisHeight, tekst)
                    end
                end

            end
        end
    end
end)