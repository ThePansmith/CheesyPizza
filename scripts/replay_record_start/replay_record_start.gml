function replay_record_start(debug = true)
{
	if (!directory_exists("Replay"))
		directory_create("Replay");
		
	var roomName = room_get_name(room);
	
	var roomNamePrefix = string_get_substring(roomName, 1, string_last_pos("_", roomName) - 1);
	
	

	ext_replay_openfile($"{roomNamePrefix}.curb");
	ext_replay_writeheader();
	
	
	trace("Starting Recording");
	global.replayrecord = true;
}