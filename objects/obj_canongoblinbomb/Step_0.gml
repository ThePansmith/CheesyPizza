hsp = image_xscale * 10;
if (check_solid(x + hsp, y))
{
	instance_create(x, y, obj_canonexplosion);
	instance_destroy();
}
if (place_meeting(x + 1, y, obj_bombblock) || place_meeting(x - 1, y, obj_bombblock) || place_meeting(x, y - 1, obj_bombblock) || place_meeting(x, y + 1, obj_bombblock))
	instance_create(x, y, obj_canonexplosion);
scr_collide();
