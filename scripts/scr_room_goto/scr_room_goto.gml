function scr_room_goto(_room)
{
	if variable_global_exists("leveltosave")
	{
		SUGARY = global.leveltosave == "entryway" or global.leveltosave == "steamy" or global.leveltosave == "molasses" or global.leveltosave == "sucrose" or _room == tower_sugary;
		MIDWAY = global.leveltosave == "midway";
	}
	
	if is_string(_room)
		cyop_room_goto(_room);
	else if live_enabled
		room_goto_live(_room);
	else
	{
		with obj_player
			lastroom = room;
		room_goto(_room);
	}
}
