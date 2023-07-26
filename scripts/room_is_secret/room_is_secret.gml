function room_is_secret(_room)
{
	return string_last_pos("_secret",  room_get_name(_room)) > 0;
}
