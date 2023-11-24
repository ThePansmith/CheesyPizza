global.levelcomplete = true;
scr_playerreset();

global.exitrank = false;
global.leveltorestart = noone;
global.leveltosave = noone;
global.level_minutes = 0;
global.level_seconds = 0;

var _r = obj_player1.backtohubroom;
if instance_exists(obj_levelLoader)
{
	if (global.is_hubworld or global.custom_hub_level == "")
	{
		_r = editor_entrance;
		instance_destroy(obj_levelLoader);
	}
	else
		cyop_load_level_internal(global.custom_hub_level);
}

with (obj_player1)
{
	targetDoor = "HUB";
	targetRoom = _r;
	scr_room_goto(_r);
	x = backtohubstartx;
	y = backtohubstarty;
	state = states.comingoutdoor;
	sprite_index = spr_walkfront;
	image_index = 0;
	image_blend = c_white;
}
