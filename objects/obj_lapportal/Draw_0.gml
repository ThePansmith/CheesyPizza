if (sprite_index != spr_idle && sprite_index != spr_outline)
{
	shader_set(shd_pal_swapper);
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	draw_self_safe();
	pattern_reset();
	shader_reset();
}
else if (sprite_index == spr_outline)
	draw_sprite_ext(sprite_index, image_index, x, y + Wave(-2, 2, 1, 5), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
else
{
	draw_self_safe();
	if !sugary
	{
		if !global.lap
			draw_sprite(spr_lap2warning, 1, x, y + Wave(-5, 5, 0.5, 5));
		else if global.lapmode == lapmode.laphell
		{
			var spr_lap3warning = spr_ough_im_getting_egg_like;
			if global.laps == 1
				draw_sprite(spr_lap3warning, check_char("N") ? 1 : 0, x, y + Wave(-5, 5, 0.5, 5));
			if global.laps == 2
				draw_sprite(spr_lap3warning, 2, x, y + Wave(-5, 5, 0.5, 5));
		}
	}
}
