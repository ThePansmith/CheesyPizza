live_auto_call;

if ds_map_find_value(async_load, "id") == req
{
	if ds_map_find_value(async_load, "status") == 0
	{
		str = ds_map_find_value(async_load, "result");
		var firstline = string_copy(str, 1, string_pos("\n", str) - 1);
		
		try
		{
			if real(firstline) > 3 // 3 is version
				str = string_copy(str, string_pos("\n", str) + 1, string_length(str));
			else
			{
				if PLAYTEST
				{
					menu = 2;
					state = 1;
					
					str = "This is a playtester build, blah blah, you know the drill.";
				}
				else
				{
					state = 2;
					are_you_sure = true;
				}
			}
		}
		catch (error)
		{
			trace("DISCLAIMER\nstr: ", str, "\nerror: ", error);
			str = "Server error!\nSomething went horribly wrong?\n\nYou may have the game blocked on your firewall.\nRestarting also might work, sometimes this breaks...";
		}
	}
	else
	{
		trace("DISCLAIMER\nstatus: ", async_load[? "status"]);
		str = "Server error!\nPlease check your internet connection.\n\nYou may have the game blocked on your firewall.\nRestarting also might work, sometimes this breaks...";
	}
	
	// open disclaimer
	if state == 0
	{
		state = 1;
		sound_play("event:/modded/sfx/diagopen");
	}
}
