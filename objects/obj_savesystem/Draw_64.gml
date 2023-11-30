if showicon
{
	var a = clamp(icon_alpha, 0, 1);
	draw_sprite_ext(check_sugary() ? spr_collectslice_ss : spr_pizzaslice, icon_index, SCREEN_WIDTH - 64, SCREEN_HEIGHT - 60, 1, 1, 0, c_white, a);
}
