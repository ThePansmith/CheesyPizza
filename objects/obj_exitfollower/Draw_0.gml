if (isgustavo)
{
	shader_set(shd_pal_swapper);
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(spr_peppalette,  gustavo_palette(obj_player1.paletteselect), false);
	draw_self();
	pattern_reset();
	shader_reset();
}
else if (snotty)
{
	shader_set(shd_pal_swapper);
	pal_swap_set(palette_cheeseslime, 1, false);
	draw_self();
	shader_reset();
}
else
	event_inherited();
