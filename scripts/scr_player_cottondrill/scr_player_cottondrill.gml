function state_player_cottondrill()
{
	static cotton_afterimagetimer = 6;
	image_speed = 0.35;
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	move = key_left + key_right;
	if (move != 0)
		xscale = move;
	if (verticalMovespeed < 9)
	{
		verticalMovespeed = Approach(verticalMovespeed, 20, 2);
		hsp = move * 5;
	}
	else
	{
		verticalMovespeed = Approach(verticalMovespeed, 20, 0.5);
		hsp = move;
	}
	vsp = verticalMovespeed;
	sprite_index = spr_cotton_drill;
	if (grounded && !place_meeting(x, y + 1, obj_destructibles) && !place_meeting(x, y + 1, obj_ratblock))
	{
		doublejump = 0;
		if scr_slope()
		{
			movespeed = (verticalMovespeed / 20) * 12;
			vsp = 3;
			state = states.cottonroll;
			image_index = 0;
			sprite_index = spr_cotton_roll;
			with (check_slope(x, y + 1))
				other.xscale = -sign(image_xscale);
		}
		else
		{
			state = states.cotton;
			sprite_index = spr_cotton_land;
			vsp = 0;
			movespeed = 0;
			image_index = 0;
		}
	}
	if (key_slap2 && sprite_index != spr_cotton_attack && grounded)
	{
		state = states.cotton;
		flash = 1;
		image_index = 0;
		sprite_index = spr_cotton_attack;
		if (movespeed < 8)
			movespeed = 8;
		if (!grounded)
			vsp = -5;
		else
			vsp = 0;
		grav = 0.2;
		grounded = false;
		//scr_sound(sfx_cottonattack);
	}
	if (key_jump && !grounded && doublejump == 0)
	{
		doublejump = 1;
		movespeed = 0;
		state = states.cotton;
		vsp = -10;
		grav = 0.1;
		image_index = 0;
		sprite_index = spr_cotton_doublejump;
		instance_create(x, y, obj_highjumpcloud2);
		with (instance_create(x, y, obj_highjumpcloud2))
		{
			image_xscale = other.xscale;
			sprite_index = spr_cottonpoof;
		}
		//scr_sound(sfx_cottonjump);
	}
	if movespeed >= 8 or sprite_index == spr_cotton_attack or sprite_index == spr_cotton_drill
	{
		if (cotton_afterimagetimer > 0)
			cotton_afterimagetimer--;
		if (cotton_afterimagetimer <= 0)
		{
			create_blur_afterimage(x, y, sprite_index, image_index, xscale);
			cotton_afterimagetimer = 6;
		}
	}
}
