spr_palette = noone;
paletteselect = 0;
image_speed = 0.35;
global.collected = false;
global.collectsound = 0;
depth = 11;
image_alpha = 0.35;
gotowardsplayer = false;
movespeed = 5;

if global.blockstyle == blockstyles.old
    sprite_index = choose(spr_bananacollect, spr_baconcollect, spr_eggcollect, spr_fishcollect, spr_shrimpcollect);
if SUGARY
	sprite_index = spr_escapecollect_ss;
