depth = 104;
with obj_player1
{
	if check_char("G")
		instance_destroy(other, false);
}
if global.blockstyle == 2
	sprite_index = spr_targetblock_old;
