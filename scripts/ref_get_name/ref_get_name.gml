function ref_get_name(ref)
{
	if !is_handle(ref)
		return STRING_UNDEFINED;
	
	var type = string_split(string(ref), " ")[1];
	switch type
	{
		case "sprite": return sprite_get_name(ref);
		case "object": return object_get_name(ref);
		case "room": return room_get_name(ref);
	}
}
