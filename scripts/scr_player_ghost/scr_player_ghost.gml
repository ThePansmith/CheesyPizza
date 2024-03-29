function scr_player_ghost()
{
	visible = true;
	image_speed = 0.35;
	ghosttimer++;
	if (sprite_index != spr_ghostend)
	{
		move_h = key_right_axis + key_left_axis;
		move_v = key_up_axis + key_down_axis;
		if (move_h == 0)
			move_h = key_right + key_left;
		if (move_v == 0)
			move_v = key_down - key_up;
		var maxspeed = 6;
		var hspaccel = 0.4;
		var vspaccel = 0.4;
		if (move_h == 0)
			hspaccel = 0.4;
		if (move_v == 0)
			vspaccel = 0.4;
		if (ghostdash)
		{
			sprite_index = spr_ghostdash;
			if (ghostpepper == 1)
				maxspeed = 8;
			if (ghostpepper == 2)
				maxspeed = 10;
			if (ghostpepper >= 3)
				maxspeed = 12;
			hspaccel = 0.4;
			vspaccel = 0.4;
		}
		if ((ghostdash == 1 && ghostpepper >= 3) && ghosteffect == 0)
		{
			create_particle(x + random_range(-25, 25), y + random_range(-25, 25), part.cloudeffect);
			ghosteffect = 5;
		}
		if (ghosteffect > 0)
			ghosteffect--;
		if (hsp != 0)
			xscale = sign(hsp);
		if (!ghostdash)
		{
			movespeed = Approach(movespeed, move_h * maxspeed, hspaccel);
			hsp = movespeed;
			vsp = Approach(vsp, move_v * maxspeed, vspaccel);
			if (move_v < 0)
				sprite_index = spr_ghostjump;
			else
				sprite_index = spr_ghostidle;
		}
		else
		{
			var m = maxspeed;
			if (move_h != 0 || move_v != 0)
				ghostangle = point_direction(0, 0, move_h * 20, move_v * 20);
			else
				m = 0;
			var dx = lengthdir_x(m, ghostangle);
			var dy = lengthdir_y(m, ghostangle);
			if (frac(move_h) > 0)
				dx = move_h * m;
			if (frac(move_v) > 0)
				dy = move_v * m;
			movespeed = Approach(movespeed, dx, hspaccel);
			hsp = movespeed;
			vsp = Approach(vsp, dy, vspaccel);
			if (m != 0)
			{
				var _h = abs(hsp) > 0;
				var mag = magnitude(hsp, vsp);
				trace(mag);
				if (mag >= 2.5)
				{
					var pad = 22;
					if (ghostangle < (45 - pad) || ghostangle > (315 + pad))
						sprite_index = spr_player_ghostdashright;
					else if (ghostangle >= (45 - pad) && ghostangle <= (45 + pad))
						sprite_index = spr_player_ghostdashupright;
					else if (ghostangle < (135 - pad) && ghostangle > (45 + pad))
						sprite_index = spr_player_ghostdashup;
					else if (ghostangle <= (135 + pad) && ghostangle >= (135 - pad))
						sprite_index = spr_player_ghostdashupright;
					else if (ghostangle > (135 + pad) && ghostangle < (225 - pad))
						sprite_index = spr_player_ghostdashright;
					else if (ghostangle <= (225 + pad) && ghostangle >= (225 - pad))
						sprite_index = spr_player_ghostdashdownright;
					else if (ghostangle > (225 + pad) && ghostangle < (315 - pad))
						sprite_index = spr_player_ghostdashdown;
					else if (ghostangle <= (315 + pad) && ghostangle >= (315 - pad))
						sprite_index = spr_player_ghostdashdownright;
				}
				else
					sprite_index = spr_ghostidle;
				ghostbump = Approach(ghostbump, 1, 0.1);
				if (scr_solid_player(x + sign(hsp), y) && !check_slope(x + sign(hsp), y + sign(vsp)))
					movespeed = 0;
				if (ghostbump < 0)
				{
					hsp = dx * ghostbump;
					vsp = dy * ghostbump;
					sprite_index = spr_player_ghostbump;
				}
				else
				{
					var mh = sign(hsp);
					var mv = sign(vsp);
					if (move_h != 0 || move_v != 0)
					{
						mh = move_h;
						mv = move_v;
					}
				}
			}
			else
				sprite_index = spr_ghostidle;
		}
		if (place_meeting(x, y, obj_tombstone) && sprite_index != spr_ghostend)
		{
			sprite_index = spr_ghostend;
			image_index = 0;
			image_alpha = 1;
			vsp = 10;
			hsp = 0;
			grav = 0.5;
			movespeed = 0;
			with (instance_place(x, y, obj_tombstone))
			{
				other.x = x;
				other.y = y;
			}
		}
	}
	if (sprite_index == spr_ghostend && floor(image_index) == (image_number - 1))
		state = states.normal;
	if (place_meeting(x, y, obj_ghosttransparency))
		image_alpha = 0.5;
	else
		image_alpha = 1;
}
function scr_player_ghostpossess()
{
	visible = false;
	hsp = 0;
	if (!instance_exists(possessID))
	{
		visible = true;
		state = states.ghost;
		sprite_index = spr_ghostidle;
	}
}
