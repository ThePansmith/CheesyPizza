/// @description online player count
if !Online exit;
if room == Mainmenu exit;

if global.Net_Online
{
	draw_set_colour(c_white);
	draw_set_align(fa_center);
	draw_set_font(global.monitorfont);
	draw_set_alpha(1);
	
	var pcount = global.Net_PlayerCount;
	draw_sprite(spr_monitor, 0, 13, display_get_gui_height() - 46);
	draw_text(30, display_get_gui_height() - 40, pcount);
}
else
	draw_sprite(spr_monitor, 1, 13, display_get_gui_height() - 46);
