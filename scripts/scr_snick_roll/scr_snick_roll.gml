function scr_snick_roll()
{
	if live_call() return live_result;
	
	if sprite_index == spr_snick_spindash
	{
		if !instance_exists(obj_superdashcloud)
		{
			with instance_create(x - xscale * 85, y, obj_superdashcloud)
				image_xscale = other.xscale;
		}
		
		image_speed = 0.5;
		if abs(hsp) > 0
			hsp = Approach(hsp, 0, 1);
		
		if movespeed > 0
			movespeed -= 0.05;
		if key_jump or key_slap2
		{
			image_index = 0;
			movespeed = min(movespeed + 2, 8);
		}
		
		if !key_down
		{
			hsp = xscale * (8 + movespeed * 2);
			state = states.machroll;
			sprite_index = spr_tumble;
			
			with obj_camera
				lag = 12;
		}
	}
	else if sprite_index == spr_move or sprite_index == spr_mach or sprite_index == spr_mach4 or sprite_index == spr_crazyrun
	{
		hsp = 0;
		
		if !instance_exists(obj_dashcloud)
		{
			with instance_create(x, y, obj_dashcloud)
				image_xscale = other.xscale;
		}
		
		movespeed = min(movespeed + 1, 24);
		if movespeed >= 24
		{
			sprite_index = spr_crazyrun;
			if !instance_exists(obj_superdashcloud)
			{
				with instance_create(x - xscale * 85, y, obj_superdashcloud)
					image_xscale = other.xscale;
			}
		}
		else if movespeed >= 16
			sprite_index = spr_mach4;
		else if movespeed >= 12
			sprite_index = spr_mach;
		else
			sprite_index = spr_move;
		
		if !key_attack
		{
			hsp = xscale * movespeed;
			state = states.normal;
		}
	}
	else
		state_snick_normal();
	
	input_buffer_jump = 0;
}