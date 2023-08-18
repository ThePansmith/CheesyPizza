maxspeed = 2;
hitboxcreate = false;
image_speed = 0;
depth = -5;

reset_pos = function(particle = true)
{
	if y > -50 && y < room_height + 50 repeat 6
	{
		with instance_create(x + irandom_range(-50, 50), y + irandom_range(-50, 50), obj_balloonpop)
			sprite_index = spr_shotgunimpact;
	}
	
	knocked = false;
	hspeed = 0;
	vspeed = 0;
	image_angle = 0;
	x = room_width / 2;
	y = -50;
	hitboxcreate = false;
	maxspeed = 2;
	
	if room == ruin_4 or room == ruin_7
	or room == ruin_4_OLD or room == ruin_7_OLD
		y = room_height + 50;
	if room == ruin_7_OLD
		maxspeed = 1;
}

// pto
knocked = false;
enemybird = false;
enemybirdi = 0;
