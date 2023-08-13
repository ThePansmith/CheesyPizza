/// @description Begin Recording

if (!directory_exists("replays"))
	directory_create("replays");
		
var roomName = room_get_name(room);



var date = date_current_datetime();

var roomNamePrefix = string_get_substring(roomName, 1, string_last_pos("_", roomName) - 1);
var dateTimeString = date_time_string(date);

for (var i = 1; i <= string_length(dateTimeString); i++)
{
	// RX: I fucking hate gamemaker sometimes oh my fucking god.
	if (string_char_at(dateTimeString, i) == ":" || string_char_at(dateTimeString, i) == " ")
	{
		dateTimeString = string_delete(dateTimeString, i, 1);
		dateTimeString = string_insert("_", dateTimeString, i);
	}
}

dateTimeString = $"{date_get_year(date)}_{date_get_month(date)}_{date_get_day(date)}_{dateTimeString}";
replay_file = $"{game_save_id}replays\\{roomNamePrefix}__{dateTimeString}.rf";

if !ptcu_replay_openfile(replay_file)
{
	trace($"Unable to create replay \"{replay_file}\"");
	event_user(1);
	exit;
}
ext_replay_writeheader();
	
trace("Starting Recording");
record = true;
active = true;







