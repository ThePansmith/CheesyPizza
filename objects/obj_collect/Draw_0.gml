if spr_palette != noone
{
	shader_set(shd_pal_swapper);
	pal_swap_set(spr_palette, paletteselect, false);
	draw_self_safe();
	pal_swap_reset();
}
else
	draw_self_safe();
