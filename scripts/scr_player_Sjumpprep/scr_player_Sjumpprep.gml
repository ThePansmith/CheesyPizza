function scr_player_Sjumpprep()
{
	if (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft)
		move = key_left + key_right;
	else
		move = xscale;
	if (!place_meeting(x, y + 1, obj_railparent))
		hsp = move * movespeed;
	else
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
	}
	if (sprite_index == spr_superjumpprep)
		movespeed = Approach(movespeed, 0, 1);
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_superjumpprep)
		sprite_index = spr_superjumppreplight;
	if (sprite_index == spr_superjumppreplight)
		movespeed = 2;
	if (sprite_index != spr_superjumpprep)
	{
		if (move != 0 && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft))
		{
			if (xscale == 1)
			{
				if (key_right)
					sprite_index = spr_superjumpright;
				if (-key_left)
					sprite_index = spr_superjumpleft;
			}
			if (xscale == -1)
			{
				if (key_right)
					sprite_index = spr_superjumpleft;
				if (-key_left)
					sprite_index = spr_superjumpright;
			}
		}
		else
			sprite_index = spr_superjumppreplight;
	}
	if (!scr_check_superjump() && grounded && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpleft || sprite_index == spr_superjumpright) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		instance_create(x, y, obj_explosioneffect);
		sprite_index = spr_superjump;
		state = states.Sjump;
		vsp = -17;
		image_index = 0;
	}
	image_speed = 0.35;
}
