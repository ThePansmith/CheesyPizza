if !in_saveroom()
{
	if (place_meeting(x + 1, y, obj_rockblock))
	{
		with (instance_place(x + 1, y, obj_rockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x - 1, y, obj_rockblock))
	{
		with (instance_place(x - 1, y, obj_rockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x, y + 1, obj_rockblock))
	{
		with (instance_place(x, y + 1, obj_rockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x, y - 1, obj_rockblock))
	{
		with (instance_place(x, y - 1, obj_rockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x + 1, y, obj_destructiblerockblock))
	{
		with (instance_place(x + 1, y, obj_destructiblerockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x - 1, y, obj_destructiblerockblock))
	{
		with (instance_place(x - 1, y, obj_destructiblerockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x, y + 1, obj_destructiblerockblock))
	{
		with (instance_place(x, y + 1, obj_destructiblerockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	if (place_meeting(x, y - 1, obj_destructiblerockblock))
	{
		with (instance_place(x, y - 1, obj_destructiblerockblock))
		{
			timer = other.timer;
			alarm[1] = timer;
		}
	}
	sound_play_3d("event:/sfx/misc/rockbreak", x + 32, y + 32);
	repeat (7)
		create_debris(x + 32, y + 32, spr_rockdebris);
	add_saveroom();
}
