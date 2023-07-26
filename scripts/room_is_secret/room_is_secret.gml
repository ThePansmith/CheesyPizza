function room_is_secret(_room)
{
	var room_name = room_get_name(_room);
	var index = string_last_pos("_secret", room_name);
	trace($"Room to Check: \"{room_name}\" -- {index}");
	return index > 0;
}