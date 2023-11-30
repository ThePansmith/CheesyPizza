spr_palette = noone;
paletteselect = 0;
image_speed = 0.35;
global.collected = false;
global.collectsound = 0;
depth = 11;
image_alpha = 0.35;
gotowardsplayer = false;
movespeed = 5;

if check_sugary()
	sprite_index = spr_escapecollect_ss;
if global.blockstyle == blockstyles.old
{
	if check_sugarychar()
		sprite_index = choose(spr_collectescape1SP_old, spr_collectescape2SP_old, spr_collectescape3SP_old, spr_collectescape4SP_old, spr_collectescape5SP_old);
	else
		sprite_index = choose(spr_bananacollect, spr_baconcollect, spr_eggcollect, spr_fishcollect, spr_shrimpcollect);
}
