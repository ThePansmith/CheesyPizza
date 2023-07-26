if async_load[? "type"] == "video_start"
	scene = 0;
if async_load[? "type"] == "video_end"
	room_goto(Mainmenu);
