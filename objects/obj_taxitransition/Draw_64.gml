if (start)
{
	draw_sprite(bgsprite, bgindex, 0, 0);
	var cy = irandom_range(-shake_mag, shake_mag);
	var img = image_index;
	if sprite_index == spr_taxitransition_pep
	{
		draw_sprite(sprite_index, 0, 0, cy);
		img = 1;
	}
	shader_set(shd_pal_swapper);
	pattern_set(global.Base_Pattern_Color, sprite_index, img, 1, 1, global.palettetexture);
	if (sprite_index != spr_taxitransition_gus)
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	else
		pal_swap_set(spr_peppalette, gustavo_palette(obj_player1.paletteselect), false);
	draw_sprite(sprite_index, img, 0, cy);
	pattern_reset();
	reset_shader_fix();
}

toggle_alphafix(true);
draw_set_alpha(fade);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);
toggle_alphafix(false);
