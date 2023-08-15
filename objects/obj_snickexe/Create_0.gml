maxspeed = 2;
hitboxcreate = false;
image_speed = 0;
depth = -5;

reset_pos = function()
{
	x = room_width / 2;
	y = -50;
	hitboxcreate = false;

	if room == ruin_4 or room == ruin_7
	or room == ruin_4_OLD or room == ruin_7_OLD
		y = room_height + 50;
}
