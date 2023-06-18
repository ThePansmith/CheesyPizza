draw_set_font(global.smallfont);
draw_set_halign(2);
draw_set_valign(2);
var a = 0;
with (obj_mainmenu)
	a = extrauialpha;
draw_text_color(SCREEN_WIDTH - 8, SCREEN_HEIGHT - 8, lang_get_value("game_version"), c_white, c_white, c_white, c_white, a);
