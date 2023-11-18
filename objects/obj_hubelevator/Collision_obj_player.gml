if state == 0
{
	with other
	{
		if key_up && grounded && (state == states.normal or state == states.ratmount)
		{
			for(var i = 0; i < array_length(other.hub_array); i++)
			{
				if room == other.hub_array[i][1]
				{
					other.sel = i;
					other.offload_arr = other.hub_array[i][3];
					break;
				}
			}
			
			sound_play("event:/modded/sfx/diagopen");
			
			state = states.actor;
			sprite_index = spr_lookdoor;
			image_index = 0;
			if isgustavo
				sprite_index = spr_ratmountenterdoor;
			hsp = 0;
			vsp = 50;
			
			if REMIX
			{
				smoothx = x - (other.x + 50);
				x = other.x + 50;
			}
			
			other.state = 1;
			other.buffer = 5;
		}
	}
}
