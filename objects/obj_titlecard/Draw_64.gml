draw_set_alpha(1);
if start
{
	var mirror = check_modifier(MOD.Mirror);
	
	shader_set(shd_pal_swapper);
	pal_swap_set(spr_peppalette, REMIX && instance_exists(obj_player1) && obj_player1.character == "P" && obj_player1.character == "P" ? obj_player1.paletteselect : 1, false);
	if REMIX
		pattern_set_temp(global.Base_Pattern_Color, titlecard_sprite, titlecard_index, 1, 1, global.palettetexture);
	
	if mirror
		draw_sprite_ext(titlecard_sprite, titlecard_index, 960, 0, -1, 1, 0, c_white, 1);
	else
		draw_sprite(titlecard_sprite, titlecard_index, 0, 0);
	
	pal_swap_reset();
	pattern_reset();
	
	if mirror && sprite_get_width(title_sprite) != 960
		draw_sprite(title_sprite, title_index, SCREEN_WIDTH - sprite_get_width(title_sprite) - 32 + irandom_range(-1, 1), irandom_range(-1, 1));
	else
		draw_sprite(title_sprite, title_index, 32 + irandom_range(-1, 1), irandom_range(-1, 1));
}
if !instance_exists(obj_fadeout)
	draw_set_alpha(fadealpha);
else
	draw_set_alpha(obj_fadeout.fadealpha);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);
