room_started = false;

if surface_exists(bg_surface)
	surface_free(bg_surface);
if surface_exists(fg_surface)
	surface_free(fg_surface);

if !instance_exists(obj_levelLoader)
	background_layers = [];
do_foreground = false;
