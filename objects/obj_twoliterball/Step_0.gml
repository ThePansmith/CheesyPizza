hsp = (image_xscale * movespeed);
scr_collide();

with instance_place(x + hsp, y, obj_baddie)
{	
	if (object_index == obj_twoliterdog)
		image_xscale = -image_xscale;
	instance_destroy();
}
instance_destroy(instance_place(x + hsp, y, obj_destructibles));
instance_destroy(instance_place(x + hsp, y, obj_metalblock));
instance_destroy(instance_place(x + hsp, y, obj_ratblock));
if scr_solid(x + image_xscale, y) && !place_meeting(x + image_xscale, y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_ratblock)
	instance_destroy();
