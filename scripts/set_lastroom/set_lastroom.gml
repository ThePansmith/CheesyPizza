function set_lastroom()
{
	with obj_player
	{
		lastroom = room;
		if instance_exists(obj_levelLoader)
			lastroom = obj_levelLoader.room_name;
	}
}
