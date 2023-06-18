if (alpha > 0)
{
	var text = concat(palettetitle, "\n", palettedesc);
	draw_set_font(lang_get_font("creditsfont"));
	draw_set_halign(1);
	draw_set_valign(2);
	draw_text_color(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 16, text, c_white, c_white, c_white, c_white, alpha);
}
