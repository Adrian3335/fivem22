local Components = {
	{label = _U('sex'),						name = 'sex',				value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('face'),					name = 'face',				value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('face_2'),					name = 'face_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('blend_face'),				name = 'blend_face',		value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('skin'),					name = 'skin',				value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('skin_2'),					name = 'skin_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('blend_skin'),				name = 'blend_skin',		value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('face_3'),					name = 'face_3',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('skin_3'),					name = 'skin_3',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('blend'),					name = 'blend',				value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('hair_1'),					name = 'hair_1',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('hair_2'),					name = 'hair_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('hair_3'),					name = 'hair_3',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('hair_color_1'),			name = 'hair_color_1',		value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('hair_color_2'),			name = 'hair_color_2',		value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('tshirt_1'),				name = 'tshirt_1',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('tshirt_2'),				name = 'tshirt_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'tshirt_1'},
	{label = _U('torso_1'),					name = 'torso_1',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('torso_2'),					name = 'torso_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'torso_1'},
	{label = _U('decals_1'),				name = 'decals_1',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('decals_2'),				name = 'decals_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'decals_1'},
	{label = _U('arms'),					name = 'arms',				value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('arms_2'),					name = 'arms_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'arms'},
	{label = _U('pants_1'),					name = 'pants_1',			value = 0,		min = 0,	zoomOffset = 0.8,		camOffset = -0.5},
	{label = _U('pants_2'),					name = 'pants_2',			value = 0,		min = 0,	zoomOffset = 0.8,		camOffset = -0.5,	textureof	= 'pants_1'},
	{label = _U('shoes_1'),					name = 'shoes_1',			value = 0,		min = 0,	zoomOffset = 0.8,		camOffset = -0.8},
	{label = _U('shoes_2'),					name = 'shoes_2',			value = 0,		min = 0,	zoomOffset = 0.8,		camOffset = -0.8,	textureof	= 'shoes_1'},
	{label = _U('mask_1'),					name = 'mask_1',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65, restrictMale = {8, 9, 10, 17, 18, 19, 20, 21, 22, 23, 25, 26, 27, 44, 45, 49, 64, 91, 103, 114, 115, 131, 135, 136, 139, 142, 143, 144, 145, 146, 147, 159, 160, 161, 162, 163, 100, 98, 97, 96, 93, 92, 24}},
	{label = _U('mask_2'),					name = 'mask_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65,	textureof	= 'mask_1'},
	{label = _U('bproof_1'),				name = 'bproof_1',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('bproof_2'),				name = 'bproof_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'bproof_1'},
	{label = _U('chain_1'),					name = 'chain_1',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('chain_2'),					name = 'chain_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65,	textureof	= 'chain_1'},
	{label = _U('helmet_1'),				name = 'helmet_1',			value = -1,		min = -1,	zoomOffset = 0.6,		camOffset = 0.65, restrictMale = {1, 16, 17, 18, 31, 32, 33, 35, 36, 37, 38, 40, 41, 46, 47, 48, 49, 50, 51, 52, 53, 57, 59, 62, 67, 68, 69, 70, 71, 72, 73, 74, 75, 78, 79, 80, 81, 82, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 98, 111, 112, 115, 116, 117, 118, 119, 123, 124, 125, 126, 127, 128, 129, 134},	componentId	= 0},
	{label = _U('helmet_2'),				name = 'helmet_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65,	textureof	= 'helmet_1'},
	{label = _U('glasses_1'),				name = 'glasses_1',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65},
	{label = _U('glasses_2'),				name = 'glasses_2',			value = 0,		min = 0,	zoomOffset = 0.6,		camOffset = 0.65,	textureof	= 'glasses_1'},
	{label = _U('watches_1'),				name = 'watches_1',			value = -1,		min = -1,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('watches_2'),				name = 'watches_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'watches_1'},
	{label = _U('bracelets_1'),				name = 'bracelets_1',		value = -1,		min = -1,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('bracelets_2'),				name = 'bracelets_2',		value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'bracelets_1'},
	{label = _U('bag'),						name = 'bags_1',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('bag_color'),				name = 'bags_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15,	textureof	= 'bags_1'},
	{label = _U('eye_color'),				name = 'eye_color',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('eyebrow_size'),			name = 'eyebrows_2',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('eyebrow_type'),			name = 'eyebrows_1',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('eyebrow_color_1'),			name = 'eyebrows_3',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('eyebrow_color_2'),			name = 'eyebrows_4',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('makeup_type'),				name = 'makeup_1',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('makeup_thickness'),		name = 'makeup_2',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('makeup_color_1'),			name = 'makeup_3',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('makeup_color_2'),			name = 'makeup_4',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('lipstick_type'),			name = 'lipstick_1',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('lipstick_thickness'),		name = 'lipstick_2',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('lipstick_color_1'),		name = 'lipstick_3',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('lipstick_color_2'),		name = 'lipstick_4',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('ear_accessories'),			name = 'ears_1',			value = -1,		min = -1,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('ear_accessories_color'),	name = 'ears_2',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65,	textureof	= 'ears_1'},
	{label = _U('chest_hair'),				name = 'chest_1',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('chest_hair_1'),			name = 'chest_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('chest_color'),				name = 'chest_3',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('bodyb'),					name = 'bodyb_1',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('bodyb_size'),				name = 'bodyb_2',			value = 0,		min = 0,	zoomOffset = 0.75,		camOffset = 0.15},
	{label = _U('wrinkles'),				name = 'age_1',				value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('wrinkle_thickness'),		name = 'age_2',				value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('blemishes'),				name = 'blemishes_1',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('blemishes_size'),			name = 'blemishes_2',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('blush'),					name = 'blush_1',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('blush_1'),					name = 'blush_2',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('blush_color'),				name = 'blush_3',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('complexion'),				name = 'complexion_1',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('complexion_1'),			name = 'complexion_2',		value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('sun'),						name = 'sun_1',				value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('sun_1'),					name = 'sun_2',				value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('freckles'),				name = 'moles_1',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('freckles_1'),				name = 'moles_2',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('beard_type'),				name = 'beard_1',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('beard_size'),				name = 'beard_2',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('beard_color_1'),			name = 'beard_3',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('beard_color_2'),			name = 'beard_4',			value = 0,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('nose_width'),				name = 'nose_1',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('nose_peak_height'),		name = 'nose_2',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('nose_peak_length'),		name = 'nose_3',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('nose_bone_high'),			name = 'nose_4',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('nose_peak_lowering'),		name = 'nose_5',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('nose_bone_twist'),			name = 'nose_6',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('eyebrow_high'),			name = 'eyebrow_1',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('eyebrow_forward'),			name = 'eyebrow_2',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('cheeks_bone_high'),		name = 'cheeks_1',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('cheeks_bone_width'),		name = 'cheeks_2',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('cheeks_bone_size'),		name = 'cheeks_3',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('lips_thickness'),			name = 'lips',				value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('jaw_bone_width'),			name = 'jaw_1',				value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('jaw_bone_back_length'),	name = 'jaw_2',				value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('chimp_bone_lowering'),		name = 'chimp_1',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('chimp_bone_length'),		name = 'chimp_2',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('chimp_bone_width'),		name = 'chimp_3',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('chimp_hole'),				name = 'chimp_4',			value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65},
	{label = _U('neck_thickness'),			name = 'neck',				value = 10,		min = 0,	zoomOffset = 0.4,		camOffset = 0.65}
}

local Decorations = {
	{
		{`mpbeach_overlays`,`FM_Hair_Fuzz`},
		{`multiplayer_overlays`,`FM_M_Hair_001_a`},
		{`multiplayer_overlays`,`FM_M_Hair_001_b`},
		{`multiplayer_overlays`,`FM_M_Hair_001_c`},
		{`multiplayer_overlays`,`FM_M_Hair_001_d`},
		{`multiplayer_overlays`,`FM_M_Hair_001_e`},
		{`multiplayer_overlays`,`FM_M_Hair_003_a`},
		{`multiplayer_overlays`,`FM_M_Hair_003_b`},
		{`multiplayer_overlays`,`FM_M_Hair_003_c`},
		{`multiplayer_overlays`,`FM_M_Hair_003_d`},
		{`multiplayer_overlays`,`FM_M_Hair_003_e`},
		{`multiplayer_overlays`,`FM_M_Hair_006_a`},
		{`multiplayer_overlays`,`FM_M_Hair_006_b`},
		{`multiplayer_overlays`,`FM_M_Hair_006_c`},
		{`multiplayer_overlays`,`FM_M_Hair_006_d`},
		{`multiplayer_overlays`,`FM_M_Hair_006_e`},
		{`multiplayer_overlays`,`FM_M_Hair_008_a`},
		{`multiplayer_overlays`,`FM_M_Hair_008_b`},
		{`multiplayer_overlays`,`FM_M_Hair_008_c`},
		{`multiplayer_overlays`,`FM_M_Hair_008_d`},
		{`multiplayer_overlays`,`FM_M_Hair_008_e`},
		{`multiplayer_overlays`,`FM_M_Hair_long_a`},
		{`multiplayer_overlays`,`FM_M_Hair_long_b`},
		{`multiplayer_overlays`,`FM_M_Hair_long_c`},
		{`multiplayer_overlays`,`FM_M_Hair_long_d`},
		{`multiplayer_overlays`,`FM_M_Hair_long_e`},
		{`multiplayer_overlays`,`NG_M_Hair_001`},
		{`multiplayer_overlays`,`NG_M_Hair_002`},
		{`multiplayer_overlays`,`NG_M_Hair_003`},
		{`multiplayer_overlays`,`NG_M_Hair_004`},
		{`multiplayer_overlays`,`NG_M_Hair_005`},
		{`multiplayer_overlays`,`NG_M_Hair_006`},
		{`multiplayer_overlays`,`NG_M_Hair_007`},
		{`multiplayer_overlays`,`NG_M_Hair_008`},
		{`multiplayer_overlays`,`NG_M_Hair_009`},
		{`multiplayer_overlays`,`NG_M_Hair_010`},
		{`multiplayer_overlays`,`NG_M_Hair_011`},
		{`multiplayer_overlays`,`NG_M_Hair_012`},
		{`multiplayer_overlays`,`NG_M_Hair_013`},
		{`multiplayer_overlays`,`NG_M_Hair_014`},
		{`multiplayer_overlays`,`NG_M_Hair_015`},
		{`multiplayer_overlays`,`NGBea_M_Hair_000`},
		{`multiplayer_overlays`,`NGBea_M_Hair_001`},
		{`multiplayer_overlays`,`NGBus_M_Hair_000`},
		{`multiplayer_overlays`,`NGBus_M_Hair_001`},
		{`multiplayer_overlays`,`NGHip_M_Hair_000`},
		{`multiplayer_overlays`,`NGHip_M_Hair_001`},
		{`multiplayer_overlays`,`NGInd_M_Hair_000`},
		{`mphipster_overlays`,`FM_Hip_M_Hair_000_a`},
		{`mphipster_overlays`,`FM_Hip_M_Hair_000_b`},
		{`mphipster_overlays`,`FM_Hip_M_Hair_000_c`},
		{`mphipster_overlays`,`FM_Hip_M_Hair_000_d`},
		{`mphipster_overlays`,`FM_Hip_M_Hair_000_e`},
		{`mphipster_overlays`,`FM_Hip_M_Hair_001_a`},
		{`mphipster_overlays`,`FM_Hip_M_Hair_001_b`},
		{`mphipster_overlays`,`FM_Hip_M_Hair_001_c`},
		{`mphipster_overlays`,`FM_Hip_M_Hair_001_d`},
		{`mphipster_overlays`,`FM_Hip_M_Hair_001_e`},
		{`mphipster_overlays`,`FM_Disc_M_Hair_001_a`},
		{`mphipster_overlays`,`FM_Disc_M_Hair_001_b`},
		{`mphipster_overlays`,`FM_Disc_M_Hair_001_c`},
		{`mphipster_overlays`,`FM_Disc_M_Hair_001_d`},
		{`mphipster_overlays`,`FM_Disc_M_Hair_001_e`},
		{`mpbiker_overlays`,`MP_Biker_Hair_000_M`},
		{`mpbiker_overlays`,`MP_Biker_Hair_001_M`},
		{`mpbiker_overlays`,`MP_Biker_Hair_002_M`},
		{`mpbiker_overlays`,`MP_Biker_Hair_003_M`},
		{`mpbiker_overlays`,`MP_Biker_Hair_004_M`},
		{`mpbiker_overlays`,`MP_Biker_Hair_005_M`},
		{`mpbiker_overlays`,`MP_Biker_Hair_006_M`},
		{`mpgunrunning_overlays`,`MP_Gunrunning_Hair_M_000_M`},
		{`mpgunrunning_overlays`,`MP_Gunrunning_Hair_M_001_M`},
		{`mplowrider_overlays`,`LR_M_Hair_000`},
		{`mplowrider_overlays`,`LR_M_Hair_001`},
		{`mplowrider_overlays`,`LR_M_Hair_002`},
		{`mplowrider_overlays`,`LR_M_Hair_003`},
		{`mplowrider2_overlays`,`LR_M_Hair_004`},
		{`mplowrider2_overlays`,`LR_M_Hair_005`},
		{`mplowrider2_overlays`,`LR_M_Hair_006`},
		{`mpbusiness_overlays`,`FM_Bus_M_Hair_000_a`},
		{`mpbusiness_overlays`,`FM_Bus_M_Hair_000_b`},
		{`mpbusiness_overlays`,`FM_Bus_M_Hair_000_c`},
		{`mpbusiness_overlays`,`FM_Bus_M_Hair_000_d`},
		{`mpbusiness_overlays`,`FM_Bus_M_Hair_000_e`},
		{`mpbusiness_overlays`,`FM_Bus_M_Hair_001_a`},
		{`mpbusiness_overlays`,`FM_Bus_M_Hair_001_b`},
		{`mpbusiness_overlays`,`FM_Bus_M_Hair_001_c`},
		{`mpbusiness_overlays`,`FM_Bus_M_Hair_001_d`},
		{`mpbusiness_overlays`,`FM_Bus_M_Hair_001_e`}
	},
	{
		{`mpbeach_overlays`,`FM_Hair_Fuzz`},
		{`multiplayer_overlays`,`FM_F_Hair_003_a`},
		{`multiplayer_overlays`,`FM_F_Hair_003_b`},
		{`multiplayer_overlays`,`FM_F_Hair_003_c`},
		{`multiplayer_overlays`,`FM_F_Hair_003_d`},
		{`multiplayer_overlays`,`FM_F_Hair_003_e`},
		{`multiplayer_overlays`,`FM_F_Hair_005_a`},
		{`multiplayer_overlays`,`FM_F_Hair_005_b`},
		{`multiplayer_overlays`,`FM_F_Hair_005_c`},
		{`multiplayer_overlays`,`FM_F_Hair_005_d`},
		{`multiplayer_overlays`,`FM_F_Hair_005_e`},
		{`multiplayer_overlays`,`FM_F_Hair_006_a`},
		{`multiplayer_overlays`,`FM_F_Hair_006_b`},
		{`multiplayer_overlays`,`FM_F_Hair_006_c`},
		{`multiplayer_overlays`,`FM_F_Hair_006_d`},
		{`multiplayer_overlays`,`FM_F_Hair_006_e`},
		{`multiplayer_overlays`,`FM_F_Hair_013_a`},
		{`multiplayer_overlays`,`FM_F_Hair_013_b`},
		{`multiplayer_overlays`,`FM_F_Hair_013_c`},
		{`multiplayer_overlays`,`FM_F_Hair_013_d`},
		{`multiplayer_overlays`,`FM_F_Hair_013_e`},
		{`multiplayer_overlays`,`FM_F_Hair_014_a`},
		{`multiplayer_overlays`,`FM_F_Hair_014_b`},
		{`multiplayer_overlays`,`FM_F_Hair_014_c`},
		{`multiplayer_overlays`,`FM_F_Hair_014_d`},
		{`multiplayer_overlays`,`FM_F_Hair_014_e`},
		{`multiplayer_overlays`,`FM_F_Hair_long_a`},
		{`multiplayer_overlays`,`FM_F_Hair_long_b`},
		{`multiplayer_overlays`,`FM_F_Hair_long_c`},
		{`multiplayer_overlays`,`FM_F_Hair_long_d`},
		{`multiplayer_overlays`,`FM_F_Hair_long_e`},
		{`multiplayer_overlays`,`NG_F_Hair_001`},
		{`multiplayer_overlays`,`NG_F_Hair_002`},
		{`multiplayer_overlays`,`NG_F_Hair_003`},
		{`multiplayer_overlays`,`NG_F_Hair_004`},
		{`multiplayer_overlays`,`NG_F_Hair_005`},
		{`multiplayer_overlays`,`NG_F_Hair_006`},
		{`multiplayer_overlays`,`NG_F_Hair_007`},
		{`multiplayer_overlays`,`NG_F_Hair_008`},
		{`multiplayer_overlays`,`NG_F_Hair_009`},
		{`multiplayer_overlays`,`NG_F_Hair_010`},
		{`multiplayer_overlays`,`NG_F_Hair_011`},
		{`multiplayer_overlays`,`NG_F_Hair_012`},
		{`multiplayer_overlays`,`NG_F_Hair_013`},
		{`multiplayer_overlays`,`NG_F_Hair_014`},
		{`multiplayer_overlays`,`NG_F_Hair_015`},
		{`multiplayer_overlays`,`NGBea_F_Hair_000`},
		{`multiplayer_overlays`,`NGBea_F_Hair_001`},
		{`multiplayer_overlays`,`NGBus_F_Hair_000`},
		{`multiplayer_overlays`,`NGBus_F_Hair_001`},
		{`multiplayer_overlays`,`NGHip_F_Hair_000`},
		{`multiplayer_overlays`,`NGHip_F_Hair_001`},
		{`multiplayer_overlays`,`NGInd_F_Hair_000`},
		{`mphipster_overlays`,`FM_Hip_F_Hair_000_a`},
		{`mphipster_overlays`,`FM_Hip_F_Hair_000_b`},
		{`mphipster_overlays`,`FM_Hip_F_Hair_000_c`},
		{`mphipster_overlays`,`FM_Hip_F_Hair_000_d`},
		{`mphipster_overlays`,`FM_Hip_F_Hair_000_e`},
		{`mphipster_overlays`,`FM_F_Hair_017_a`},
		{`mphipster_overlays`,`FM_F_Hair_017_b`},
		{`mphipster_overlays`,`FM_F_Hair_017_c`},
		{`mphipster_overlays`,`FM_F_Hair_017_d`},
		{`mphipster_overlays`,`FM_F_Hair_017_e`},
		{`mphipster_overlays`,`FM_F_Hair_020_a`},
		{`mphipster_overlays`,`FM_F_Hair_020_b`},
		{`mphipster_overlays`,`FM_F_Hair_020_c`},
		{`mphipster_overlays`,`FM_F_Hair_020_d`},
		{`mphipster_overlays`,`FM_F_Hair_020_e`}
	}
}

local LastSex     = -1
local LoadSkin    = nil
local LoadClothes = nil
local Character   = {}

for i=1, #Components, 1 do
  Character[Components[i].name] = Components[i].value
end

function GetDecorations()
	return Decorations
end

function LoadDefaultModel(malePed, cb)
    local ped = PlayerPedId()
	local characterModel
	
    if malePed then
		characterModel = `mp_m_freemode_01`
    else
		characterModel = `mp_f_freemode_01`
    end

    Citizen.CreateThreadNow(function()
        RequestModel(characterModel)
        while not HasModelLoaded(characterModel) do
            Citizen.Wait(0)
        end

        if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
            SetPlayerModel(PlayerId(), characterModel)
            Citizen.Wait(100)
            ped = PlayerPedId()

            SetPedDefaultComponentVariation(ped)
            SetPedMaxHealth(ped, 200)
            SetEntityHealth(ped, 200)
        end

        SetModelAsNoLongerNeeded(characterModel)
        if cb ~= nil then
            cb()
        end

        TriggerEvent('skinchanger:modelLoaded')
    end)
end

function GetMaxVals(ped)
	local playerPed = PlayerPedId()
	return {
		sex				= ped and #Config.pedList + 1 or 1,
		face			= 45,
		face_2			= 45,
		blend_face		= 10,
		skin			= 45,
		skin_2			= 45,
		blend_skin		= 10,
		face_3			= 45,
		skin_3			= 45,
		blend			= 10,
		age_1			= GetNumHeadOverlayValues(3)-1,
		age_2			= 10,
		beard_1			= GetNumHeadOverlayValues(1)-1,
		beard_2			= 10,
		beard_3			= GetNumHairColors()-1,
		beard_4			= GetNumHairColors()-1,
		hair_1			= GetNumberOfPedDrawableVariations		(playerPed, 2) - 1,
		hair_2			= GetNumberOfPedTextureVariations		(playerPed, 2, Character['hair_1']) - 1,
		hair_3          = #Decorations[(GetEntityModel(playerPed) ~= `mp_f_freemode_01` and 1 or 2)],
		hair_color_1	= GetNumHairColors()-1,
		hair_color_2	= GetNumHairColors()-1,
		eye_color		= 31,
		eyebrows_1		= GetNumHeadOverlayValues(2)-1,
		eyebrows_2		= 10,
		eyebrows_3		= GetNumHairColors()-1,
		eyebrows_4		= GetNumHairColors()-1,
		makeup_1		= GetNumHeadOverlayValues(4)-1,
		makeup_2		= 10,
		makeup_3		= GetNumHairColors()-1,
		makeup_4		= GetNumHairColors()-1,
		lipstick_1		= GetNumHeadOverlayValues(8)-1,
		lipstick_2		= 10,
		lipstick_3		= GetNumHairColors()-1,
		lipstick_4		= GetNumHairColors()-1,
		blemishes_1		= GetNumHeadOverlayValues(0)-1,
		blemishes_2		= 10,
		blush_1			= GetNumHeadOverlayValues(5)-1,
		blush_2			= 10,
		blush_3			= GetNumHairColors()-1,
		complexion_1	= GetNumHeadOverlayValues(6)-1,
		complexion_2	= 10,
		sun_1			= GetNumHeadOverlayValues(7)-1,
		sun_2			= 10,
		moles_1			= GetNumHeadOverlayValues(9)-1,
		moles_2			= 10,
		chest_1			= GetNumHeadOverlayValues(10)-1,
		chest_2			= 10,
		chest_3			= GetNumHairColors()-1,
		bodyb_1			= GetNumHeadOverlayValues(11)-1,
		bodyb_2			= 10,
		ears_1			= GetNumberOfPedPropDrawableVariations	(playerPed, 2) - 1,
		ears_2			= GetNumberOfPedPropTextureVariations	(playerPed, 2, Character['ears_1'] - 1),
		tshirt_1		= GetNumberOfPedDrawableVariations		(playerPed, 8) - 1,
		tshirt_2		= GetNumberOfPedTextureVariations		(playerPed, 8, Character['tshirt_1']) - 1,
		torso_1			= GetNumberOfPedDrawableVariations		(playerPed, 11) - 1,
		torso_2			= GetNumberOfPedTextureVariations		(playerPed, 11, Character['torso_1']) - 1,
		decals_1		= GetNumberOfPedDrawableVariations		(playerPed, 10) - 1,
		decals_2		= GetNumberOfPedTextureVariations		(playerPed, 10, Character['decals_1']) - 1,
		arms			= GetNumberOfPedDrawableVariations		(playerPed, 3) - 1,
		arms_2			= 10,
		pants_1			= GetNumberOfPedDrawableVariations		(playerPed, 4) - 1,
		pants_2			= GetNumberOfPedTextureVariations		(playerPed, 4, Character['pants_1']) - 1,
		shoes_1			= GetNumberOfPedDrawableVariations		(playerPed, 6) - 1,
		shoes_2			= GetNumberOfPedTextureVariations		(playerPed, 6, Character['shoes_1']) - 1,
		mask_1			= GetNumberOfPedDrawableVariations		(playerPed, 1) - 1,
		mask_2			= GetNumberOfPedTextureVariations		(playerPed, 1, Character['mask_1']) - 1,
		bproof_1		= GetNumberOfPedDrawableVariations		(playerPed, 9) - 1,
		bproof_2		= GetNumberOfPedTextureVariations		(playerPed, 9, Character['bproof_1']) - 1,
		chain_1			= GetNumberOfPedDrawableVariations		(playerPed, 7) - 1,
		chain_2			= GetNumberOfPedTextureVariations		(playerPed, 7, Character['chain_1']) - 1,
		bags_1			= GetNumberOfPedDrawableVariations		(playerPed, 5) - 1,
		bags_2			= GetNumberOfPedTextureVariations		(playerPed, 5, Character['bags_1']) - 1,
		helmet_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 0) - 1,
		helmet_2		= GetNumberOfPedPropTextureVariations	(playerPed, 0, Character['helmet_1']) - 1,
		glasses_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 1) - 1,
		glasses_2		= GetNumberOfPedPropTextureVariations	(playerPed, 1, Character['glasses_1'] - 1),
		watches_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 6) - 1,
		watches_2		= GetNumberOfPedPropTextureVariations	(playerPed, 6, Character['watches_1']) - 1,
		bracelets_1		= GetNumberOfPedPropDrawableVariations	(playerPed, 7) - 1,
		bracelets_2		= GetNumberOfPedPropTextureVariations	(playerPed, 7, Character['bracelets_1'] - 1),
		nose_1			= 20,
		nose_2			= 20,
		nose_3			= 20,
		nose_4			= 20,
		nose_5			= 20,
		nose_6			= 20,
		eyebrow_1		= 20,
		eyebrow_2		= 20,
		cheeks_1		= 20,
		cheeks_2		= 20,
		cheeks_3		= 20,
		lips			= 20,
		jaw_1			= 20,
		jaw_2			= 20,
		chimp_1			= 20,
		chimp_2			= 20,
		chimp_3			= 20,
		chimp_4			= 20,
		neck			= 20
	}
end

function GetCustomPed(id)
	if Config.pedList[id] then
		return Config.pedList[id]
	else
		return false
	end
end

function ApplySkin(skin, clothes)
	local playerPed = PlayerPedId()
	
	for k,v in pairs(skin) do
		Character[k] = v
	end

	if clothes ~= nil then
		for k,v in pairs(clothes) do
			if
				k ~= 'sex'				and
				k ~= 'face'				and
				k ~= 'face_2'			and
				k ~= 'blend_face'		and
				k ~= 'skin'				and
				k ~= 'skin_2'			and
				k ~= 'blend_skin'		and
				k ~= 'face_3'			and
				k ~= 'skin_3'			and
				k ~= 'blend'			and
				k ~= 'age_1'			and
				k ~= 'age_2'			and
				k ~= 'eye_color'		and
				k ~= 'beard_1'			and
				k ~= 'beard_2'			and
				k ~= 'beard_3'			and
				k ~= 'beard_4'			and
				k ~= 'hair_1'			and
				k ~= 'hair_2'			and
				k ~= 'hair_3'			and
				k ~= 'hair_color_1'		and
				k ~= 'hair_color_2'		and
				k ~= 'eyebrows_1'		and
				k ~= 'eyebrows_2'		and
				k ~= 'eyebrows_3'		and
				k ~= 'eyebrows_4'		and
				k ~= 'makeup_1'			and
				k ~= 'makeup_2'			and
				k ~= 'makeup_3'			and
				k ~= 'makeup_4'			and
				k ~= 'lipstick_1'		and
				k ~= 'lipstick_2'		and
				k ~= 'lipstick_3'		and
				k ~= 'lipstick_4'		and
				k ~= 'blemishes_1'		and
				k ~= 'blemishes_2'		and
				k ~= 'blush_1'			and
				k ~= 'blush_2'			and
				k ~= 'blush_3'			and
				k ~= 'complexion_1'		and
				k ~= 'complexion_2'		and
				k ~= 'sun_1'			and
				k ~= 'sun_2'			and
				k ~= 'moles_1'			and
				k ~= 'moles_2'			and
				k ~= 'chest_1'			and
				k ~= 'chest_2'			and
				k ~= 'chest_3'			and
				k ~= 'bodyb_1'			and
				k ~= 'bodyb_2'			and
				k ~= 'nose_1'			and
				k ~= 'nose_2'			and
				k ~= 'nose_3'			and
				k ~= 'nose_4'			and
				k ~= 'nose_5'			and
				k ~= 'nose_6'			and
				k ~= 'eyebrow_1'		and
				k ~= 'eyebrow_2'		and
				k ~= 'cheeks_1'			and
				k ~= 'cheeks_2'			and
				k ~= 'cheeks_3'			and
				k ~= 'lips'				and
				k ~= 'jaw_1'			and
				k ~= 'jaw_2'			and
				k ~= 'chimp_1'			and
				k ~= 'chimp_2'			and
				k ~= 'chimp_3'			and
				k ~= 'chimp_4'			and
				k ~= 'neck'
			then
				Character[k] = v
			end
		end
	end
	
	ClearPedDecorations(playerPed)
	ClearPedFacialDecorations(playerPed)

	if not Character['face_2'] then
		Character['face_2'] = Character['face']
		Character['face_3'] = Character['face']
		Character['skin_2'] = Character['skin']
		Character['skin_3'] = Character['skin']
		Character['blend_face'] = 10
		Character['blend_skin'] = 10
		Character['blend'] = 10
	end

	SetPedHeadBlendData(playerPed, Character['face'], Character['face_2'], Character['face_3'], Character['skin'], Character['skin_2'], Character['skin_3'], Character['blend_face'] / 10, Character['blend_skin'] / 10, Character['blend'] / 10, true)
	if Character['hair_3'] and Character['hair_3'] ~= 0 and Decorations[Character['sex'] + 1] then
		local decor = Decorations[Character['sex'] + 1][Character['hair_3']]
		if decor then
			SetPedFacialDecoration(playerPed, decor[1], decor[2])
		end
	end

	SetPedHairColor				(playerPed,			Character['hair_color_1'],		Character['hair_color_2'])					-- Hair Color
	SetPedHeadOverlay			(playerPed, 3,		Character['age_1'],				(Character['age_2'] / 10) + 0.0)			-- Age + opacity
	SetPedHeadOverlay			(playerPed, 1,		Character['beard_1'],			(Character['beard_2'] / 10) + 0.0)			-- Beard + opacity
	SetPedEyeColor				(playerPed,			Character['eye_color'], 0, 1)												-- Eyes color
	SetPedHeadOverlay			(playerPed, 2,		Character['eyebrows_1'],		(Character['eyebrows_2'] / 10) + 0.0)		-- Eyebrows + opacity
	SetPedHeadOverlay			(playerPed, 0,		Character['blemishes_1'],		(Character['blemishes_2'] / 10) + 0.0)		-- Blemishes + opacity
	SetPedHeadOverlay			(playerPed, 4,		Character['makeup_1'],			(Character['makeup_2'] / 10) + 0.0)			-- Makeup + opacity
	SetPedHeadOverlay			(playerPed, 8,		Character['lipstick_1'],		(Character['lipstick_2'] / 10) + 0.0)		-- Lipstick + opacity
	SetPedComponentVariation	(playerPed, 2,		Character['hair_1'],			Character['hair_2'], 2)						-- Hair
	SetPedHeadOverlayColor		(playerPed, 1, 1,	Character['beard_3'],			Character['beard_4'])						-- Beard Color
	SetPedHeadOverlayColor		(playerPed, 2, 1,	Character['eyebrows_3'],		Character['eyebrows_4'])					-- Eyebrows Color
	SetPedHeadOverlayColor		(playerPed, 4, 1,	Character['makeup_3'],			Character['makeup_4'])						-- Makeup Color
	SetPedHeadOverlayColor		(playerPed, 8, 1,	Character['lipstick_3'],		Character['lipstick_4'])					-- Lipstick Color
	SetPedHeadOverlay			(playerPed, 5,		Character['blush_1'],			(Character['blush_2'] / 10) + 0.0)			-- Blush + opacity
	SetPedHeadOverlayColor		(playerPed, 5, 2,	Character['blush_3'])														-- Blush Color
	SetPedHeadOverlay			(playerPed, 6,		Character['complexion_1'],		(Character['complexion_2'] / 10) + 0.0)		-- Complexion + opacity
	SetPedHeadOverlay			(playerPed, 7,		Character['sun_1'],				(Character['sun_2'] / 10) + 0.0)			-- Sun Damage + opacity
	SetPedHeadOverlay			(playerPed, 9,		Character['moles_1'],			(Character['moles_2'] / 10) + 0.0)			-- Moles/Freckles + opacity
	SetPedHeadOverlay			(playerPed, 10,		Character['chest_1'],			(Character['chest_2'] / 10) + 0.0)			-- Chest Hair + opacity
	SetPedHeadOverlayColor		(playerPed, 10, 1,	Character['chest_3'])														-- Torso Color
	SetPedHeadOverlay			(playerPed, 11,		Character['bodyb_1'],			(Character['bodyb_2'] / 10) + 0.0)			-- Body Blemishes + opacity

	if Character['ears_1'] == -1 then
		ClearPedProp(playerPed, 2)
	else
		SetPedPropIndex			(playerPed, 2,		Character['ears_1'],			Character['ears_2'], 2)						-- Ears Accessories
	end

	SetPedComponentVariation	(playerPed, 8,		Character['tshirt_1'],			Character['tshirt_2'], 2)					-- Tshirt
	SetPedComponentVariation	(playerPed, 11,		Character['torso_1'],			Character['torso_2'], 2)					-- torso parts
	SetPedComponentVariation	(playerPed, 3,		Character['arms'],				Character['arms_2'], 2)						-- Amrs
	SetPedComponentVariation	(playerPed, 10,		Character['decals_1'],			Character['decals_2'], 2)					-- decals
	SetPedComponentVariation	(playerPed, 4,		Character['pants_1'],			Character['pants_2'], 2)					-- pants
	SetPedComponentVariation	(playerPed, 6,		Character['shoes_1'],			Character['shoes_2'], 2)					-- shoes
	SetPedComponentVariation	(playerPed, 1,		Character['mask_1'],			Character['mask_2'], 2)						-- mask
	SetPedComponentVariation	(playerPed, 9,		Character['bproof_1'],			Character['bproof_2'], 2)					-- bulletproof
	SetPedComponentVariation	(playerPed, 7,		Character['chain_1'],			Character['chain_2'], 2)					-- chain
	SetPedComponentVariation	(playerPed, 5,		Character['bags_1'],			Character['bags_2'], 2)						-- Bag

	if Character['helmet_1'] == -1 then
		ClearPedProp(playerPed, 0)
	else
		SetPedPropIndex			(playerPed, 0,		Character['helmet_1'],			Character['helmet_2'], 2)					-- Helmet
	end

	if Character['glasses_1'] == -1 then
		ClearPedProp(playerPed, 1)
	else
		SetPedPropIndex			(playerPed, 1,		Character['glasses_1'],			Character['glasses_2'], 2)					-- Glasses
	end

	if Character['watches_1'] == -1 then
		ClearPedProp(playerPed, 6)
	else
		SetPedPropIndex			(playerPed, 6,		Character['watches_1'],			Character['watches_2'], 2)					-- Watches
	end

	if Character['bracelets_1'] == -1 then
		ClearPedProp(playerPed,	7)
	else
		SetPedPropIndex			(playerPed, 7,		Character['bracelets_1'],		Character['bracelets_2'], 2)				-- Bracelets
	end

	if Character['nose_1'] then
		SetPedFaceFeature(playerPed, 0, Character['nose_1'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 0, 0.0)
	end

	if Character['nose_2'] then
		SetPedFaceFeature(playerPed, 1, Character['nose_2'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 1, 0.0)
	end

	if Character['nose_3'] then
		SetPedFaceFeature(playerPed, 2, Character['nose_3'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 2, 0.0)
	end

	if Character['nose_4'] then
		SetPedFaceFeature(playerPed, 3, Character['nose_4'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 3, 0.0)
	end

	if Character['nose_5'] then
		SetPedFaceFeature(playerPed, 4, Character['nose_5'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 4, 0.0)
	end

	if Character['nose_6'] then
		SetPedFaceFeature(playerPed, 5, Character['nose_6'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 5, 0.0)
	end

	if Character['eyebrow_1'] then
		SetPedFaceFeature(playerPed, 6, Character['eyebrow_1'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 6, 0.0)
	end

	if Character['eyebrow_2'] then
		SetPedFaceFeature(playerPed, 7, Character['eyebrow_2'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 7, 0.0)
	end

	if Character['cheeks_1'] then
		SetPedFaceFeature(playerPed, 8, Character['cheeks_1'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 8, 0.0)
	end

	if Character['cheeks_2'] then
		SetPedFaceFeature(playerPed, 9, Character['cheeks_2'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 9, 0.0)
	end

	if Character['cheeks_3'] then
		SetPedFaceFeature(playerPed, 10, Character['cheeks_3'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 10, 0.0)
	end

	if Character['lips'] then
		SetPedFaceFeature(playerPed, 12, Character['lips'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 12, 0.0)
	end

	if Character['jaw_1'] then
		SetPedFaceFeature(playerPed, 11, Character['jaw_1'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 11, 0.0)
	end

	if Character['jaw_2'] then
		SetPedFaceFeature(playerPed, 13, Character['jaw_2'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 13, 0.0)
	end

	if Character['chimp_1'] then
		SetPedFaceFeature(playerPed, 14, Character['chimp_1'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 14, 0.0)
	end

	if Character['chimp_2'] then
		SetPedFaceFeature(playerPed, 15, Character['chimp_2'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 15, 0.0)
	end

	if Character['chimp_3'] then
		SetPedFaceFeature(playerPed, 16, Character['chimp_3'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 16, 0.0)
	end

	if Character['chimp_4'] then
		SetPedFaceFeature(playerPed, 17, Character['chimp_4'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 17, 0.0)
	end

	if Character['neck'] then
		SetPedFaceFeature(playerPed, 18, Character['neck'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 18, 0.0)
	end
	
	TriggerEvent('skinchanger:modelComplete')
	TriggerServerEvent('skinchanger:modelComplete', Character)
end

function ApplySkin_2(playerPed, skin, clothes, cb)
	ClearPedDecorations(playerPed)
	ClearPedFacialDecorations(playerPed)

	if not skin['face_2'] then
		skin['face_2'] = skin['face']
		skin['face_3'] = skin['face']
		skin['skin_2'] = skin['skin']
		skin['skin_3'] = skin['skin']
		skin['blend_face'] = 10
		skin['blend_skin'] = 10
		skin['blend'] = 10
	end

	SetPedHeadBlendData(playerPed, skin['face'], skin['face_2'], skin['face_3'], skin['skin'], skin['skin_2'], skin['skin_3'], skin['blend_face'] / 10, skin['blend_skin'] / 10, skin['blend'] / 10, true)
	if skin['hair_3'] and skin['hair_3'] ~= 0 and Decorations[skin['sex'] + 1] then
		local decor = Decorations[skin['sex'] + 1][skin['hair_3']]
		if decor then
			SetPedFacialDecoration(playerPed, decor[1], decor[2])
		end
	end

	SetPedHairColor				(playerPed,			skin['hair_color_1'],		skin['hair_color_2'])					-- Hair Color
	SetPedHeadOverlay			(playerPed, 3,		skin['age_1'],				(skin['age_2'] / 10) + 0.0)			-- Age + opacity
	SetPedHeadOverlay			(playerPed, 1,		skin['beard_1'],			(skin['beard_2'] / 10) + 0.0)			-- Beard + opacity
	SetPedEyeColor				(playerPed,			skin['eye_color'], 0, 1)												-- Eyes color
	SetPedHeadOverlay			(playerPed, 2,		skin['eyebrows_1'],		(skin['eyebrows_2'] / 10) + 0.0)		-- Eyebrows + opacity
	SetPedHeadOverlay			(playerPed, 0,		skin['blemishes_1'],		(skin['blemishes_2'] / 10) + 0.0)		-- Blemishes + opacity
	SetPedHeadOverlay			(playerPed, 4,		skin['makeup_1'],			(skin['makeup_2'] / 10) + 0.0)			-- Makeup + opacity
	SetPedHeadOverlay			(playerPed, 8,		skin['lipstick_1'],		(skin['lipstick_2'] / 10) + 0.0)		-- Lipstick + opacity
	SetPedComponentVariation	(playerPed, 2,		skin['hair_1'],			skin['hair_2'], 2)						-- Hair
	SetPedHeadOverlayColor		(playerPed, 1, 1,	skin['beard_3'],			skin['beard_4'])						-- Beard Color
	SetPedHeadOverlayColor		(playerPed, 2, 1,	skin['eyebrows_3'],		skin['eyebrows_4'])					-- Eyebrows Color
	SetPedHeadOverlayColor		(playerPed, 4, 1,	skin['makeup_3'],			skin['makeup_4'])						-- Makeup Color
	SetPedHeadOverlayColor		(playerPed, 8, 1,	skin['lipstick_3'],		skin['lipstick_4'])					-- Lipstick Color
	SetPedHeadOverlay			(playerPed, 5,		skin['blush_1'],			(skin['blush_2'] / 10) + 0.0)			-- Blush + opacity
	SetPedHeadOverlayColor		(playerPed, 5, 2,	skin['blush_3'])														-- Blush Color
	SetPedHeadOverlay			(playerPed, 6,		skin['complexion_1'],		(skin['complexion_2'] / 10) + 0.0)		-- Complexion + opacity
	SetPedHeadOverlay			(playerPed, 7,		skin['sun_1'],				(skin['sun_2'] / 10) + 0.0)			-- Sun Damage + opacity
	SetPedHeadOverlay			(playerPed, 9,		skin['moles_1'],			(skin['moles_2'] / 10) + 0.0)			-- Moles/Freckles + opacity
	SetPedHeadOverlay			(playerPed, 10,		skin['chest_1'],			(skin['chest_2'] / 10) + 0.0)			-- Chest Hair + opacity
	SetPedHeadOverlayColor		(playerPed, 10, 1,	skin['chest_3'])														-- Torso Color
	SetPedHeadOverlay			(playerPed, 11,		skin['bodyb_1'],			(skin['bodyb_2'] / 10) + 0.0)			-- Body Blemishes + opacity

	if skin['ears_1'] == -1 then
		ClearPedProp(playerPed, 2)
	else
		SetPedPropIndex			(playerPed, 2,		skin['ears_1'],			skin['ears_2'], 2)						-- Ears Accessories
	end

	SetPedComponentVariation	(playerPed, 8,		skin['tshirt_1'],			skin['tshirt_2'], 2)					-- Tshirt
	SetPedComponentVariation	(playerPed, 11,		skin['torso_1'],			skin['torso_2'], 2)					-- torso parts
	SetPedComponentVariation	(playerPed, 3,		skin['arms'],				skin['arms_2'], 2)						-- Amrs
	SetPedComponentVariation	(playerPed, 10,		skin['decals_1'],			skin['decals_2'], 2)					-- decals
	SetPedComponentVariation	(playerPed, 4,		skin['pants_1'],			skin['pants_2'], 2)					-- pants
	SetPedComponentVariation	(playerPed, 6,		skin['shoes_1'],			skin['shoes_2'], 2)					-- shoes
	SetPedComponentVariation	(playerPed, 1,		skin['mask_1'],			skin['mask_2'], 2)						-- mask
	SetPedComponentVariation	(playerPed, 9,		skin['bproof_1'],			skin['bproof_2'], 2)					-- bulletproof
	SetPedComponentVariation	(playerPed, 7,		skin['chain_1'],			skin['chain_2'], 2)					-- chain
	SetPedComponentVariation	(playerPed, 5,		skin['bags_1'],			skin['bags_2'], 2)						-- Bag

	if skin['helmet_1'] == -1 then
		ClearPedProp(playerPed, 0)
	else
		SetPedPropIndex			(playerPed, 0,		skin['helmet_1'],			skin['helmet_2'], 2)					-- Helmet
	end

	if skin['glasses_1'] == -1 then
		ClearPedProp(playerPed, 1)
	else
		SetPedPropIndex			(playerPed, 1,		skin['glasses_1'],			skin['glasses_2'], 2)					-- Glasses
	end

	if skin['watches_1'] == -1 then
		ClearPedProp(playerPed, 6)
	else
		SetPedPropIndex			(playerPed, 6,		skin['watches_1'],			skin['watches_2'], 2)					-- Watches
	end

	if skin['bracelets_1'] == -1 then
		ClearPedProp(playerPed,	7)
	else
		SetPedPropIndex			(playerPed, 7,		skin['bracelets_1'],		skin['bracelets_2'], 2)				-- Bracelets
	end

	if skin['nose_1'] then
		SetPedFaceFeature(playerPed, 0, skin['nose_1'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 0, 0.0)
	end

	if skin['nose_2'] then
		SetPedFaceFeature(playerPed, 1, skin['nose_2'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 1, 0.0)
	end

	if skin['nose_3'] then
		SetPedFaceFeature(playerPed, 2, skin['nose_3'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 2, 0.0)
	end

	if skin['nose_4'] then
		SetPedFaceFeature(playerPed, 3, skin['nose_4'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 3, 0.0)
	end

	if skin['nose_5'] then
		SetPedFaceFeature(playerPed, 4, skin['nose_5'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 4, 0.0)
	end

	if skin['nose_6'] then
		SetPedFaceFeature(playerPed, 5, skin['nose_6'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 5, 0.0)
	end

	if skin['eyebrow_1'] then
		SetPedFaceFeature(playerPed, 6, skin['eyebrow_1'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 6, 0.0)
	end

	if skin['eyebrow_2'] then
		SetPedFaceFeature(playerPed, 7, skin['eyebrow_2'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 7, 0.0)
	end

	if skin['cheeks_1'] then
		SetPedFaceFeature(playerPed, 8, skin['cheeks_1'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 8, 0.0)
	end

	if skin['cheeks_2'] then
		SetPedFaceFeature(playerPed, 9, skin['cheeks_2'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 9, 0.0)
	end

	if skin['cheeks_3'] then
		SetPedFaceFeature(playerPed, 10, skin['cheeks_3'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 10, 0.0)
	end

	if skin['lips'] then
		SetPedFaceFeature(playerPed, 12, skin['lips'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 12, 0.0)
	end

	if skin['jaw_1'] then
		SetPedFaceFeature(playerPed, 11, skin['jaw_1'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 11, 0.0)
	end

	if skin['jaw_2'] then
		SetPedFaceFeature(playerPed, 13, skin['jaw_2'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 13, 0.0)
	end

	if skin['chimp_1'] then
		SetPedFaceFeature(playerPed, 14, skin['chimp_1'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 14, 0.0)
	end

	if skin['chimp_2'] then
		SetPedFaceFeature(playerPed, 15, skin['chimp_2'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 15, 0.0)
	end

	if skin['chimp_3'] then
		SetPedFaceFeature(playerPed, 16, skin['chimp_3'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 16, 0.0)
	end

	if skin['chimp_4'] then
		SetPedFaceFeature(playerPed, 17, skin['chimp_4'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 17, 0.0)
	end

	if skin['neck'] then
		SetPedFaceFeature(playerPed, 18, skin['neck'] / 10 - 1.0)
	else
		SetPedFaceFeature(playerPed, 18, 0.0)
	end

	if cb then
		cb()
	end
end

AddEventHandler('skinchanger:loadDefaultModel', function(loadMale, cb)
	LoadDefaultModel(loadMale, cb)
end)

AddEventHandler('skinchanger:getData', function(cb)
	local components = json.decode(json.encode(Components))
	for k,v in pairs(Character) do
		for i=1, #components, 1 do
			if k == components[i].name then
				components[i].value = v
				--components[i].zoomOffset = Components[i].zoomOffset
				--components[i].camOffset = Components[i].camOffset
			end
		end
	end

	cb(components, GetMaxVals(false))
end)

AddEventHandler('skinchanger:getData2', function(cb)
	local components = json.decode(json.encode(Components))
	for k,v in pairs(Character) do
		for i=1, #components, 1 do
			if k == components[i].name then
				components[i].value = v
				--components[i].zoomOffset = Components[i].zoomOffset
				--components[i].camOffset = Components[i].camOffset
			end
		end
	end

	cb(components, GetMaxVals(true))
end)

AddEventHandler('skinchanger:change', function(key, val)
	Character[key] = val
	if key == 'sex' then
		TriggerEvent('skinchanger:loadSkin', Character)
	else
		ApplySkin(Character)
	end
end)

AddEventHandler('skinchanger:getSkin', function(cb)
	cb(Character)
end)

AddEventHandler('skinchanger:getSaveable', function(cb)
	local KEYS = {['tshirt_1'] = true, ['tshirt_2'] = true, ['torso_1'] = true, ['torso_2'] = true, ['decals_1'] = true, ['decals_2'] = true, ['arms'] = true, ['arms_2'] = true, ['pants_1'] = true, ['pants_2'] = true, ['shoes_1'] = true, ['shoes_2'] = true, ['helmet_1'] = true, ['helmet_2'] = true, ['ears_1'] = true, ['ears_2'] = true, ['glasses_1'] = true, ['glasses_2'] = true, ['mask_1'] = true, ['mask_2'] = true, ['bags_1'] = true, ['bags_2'] = true, ['chain_1'] = true, ['chain_2'] = true, ['watches_1'] = true, ['watches_2'] = true, ['bracelets_1'] = true, ['bracelets_2'] = true, ['bproof_1'] = true, ['bproof_2'] = true}

	local data = {}
	for k, v in pairs(Character) do
		if KEYS[k] then
			data[k] = v
		end
	end

	cb(data)
end)

AddEventHandler('skinchanger:modelLoaded', function()
	ClearPedProp(PlayerPedId(), 0)
	if LoadSkin ~= nil then
		ApplySkin(LoadSkin)
		LoadSkin = nil
	end

	if LoadClothes ~= nil then
		ApplySkin(LoadClothes.playerSkin, LoadClothes.clothesSkin)
		LoadClothes = nil
	end
end)

RegisterNetEvent('skinchanger:loadSkin')
AddEventHandler('skinchanger:loadSkin', function(skin, cb)
	local characterModel = nil
	if not skin then
		if cb ~= nil then
			cb()
		end

		return
	end

	if skin.sex and skin.sex ~= LastSex then
		LoadSkin = skin
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadDefaultModel', true, cb)
		elseif skin.sex > 1 then
			characterModel = joaat(Config.pedList[skin.sex - 1])
		else
			TriggerEvent('skinchanger:loadDefaultModel', false, cb)
		end

		RequestModel(characterModel)			
		LastSex = skin.sex
	else
		ApplySkin(skin)
		if cb ~= nil then
			cb()
		end
	end	
	
	if characterModel ~= nil then
		CreateThread(function()

			while not HasModelLoaded(characterModel) do
				RequestModel(characterModel)
				Citizen.Wait(0)
			end

			if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
				SetPlayerModel(PlayerId(), characterModel)
				SetPedDefaultComponentVariation(playerPed)
			end

			SetModelAsNoLongerNeeded(characterModel)
			TriggerEvent('skinchanger:modelLoaded')
		end)
	end
end)

RegisterNetEvent('skinchanger:loadPedSkin')
AddEventHandler('skinchanger:loadPedSkin', function(targetPed, skin, cb)
	if targetPed and skin then
		SetPedMaxHealth(targetPed, 200)
		SetPedDefaultComponentVariation(targetPed)

		ApplySkin_2(targetPed, skin, nil, function()
			if cb then
				cb()
			end
		end)
	end
end)

RegisterNetEvent('skinchanger:loadClothes')
AddEventHandler('skinchanger:loadClothes', function(playerSkin, clothesSkin)
	local characterModel = nil
	if not playerSkin then
		return
	end

	if playerSkin.sex and playerSkin.sex ~= LastSex then
		LoadClothes = {
			playerSkin	= playerSkin,
			clothesSkin	= clothesSkin
		}
		if playerSkin.sex == 0 then
			TriggerEvent('skinchanger:loadDefaultModel', true)
		else
			TriggerEvent('skinchanger:loadDefaultModel', false)
		end

		LastSex = playerSkin.sex
	else
		ApplySkin(playerSkin, clothesSkin)
	end
	
	if characterModel ~= nil then
		CreateThread(function()

			while not HasModelLoaded(characterModel) do
				RequestModel(characterModel)
				Citizen.Wait(0)
			end

			if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
				SetPlayerModel(PlayerId(), characterModel)
				SetPedDefaultComponentVariation(playerPed)
			end

			SetModelAsNoLongerNeeded(characterModel)
			TriggerEvent('skinchanger:modelLoaded')
		end)
	end
end)