draw_set_font(lang_get_font("bigfont"));
draw_set_halign(1);
draw_set_color(c_white);
draw_set_alpha(1);

if room == editor_room or is_bossroom() or instance_exists(obj_tutorialbook)
	exit;

if global.hud == 1
	scr_tvdraw_old();
else
	scr_tvdraw();
