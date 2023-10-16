queue = ds_queue_create();
image_speed = 0;
target_object = obj_player1;

curr_state = noone;
grace_period = 0;

surf = -1;
characters = [
	["P", spr_peppalette], // character, idle, palette sprite, [main color, mixing color]
	["N", spr_noisepalette],
	["V", spr_vigipalette],
	["G", spr_peppalette],
	["SP", spr_pizzypalette],
	["SN", spr_pizzanopalette],
	
	//["PN", spr_peppalette],
	["BN", spr_bopalette],
];
layer_4_index = 0;
layer_offsets = 
	[
		0, 0, // layer 2 x y 
		0, 0, // layer 3 x y
		0, 0 // layer 4 x y
	];
/*
layer_uvs = 
[
	sprite_get_uvs(spr_cosmicclone_layer1, 0),
	sprite_get_uvs(spr_cosmicclone_layer2, 0),
	sprite_get_uvs(spr_cosmicclone_layer3, 0),
]*/
