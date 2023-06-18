function check_sugary()
{
	var r = room_get_name(room);
	if string_starts_with(r, "entryway_")
		return true;
}
