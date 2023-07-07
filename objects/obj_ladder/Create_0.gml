depth = 7;
if check_sugary()
{
	visible = true;
	sprite_index = spr_ladder_sugary;
	depth = -1;
}
if global.leveltosave == "grinch" or global.leveltosave == "etb" or global.leveltosave == "ancient"
	visible = true;
if REMIX
	mask_index = spr_solid;
