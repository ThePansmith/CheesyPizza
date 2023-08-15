function scr_room_goto(_room)
{
	if variable_global_exists("leveltosave")
	{
		SUGARY = global.leveltosave == "entryway" or global.leveltosave == "steamy" or global.leveltosave == "molasses" or global.leveltosave == "sucrose" or _room == tower_sugary;
		MIDWAY = global.leveltosave == "midway";
	}
	
	if is_string(_room)
		cyop_room_goto(_room);
	else
	{
		with obj_player
			lastroom = room;
		
		if MOD.OldLevels
		{
			var newRoom = asset_get_index(room_get_name(_room) + "_OLD");
			if room_exists(newRoom)
			{
				room_goto(newRoom);
				exit;
			}
		}
		
		if live_enabled
			room_goto_live(_room);
		else
			room_goto(_room);
	}
}
