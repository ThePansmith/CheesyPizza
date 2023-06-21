function scr_player_tumble()
{
	var machrollspr = (character == "P") ? spr_player_machroll : spr_machroll;
	var divespr = spr_dive;
	if isgustavo
	{
		machrollspr = spr_lonegustavo_crouchwalk;
		divespr = spr_lonegustavo_groundpound;
	}
	
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
	}
	hsp = (xscale * movespeed) + (railmovespeed * raildir);
	move = key_right + key_left;
	mask_index = spr_crouchmask;
	if (sprite_index == spr_tumblestart)
		movespeed = 6;
	if (!grounded && (sprite_index == spr_crouchslip || sprite_index == machrollspr || sprite_index == spr_mach2jump || sprite_index == spr_backslide || sprite_index == spr_backslideland))
	{
		vsp = 10;
		sprite_index = divespr;
		fmod_event_instance_play(snd_dive);
	}
	if (sprite_index == spr_tumble && grounded)
	{
		if (move == xscale)
			movespeed = Approach(movespeed, 12, 0.25);
		else if (move == -xscale)
			movespeed = Approach(movespeed, 8, 0.25);
		else
			movespeed = Approach(movespeed, 10, 0.25);
	}
	if (grounded && sprite_index == divespr)
	{
		sprite_index = machrollspr;
		image_index = 0;
	}
	if (sprite_index == divespr && key_jump && !isgustavo)
	{
		sprite_index = spr_poundcancel1;
		if character == "SP"
			sprite_index = spr_playerSP_poundcancel1;
		image_index = 0;
		state = states.freefall;
		dir = xscale;
		vsp = -6;
	}
	if (movespeed <= 2 && sprite_index != spr_tumble && sprite_index != spr_player_breakdance)
		state = states.normal;
	if (!scr_slope() && sprite_index == spr_tumblestart && floor(image_index) < 11)
		image_index = 11;
	if (sprite_index == spr_mach2jump && grounded)
	{
		image_index = 0;
		sprite_index = machrollspr;
	}
	if (sprite_index == spr_mach2jump && grounded)
	{
		image_index = 0;
		sprite_index = machrollspr;
	}
	if (sprite_index == spr_crouchslip && !grounded)
		sprite_index = spr_player_jumpdive2;
	if (sprite_index == spr_player_Sjumpcancelland && floor(image_index) == (image_number - 1))
		sprite_index = spr_player_Sjumpcancelslide;
	if (sprite_index == spr_player_jumpdive2 && grounded)
		sprite_index = spr_crouchslip;
	if (floor(image_index) == (image_number - 1) && sprite_index == machrollspr && movespeed > 12 && character != "N" && character != "V" && character != "S")
	{
		sprite_index = spr_backslideland;
		image_index = 0;
	}
	if (sprite_index == machrollspr && !grounded)
		sprite_index = spr_mach2jump;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_backslideland)
		sprite_index = spr_backslide;
	if (sprite_index == spr_player_Sjumpcancel && grounded)
		sprite_index = spr_player_Sjumpcancelland;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancelland)
		sprite_index = spr_player_Sjumpcancelslide;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdance)
	{
		particle_set_scale(particle.jumpdust, xscale, 1);
		create_particle(x, y, particle.jumpdust, 0);
		movespeed = 12;
		sprite_index = spr_breakdancesuper;
	}
	if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
	{
		sprite_index = spr_tumble;
		movespeed = 14;
	}
	if ((state != states.freefall && ((place_meeting(x + xscale, y, obj_solid) || scr_solid_slope(x + xscale, y)) && !place_meeting(x + hsp, y, obj_rollblock) && !place_meeting(x + hsp, y, obj_unbumpablewall) && (!place_meeting(x + hsp, y, obj_rattumble) || sprite_index != spr_tumble) && (!place_meeting(x + hsp, y, obj_destructibles)/* or character == "V"*/) && (!place_meeting(x + hsp, y, obj_metalblock) or character != "SP" or sprite_index != spr_machroll or abs(hsp) < 12))) || place_meeting(x, y, obj_timedgate))
	{
		hsp = 0;
		movespeed = 0;
		if (sprite_index == spr_tumble || sprite_index == spr_tumblestart)
		{
			fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
			state = states.bump;
			landAnim = false;
			sprite_index = spr_tumbleend;
			image_index = 0;
			hsp = -xscale * 2;
			vsp = -3;
			jumpstop = true;
		}
		else
		{
			fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y);
			state = states.bump;
			image_index = 0;
			sprite_index = spr_wallsplat;
		}
	}
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0 && !place_meeting(x, y, obj_bigcheese))
		jumpstop = false;
	if (input_buffer_jump > 0 && can_jump && state != states.bump && hsp != 0 && sprite_index == spr_tumble && !place_meeting(x, y, obj_pinballlauncher) && !place_meeting(x, y, obj_bigcheese))
	{
		if (!scr_solid(x, y - 16))
		{
			with (instance_create(x, y, obj_highjumpcloud2))
				image_xscale = other.xscale;
			vsp = -11;
			image_index = 0;
		}
	}
	if (crouchslipbuffer > 0)
		crouchslipbuffer--;
	if (!key_down && key_attack && grounded && state != states.bump && (sprite_index != spr_tumble && sprite_index != spr_tumbleend) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && sprite_index != spr_player_breakdance)
	{
		if (crouchslipbuffer == 0)
		{
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale;
			if isgustavo
			{
				state = states.ratmount;
				ratmount_movespeed = movespeed;
				movespeed *= xscale;
			}
			else if (movespeed >= 12)
				state = states.mach3;
			else
				state = states.mach2;
			image_index = 0;
			sprite_index = spr_rollgetup;
			fmod_event_instance_play(rollgetupsnd);
		}
	}
	if (!key_down && !key_attack && grounded && vsp > 0 && state != states.bump && (sprite_index != spr_tumble && sprite_index != spr_tumbleend) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && sprite_index != spr_player_breakdance)
	{
		if (crouchslipbuffer == 0)
		{
			if isgustavo
			{
				movespeed = 0;
				state = states.ratmount;
			}
			else if (movespeed > 6)
			{
				state = states.machslide;
				sprite_index = spr_machslidestart;
				image_index = 0;
			}
			else
				state = states.normal;
		}
	}
	if (sprite_index == spr_crouchslip || sprite_index == spr_breakdancesuper || sprite_index == machrollspr || sprite_index == spr_tumble || sprite_index == spr_tumblestart || sprite_index == spr_player_machroll || sprite_index == spr_player_mach2jump)
		image_speed = abs(movespeed) / 15;
	else if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach2jump)
		image_speed = 0;
	else if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancel)
		image_speed = 0;
	else
		image_speed = 0.35;
	if (!instance_exists(dashcloudid) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
}
