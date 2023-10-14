queue = ds_queue_create();
image_speed = 0;
target_object = obj_player1;

curr_state = noone;
grace_period = 0;

layer_4_index = 0;
layer_uvs = 
[
	sprite_get_uvs(spr_cosmicclone_layer1, 0),
	sprite_get_uvs(spr_cosmicclone_layer2, 0),
	sprite_get_uvs(spr_cosmicclone_layer3, 0),
]
