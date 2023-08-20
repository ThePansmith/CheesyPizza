live_auto_call;

if scene == 0
{
	var _data = video_draw();
	var _status = _data[0];
	
	if _status == 0
	{
	    var s = _data[1];
		var w = surface_get_width(s), h = surface_get_height(s);
		var scale = 540 / h;
		
	    draw_surface_ext(s, 960 / 2 - (w * scale) / 2, 0, scale, scale, 0, c_white, 1);
	}
}
if showtext
{
	draw_set_font(lang_get_font("creditsfont"));
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	scr_draw_text_arr(16, SCREEN_HEIGHT - 48, text);
}
