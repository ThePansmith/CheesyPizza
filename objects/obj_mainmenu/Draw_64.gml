if (state == states.titlescreen || (state == states.transition && dark))
	draw_sprite(spr_menudark, 0, 0, 0);
if (state == states.bombdelete)
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, 0, 0, 0, 0, false);
	draw_set_alpha(1);
	draw_set_font(lang_get_font("bigfont"));
	draw_set_halign(1);
	draw_set_valign(1);
	var _str = embed_value_string(lang_get_value("menu_delete"), [string(currentselect + 1)]);
	draw_text_color(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - 30, _str, c_red, c_red, c_red, c_red, 1);
	var w = string_width(_str) / 2;
	draw_sprite(spr_menu_filedelete, index, (SCREEN_WIDTH / 2) + w + 70, SCREEN_HEIGHT / 2);
	draw_sprite(spr_menu_filedelete, index, (SCREEN_WIDTH / 2) - w - 70, SCREEN_HEIGHT / 2);
	var c1 = (deleteselect == 0) ? c_white : c_gray;
	var c2 = (deleteselect == 1) ? c_white : c_gray;
	draw_text_color((SCREEN_WIDTH / 2) - 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_yes"), c1, c1, c1, c1, 1);
	draw_text_color((SCREEN_WIDTH / 2) + 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_no"), c2, c2, c2, c2, 1);
}
else if (state == states.finale)
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, 0, 0, 0, 0, false);
	draw_set_alpha(1);
	draw_set_font(lang_get_font("bigfont"));
	draw_set_halign(1);
	draw_set_valign(1);
	draw_sprite(spr_menu_byebye, index, (SCREEN_WIDTH / 2) + 210, SCREEN_HEIGHT / 2);
	draw_sprite(spr_menu_byebye, index, (SCREEN_WIDTH / 2) - 210, SCREEN_HEIGHT / 2);
	draw_text_color(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - 30, lang_get_value("menu_exit"), c_white, c_white, c_white, c_white, 1);
	c1 = (exitselect == 0) ? c_white : c_gray;
	c2 = (exitselect == 1) ? c_white : c_gray;
	draw_text_color((SCREEN_WIDTH / 2) - 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_yes"), c1, c1, c1, c1, 1);
	draw_text_color((SCREEN_WIDTH / 2) + 100, (SCREEN_HEIGHT / 2) + 30, lang_get_value("option_no"), c2, c2, c2, c2, 1);
}

// 
if GM_build_type != "run" && !code_is_compiled()
{
	draw_set_font(global.bigfont);
	draw_set_align(fa_center);
	draw_set_color(c_red);
	draw_text(960 / 2, 32, "COMPILED IN VM. DO NOT SHARE!");
	draw_set_align();
}
if Debug
{
	draw_set_font(global.font_small);
	draw_set_align(fa_center);
	draw_set_color(c_red);
	draw_text(960 / 2, 32, $"Debug build - {date_date_string(GM_build_date)} {date_time_string(GM_build_date)}");
	draw_set_align();
}
draw_set_colour(c_white);
