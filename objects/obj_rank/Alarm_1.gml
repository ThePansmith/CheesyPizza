global.levelcomplete = true;
scr_playerreset();
with (obj_player1)
{
	targetDoor = "HUB";
	targetRoom = backtohubroom;
	scr_room_goto(backtohubroom);
	x = backtohubstartx;
	y = backtohubstarty;
	state = states.comingoutdoor;
	sprite_index = spr_walkfront;
	image_index = 0;
	image_blend = c_white;
}
global.exitrank = false;
global.leveltorestart = noone;
global.leveltosave = noone;
global.level_minutes = 0;
global.level_seconds = 0;
