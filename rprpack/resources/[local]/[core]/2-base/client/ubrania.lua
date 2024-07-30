--- VANILA ---
exports.qtarget:AddBoxZone("VanillaUnicornSzatnia", vector3(99.0, -1311.62, 29.26), 1, 2, {
    name="VanillaUnicornSzatnia",
    heading= 11.0,
    debugPoly= false,
    minZ= 28.07834,
    maxZ= 31.97834,
    }, {
        options = {
            {
				event = "ciuchy",
				icon = "fa-solid fa-shirt",
				label = "Szafka z ciuchami",
                job = "vanilla",
			},
			{
				event = "zapisz",
				icon = "fa-solid fa-clipboard",
				label = "Zapisz ciuchy",
                job = "vanilla",
			},
			{
				event = "usun",
				icon = "fa-solid fa-clipboard",
				label = "Usun ciuchy",
                job = "vanilla",
			},
        },
        distance = 3.5
})

--- First Class ---
exports.qtarget:AddBoxZone("FirstClassSzatnia", vector3(-1933.49, 547.7, 119.45), 1, 2, {
    name="FirstClassSzatnia",
    heading= 11.0,
    debugPoly= false,
    minZ= 118.77834,
    maxZ= 120.87834,
    }, {
        options = {
            {
				event = "ciuchy",
				icon = "fa-solid fa-shirt",
				label = "Szafka z ciuchami",
                job = "firstclass",
			},
			{
				event = "zapisz",
				icon = "fa-solid fa-clipboard",
				label = "Zapisz ciuchy",
                job = "firstclass",
			},
			{
				event = "usun",
				icon = "fa-solid fa-clipboard",
				label = "Usun ciuchy",
                job = "firstclass",
			},
        },
        distance = 3.5
})

--- First Class ---
-- exports.qtarget:AddBoxZone("FirstClassSzatnia", vector3(-1933.49, 547.7, 119.45), 1, 2, {
--     name="FirstClassSzatnia",
--     heading= 11.0,
--     debugPoly= false,
--     minZ= 118.77834,
--     maxZ= 120.87834,
--     }, {
--         options = {
--             {
-- 				event = "ciuchy",
-- 				icon = "fa-solid fa-shirt",
-- 				label = "Szafka z ciuchami",
--                 job = "firstclass",
-- 			},
-- 			{
-- 				event = "zapisz",
-- 				icon = "fa-solid fa-clipboard",
-- 				label = "Zapisz ciuchy",
--                 job = "firstclass",
-- 			},
-- 			{
-- 				event = "usun",
-- 				icon = "fa-solid fa-clipboard",
-- 				label = "Usun ciuchy",
--                 job = "firstclass",
-- 			},
--         },
--         distance = 3.5
-- })