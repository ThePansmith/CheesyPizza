function pto_button(x, y, w, h = 72, hoverable = true, mxo = 0, myo = 0, text = "")
{
	var state = 0;
	if hoverable && point_in_rectangle(mouse_x_gui + mxo, mouse_y_gui + myo, x, y, x + w, y + h)
	{
		if mouse_check_button_released(mb_left)
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
function text_button(x, y, text = "", col = c_white, selcol = c_aqua)
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
		draw_set_colour(state == 0 ? col : selcol);
		draw_text(x, y, text);
	}
	return state;
}
function pto_textbox_init()
{
	textboxes = ds_map_create();
}
function pto_textbox_destroy()
{
	ds_map_destroy(textboxes);
}
function pto_textbox(x, y, w = 254, h = 30, maximum = 32, placeholder = "", def = "")
{
	if live_call(x, y, w, h, maximum, placeholder, def) return live_result;
	
	// setup the textbox
	var x2 = x + w, y2 = y + h;
	
	var varprefix = string(x * y);
	var struct = ds_map_find_value(textboxes, varprefix);
	
	if struct == undefined
	{
		struct = {
			str : def,
			sel : false,
			textline : 0,
			scroll : 0
		}
	}
	
	// draw the text and the textbox itself
	var subwaysurfers = surface_create(w, h);
	surface_set_target(subwaysurfers);
	
	draw_set_font(global.font_small);
	draw_set_halign(fa_left);
	draw_clear(c_white);
	draw_set_colour(c_black);
	draw_rectangle(1, 1, w - 2, h - 2, true);
	draw_set_colour(c_white);
	
	var xx = 0, yy = 0, scrollw = (h < 60 ? struct.scroll : 0), scrollh = (h >= 60 ? struct.scroll : 0);
	for(var i = 1; i <= string_length(struct.str); i++)
	{
		var char = string_char_at(struct.str, i);
		if xx + scrollw >= 0 && xx + scrollw <= w && yy + scrollh >= 0 && yy + scrollh <= h
			draw_text(xx + 6 + scrollw, yy + 6 + scrollh, char);
		
		xx += string_width(char);
		if xx >= w - 16 && h >= 60
		{
			xx = 0;
			yy += 16;
		}
	}
	if struct.str == "" && !struct.sel
		draw_text_color(xx + 6, yy + 6, placeholder, c_gray, c_gray, c_gray, c_gray, 0);
	if floor(struct.textline / 20)
	{
		draw_set_font(font0);
		draw_text(xx + scrollw + 6, yy + 4 + scrollh, "|");
	}
	
	// scrolling
	var hover = mouse_x_gui >= x && mouse_y_gui >= y && mouse_x_gui < x2 && mouse_y_gui < y2;
	if hover
	{
		if mouse_wheel_down()
			struct.scroll -= 16;
		if mouse_wheel_up()
			struct.scroll += 16;
	}
	
	// selected
	if !struct.sel
	{
		if mouse_check_button_pressed(mb_left) && hover
		{
			cooldown = 2;
			
			struct.textline = 20;
			struct.sel = true;
			keyboard_string = struct.str;
		}
	}
	if struct.sel
	{
		if cooldown <= 0
		{
			if struct.str != keyboard_string
			{
				keyboard_string = string_copy(keyboard_string, 1, maximum);
				
				xx -= string_width(struct.str) - string_width(keyboard_string);
				struct.scroll = -xx;
				struct.str = keyboard_string;
			}
		}
		else
			cooldown--;
		struct.textline = (struct.textline + 1) % 40;
		
		if mouse_check_button_pressed(mb_left) && !hover
		{
			struct.textline = 0;
			struct.sel = false;
		}
	}
	
	surface_reset_target();
	draw_surface(subwaysurfers, x, y);
	surface_free(subwaysurfers);
	
	struct.scroll = clamp(struct.scroll, -max((h >= 60 ? yy - h + 32 : xx - w + 16), 0), 0);
	
	ds_map_set(textboxes, varprefix, struct);
	return struct;
}
