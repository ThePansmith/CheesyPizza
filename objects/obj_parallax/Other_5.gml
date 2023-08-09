room_started = false;
if surface_exists(bg_surface)
	surface_free(bg_surface);

if !instance_exists(obj_levelLoader)
	background_layers = [];
