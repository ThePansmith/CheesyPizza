image_speed = 0.35;
hsp = 0;
vsp = 0;
hsp_carry = 0;
vsp_carry = 0;
platformid = noone;
grav = 0.5;
part = false;
partx = 0;
party = 0;

if (check_solid(x, y))
{
	y = 16;
	part = true;
	partx = x;
	party = y;
	alarm[0] = 1;
	
	x = clamp(x, 96, room_width - 96);
}

with obj_bosscontroller
	other.sprite_index = spr_playerhp;
