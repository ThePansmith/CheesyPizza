if (dark)
	draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
else
	scr_draw_pause_image();
draw_set_halign(2);
draw_set_valign(2);
draw_set_font(lang_get_font("creditsfont"));
draw_text_color(SCREEN_WIDTH - 16, SCREEN_HEIGHT - 16, lang_get_value("menu_loading"), c_white, c_white, c_white, c_white, 1);
