if (room == rank_room || room == timesuproom)
{
	if record
		event_user(1);
	if playback
		event_user(3);
}

if record && !active
	event_user(0);
	
if playback
{
	if !active && playback_start_room == noone
		event_user(2);
	trace($"Does {room} == {playback_start_room}");
	if room == playback_start_room 
		active = true;
}
	
	

