if (sprite_index != spr_newclothes)
{
	draw_sprite(sprite_index, image_index, x, y);
	draw_sprite(achievement_spr, achievement_index, x, y - 80);
}
else
{
	shader_set(shd_pal_swapper);
	if (texture != noone)
		pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, texture);
	pal_swap_set(spr_peppalette, paletteselect, false);
	draw_sprite(sprite_index, image_index, x, y);
	if (texture != noone)
        pattern_reset();
	reset_shader_fix();
}
