function scr_room_goto(_room)
{
	with obj_player
		lastroom = room;
	
	if live_enabled
		room_goto_live(_room);
	else
		room_goto(_room);
}
