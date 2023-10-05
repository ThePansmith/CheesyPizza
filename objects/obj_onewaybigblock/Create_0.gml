if (room == rm_editor)
	exit;

event_inherited();
image_speed = 0.35;
depth = 1;
solid_inst = noone;

if instance_exists(obj_levelLoader)
	alarm[0] = 1;
else
	event_perform(ev_alarm, 0);

if global.blockstyle == blockstyles.old
	sprite_index = spr_onewaybigblock_old;

sugary = SUGARY;
if sugary
	sprite_index = spr_onewaybigblock_ss;

bo = MIDWAY;
if bo
	sprite_index = spr_onewaybigblock_bo;
