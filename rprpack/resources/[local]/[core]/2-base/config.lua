-- RECOIL/EFFECTS --

Config = {
	
Recoils = {
		[`WEAPON_STUNGUN`] = {0.5, 2.0}, -- STUN GUN
		[`WEAPON_FLAREGUN`] = {0.9, 1.9}, -- FLARE GUN
	
		[`WEAPON_SNSPISTOL`] = {5.2, 5.2}, -- SNS PISTOL
		[`WEAPON_SNSPISTOL_MK2`] = {5.2, 5.2}, -- SNS PISTOL MK2
		[`WEAPON_VINTAGEPISTOL`] = {5.2, 5.2}, -- VINTAGE PISTOL
		[`WEAPON_PISTOL`] = {5.2, 5.2}, -- PISTOL
		[`WEAPON_PISTOL_MK2`] = {5.2, 5.2}, -- PISTOL MK2
		[`WEAPON_DOUBLEACTION`] = {5.2, 5.2}, -- DOUBLE ACTION REVOLVER
		[`WEAPON_COMBATPISTOL`] = {5.2, 5.2}, -- COMBAT PISTOL
		[`WEAPON_HEAVYPISTOL`] = {5.2, 5.2}, -- HEAVY PISTOL
		[`WEAPON_GLOCK`] = {3.2, 3.2},
	
		[`WEAPON_DBSHOTGUN`] = {3.00, 3.00}, -- DOUBLE BARREL SHOTGUN
		[`WEAPON_SAWNOFFSHOTGUN`] = {3.00, 3.00}, -- SAWNOFF SHOTGUN
		[`WEAPON_PUMPSHOTGUN`] = {3.00, 3.00}, -- PUMP SHOTGUN
		[`WEAPON_PUMPSHOTGUN_MK2`] = {3.00, 3.00}, -- PUMP SHOTGUN MK2
		[`WEAPON_BULLPUPSHOTGUN`] = {3.00, 3.00}, -- BULLPUP SHOTGUN
	
		[`WEAPON_MICROSMG`] = {4.00, 4.00}, -- MICRO SMG (UZI)
		[`WEAPON_SMG`] = {4.00, 4.00}, -- SMG
		[`WEAPON_SMG_MK2`] = {4.00, 4.00}, -- SMG MK2
		[`WEAPON_ASSAULTSMG`] = {4.00, 4.00}, -- ASSAULT SMG
		[`WEAPON_COMBATPDW`] = {4.00, 4.00}, -- COMBAT PDW
		[`WEAPON_GUSENBERG`] = {4.00, 4.00}, -- GUSENBERG
	
		[`WEAPON_COMPACTRIFLE`] = {4.00, 4.00}, -- COMPACT RIFLE
		[`WEAPON_ASSAULTRIFLE`] = {4.00, 4.00}, -- ASSAULT RIFLE
		[`WEAPON_CARBINERIFLE`] = {4.00, 4.00}, -- CARBINE RIFLE
	
		[`WEAPON_MARKSMANRIFLE`] = {4.00, 4.00}, -- MARKSMAN RIFLE
		[`WEAPON_SNIPERRIFLE`] = {4.00, 4.00}, -- SNIPER RIFLE
	
		[`WEAPON_1911PISTOL`] = {4.00, 4.00}, -- 1911 PISTOL
	},

Effects = {
		[`WEAPON_STUNGUN`] = {0.01, 0.02}, -- STUN GUN
		[`WEAPON_FLAREGUN`] = {0.01, 0.02}, -- FLARE GUN
	
		[`WEAPON_SNSPISTOL`] = {0.08, 0.16}, -- SNS PISTOL
		[`WEAPON_SNSPISTOL_MK2`] = {0.07, 0.14}, -- SNS PISTOL MK2
		[`WEAPON_VINTAGEPISTOL`] = {0.08, 0.16}, -- VINTAGE PISTOL
		[`WEAPON_PISTOL`] = {0.10, 0.20}, -- PISTOL
		[`WEAPON_PISTOL_MK2`] = {0.11, 0.22}, -- PISTOL MK2
		[`WEAPON_DOUBLEACTION`] = {0.1, 0.2}, -- DOUBLE ACTION REVOLVER
		[`WEAPON_COMBATPISTOL`] = {0.1, 0.2}, -- COMBAT PISTOL
		[`WEAPON_HEAVYPISTOL`] = {0.1, 0.2}, -- HEAVY PISTOL
	
		[`WEAPON_DBSHOTGUN`] = {0.1, 0.2}, -- DOUBLE BARREL SHOTGUN
		[`WEAPON_SAWNOFFSHOTGUN`] = {0.095, 0.19}, -- SAWNOFF SHOTGUN
		[`WEAPON_PUMPSHOTGUN`] = {0.09, 0.18}, -- PUMP SHOTGUN
		[`WEAPON_PUMPSHOTGUN_MK2`] = {0.09, 0.18}, -- PUMP SHOTGUN MK2
		[`WEAPON_BULLPUPSHOTGUN`] = {0.085, 0.19}, -- BULLPUP SHOTGUN
	
		[`WEAPON_MICROSMG`] = {0.05, 0.1}, -- MICRO SMG (UZI)
		[`WEAPON_SMG`] = {0.04, 0.08}, -- SMG
		[`WEAPON_SMG_MK2`] = {0.04, 0.08}, -- SMG MK2
		[`WEAPON_ASSAULTSMG`] = {0.035, 0.07}, -- ASSAULT SMG
		[`WEAPON_COMBATPDW`] = {0.03, 0.06}, -- COMBAT PDW
		[`WEAPON_GUSENBERG`] = {0.035, 0.07}, -- GUSENBERG
	
		[`WEAPON_COMPACTRIFLE`] = {0.04, 0.08}, -- COMPACT RIFLE
		[`WEAPON_ASSAULTRIFLE`] = {0.032, 0.064}, -- ASSAULT RIFLE
		[`WEAPON_CARBINERIFLE`] = {0.03, 0.06}, -- CARBINE RIFLE
	
		[`WEAPON_MARKSMANRIFLE`] = {0.025, 0.05}, -- MARKSMAN RIFLE
		[`WEAPON_SNIPERRIFLE`] = {0.025, 0.05}, -- SNIPER RIFLE	
	
		[`WEAPON_1911PISTOL`] = {0.1, 0.2}, -- 1911 PISTOL
		[`WEAPON_FIREWORK`] = {0.5, 1.0} -- FIREWORKS
	},
}

-- INNE  --
Webhooks = {
    ['connect'] = 'tutaj webhook',
    ['disconnect'] = 'tutaj webhook',
    
    ['ems-faktury-mdt'] = 'tutaj webhook',
    ['mechanik-faktury-mdt'] = 'tutaj webhook',
}

Config.UseESX = true				
Config.UseQBCore = false		

Config.UseCustomNotify = false				

RegisterNetEvent('angelicxs-flipcar:CustomNotify')
	AddEventHandler('angelicxs-flipcar:CustomNotify', function(message, type)
end)

Config.czasprzewrotki = 12 					

Config.Jobs = {}

Config.UseThirdEye = true 				
Config.ThirdEyeName = 'qtarget' 	
Config.UseChatCommand = false                
Config.ChatCommand = 'przewrotka'          
Config.SkillBar = true                       

Config.LangType = {
	['error'] = 'error',
	['success'] = 'success',
	['info'] = 'inform'
}

Config.Lang = {
	['flipped'] = 'Przewróciłeś pojazd!',
    ['in_vehicle'] = 'Nie możesz przewrócić pojazdu ze środka!',
    ['far_away'] = 'Jesteś za daleko żeby obrócić pojazd!',
    ['not_allowed'] = 'Nie masz siły żeby obrócić pojazd!',
}

Config.Visuals = {
	["heightReflect.width"] = 10.0,
	["heightReflect.height"] = 22.0,
	["rain.NumberParticles"] = 128.0,
	["rain.UseLitShader"] = 0.0,
	["heightReflect.specularoffset"] = 0.05,
	["sky.cloudInscatteringRange"] = 0.0,
	["sky.cloudEdgeSmooth"] = 0.0,
	["sky.GameCloudSpeed"] = 0.5,
	["shadows.cloudtexture.rangemax"] = 0.0,
	["car.interiorlight.color.blue"] = 5.7,
	["car.interiorlight.intensity"] = 2.5,
	["car.platelight.color.blue"] = 5.0,
	["car.platelight.intensity"] = 1.5,
	["car.dashlight.color.blue"] = 3.6,
	["car.doorlight.color.blue"] = 6.95,
	["car.taxi.intensity"] = 1.0,
	["car.headlights.global.HeadlightIntensityMult"] = 3.55,
	["car.headlights.global.HeadlightDistMult"] = 3.8,
	["car.headlights.fullbeam.DistMult"] = 3.5,
	["car.headlights.fullbeam.CoronaIntensityMult"] = 1.9,
	["car.headlights.fullbeam.CoronaSizeMult"] = 1.8,
	["car.headlights.player.intensitymult"] = 1.1,
	["car.headlights.player.distmult"] = 0.45,
	["car.headlights.useDynamicShadows"] = 1.0,
	["car.coronas.CutoffStart"] = 280.0,
	["car.sirens.ShadowFade"] = 35.0,
	["car.sirens.intensity"] = 75.0,
	["car.sirens.radius"] = 50.0,
	["plane.luxe2.cabin.useDynamicShadows"] = 1.0,
	["heli.swift2.cabin.useDynamicShadows"] = 1.0,
	["sub.lightOne.color.red"] = 1.0,
	["sub.lightOne.color.green"] = 1.0,
	["sub.lightOne.intensity"] = 0.0,
	["sub.lightOne.radius"] = 1.0,
	["sub.lightOne.outerConeAngle"] = 45.0,
	["sub.lightTwo.color.red"] = 1.0,
	["sub.lightTwo.color.blue"] = 1.0,
	["sub.lightTwo.intensity"] = 0.0,
	["sub.lightTwo.radius"] = 1.0,
	["sub.lightTwo.outerConeAngle"] = 45.0,
	["train.light.fadelength"] = 20.0,
	["car.headlight.day.emissive.on"] = 208.0,
	["car.headlight.night.emissive.on"] = 109.0,
	["car.headlight.day.emissive.off"] = 0.001,
	["car.headlight.night.emissive.off"] = 0.001,
	["car.taillight.day.emissive.on"] = 65.0,
	["car.taillight.night.emissive.on"] = 65.0,
	["car.taillight.day.emissive.off"] = 0.001,
	["car.taillight.night.emissive.off"] = 0.001,
	["car.indicator.day.emissive.on"] = 135.0,
	["car.indicator.night.emissive.on"] = 116.0,
	["car.indicator.day.emissive.off"] = 0.001,
	["car.indicator.night.emissive.off"] = 0.001,
	["car.reversinglight.day.emissive.on"] = 19.0,
	["car.reversinglight.night.emissive.on"] = 9.0,
	["car.reversinglight.day.emissive.off"] = 0.001,
	["car.reversinglight.night.emissive.off"] = 0.001,
	["car.brakelight.day.emissive.on"] = 150.0,
	["car.brakelight.night.emissive.on"] = 135.0,
	["car.brakelight.day.emissive.off"] = 0.001,
	["car.brakelight.night.emissive.off"] = 0.001,
	["car.middlebrakelight.day.emissive.on"] = 150.0,
	["car.middlebrakelight.night.emissive.on"] = 135.0,
	["car.middlebrakelight.day.emissive.off"] = 0.001,
	["car.middlebrakelight.night.emissive.off"] = 0.001,
	["car.extralight.day.emissive.on"] = 160.0,
	["car.extralight.night.emissive.on"] = 90.0,
	["car.extralight.day.emissive.off"] = 0.001,
	["car.extralight.night.emissive.off"] = 0.001,
	["car.emissiveMultiplier"] = 2.021,
	["car.lod.distance.high"] = 55.0,
	["car.lod.distance.low"] = 210.0,
	["boat.intensity"] = 5.0,
	["train.light.intensity"] = 1.0,
	["train.light.fadingdistance"] = 50.0,
	["defaultsearchlight.mainLightInfo.globalIntensity"] = 2.0,
	["trafficLight.near.intensity"] = 0.0,
	["trafficLight.near.radius"] = 0.0,
	["trafficLight.near.outerConeAngle"] = 20.0,
	["trafficLight.near.coronaHDR"] = 2.0,
	["trafficLight.near.coronaSize"] = 0.0,
	["trafficLight.farFadeStart"] = 200.0,
	["trafficLight.farFadeEnd"] = 250.0,
	["trafficLight.nearFadeStart"] = 100.0,
	["trafficLight.nearFadeEnd"] = 130.0,
	["imposter.color.blendRange"] = 0.0,
	["imposter.color.blendBias"] = 0.0,
	["imposter.color.size1"] = 0.0,
	["imposter.color.amt1"] = 0.0,
	["imposter.color.size2"] = 0.0,
	["imposter.color.amt2"] = 0.0,
	["imposter.backgroundColor.red"] = 0.0,
	["imposter.backgroundColor.green"] = 0.0,
	["imposter.backgroundColor.blue"] = 0.0,
	["imposter.shadow.blendRange"] = 0.0,
	["imposter.shadow.blendBias"] = 0.0,
	["imposter.shadow.size1"] = 0.0,
	["imposter.shadow.amt1"] = 0.0,
	["imposter.shadow.size2"] = 0.0,
	["imposter.shadow.amt2"] = 0.0,
	["ped.ambientvolume.fadestart"] = 12.0,
	["ped.ambientvolume.fadeend"] = 16.0,
	["distantlights.size"] = 0.6,
	["distantlights.sizeReflections"] = 0.0,
	["distantlights.sizeMin"] = 0.8,
	["distantlights.sizeUpscale"] = 8.0,
	["distantlights.sizeUpscaleReflections"] = 0.0,
	["distantlights.flicker"] = 0.2,
	["distantlights.carlight.HDRIntensity"] = 0.0,
	["distantlights.streetlight.HDRIntensity"] = 19.0,
	["distantlights.streetlight.color.green"] = 0.43,
	["misc.DOFBlurMultiplier.HD"] = 0.0,
	["misc.DOFBlurMultiplier.SD"] = 0.0,
	["misc.Multiplier.nearFogMultiplier"] = 0.0,
	["misc.3dMarkers.FrontLightIntensity"] = 2.0,
	["misc.3dMarkers.frontLightExponent"] = 12.0,
	["misc.coronas.sizeScaleGlobal"] = 1.25,
	["misc.coronas.intensityScaleGlobal"] = 0.0,
	["misc.coronas.intensityScaleWater"] = 0.0,
	["misc.coronas.sizeScaleWater"] = 0.0,
	["misc.coronas.screenspaceExpansionWater"] = 0.0,
	["misc.coronas.zBiasMultiplier"] = 25.0,
	["misc.coronas.zBias.fromFinalSizeMultiplier"] = 0.1,
	["misc.coronas.underwaterFadeDist"] = 2.0,
	["misc.coronas.screenEdgeMinDistForFade"] = 0.0,
	["misc.CrossPMultiplier.RimLight"] = 0.0,
	["misc.CrossPMultiplier.GlobalEnvironmentReflection"] = 0.0,
	["misc.CrossPMultiplier.MidBlur"] = 0.0,
	["misc.CrossPMultiplier.Farblur"] = 0.0,
	["misc.CrossPMultiplier.Desaturation"] = 1.20,
	["misc.HiDof.nearBlur"] = 0.0,
	["misc.HiDof.midBlur"] = 0.0,
	["misc.HiDof.farBlur"] = 0.0,
	["misc.cutscene.nearBlurMin"] = 0.0,
	["misc.MoonDimMult"] = 0.0,
	["Tonemapping.bright.filmic.A"] = 0.3,
	["Tonemapping.bright.filmic.B"] = 0.23,
	["Tonemapping.bright.filmic.C"] = 0.1,
	["Tonemapping.bright.filmic.D"] = 0.2,
	["Tonemapping.bright.filmic.E"] = 0.01,
	["Tonemapping.bright.filmic.F"] = 0.3,
	["Tonemapping.bright.filmic.W"] = 4.0,
	["Tonemapping.dark.filmic.A"] = 0.3,
	["Tonemapping.dark.filmic.B"] = 0.23,
	["Tonemapping.dark.filmic.C"] = 0.2,
	["Adaptation.min.step.size"] = 0.0,
	["Adaptation.max.step.size"] = 19.9,
	["Adaptation.step.size.mult"] = 0.55,
	["Adaptation.sun.exposure.tweak"] = -3.0,
	["cloudgen.frequency"] = 1.0,
	["cloudgen.scale"] = 24.0,
	["cloudgen.edge.detail.scale"] = 4.0,
	["cloudgen.overlay.detail.scale"] = 2.0,
	["cloud.speed.small"] = 4.0,
	["lod.fadedist.orphanhd"] = 0.075,
	["rim.lighting.main.colour.intensity"] = 6.0,
	["bloom.blurblendmult.large"] = 0.3,
	["bloom.blurblendmult.med"] = 1.2,
	["bloom.blurblendmult.small"] = 0.6,
	["lodlight.corona.size"] = 1.75,
	["misc.brightlight.distculled.FadeStart"] = 200.0,
	["misc.brightlight.distculled.FadeEnd"] = 220.0,
	["misc.brightlight.notdistculled.FadeStart"] = 180.0,
	["misc.brightlight.notdistculled.FadeEnd"] = 235.0,
	["vehicle.lights.sunrise"] = 5.5,
	["vehicle.lights.sunset"] = 21.0,
	["vehicle.lights.fadeDistance.main"] = 250.0,
	["vehicle.lights.fadeDistance.secondary"] = 250.0,
	["vehicle.lights.fadeDistance.sirens"] = 400.0,
	["vehicle.lights.fadeDistance.AO"] = 250.0,
	["vehicle.lights.fadeDistance.neon"] = 220.0,
	["vehicle.lights.fadeLength"] = 20.0,
	["particles.shadowintensity"] = 1.15,
	["dark.useNormal"] = 1.0,
	["dark.useVolumes"] = 1.0,
	["ped.light.fade.day.end"] = 6.1,
	["ped.light.fade.night.end"] = 20.1,
	["adaptivedof.day.near.nearin"] = 3.0,
	["lensflare.switch.length"] = 90.0,
	["lensflare.hide.length"] = 95.0,
	["lensflare.show.length"] = 64.0,
	["lensflare.desaturation.boost"] = 0.16
}