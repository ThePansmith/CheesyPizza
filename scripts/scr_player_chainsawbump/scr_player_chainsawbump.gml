function scr_player_chainsawbump()
{
	hsp = xscale * movespeed;
	move = key_right + key_left;
	if (hsp != 0 && movespeed > 0 && (sprite_index == spr_player_chainsawrev or sprite_index == spr_player_chainsawidle) && grounded)
		movespeed--;
	if (sprite_index == spr_player_chainsawidle && move != 0)
		xscale = move;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_chainsawrev)
		sprite_index = spr_player_chainsawidle;
	if (!key_chainsaw && sprite_index == spr_player_chainsawidle)
	{
		vsp = -5;
		sprite_index = spr_player_chainsawdashstart;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_chainsawdashstart)
	{
		with (instance_create(x, y, obj_superdashcloud))
			image_xscale = other.xscale;
		particle_set_scale(particle.crazyrunothereffect, xscale, 1);
		create_particle(x, y, particle.crazyrunothereffect, 0);
		image_index = 0;
		sprite_index = spr_player_chainsawdash;
		if (movespeed < 12)
			movespeed = 12;
	}
	if (sprite_index == spr_player_chainsawdash && movespeed < 20)
		movespeed += 0.1;
	if (check_wall(x + xscale, y) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
		if (_bump)
		{
			if (sprite_index != spr_player_chainsawhitwall)
			{
				with (obj_camera)
				{
					shake_mag = 10;
					shake_mag_acc = 30 / room_speed;
				}
				sound_play_3d("event:/sfx/pep/groundpound", x, y);
				sound_play_3d("event:/sfx/pep/bumpwall", x, y);
				vsp = -6;
				movespeed = -4;
				sprite_index = spr_player_chainsawhitwall;
				image_index = 0;
			}
		}
	}
	if (key_jump && grounded && sprite_index != spr_player_chainsawhitwall)
	{
		jumpstop = false;
		vsp = -11;
		state = states.mach2;
		sprite_index = spr_mach2jump;
		hsp = abs(hsp) * xscale;
	}
	if (!instance_exists(obj_chainsawpuff))
		instance_create(x, y, obj_chainsawpuff);
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_chainsawhit or sprite_index == spr_player_chainsawdash))
	{
		if (key_attack)
			state = states.mach2;
		else
			state = states.normal;
	}
	if (floor(image_index) >= image_number - 1 && sprite_index == spr_player_chainsawhitwall)
	{
		landAnim = false;
		state = states.normal;
	}
	
	if (sprite_index == spr_player_chainsawdash)
		image_speed = 0.4 + (movespeed * 0.01);
	else if sprite_index == spr_player_chainsawhitwall
	{
		if image_index < 3 or grounded
			image_speed = 0.35;
		else
			image_speed = 0;
	}
	else
		image_speed = 0.4;
}
