function scr_pizzano_twirl()
{
	if live_call() return live_result;
	
	if sprite_index == spr_crazyrun
		sprite_index = spr_pizzano_machtwirl;
	image_speed = 0.5;
	
	move = (key_left + key_right);
	hsp = (xscale * movespeed);
	mach2++
	if move != 0
	{
		if move == xscale && movespeed < 11
			movespeed += 0.75;
		if move != xscale && movespeed > -11
			movespeed -= 0.75;
	}
	
	if (key_down2 && !grounded && vsp < 10)
        vsp = 10
	if !key_jump2 && vsp < -2
		vsp = -2;
	
	if grounded
	{
		if movespeed < 0
			xscale *= -1;
		movespeed = abs(movespeed);
		
		if key_attack
		{
			movespeed = max(movespeed, 6);
			state = states.mach2
			image_index = 0;
			
			jumpstop = 0
		}
		else
		{
			state = states.normal;
			image_index = 0;
			mach2 = 0;
			jumpstop = 0	
		}	
	}
	
	// wallclimb
	if ((!grounded && (check_solid(x + hsp, y) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && (!place_meeting(x + hsp, y, obj_metalblock) or movespeed < 12)) || (grounded && (check_solid(x + sign(hsp), y - 16) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && (!place_meeting(x + hsp, y, obj_metalblock) or movespeed < 12) && check_slope(x, y + 1)))
	{
		wallspeed = movespeed;
		grabclimbbuffer = 0;
		movespeed = max(wallspeed, 1);
		state = states.climbwall;
		if REMIX
			vsp = -wallspeed;
	}
	if (!grounded && place_meeting(x + sign(hsp), y, obj_climbablewall) && !place_meeting(x + sign(hsp), y, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_metalblock) or movespeed < 12))
	{
		wallspeed = movespeed;
		grabclimbbuffer = 0;
		state = states.climbwall;
	}
	
	// grab
	if (input_buffer_shoot > 0 && shotgunAnim)
		scr_shotgunshoot();
	else if (input_buffer_pistol > 0 && global.pistol)
	or (global.shootstyle == 1 && key_shoot2)
		scr_pistolshoot(states.mach2);
	else if key_shoot2
		scr_perform_move(moves.shootattack, states.mach2);
	
	if input_buffer_slap > 0 && ((shotgunAnim == false && !global.pistol) or global.shootbutton == 1 or (global.shootbutton == 2 && !global.pistol))
	{
		// uppercut
		if key_up
		{
			input_buffer_slap = 0;
			input_buffer_grab = 0;
			state = states.punch;
			image_index = 0;
			sprite_index = spr_breakdanceuppercut;
			fmod_event_instance_play(snd_uppercut);
			vsp = -10;
			movespeed = hsp;
			particle_set_scale(part.highjumpcloud2, xscale, 1);
			create_particle(x, y, part.highjumpcloud2, 0);
		}
		
		// kungfu
		else
		{
			input_buffer_slap = 0;
			scr_perform_move(moves.grabattack, states.twirl);
		}
	}
	
	// pound cancel
	if key_down && key_jump
	{
		sprite_index = spr_poundcancel1;
		image_index = 0;
		state = states.freefall;
		dir = xscale;
		vsp = -6;
	}
	
	// blue afterimage
	if punch_afterimage > 0
		punch_afterimage--;
	else
	{
		punch_afterimage = 5;
		with create_blue_afterimage(x, y, sprite_index, image_index, true)
		{
			image_xscale = other.xscale;
			playerid = other.id;
		}
	}
}
