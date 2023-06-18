/// @description ping server
if pause
{
	// repeat this every 5 seconds if we're still paused.
	sendString({type: 3})
	alarm[6] = room_speed * 5;
}
