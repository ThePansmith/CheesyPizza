function room_is_secret(_room)
{
	return string_last_pos("_secret",  room_get_name(_room)) > 0 or room == tower_soundtest or (room == _room && instance_exists(obj_ghostcollectibles));
}
