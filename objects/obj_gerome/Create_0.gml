event_inherited();
image_speed = 0.35;
if SUGARY
	sprite_index = spr_gerome_idle_ss;
else
	sprite_index = choose(spr_gerome_idle1, spr_gerome_idle2, spr_gerome_idle3);
image_xscale = 1;
grabbed = false;
init_collision();
flash = true;
unpickable = false;
hp = 0;
state = 0; // not an enum
playerid = obj_player1;
mask_index = spr_player_mask;
depth = -5;
thrown = false;
