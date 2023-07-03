live_auto_call;
if instance_exists(obj_option) && obj_option.menus[obj_option.menu].menu_id != menus.inputdisplay
	exit;

scr_getinput(true);

if global.inputdisplay
{
	var _camx = camera_get_view_x(view_camera[0]);
	var _camy = camera_get_view_y(view_camera[0]);
	
	x = pos[0];
	y = pos[1];
	
	// draw it
	var xx = 0, yy = 0, maxx = 0, maxy = 0;
	for(var i = 0; i < array_length(inputkeys); i++)
	{
		var k = inputkeys[i];
		
		xx = k.x * keysize + k.x * keysep;
		yy = k.y * keysize + k.y * keysep;
		
		var ughx = xx + keysize * k.keyw + 2;
		var ughy = yy + keysize * k.keyh;
		
		if maxx < ughx
			maxx = ughx;
		if maxy < ughy
			maxy = ughy;
		
		draw_inputdisplay_key(x + xx, y + yy, k.key, k.keyw * keysize + (k.keyw - 1) * keysep, k.keyh * keysize + (k.keyh - 1) * keysep);
	}
	
	// dont block the view
	var left = x, right = x + maxx, top = y, bottom = y + maxy;
	
	image_alpha = keyalpha;
	if instance_exists(obj_player1)
	{
		var px = obj_player1.x - _camx, py = obj_player1.y - _camy;
		if px >= left - 25 && px <= right + 25
		&& py >= top - 50 && py <= bottom + 25
			image_alpha = min(keyalpha, 0.25);
	}
	
	// customize
	var mx = device_mouse_x_to_gui(0), my = device_mouse_y_to_gui(0);
	if mx >= left && mx <= right && my >= top && my <= bottom
	{
		if mouse_check_button_pressed(mb_left) && !drag
		{
			drag = true;
			dragoffset = [pos[0] - mx, pos[1] - my];
		}
		
		draw_set_colour(drag ? c_red : merge_colour(c_blue, c_aqua, 0.75));
		draw_rectangle(left, top, right, bottom, true);
	}
	if !mouse_check_button(mb_left)
		drag = false;
	
	if drag
	{
		pos[0] = mx + dragoffset[0];
		pos[1] = my + dragoffset[1];
		
		pos[0] = clamp(pos[0], keysep, 960 - maxx - keysep);
		pos[1] = clamp(pos[1], keysep, 540 - maxy - keysep);
		
		with obj_shell
			WC_drag_inst = noone;
	}
}
