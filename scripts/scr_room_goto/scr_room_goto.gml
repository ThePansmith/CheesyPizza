function scr_room_goto(_room)
{
	if instance_exists(obj_levelLoader)
	{
		SUGARY = false;
		MIDWAY = false;
		
		cyop_room_goto(_room);
	}
	else
	{
		SUGARY = global.leveltosave == "entryway" or global.leveltosave == "steamy" or global.leveltosave == "molasses" or global.leveltosave == "sucrose" or _room == tower_sugary or string_starts_with(room_get_name(_room), "sugarytut");
		MIDWAY = global.leveltosave == "midway";
		
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
