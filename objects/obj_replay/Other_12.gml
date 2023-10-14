/// @description Begin Playback
trace($"[REPLAY] - Attemping to read replayfile: \"{replay_file}\"");

if !pto_replay_openfile(replay_file)
{
	trace($"[REPLAY] - Unable to open replay \"{replay_file}\"");
	event_user(3);
	exit;
}

if !pto_replay_readheader() // Header Check
{
	trace($"[REPLAY] - Replay had invalid header!");
	event_user(3);
	exit;
}

if !pto_replay_readstringdictionary()
{
	trace("[REPLAY] - Unable to read Replay's string dictionary!");
	event_user(3);
	exit;
}
trace($"[REPLAY] - replaypos: {pto_replay_tell()}");
var buffer = pto_replay_readstring();
if buffer == ""
{
	trace("[REPLAY] - Unable to read Replay's first room!");
	event_user(3);
	exit;
}

trace($"[REPLAY] - Playback started, waiting for room: \"{buffer}\"");

pto_replay_seek(pto_replay_tell() - 1);
trace($"[REPLAY] - Starting Playback in room: {room_get_name(room)}");
playback = true;
playback_start_room = room;
active = false;