function pto_button(x, y, w, h = 72, hoverable = true, mxo = 0, myo = 0, text = "")
{
	var state = 0;
	if hoverable && point_in_rectangle(cursor.x + mxo, cursor.y + myo, x, y, x + w, y + h)
	{
		if mouse_check_button_released(mb_left) or cursor.leftclick
			state = 2;
		else
			state = 1;
	}
	
	draw_sprite_stretched(spr_button, state != 0, x, y, w, h);
	if text != ""
	{
		draw_set_font(global.creditsfont);
		draw_set_colour(c_white);
		draw_set_align(fa_center);
		draw_text(lerp(x, x + w, 0.5), y + 20, text);
		draw_set_align();
	}
	
	return state;
}
function text_button(x, y, text = "")
{
	var xx = x, yy = y, ww = string_width(text), hh = string_height(text);
	if draw_get_halign() == fa_center
		xx = x - ww / 2;
	if draw_get_halign() == fa_right
		xx -= ww;
	if draw_get_valign() == fa_middle
		yy = y - yy / 2;
	if draw_get_valign() == fa_bottom
		yy -= hh;
	
	var state = 0;
	if point_in_rectangle(mouse_x_gui, mouse_y_gui, xx, yy, xx + ww, yy + hh)
	{
		if mouse_check_button_released(mb_left)
			state = 2;
		else
			state = 1;
	}
	
	if text != ""
	{
		draw_set_colour(state == 0 ? c_white : c_aqua);
		draw_text(x, y, text);
	}
	return state;
}
