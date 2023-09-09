event_inherited();
if global.snickchallenge
	instance_destroy(id, false);

if REMIX
	image_alpha = (global.panic == true || instance_exists(obj_wartimer));
