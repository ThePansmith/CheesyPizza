if (geyser_timer > 0)
	geyser_timer--;

// Do Geyser Animation
geyser_image_index += 0.35;
if (geyser_image_index > sprite_get_number(spr_geyservertical))
	geyser_image_index = 0;
	
// Do Cloud animation
cloud_image_index += 0.25;
if (cloud_image_index > sprite_get_number(spr_geysercloud))
	cloud_image_index = 0;
	
	
if (!geyser_timer && geyser_size < 0) // Drain and Fade
{
	geyser_opacity = Approach(geyser_opacity, 0, 0.05);
	geyser_size = Approach(geyser_size, 0, 0.5);
}
if (geyser_timer && geyser_size > -vertical_stop_scale) // Fill
{
	geyser_size = Approach(geyser_size, -vertical_stop_scale, 1);
	geyser_opacity = 1;
}

// Ignore any player interactions if the player isn't in range
if (!(bbox_right < obj_player1.bbox_left || bbox_left > obj_player1.bbox_right))
{	
	if (geyser_timer > 0) // Active Geyser
	{
		if (obj_player1.bbox_bottom > vertical_stop)
		{
			with (obj_player1)
			{
				state = states.jump;
				sprite_index = spr_currentplayer;
				movespeed = 8;
				if (vsp > -8)
					vsp = -8;
					
				vsp = Approach(vsp, -18, 1);
			}
		}
	}
	else // Inactive Geyser
	{
		if (obj_player1.bbox_bottom != y - 1)
			exit;
		if (obj_player1.state == states.freefallland || obj_player.sprite_index == obj_player.spr_bodyslamland)
		{
			fmod_event_one_shot("event:/modded/sfx/geyser");
			geyser_timer = 300;
		}
	
	}
}