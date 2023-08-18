if ds_map_find_value(async_load, "id") == req
{
	if ds_map_find_value(async_load, "status") == 0
	{
		str = ds_map_find_value(async_load, "result");
		var firstline = string_copy(str, 1, string_pos("\n", str) - 1);
		
		try
		{
			if real(firstline) != 3
				str = string_copy(str, string_pos("\n", str) + 1, string_length(str));
			else
			{
				state = 2;
				are_you_sure = true;
			}
		}
		catch (error)
		{
			trace("DISCLAIMER\nstr: ", str, "\nerror: ", error);
			str = "Server error!\nSomething went horribly wrong???";
		}
	}
	else
	{
		trace("DISCLAIMER\nstatus: ", async_load[? "status"]);
		str = "Server error!\nPlease check your internet connection.";
	}
	
	// open disclaimer
	if state == 0
	{
		state = 1;
		sound_play("event:/modded/sfx/diagopen");
	}
}
