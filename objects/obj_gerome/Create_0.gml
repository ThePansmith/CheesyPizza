event_inherited();
image_speed = 0.35;
if check_sugary()
	sprite_index = spr_gerome_idle_ss
else
	sprite_index = choose(spr_gerome_idle1, spr_gerome_idle2, spr_gerome_idle3);
image_xscale = 1;
grabbed = false;
hsp = 0;
vsp = 0;
grav = 0.5;
flash = true;
unpickable = false;
hp = 0;
grounded = true;
state = 0; // not an enum
playerid = obj_player1;
mask_index = spr_player_mask;
depth = -5;
platformid = -4;
hsp_carry = 0;
vsp_carry = 0;
thrown = false;
