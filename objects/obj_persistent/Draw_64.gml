// fps count
if global.showfps && global.option_hud
{
	draw_set_font(SUGARY ? global.smallfont_ss : global.font_small);
	draw_set_colour(c_white);
	draw_set_align(fa_right, fa_bottom);
	
	var xx = SCREEN_WIDTH - 20;
	var yy = SCREEN_HEIGHT - 12;
	
	if global.option_timer && !(room == Realtitlescreen || room == Longintro || room == Finalintro || room == Mainmenu || room == hub_loadingscreen || room == Creditsroom || room == Johnresurrectionroom || room == rank_room || instance_exists(obj_titlecard) || instance_exists(obj_titlecard_ss) || !global.option_hud || room == characterselect)
	{
		xx -= 4;
		yy -= 18;
	}
	
	draw_text_transformed(xx, yy, string(fps), 1, 1, 0);
}
draw_set_align();
