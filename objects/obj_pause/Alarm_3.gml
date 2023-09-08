pause = false;
scr_pause_stop_sounds();
scr_pause_activate_objects();

var rm = room;
if !hub
{
	instance_destroy(obj_levelLoader);
		
	pause = false;
	obj_player1.targetRoom = Realtitlescreen;
	scr_room_goto(Realtitlescreen);
	with (obj_player1)
	{
		character = "P";
		scr_characterspr();
	}
	global.leveltosave = -4;
	global.leveltorestart = -4;
	scr_playerreset();
	alarm[0] = 2;
	obj_player1.state = states.titlescreen;
	obj_player1.targetDoor = "A";
	if (instance_exists(obj_player2))
		obj_player2.targetDoor = "A";
	global.cowboyhat = false;
	global.coop = false;
}
else
{
	if instance_exists(obj_levelLoader)
	{
		with instance_create(0, 0, obj_backtohub_fadeout)
			fadealpha = 0.9;
		global.levelreset = true;
		cyop_load_level(global.custom_hub_level);
	}
	else
	{
		instance_destroy(obj_levelLoader);
		
		with (instance_create(0, 0, obj_backtohub_fadeout))
			fadealpha = 0.9;
		scr_playerreset();
		global.levelreset = true;
		obj_player1.targetDoor = "HUB";
		if (instance_exists(obj_player2))
			obj_player2.targetDoor = "HUB";
		global.leveltorestart = -4;
		global.leveltosave = -4;
	}
}
if (rm == boss_pizzaface || rm == boss_noise || rm == boss_pepperman || rm == boss_fakepep || rm == boss_vigilante)
	global.bossintro = true;
