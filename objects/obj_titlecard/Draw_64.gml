live_auto_call;

draw_set_alpha(1);
if start
{
	var xscale = SCREEN_WIDTH / 960, yscale = SCREEN_HEIGHT / 540;
	
	shader_set(shd_pal_swapper);
	pal_swap_set(spr_peppalette, REMIX && check_char("P") ? obj_player1.paletteselect : 1);
	if REMIX
		pattern_set_temp(global.Base_Pattern_Color, titlecard_sprite, titlecard_index, 1, 1, global.palettetexture);
	
	if MOD.Mirror
		draw_sprite_ext(titlecard_sprite, titlecard_index, SCREEN_WIDTH, 0, -xscale, yscale, 0, c_white, 1);
	else
		draw_sprite_ext(titlecard_sprite, titlecard_index, 0, 0, xscale, yscale, 0, c_white, 1);
	
	pal_swap_reset();
	pattern_reset();
	
	if MOD.Mirror && sprite_get_width(title_sprite) != 960
		draw_sprite_ext(title_sprite, title_index, SCREEN_WIDTH - ((sprite_get_width(title_sprite) - 32) * xscale) + irandom_range(-1, 1), irandom_range(-1, 1), xscale, yscale, 0, c_white, 1);
	else
		draw_sprite_ext(title_sprite, title_index, 32 * xscale + irandom_range(-1, 1), irandom_range(-1, 1), xscale, yscale, 0, c_white, 1);
}

toggle_alphafix(true);

if !instance_exists(obj_fadeout)
	draw_set_alpha(fadealpha);
else
	draw_set_alpha(obj_fadeout.fadealpha);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);

toggle_alphafix(false);
