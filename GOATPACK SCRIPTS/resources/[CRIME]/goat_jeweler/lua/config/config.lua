cfg = {}
name = GetCurrentResourceName()

cfg.target = 'ox_target'

cfg.minPolice = 0
cfg.policeJob = 'police'
cfg.policeSecond = 'lssd'

cfg.cooldown = 1900 -- sekundy 
cfg.globalCooldown = 1900 -- sekundy

cfg.jeweleryCoords = vec3(-621.9745, -230.681, 38.1071)

cfg.start = vec3(-631.2171, -237.3671, 38.6529)

cfg.safeDoors = vector3(-629.4, -230.43, 38.56)

cfg.safeReward = {
    min = 50000,
    max = 100000,
}

cfg.requiredItem = { -- Itemy potrzebne zeby zrobic napad
    name = 'bomba',
    remove = true,
    numToRemove = 1
}

cfg.item = {
    drill = 'drill',
    doorsSafe = 'pendrive'
}

cfg.rewards = {
    {
        name = 'zegarek',
        random = {
            min = 1,
            max = 2
        },
        money = {
            min = 2500,
            max = 15000
        }
    },
    {
        name = 'naszyjnik',
        random = {
            min = 1,
            max = 2
        },
        money = {
            min = 5000,
            max = 10000
        }
    },
    {
        name = 'pierscionek',
        random = {
            min = 1,
            max = 2
        },
        money = {
            min = 5000,
            max = 10000
        }
    },
    
}

cfg.vetrine = {
    {
        pos = vector3(-627.735, -234.439, 37.875),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end',
    },
    {
        pos = vector3(-626.716, -233.685, 37.8583),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end',
    },
    {
        pos = vector3(-627.35, -234.947, 37.8531),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end',
    },
    {
        pos = vector3(-626.298, -234.193, 37.8492),
        oldModel = 'des_jewel_cab4_start',
        newModel = 'des_jewel_cab4_end',
    },
    {
        pos = vector3(-626.399, -239.132, 37.8616),
        oldModel = 'des_jewel_cab2_start',
        newModel = 'des_jewel_cab2_end',
    },
    {
        pos = vector3(-625.376, -238.358, 37.8687),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end',
    },
    {
        pos = vector3(-625.517, -227.421, 37.86),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end',
    },
    {
        pos = vector3(-624.467, -226.653, 37.861),
        oldModel = 'des_jewel_cab4_start',
        newModel = 'des_jewel_cab4_end',
    },
    {
        pos = vector3(-623.8118, -228.6336, 37.8522),
        oldModel = 'des_jewel_cab2_start',
        newModel = 'des_jewel_cab2_end',
    },
    {
        pos = vector3(-624.1267, -230.7476, 37.8618),
        oldModel = 'des_jewel_cab4_start',
        newModel = 'des_jewel_cab4_end',
    },
    {
        pos = vector3(-621.7181, -228.9636, 37.8425),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end',
    },
    {
        pos = vector3(-622.7541, -232.614, 37.8638),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end',
    },
    {
        pos = vector3(-620.3262, -230.829, 37.8578),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end',
    },
    {
        pos = vector3(-620.6465, -232.9308, 37.8407),
        oldModel = 'des_jewel_cab4_start',
        newModel = 'des_jewel_cab4_end',
    },
    {
        pos = vector3(-619.978, -234.93, 37.8537),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end',
    },
    {
        pos = vector3(-618.937, -234.16, 37.8425),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end',
    },
    {
        pos = vector3(-620.163, -226.212, 37.8266),
        oldModel = 'des_jewel_cab_start',
        newModel = 'des_jewel_cab_end',
    },
    {
        pos = vector3(-619.384, -227.259, 37.8342),
        oldModel = 'des_jewel_cab2_start',
        newModel = 'des_jewel_cab2_end',
    },
    {
        pos = vector3(-618.019, -229.115, 37.8302),
        oldModel = 'des_jewel_cab3_start',
        newModel = 'des_jewel_cab3_end',
    },
    {
        pos = vector3(-617.249, -230.156, 37.8201),
        oldModel = 'des_jewel_cab2_start',
        newModel = 'des_jewel_cab2_end',
    },
}