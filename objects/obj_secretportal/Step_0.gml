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
if (touched && sprite_index == spr_close && (!death or instance_exists(obj_deathportalexit)))
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
			if touched
			{
				if death
				{
					with obj_camera
					{
						lock = false;
						limitcam = [camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])];
						panspeed = 40;
					}
					with obj_deathportalexit
					{
						visible = true;
						active = true;
						image_index = 0;
					}
					instance_destroy();
				}
				else if !instance_exists(obj_fadeout)
				{
					with (obj_player)
					{
						lastTargetDoor = targetDoor;
						targetDoor = "S";
						//if (instance_exists(obj_secretportalstart))
						//		secretportalID = other.ID;
						if !other.secret
						{
							set_lastroom();
							targetRoom = other.targetRoom;
							secretportalID = other.ID;
						}
						else
						{
							var condition = other.targetRoom != room;
							if instance_exists(obj_levelLoader)
								condition = false;
							
							if condition // it wasn't set, we are probably in a secret
								targetRoom = other.targetRoom;
							else
								targetRoom = lastroom;
							set_lastroom();
						}
					}
					if !secret && !soundtest
						add_saveroom();
					
					instance_create(x, y, obj_fadeout);
				}
			}
			break;
	}
}
