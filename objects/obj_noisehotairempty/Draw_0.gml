if paletteselect != 0
{
	shader_set(shd_pal_swapper);
	pal_swap_set(spr_noisepalette, paletteselect, false);
}
draw_self();
shader_reset();
