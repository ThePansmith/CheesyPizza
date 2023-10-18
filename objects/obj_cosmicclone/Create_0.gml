queue = ds_queue_create();
image_speed = 0;
target_object = obj_player1;

curr_state = noone;
grace_period = 0;

surf = -1;
color1 = shader_get_uniform(shd_mach3effect, "color1");
color2 = shader_get_uniform(shd_mach3effect, "color2");
layer_4_index = 0;
layer_offsets = 
[
	0, 0, // layer 2 x y 
	0, 0, // layer 3 x y
	0, 0 // layer 4 x y
];

// queue size
distance = 50;
