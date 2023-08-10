if !secrettile
	exit;
	
if buffer > 0
	buffer--;

player = obj_player1;

contains_player = false;
for (var i = 0; i < array_length(tilelayer.tiles); i++)
{
	var tile = tilelayer.tiles[i];
		
	if (point_in_rectangle(player.x, player.y, tile.x, tile.y, tile.x + tile.size_x, tile.y + tile.size_y))
		contains_player = true;
		
	if contains_player
		break;
}

if (player && contains_player && player.state != states.chainsaw) or active
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
	image_alpha = Approach(image_alpha, 0, 0.05);
}
else
{
	//depth = desireddepth;
	image_alpha = Approach(image_alpha, 1, 0.05);
}
active = false;


