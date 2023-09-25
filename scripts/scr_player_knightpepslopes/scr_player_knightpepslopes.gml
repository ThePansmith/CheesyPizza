function scr_player_knightpepslopes()
{
	if ((x + hsp) == xprevious)
		slope_buffer--;
	else
		slope_buffer = 20;
	alarm[5] = 2;
	alarm[7] = 60;
	if (knightmiddairstop == 0)
		hsp = xscale * movespeed;
	image_speed = 0.35;
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
		jumpstop = false;
	if (!scr_slope() && grounded)
		sprite_index = spr_knightpepcharge;
	if (vsp > 0)
	{
		if (scr_slope())
		{
			sprite_index = spr_knightpepdownslope;
			with (check_slope(x, y + 1))
			{
				if (sign(image_xscale) == other.xscale)
					other.sprite_index = other.spr_knightpepupslope;
			}
		}
	}
	if (input_buffer_jump > 0)
	{
		if (can_jump || !doublejump)
		{
			scr_fmod_soundeffect(jumpsnd, x, y);
			vsp = -11;
			sprite_index = spr_knightpepfly;
			image_index = 0;
			input_buffer_jump = 0;
			if (!can_jump)
			{
				repeat (4)
				{
					with (instance_create(x + random_range(-50, 50), y + random_range(0, 50), obj_highjumpcloud2))
					{
						vspeed = 2;
						sprite_index = spr_cloudeffect;
					}
				}
				vsp = -11;
				doublejump = true;
				sprite_index = spr_knightpepdoublejump;
			}
			if (!doublejump)
			{
				particle_set_scale(part.jumpdust, xscale, 1);
				create_particle(x, y, part.jumpdust, 0);
			}
		}
	}
	if (sprite_index != spr_knightpepfly && sprite_index != spr_knightpepdoublejump && sprite_index != spr_knightpepjump && !grounded)
		sprite_index = spr_knightpepfly;
	if ((sprite_index == spr_knightpepdoublejump || sprite_index == spr_knightpepfly) && floor(image_index) == (image_number - 1))
		image_index = image_number - 1;
	if (scr_solid(x + sign(hsp), y) && (!scr_slope() || check_solid(x + sign(hsp), y - 2)) && !check_slope(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		instance_create(x + (xscale * 40), y, obj_bumpeffect);
		movespeed = 0;
		vsp = -6;
		sprite_index = spr_knightpep_bump;
		image_index = floor(image_number - 1);
		state = states.knightpepbump;
		sound_play_3d("event:/sfx/pep/groundpound", x, y);
		notification_push(notifs.knightpep_bump, []);
	}
	if (scr_slope())
	{
		with (check_slope(x, y + 1))
		{
			if (other.xscale == -sign(image_xscale))
			{
				if (other.movespeed < 14)
					other.movespeed += 0.25;
			}
		}
	}
	if (!grounded && scr_check_groundpound() && sprite_index != spr_knightpepdownthrust)
	{
		sound_play_3d("event:/sfx/knight/down", x, y);
		if (vsp >= 12)
		{
			with (instance_create(x, y - 16, obj_parryeffect))
				sprite_index = spr_knightpep_downcloud;
		}
		sprite_index = spr_knightpepdownthrust;
		vsp = -5;
		hsp = 0;
		movespeed = 0;
		state = states.knightpep;
	}
}
