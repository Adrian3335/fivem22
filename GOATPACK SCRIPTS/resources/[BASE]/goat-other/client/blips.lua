local blips = {
  {title="Los Santos Customs", colour=38, id=488, x = 548.9548, y = -187.7759, z = 54.5081},
  --{title="CarZone Garage", colour=49, id=488, x = -1421.1931, y = -442.0166, z = 35.9097},
--{title="Hurtownia", colour=26, id=52, x = 159.6597, y = -3074.5552, z = 6.0017},
 -- {title="Motoclub Pub", colour=76, id=93, x = 2514.8372, y = 4097.4009, z = 38.5846},
  --itle="Komisariat Policji", colour=29, id=60, x = 575.4241, y = -42.2951, z = 76.9157},
  {title="Arcade Bar", colour=41, id=93, x = -1276.9543, y = -306.4141, z = 37.0508},
  } 

Citizen.CreateThread(function()

   for _, info in pairs(blips) do
     info.blip = AddBlipForCoord(info.x, info.y, info.z)
     SetBlipSprite(info.blip, info.id)
     SetBlipDisplay(info.blip, 4)
     SetBlipScale(info.blip, 1.0)
     SetBlipColour(info.blip, info.colour)
     SetBlipAsShortRange(info.blip, true)
     BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(info.title)
     EndTextCommandSetBlipName(info.blip)
   end
end)