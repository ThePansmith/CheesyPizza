if (sprite_index != spr_idle)
{
	shader_set(shd_pal_swapper);
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	draw_self_safe();
	pattern_reset();
	shader_reset();
}
else
{
	draw_self_safe();
	if !sugary
	{
		if !global.lap
			draw_sprite(spr_lap2warning, 1, x, y + Wave(-5, 5, 0.5, 5));
		else if MOD.Lap3 && global.laps == 1
			draw_sprite(spr_lap3warning, 1, x, y + Wave(-5, 5, 0.5, 5));
	}
}
