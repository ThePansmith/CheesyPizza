x += (image_xscale * 6);
depth = -1;
if (place_meeting(x, y, obj_solid) || place_meeting(x, y, obj_slope_parent))
{
	instance_create(x, y, obj_bumpeffect);
	instance_destroy();
}