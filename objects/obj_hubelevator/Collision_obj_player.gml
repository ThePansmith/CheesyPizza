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
					break;
				}
			}
			
			sound_play("event:/ptt/sfx/diagopen");
			other.state = 1;
		}
	}
}
