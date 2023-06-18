/// @description hide window top
if device_mouse_y_to_gui(0) > 32
{
	with obj_screensizer
		captionalpha = Approach(captionalpha, -.5, .5);
}
if keyboard_check(vk_control) && keyboard_check_pressed(ord("R")) && Debug
	room_restart();

// handle cursor
scr_getinput();
var _dvc = obj_inputAssigner.player_input_device[0];

if mouse_x != mx_previous or mouse_y != my_previous
{
	mx_previous = mouse_x;
	my_previous = mouse_y;
	cursor.active = false;
}
else if key_left or key_right or key_up or key_down or (gamepad_is_connected(_dvc) && (scr_checkanygamepad(_dvc) or scr_checkanystick(_dvc)))
	cursor.active = true;

if cursor.active
{
	cursor.scrollup = false;
	cursor.scrolldown = false;
	
	if gamepad_is_connected(_dvc)
	{
		if !stick
		{
			cursor.scrollup = gamepad_axis_value(_dvc, gp_axisrv) <= -global.gamepad_deadzone_press;
			cursor.scrolldown = gamepad_axis_value(_dvc, gp_axisrv) >= global.gamepad_deadzone_press;
		}
		if abs(gamepad_axis_value(_dvc, gp_axisrv)) >= global.gamepad_deadzone_press
			stick = true;
		else
			stick = false;
		
		// dpad
		cursor.x += 10 * (-gamepad_button_check(_dvc, gp_padl) + gamepad_button_check(_dvc, gp_padr));
		cursor.y += 10 * (-gamepad_button_check(_dvc, gp_padu) + gamepad_button_check(_dvc, gp_padd));
		
		// stick
		if abs(gamepad_axis_value(_dvc, gp_axislh)) >= 0.1
			cursor.x += 15 * gamepad_axis_value(_dvc, gp_axislh);
		if abs(gamepad_axis_value(_dvc, gp_axislv)) >= 0.1
			cursor.y += 15 * gamepad_axis_value(_dvc, gp_axislv);
	}
	else
	{
		cursor.x += 10 * (key_left + key_right);
		cursor.y += 10 * (-key_up + key_down);
	}
	cursor.leftclick = key_jump;
	cursor.rightclick = key_slap2;
	
	cursor.x = clamp(cursor.x, 0, 960);
	cursor.y = clamp(cursor.y, 0, 540);
}
else
{
	cursor.x = mouse_x;
	cursor.y = mouse_y;
	cursor.scrollup = mouse_wheel_up();
	cursor.scrolldown = mouse_wheel_down();
	cursor.leftclick = false;
	cursor.rightclick = false;
}
