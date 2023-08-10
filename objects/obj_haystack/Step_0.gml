mask_index = spr_haystack;
if (sprite_index != spr_haystackburning && sprite_index != spr_haystackburningup)
{
	with (obj_peasanto)
	{
		if (state == states.charge && place_meeting(x + hsp, y, other))
			other.sprite_index = spr_haystackburningup;
	}
	with (obj_player)
	{
		if ((state == states.firemouth && (place_meeting(x + hsp, y, other) || place_meeting(x, y + 1, other))) || (state == states.fireass && place_meeting(x, y + 1, other)))
			other.sprite_index = spr_haystackburningup;
	}
}
else if (sprite_index == spr_haystackburningup)
{
	if (floor(image_index) == (image_number - 1))
		sprite_index = spr_haystackburning;
}
else if (sprite_index == spr_haystackburning)
{
	with (instance_place(x + 1, y, obj_haystack))
	{
		if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
			sprite_index = spr_haystackburningup;
	}
	with (instance_place(x - 1, y, obj_haystack))
	{
		if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
			sprite_index = spr_haystackburningup;
	}
	with (instance_place(x, y + 1, obj_haystack))
	{
		if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
			sprite_index = spr_haystackburningup;
	}
	with (instance_place(x, y - 1, obj_haystack))
	{
		if (sprite_index != spr_haystackburningup && sprite_index != spr_haystackburning)
			sprite_index = spr_haystackburningup;
	}
	with (instance_place(x, y - 1, obj_baddie))
	{
		if (state != states.grabbed)
			instance_destroy();
	}
	if !in_saveroom()
		add_saveroom();
	if (firetimer > 0 && sprite_index == spr_haystackburning && firetimeinf == 0)
		firetimer--;
	if (firetimer <= 0 && sprite_index == spr_haystackburning && firetimeinf == 0)
	{
		sprite_index = spr_haystack;
		firetimer = 200;
	}
	playerid = instance_place(x, y - 1, obj_player);
	with (playerid)
	{
		if (state != states.fireass && state != states.knightpep)
		{
			if (character == "V")
				scr_hurtplayer(id);
			else if (scr_transformationcheck())
			{
				scr_losepoints();
				if (state != states.fireass)
				{
					
				}
				state = states.fireass;
				image_index = 0;
				vsp = -5;
				sprite_index = spr_fireass;
			}
		}
	}
}
if (state == states.transition)
{
	hsp = movespeed * dir;
	if (check_solid(x + sign(hsp), y) && (!check_slope(x + sign(hsp), y) || check_solid(x + sign(hsp), y - 4)))
		x_to = x;
	if ((dir > 0 && x >= x_to) || (dir < 0 && x <= x_to))
	{
		x = x_to;
		hsp = 0;
		state = states.normal;
	}
}
