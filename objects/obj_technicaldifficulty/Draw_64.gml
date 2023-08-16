if (use_static)
	draw_sprite(spr_tvstatic, static_index, 0, 0);
else
{
	screen_clear(make_color_rgb(216, 104, 160));
	shader_set(shd_pal_swapper);
	
	var cx = obj_screensizer.normal_size_fix_x;
	var cy = obj_screensizer.normal_size_fix_y;
	
	var bg = spr_technicaldifficulty_bg;
	if chara == "PN"
		bg = spr_technicaldifficulty_bgPN;
	
	draw_sprite(bg, 0, cx, cy);
	pattern_set(global.Base_Pattern_Color, sprite, 0, 1, 1, global.palettetexture);
	
	if (sprite != spr_technicaldifficulty4)
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	else
		pal_swap_set(spr_peppalette, gustavo_palette(obj_player1.paletteselect), false);
	
	if chara == "BN" or chara == "N" or chara == "SP"
		draw_sprite(sprite, 0, 0, 0);
	else
		draw_sprite(sprite, 0, cx + 300, cy + 352);
	
	pattern_reset();
	reset_shader_fix();
}
