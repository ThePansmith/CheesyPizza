image_speed = 0.35;
switch (sprite_index)
{
	case spr_open:
		with (obj_heatafterimage)
			visible = false;
		with (obj_player)
		{
			if (object_index != obj_player2 || global.coop)
			{
				x = other.x;
				y = other.y;
				roomstartx = x;
				roomstarty = y;
				hsp = 0;
				vsp = 0;
				movespeed = 0;
				cutscene = true;
				visible = false;
			}
		}
		waitbuffer = 80;
		drop = false;
		if (floor(image_index) == (image_number - 1))
		{
			fmod_event_one_shot_3d("event:/sfx/misc/secretexit", x, y);
			sprite_index = spr_idle;
			with (obj_player)
			{
				if (object_index != obj_player2 || global.coop)
				{
					if (!isgustavo && tauntstoredstate != states.knightpep && tauntstoredstate != states.knightpepslopes && tauntstoredstate != states.knightpepbump && tauntstoredstate != states.firemouth)
					{
						visible = true;
						cutscene = false;
						sprite_index = spr_bodyslamstart;
						image_index = 0;
						state = states.freefallprep;
						vsp = (character != "N") ? -5 : -7;
					}
					else if (isgustavo)
						state = states.ratmount;
					else
					{
						if (state == states.knightpep)
							hsp = 0;
						sprite_index = tauntstoredsprite;
					}
				}
			}
		}
		break;
	
	case spr_idle:
		if (!drop)
		{
			with (obj_heatafterimage)
				visible = false;
			with (obj_player)
			{
				if (check_player_coop())
				{
					x = other.x;
					y = other.y - 10;
					visible = true;
					hsp = 0;
					movespeed = 0;
					vsp = 10;
					scale_xs = Approach(scale_xs, 1, 0.05);
					scale_ys = Approach(scale_ys, 1, 0.05);
					fallinganimation = 0;
					if (scale_xs == 1)
						other.drop = true;
					if (other.drop)
					{
						if (!isgustavo && (tauntstoredstate == states.knightpep || tauntstoredstate == states.knightpepslopes || tauntstoredstate == states.knightpepbump || tauntstoredstate == states.firemouth))
						{
							state = tauntstoredstate;
							movespeed = tauntstoredmovespeed;
							hsp = tauntstoredhsp;
							sprite_index = tauntstoredsprite;
							if (state == states.knightpep)
							{
								hsp = 0;
								movespeed = 0;
							}
							else if (state == states.knightpepslopes)
							{
								movespeed = 0;
								hsp = 0;
								state = states.knightpep;
								sprite_index = spr_knightpepfall;
							}
							else if (state == states.firemouth)
							{
								if (sprite_index == spr_player_firemouthdash)
								{
									hsp = 0;
									movespeed = 0;
									sprite_index = spr_player_firemouthidle;
								}
							}
						}
					}
				}
			}
		}
		if (drop)
		{
			if (waitbuffer > 0)
				waitbuffer--;
			else
			{
				sprite_index = spr_close;
				image_index = 0;
			}
		}
		break;
	
	case spr_close:
		if (floor(image_index) == (image_number - 1))
		{
			image_index = image_number - 1;
			instance_destroy();
		}
		break;
}
