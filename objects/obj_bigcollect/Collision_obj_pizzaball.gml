if (obj_player1.character == "V")
	global.playerhealth = clamp(global.playerhealth + 10, 0, 100);
global.heattime = 60;
with (obj_camera)
	healthshaketime = 60;
if obj_player1.character == "SP"
	scr_sound_multiple("event:/sfx/misc/collectSP", x, y);
else
	fmod_event_one_shot("event:/sfx/misc/collectpizza");
if object_index == obj_escapecollectbig
	fmod_event_one_shot_3d("event:/sfx/misc/bellcollectbig", x, y);
instance_destroy();
global.combotime = 60;
var val = heat_calculate(value);
global.collect += val;
create_collect(x, y, sprite_index, val);
with (instance_create(x + 16, y, obj_smallnumber))
	number = string(val);
tv_do_expression(spr_tv_exprcollect);
