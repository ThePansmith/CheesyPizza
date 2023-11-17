live_auto_call;

// subsection
if !visible
{
	buffer = 5;
	exit;
}
if buffer > 0
{
	buffer--;
	exit;
}

// get input
scr_menu_getinput();

// save and go back
if (key_back or (sel == -1 && mouse_check_button_pressed(mb_right))) && object_index != obj_levelsettings
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	for(var i = 0; i < array_length(options_array); i++)
	{
		var opt = options_array[i];
		if opt.type == modconfig.option
		{
			var value = opt.opts[opt.value][1];
			variable_global_set(opt.vari, value);
			
			if is_real(value)
				ini_write_real("Modded", opt.vari, value);
			else
				ini_write_string("Modded", opt.vari, value);
		}
		if opt.type == modconfig.slider
		{
			var value = (opt.range[0] + (opt.range[1] - opt.range[0]) * opt.value);
			variable_global_set(opt.vari, value);
			ini_write_real("Modded", opt.vari, value);
		}
	}
	ini_write_string("Modded", "inputdisplay", global.inputdisplay);
	obj_savesystem.ini_str_options = ini_close();
	
	gamesave_async_save_options();
	if instance_exists(obj_option)
		obj_option.backbuffer = 2;
	with create_transformation_tip("{u}Settings saved!/")
	{
		depth = -700;
		alarm[1] = 100;
	}
	sound_play(sfx_back);
	instance_destroy();
}

// move
var move = key_down2 - key_up2;
if move_buffer == 0
{
	move = key_down - key_up;
	move_buffer = 5;
}
else if move != 0 && move_buffer == -1
	move_buffer = 20;

if key_down - key_up != 0
{
	if move_buffer > 0
		move_buffer--;
}
else
	move_buffer = -1;

if move != 0
{
	control_mouse = false;
	sel = max(sel, 0);
	
	sel += move;
	if sel >= array_length(options_array)
		sel = 0;
	if sel < 0
		sel = array_length(options_array) - 1;
	
	yo = 10 * -move;
	select(sel);
}

xo = lerp(xo, 0, 0.25);
yo = lerp(yo, 0, 0.25);
alpha = lerp(alpha, 1, 0.25);

if sel != -1
{
	// figure section
	while options_array[sel].type == modconfig.section
	{
		sel += move;
		if sel < 0
			sel = array_length(options_array) - 1;
	}
	
	// change values
	var opt = options_array[sel], locked = false;
	if opt.type != modconfig.section && is_callable(opt.condition)
		locked = !opt.condition()[0];

	if !locked
	{
		if opt.type == modconfig.slider
		{
			var move2 = key_left + key_right;
			if move2 != 0
			{
				image_index = 8;
				xo = 10;
		
				opt.value = clamp(opt.value + move2 * (((key_attack * 2) + 1) / 100), 0, 1);
			}
		}
		else
		{
			var move2 = key_left2 + key_right2;
			if control_mouse && mouse_check_button_pressed(mb_right)
				move2 = -1;
			
			if move2 != 0
			{
				image_index = 8;
				xo = 10;
		
				if opt.type != modconfig.button
				{
					simuplayer.changed = true;
	
					var valueold = opt.value;
					opt.value = clamp(opt.value + move2, 0, array_length(opt.opts) - 1);
	
					if valueold != opt.value
						sound_play(sfx_step);
				}
	
				if layer_exists(sequence_layer)
					layer_destroy(sequence_layer);
			}
			if key_jump or (control_mouse && mouse_check_button_pressed(mb_left))
			{
				image_index = 8;
				xo = 10;
	
				sound_play(sfx_select);
	
				if opt.type != modconfig.button
					opt.value = wrap(opt.value + 1, 0, array_length(opt.opts) - 1);
				else
				{
					if is_callable(opt.func)
						opt.func();
				}
	
				if layer_exists(sequence_layer)
					layer_destroy(sequence_layer);
			}
		}
	}
	else if key_jump
	{
		image_index = 8;
		xo = 10;
		sound_play("event:/sfx/misc/golfjingle");
	}
}

// figure out scroll
if control_mouse
{
	if mouse_wheel_down()
		scrolltarget += 40;
	if mouse_wheel_up()
		scrolltarget -= 40;
	scrolltarget = clamp(scrolltarget, 0, array_last(options_pos) - SCREEN_HEIGHT / 2);
}
else
{
	scrolltarget = max(options_pos[sel] - SCREEN_HEIGHT / 2, 0);
	sel = max(sel, 0);
	
	if mouse_check_button(mb_left)
	{
		control_mouse = true;
		sel = -1;
	}
}
scroll = lerp(scroll, scrolltarget, 0.2);

// 
event_user(0);
