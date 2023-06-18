if (DEBUG)
{
	if (!active)
		exit;
	draw_set_font(global.font_small);
	draw_set_halign(0);
	draw_set_valign(0);
	draw_set_alpha(0.85);
	draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
	draw_rectangle_color(0, SCREEN_HEIGHT - 24, SCREEN_WIDTH, SCREEN_HEIGHT, c_white, c_white, c_white, c_white, true)
	draw_set_alpha(1);
	var ys = SCREEN_HEIGHT - 30 - (16 * ds_list_size(text_list));
	for (var i = 0; i < ds_list_size(text_list); i++)
	{
		var t = array_get(ds_list_find_value(text_list, i), 0);
		var txt = array_get(ds_list_find_value(text_list, i), 1);
		var str = txt;
		var c = c_white;
		switch (t)
		{
			case debug_text_type.error:
				str = concat("[ERROR] ", txt);
				c = c_red;
				break;
			case debug_text_type.traced:
				str = concat("[DEBUG] ", txt);
				c = c_gray;
				break;
			case debug_text_type.command:
				str = concat("[COMMAND] ", txt);
				c = c_green;
				break;
			case debug_text_type.msg:
				str = txt;
				c = c_white;
				break;
		}
		draw_text_color(8, ys + (16 * i), str, c, c, c, c, 1);
	}
	draw_text(8, SCREEN_HEIGHT - 21, input_text);
}
