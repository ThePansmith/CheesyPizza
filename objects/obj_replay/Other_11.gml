/// @description End Recording
ptcu_replay_writestringdictionary();
	
show_debug_message("Ending Recording");
record = false;
replay_file = STRING_UNDEFINED;
ptcu_replay_closefile();
active = false;








