if !secrettile
	exit;
if buffer > 0
	buffer--;

player = noone;
for (var i = 0; i < array_length(tilelayer.tiles); i++)
{
	var tile = tilelayer.tiles[i];
	with obj_player
	{
		if point_in_rectangle(x, y, tile.x, tile.y, tile.x + 32, tile.y + 32)
		{
			other.player = id;
			break;
		}
	}
}

if (player && player.state != states.chainsaw && player.state != states.backtohub) or active
{
	if buffer > 0
		image_alpha = 0;
	
	if !revealed
	{
		revealed = true;
		add_saveroom();
		
		if REMIX && buffer <= 0
		{
			sound_stop(sfx_collectpizza);
			with player
				fmod_event_instance_set_parameter(global.snd_secretwall, "state", character == "SP", false);
			fmod_event_instance_play(global.snd_secretwall);
		}
	}
	
	/*
	with obj_secrettile
	{
		if distance_to_object(other) <= 1
		{
			var found = false;
			with obj_secrettile
			{
				if player
					found = true;
			}
			if found
			{
				if !revealed
				{
					if other.buffer > 0
						image_alpha = 0;
				
					revealed = true;
					add_saveroom();
				}
				active = true;
			}
		}
	}
	*/
	
	
	//depth = max(-8, desireddepth);
	image_alpha = Approach(image_alpha, 0, 0.1);
}
else if !(player && player.state == states.chainsaw)
{
	//depth = desireddepth;
	image_alpha = Approach(image_alpha, 1, 0.1);
}
active = false;
