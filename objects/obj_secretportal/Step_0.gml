if ((sprite_index == spr_close or sprite_index == spr_secretportal_close) && !touched)
{
	image_speed = 0;
	if (active)
	{
		sprite_index = spr_open;
		image_index = 0;
	}
}
else
	image_speed = 0.35;
if (touched && sprite_index == spr_close)
{
	with (playerid)
	{
		hsp = 0;
		vsp = 0;
		x = other.x;
		y = other.y;
		scale_xs = Approach(scale_xs, 0, 0.05);
		scale_ys = Approach(scale_ys, 0, 0.05);
		fallinganimation = 0;
		if (state == states.mach2 || state == states.mach3)
			state = states.normal;
	}
	with (obj_heatafterimage)
		visible = false;
}
if (floor(image_index) >= (image_number - 1))
{
	switch (sprite_index)
	{
		case spr_open:
			sprite_index = spr_idle;
			break;
		
		case spr_close:
			image_index = image_number - 1;
			if (touched)
			{
				if (!instance_exists(obj_fadeout))
				{
					with (obj_player)
					{
						lastTargetDoor = targetDoor;
						targetDoor = "S";
						if (!other.secret)
						{
							lastroom = room;
							targetRoom = other.targetRoom;
							secretportalID = other.id;
						}
						else
							targetRoom = lastroom;
					}
					if (!secret && !soundtest)
						ds_list_add(global.saveroom, id);
					instance_create(x, y, obj_fadeout);
				}
			}
			break;
	}
}
