/// @description Begin Recording

if (!directory_exists("replays"))
	directory_create("replays");
		
var roomName = room_get_name(room);



var date = date_current_datetime();

var roomNamePrefix = string_get_substring(roomName, 1, string_last_pos("_", roomName) - 1);


replay_file = $"{game_save_id}replays\\{roomNamePrefix}__{DATE_TIME_NOW}.rf";

if !ptcu_replay_openfile(replay_file)
{
	trace($"Unable to create replay \"{replay_file}\"");
	event_user(1);
	exit;
}
ptcu_replay_writeheader();

trace("Starting Recording");
record = true;
active = true;







