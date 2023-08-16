repeat 3 
{
	create_slapstar(x, y);
	create_baddiegibs(x, y);
}
sound_play_oneshot_3d("event:/sfx/enemies/kill", x, y);
instance_create(x, y + 30, obj_bangeffect);
with obj_camera
{
	shake_mag = 3;
	shake_mag_acc = 3 / room_speed;
}

var dir = point_direction(xstart, ystart - 25, tgt_x, tgt_y);
with instance_create(x, y, obj_sausageman_dead)
{
	sugary = true;
	image_xscale = other.image_xscale;
	sprite_index = spr_eyescreamsandwich_dead;
	hsp = lengthdir_x(16, dir);
	vsp = lengthdir_y(16, dir);		
}
