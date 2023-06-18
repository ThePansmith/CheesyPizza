x += (image_xscale * 4);
depth = -1;
if (place_meeting(x, y, obj_solid) || place_meeting(x, y, obj_slope_parent))
	instance_destroy();
