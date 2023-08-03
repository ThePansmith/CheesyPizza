if (geyser_timer > 0)
	geyser_timer--;
geyser_image_index += 0.35;
	
if (geyser_image_index > sprite_get_number(spr_geyservertical))
	geyser_image_index = 0;
		
if (!geyser_timer && geyser_size < 0)
	geyser_size = Approach(geyser_size, 0, 0.5);
if (geyser_timer && geyser_size > -vertical_stop_scale)
	geyser_size = Approach(geyser_size, -vertical_stop_scale, 1);
	
if (!(bbox_right < obj_player1.bbox_left || bbox_left > obj_player1.bbox_right))
{	
	if (geyser_timer > 0)
	{
		if (obj_player1.bbox_bottom > vertical_stop)
		{
			with (obj_player1)
			{
				state = states.jump;
				sprite_index = spr_currentplayer;
				movespeed = 8;
				vsp = Approach(vsp, -18, 1); 
			}
		}
	}
	else
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
trace($"geyser: {geyser_timer}");