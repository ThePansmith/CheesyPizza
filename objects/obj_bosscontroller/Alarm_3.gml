with (obj_player1)
{
	global.player_damage = 0;
	global.peppino_damage = 0;
	global.bossplayerhurt = false;
	global.pistol = false;
	global.leveltorestart = -4;
	pistolanim = -4;
	targetDoor = "HUB";
	scr_room_goto(backtohubroom);
	x = backtohubstartx;
	y = backtohubstarty;
}
