if (room == rank_room || room == timesuproom)
{
	if record
		event_user(1);
	if playback
		event_user(3);
}

if record && replay_file == STRING_UNDEFINED && global.leveltosave != -4
	event_user(0);
