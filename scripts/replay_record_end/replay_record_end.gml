function replay_record_end()
{
	ext_replay_writestringdictionary();
	
	show_debug_message("Ending Recording");
	global.replayrecord = false;
	ext_replay_closefile();
}