with (obj_player)
{
	if place_meeting(x, y + 1, other)
	{
		if (!check_wall(other.x + 16, y + 1) && key_down && (state == states.crouch or ((character == "S" or character == "M") && (state == states.normal or state == states.mach1))) && place_meeting(x, y + 1, obj_platform))
		{
			if REMIX
				smoothx = x - (other.x + 16);
			
			y += 5;
			state = states.ladder;
			x = other.x + 16;
			y = floor(y);
			if ((y % 2) == 1)
				y -= 1;
		}
		if (key_down && !check_wall(other.x + 16, y + 1) && state == states.ratmountcrouch && place_meeting(x, y + 1, obj_platform))
		{
			if REMIX
				smoothx = x - (other.x + 16);
			
			state = states.ratmountladder;
			if (brick == 1)
			{
				with (instance_create(x, y, obj_brickcomeback))
				{
					wait = true;
					instance_create(x, y, obj_genericpoofeffect);
				}
			}
			y += 5;
			brick = false;
			x = other.x + 16;
			y = floor(y);
			if ((y % 2) == 1)
				y -= 1;
		}
	}
}
