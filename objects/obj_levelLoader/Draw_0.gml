live_auto_call;

gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);

for(var i = 0; i < array_length(tile_layers); i++)
	tile_layers[i].Draw();

gpu_set_alphatestenable(false);
gpu_set_ztestenable(false);
