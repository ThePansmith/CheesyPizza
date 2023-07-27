function scr_player_ratmounthurt()
{
	hsp = -xscale * movespeed;
	landAnim = false;
	jumpAnim = false;
	hurted = true;
	gusdashpadbuffer = 0;
	if (check_solid(x + sign(hsp), y) && !check_slope(x, y + sign(hsp)))
		movespeed = 0;
	alarm[5] = 2;
	alarm[7] = 80;
	if (grounded && vsp > 0)
	{
		state = states.ratmount;
		movespeed = 0;
	}
	if (brick)
		sprite_index = spr_player_ratmounthurt;
	else
		sprite_index = spr_lonegustavo_hurt;
	image_speed = 0.35;
}
