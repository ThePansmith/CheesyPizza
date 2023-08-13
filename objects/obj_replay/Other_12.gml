/// @description Begin Playback
if !ext_replay_openfile(replay_file)
{
	trace($"Unable to open replay \"{replay_file}\"");
	exit;
}

if ext_replay_readstringraw() != "RF"
{
	trace($"Replay had invalid header!");
	exit;
}

var pointer_table_size = ext_replay_readint32();
var dictionary_table_offset = ext_replay_readint32();
trace($"Replay: Found pointer table with a size of: \"{pointer_table_size}\"");
trace($"Replay: Found Dictionary Table offset: \"{dictionary_table_offset}\"");

trace("Starting Playback");
playback = true;








