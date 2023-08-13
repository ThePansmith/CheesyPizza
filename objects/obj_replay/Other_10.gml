/// @description Begin Recording

if (!directory_exists("Replay"))
	directory_create("Replay");
		
var roomName = room_get_name(room);



var roomNamePrefix = string_get_substring(roomName, 1, string_last_pos("_", roomName) - 1);

replay_file = $"{game_save_id}\\Replay\\{roomNamePrefix}_{date_time_string(date_current_datetime())}.rf";

if !ext_replay_openfile(replay_file)
{
	trace($"Unable to create replay \"{replay_file}\"");
	exit;
}
ext_replay_writeheader();
	
trace("Starting Recording");
record = true;








