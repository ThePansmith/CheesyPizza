function scr_room_goto(_room)
{
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
