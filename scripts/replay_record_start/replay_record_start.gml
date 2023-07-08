function replay_record_start(debug = true)
{
	var roomName = room_get_name(room);
	
	var roomNamePrefix = string_get_substring(roomName, 1, string_last_pos("_", roomName) - 1);
	
	var roomListDsMapID = replay_get_associated_rooms(roomNamePrefix);
	if (debug)
	{
		show_debug_message($"replay_record_start: Found {ds_list_size(roomListDsMapID)} associated with the prefix: \"{roomNamePrefix}\"");
		for (var i = 0; i < ds_list_size(roomListDsMapID); i++)
		{
			show_debug_message($"\"{ds_list_find_value(roomListDsMapID, i)}\"");
		}
	}
	
	
	// Todo: more of this
	
	ds_list_destroy(roomListDsMapID);
}