function replay_record_start(debug = true)
{
	var roomName = room_get_name(room);
	
	var roomNamePrefix = string_get_substring(roomName, 1, string_last_pos("_", roomName) - 1);
	

	ext_replay_openfile($"{roomNamePrefix}.curb");
	ext_replay_writeheader();
	
	
	show_debug_message("Starting Recording");
	global.replayrecord = true;
}