local blips = {

  --{title="Mechanik", colour=81, id=446, x = -204.3023, y = -1307.6086, z = 31.2651},
 -- {title="Pole Gokartowe", colour=68, id=522, x = -84.026100158691, y = -2006.4426269531, z = 18.01676940918},
 -- {title="Sklep wędkarski", colour=29, id=587, x=-1499.9188232422, y=-933.41033935547,  z=10.181132316589},
  --{title="UwU Caffe", colour=8, id=439, x = -581.07312011719, y = -1065.0321044922, z = 22.347234725952},
  --{title="Hurtownia", colour=5, id=304, x = 1242.6501464844, y = -3161.5625, z = 5.5282969474792},
  --{title="Komenda", colour=26, id=60, x = 425.130, y = -979.558, z = 30.711},
  --{title="Komenda", colour=3, id=60, x = 372.28271484375, y = -1603.2354736328, z = 30.051389694214},
  {title="Weed Shop", colour=2, id=140, x = 377.9154, y = -831.3854, z = 29.3028},
  -- {title="Vanilla Unicorn", colour=8, id=121, x=112.3, y=-1296.25,  z=29.78192},
}

Citizen.CreateThread(function()
   for _, info in pairs(blips) do
     info.blip = AddBlipForCoord(info.x, info.y, info.z)
     SetBlipSprite(info.blip, info.id)
     SetBlipDisplay(info.blip, 4)
     SetBlipScale(info.blip, 0.7)
     SetBlipColour(info.blip, info.colour)
     SetBlipAsShortRange(info.blip, true)
     BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(info.title)
     EndTextCommandSetBlipName(info.blip)
   end
end)