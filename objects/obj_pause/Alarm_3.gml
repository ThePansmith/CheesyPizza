pause = false;
scr_pause_stop_sounds();
scr_pause_activate_objects();

if room == editor_entrance
{
	with obj_player
		cyop_backtohubroom = noone;
}
if instance_exists(obj_levelLoader)
{
	with obj_tv
		tv_bg.sprite = spr_gate_cyopBG;
}

var rm = room;
if !hub or (instance_exists(obj_levelLoader) && !is_string(obj_player1.backtohubroom))
{
	pause = false;
	if instance_exists(obj_levelLoader)
	{
		instance_destroy(obj_levelLoader);
		obj_player1.targetRoom = editor_entrance;
		scr_room_goto(editor_entrance);
	}
	else
	{
		obj_player1.targetRoom = Realtitlescreen;
		scr_room_goto(Realtitlescreen);
		with (obj_player1)
		{
			character = "P";
			scr_characterspr();
		}
	}
	global.leveltosave = noone;
	global.leveltorestart = noone;
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
	if instance_exists(obj_levelLoader) && is_string(obj_player1.backtohubroom)
	{
		with instance_create(0, 0, obj_backtohub_fadeout)
			fadealpha = 0.9;
		global.levelreset = true;
		cyop_load_level_internal(global.custom_hub_level);
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
		global.leveltorestart = noone;
		global.leveltosave = noone;
	}
}
if (rm == boss_pizzaface || rm == boss_noise || rm == boss_pepperman || rm == boss_fakepep || rm == boss_vigilante)
	global.bossintro = true;
