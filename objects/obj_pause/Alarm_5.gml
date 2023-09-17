var rm = roomtorestart;
scr_pause_stop_sounds();
global.levelattempts++;
ds_list_clear(global.saveroom);
ds_list_clear(global.baddieroom);
ds_list_clear(global.debris_list);
ds_list_clear(global.collect_list);
alarm[4] = 1;
obj_music.music = noone;
instance_destroy(obj_fadeout);

global.levelreset = false;
scr_playerreset(false, true);
global.levelreset = true;

obj_player1.targetRoom = rm;
scr_room_goto(rm);
var _d = "A";
if (rm == boss_pizzaface)
	_d = "B";
obj_player1.targetDoor = _d;
obj_player1.restartbuffer = 15;
if (rm == boss_pizzaface || rm == boss_noise || rm == boss_pepperman || rm == boss_fakepep || rm == boss_vigilante)
	global.bossintro = true;
