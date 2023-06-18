if (state == 3)
{
	draw_set_font(lang_get_font("creditsfont"));
	draw_set_halign(0);
	draw_set_valign(0);
	scr_draw_text_arr(16, SCREEN_HEIGHT - 48, skiptext);
}
