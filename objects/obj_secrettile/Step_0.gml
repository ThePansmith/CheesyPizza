if buffer > 0
	buffer--;

player = instance_place(x, y, obj_player);
if active && !player
{
	var found = false;
	with obj_secrettile
	{
		if player
			found = true;
	}
	if !found
		active = false;
}

if (player && place_meeting(x, y, player) && player.state != states.chainsaw) or active
{
	if buffer > 0
		image_alpha = 0;
	
	if !revealed
	{
		revealed = true;
		ds_list_add(global.saveroom, id);
		
		if REMIX && buffer <= 0
		{
			sound_stop(sfx_collectpizza);
			with player
			{
				if character == "SP"
					fmod_event_instance_set_parameter(global.snd_secretwall, "state", 1, false);
			}
			fmod_event_instance_play(global.snd_secretwall);
		}
	}
	
	with obj_secrettile
	{
		if distance_to_object(other) <= 1
		{
			if !revealed
			{
				if other.buffer > 0
					image_alpha = 0;
				
				revealed = true;
				ds_list_add(global.saveroom, id);
			}
			active = true;
		}
	}
	
	depth = max(-8, desireddepth);
	image_alpha = Approach(image_alpha, 0, 0.05);
}
else
{
	depth = desireddepth;
	image_alpha = Approach(image_alpha, 1, 0.05);
}
active = false;
