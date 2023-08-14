/// @description Begin Playback
if !ptcu_replay_openfile(replay_file)
{
	trace($"Unable to open replay \"{replay_file}\"");
	event_user(3);
	exit;
}

if !ptcu_replay_readheader() // Header Check
{
	trace($"Replay had invalid header!");
	event_user(3);
	exit;
}

if !ptcu_replay_readstringdictionary()
{
	trace("Unable to read Replay's string dictionary!");
	event_user(3);
	exit;
}
trace($"replaypos: {ext_replay_tell()}");
var buffer = ext_replay_readstring();
if buffer == ""
{
	trace("Unable to read Replay's first room!");
	event_user(3);
	exit;
}

trace($"Playback started, waiting for room: \"{buffer}\"");

ptcu_replay_seek(ext_replay_tell() - string_length(buffer));
trace("Starting Playback");
playback = true;
playback_start_room = entrance_1;
active = false;