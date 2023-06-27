live_auto_call;

defaultkeys = function()
{
	array_push(inputkeys, {x : 0, y : 0, key : "Z", keyw : 1, keyh : 1});
	array_push(inputkeys, {x : 1, y : 0, key : "UP", keyw : 1, keyh : 1});
	array_push(inputkeys, {x : 2, y : 0, key : "X", keyw : 1, keyh : 1});
	array_push(inputkeys, {x : 0, y : 1, key : "LEFT", keyw : 1, keyh : 1});
	array_push(inputkeys, {x : 1, y : 1, key : "DOWN", keyw : 1, keyh : 1});
	array_push(inputkeys, {x : 2, y : 1, key : "RIGHT", keyw : 1, keyh : 1});
	array_push(inputkeys, {x : 0, y : 2, key : "SHIFT", keyw : 2, keyh : 1});
	array_push(inputkeys, {x : 2, y : 2, key : "C", keyw : 1, keyh : 1});
	array_push(inputkeys, {x : 3, y : 2, key : "A", keyw : 1.5, keyh : 1});
	array_push(inputkeys, {x : 3, y : 1, key : "V", keyw : 1.5, keyh : 1});
	
	keysep = 4;
	keysize = 48;
	
	pos[0] = keysep;
	pos[1] = (540 - keysize * 3) - keysep * 3;
	
	pressedcol = merge_colour(c_blue, c_aqua, 0.75);
}
savekeys = function()
{
	file = file_text_open_write("inputdisplay");
	
	file_text_write_real(file, x);
	file_text_writeln(file);
	file_text_write_real(file, y);
	file_text_writeln(file);
	file_text_write_real(file, keysep);
	file_text_writeln(file);
	file_text_write_real(file, keysize);
	file_text_writeln(file);
	file_text_write_real(file, pressedcol);
	file_text_writeln(file);
	file_text_write_string(file, json_stringify(inputkeys));
	
	file_text_close(file);
}
loadkeys = function()
{
	file = file_text_open_read("inputdisplay");
	
	pos[0] = file_text_read_real(file);
	file_text_readln(file);
	pos[1] = file_text_read_real(file);
	file_text_readln(file);
	keysep = file_text_read_real(file);
	file_text_readln(file);
	keysize = file_text_read_real(file);
	file_text_readln(file);
	pressedcol = file_text_read_real(file);
	file_text_readln(file);
	inputkeys = json_parse(file_text_read_string(file));
	
	file_text_close(file);
}
draw_inputdisplay_key = function(xx, yy, keycode, width, height = width)
{
	/*
	var drawer = keycode;
	var pressed = false;
	switch keycode
	{
		default: pressed = keyboard_check(scr_keyfromname(keycode)); break;
		
		case "SHIFT": pressed = key_attack; break;
		case "Z": pressed = key_jump2; break;
		case "X": pressed = key_slap; break;
		case "C": pressed = key_taunt; break;
		case "A": pressed = key_shoot; break;
		case "V": pressed = key_chainsaw; break;
		case "UP": drawer = 0; pressed = key_up; break;
		case "DOWN": drawer = 180; pressed = key_down; break;
		case "LEFT": drawer = 90; pressed = -key_left; break;
		case "RIGHT": drawer = 270; pressed = key_right; break;
	}
	
	// square
	draw_set_alpha(image_alpha);
	draw_set_colour(pressed ? pressedcol : c_ltgray);
	draw_roundrect(xx, yy, xx + width - 1, yy + height - 1, false);
	
	draw_set_colour(c_black);
	draw_roundrect(xx, yy, xx + width - 1, yy + height - 1, true);
	
	// text
	if is_string(drawer)
	{
		draw_set_colour(c_white);
		draw_set_font(global.bigfont);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
		var siz = 1;
		var _stringwidth = string_width(drawer);
		
		siz = (width - 16) / _stringwidth;
		if siz > 1
			siz = max(floor(siz / 2), 1);
	
		if siz != 1
			draw_text_transformed(floor(xx + width / 2), floor(yy + height / 2), drawer, siz, siz, 0);
		else
			draw_text(floor(xx + width / 2), floor(yy + height / 2), drawer);
	
		draw_set_valign(fa_top);
	}
	else
	{
		siz = (width - 16) / 28;
		if siz > 1
			siz = max(floor(siz / 2), 1);
		draw_sprite_ext(spr_palettearrow, 0, floor(xx + width / 2), floor(yy + height / 2), siz, siz, drawer, c_white, image_alpha);
	}
	draw_set_alpha(1);
	*/
	
	var drawer = keycode, pressed = false, xo = 0, yo = 0;
	switch keycode
	{
		default: pressed = keyboard_check(scr_keyfromname(keycode)); break;
		
		case "SHIFT": 
			drawer = 6; 
			pressed = key_attack;
			xo = -1;
			yo = -5;
			break;
		
		case "Z": 
			drawer = 4; 
			pressed = key_jump2;
			yo = -6;
			xo = -1;
			break;
		case "X": 
			drawer = 5;
			pressed = key_slap;
			xo = -6;
			yo = -6;
			break;
		case "C": 
			drawer = 7; 
			pressed = key_taunt;
			xo = -2;
			break;
		case "A": 
			drawer = 9; 
			pressed = key_shoot;
			yo = -6;
			break;
		case "V": 
			drawer = 10; 
			pressed = key_chainsaw; 
			yo = -5;
			break;
		
		case "UP": 
			drawer = 0;
			pressed = key_up;
			xo = -2;
			yo = 2;
			break;
		case "DOWN": 
			drawer = 1; 
			pressed = key_down;
			xo = -2;
			yo = -2;
			break;
		case "LEFT": 
			drawer = 3; 
			pressed = -key_left; 
			xo = 2;
			yo = -2;
			break;
		case "RIGHT": 
			drawer = 2;
			pressed = key_right;
			xo = -2;
			yo = -2;
			break;
	}
	
	// square
	draw_set_alpha(image_alpha);
	draw_set_colour(pressed ? pressedcol : c_ltgray);
	draw_roundrect(xx, yy, xx + width - 1, yy + height - 1, false);
	
	draw_set_colour(c_black);
	draw_roundrect(xx, yy, xx + width - 1, yy + height - 1, true);
	
	// text
	if is_string(drawer)
	{
		draw_set_colour(c_white);
		draw_set_font(global.bigfont);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
		var siz = 1;
		var _stringwidth = string_width(drawer);
		
		siz = (width - 16) / _stringwidth;
		if siz > 1
			siz = max(floor(siz / 2), 1);
	
		if siz != 1
			draw_text_transformed(floor(xx + width / 2), floor(yy + height / 2), drawer, siz, siz, 0);
		else
			draw_text(floor(xx + width / 2), floor(yy + height / 2), drawer);
	
		draw_set_valign(fa_top);
	}
	else
	{
		siz = (width - 16) / 32;
		if siz > 1
			siz = max(floor(siz / 2), 1);
		draw_sprite_ext(spr_controlicons, drawer, xo + floor(xx + width / 2), yo + floor(yy + height / 2), siz, siz, 0, c_white, image_alpha);
	}
	draw_set_alpha(1);
}

clicktimer = 0;
drag = false;
dragoffset = [0, 0];

depth = -10000;

inputkeys = [];
pos = [0, 0];

if !file_exists("inputdisplay")
{
	defaultkeys();
	savekeys();
}
else
{
	loadkeys();
	if pos[0] < 0 or pos[1] < 0 or !is_array(inputkeys) or array_length(inputkeys) == 0
	{
		defaultkeys();
		savekeys();
	}
}
scr_initinput();
