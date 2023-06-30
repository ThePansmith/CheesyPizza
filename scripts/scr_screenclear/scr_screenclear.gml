function scr_screenclear()
{
	var c = 0;
	var lag = 20;
	with (obj_baddie)
	{
		if (point_in_camera(x, y, view_camera[0]) && supertauntable)
		{
			global.style += (5 + floor(global.combo / 5));
					
			hp = -99;
			state = states.hit;
			hitLag = lag;
			hitX = x;
			hitY = y;
			if (elite)
			{
				elitehit = -1;
				mach3destroy = true;
			}
			if (destroyable)
				c++;
			instance_create(x, y, obj_parryeffect);
			alarm[3] = 3;
			repeat 3
			{
				create_slapstar(x, y);
				create_baddiegibs(x, y);
			}
			with (obj_camera)
			{
				shake_mag = 3;
				shake_mag_acc = 3 / room_speed;
			}
		}
	}
	with (obj_camera)
	{
		shake_mag = 10;
		shake_mag_acc = 30 / room_speed;
	}
}