global.switchbuffer = 0;
image_speed = 0.35;
playerid = obj_player1.id;
image_xscale = 1;
escape = false;
depth = -5;

if obj_player1.character == "G"
	instance_destroy();

switchspr = spr_gustavo_intro;
if obj_player1.character == "PN"
	switchspr = spr_mario_intro;
