function replay_record_end()
{
	show_debug_message("Ending Recording");
	global.replayrecord = false;
	ext_replay_closefile();
}