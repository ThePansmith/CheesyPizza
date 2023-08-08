function scr_room_goto(_room)
{
	with obj_player
		lastroom = room;
	
	if is_string(_room)
		cyop_room_goto(_room);
	else if live_enabled
		room_goto_live(_room);
	else
		room_goto(_room);
}
