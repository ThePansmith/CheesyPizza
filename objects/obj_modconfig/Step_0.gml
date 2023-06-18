if live_call() return live_result;
scr_getinput();

key_back = safe_get(obj_option, "key_back") or key_slap2;

// go back
if key_back or keyboard_check_pressed(vk_escape)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	for(var i = 0; i < array_length(options_array); i++)
	{
		var opt = options_array[i];
		if opt.type == 0
		{
			var value = opt.opts[opt.value][1];
			variable_global_set(opt.vari, value);
			
			if is_real(value)
				ini_write_real("Modded", opt.vari, value);
			else
				ini_write_string("Modded", opt.vari, value);
		}
	}
	obj_savesystem.ini_str_options = ini_close();
	gamesave_async_save_options();
	
	if instance_exists(obj_option)
		obj_option.backbuffer = 2;
	with create_transformation_tip("{u}Settings saved!/")
	{
		depth = -700;
		alarm[1] = 100;
	}
	sound_play_oneshot(sfx_back);
	instance_destroy();
}

// move
var move = key_down2 - key_up2;
if move != 0
{
	sound_play_oneshot(sfx_step);
	simuplayer.state = states.titlescreen;
	simuplayer.changed = true;
	simuplayer.angle = 0;
	
	sel += move;
	if sel >= array_length(options_array)
		sel = 1;
	
	yo = 10 * -move;
}

xo = lerp(xo, 0, 0.25);
yo = lerp(yo, 0, 0.25);
alpha = lerp(alpha, 1, 0.25);

// figure section
for(var i = 0; i < array_length(options_array); i++)
{
	var opt = options_array[i];
	if opt.type == 1
	{
		if sel == i
		{
			sel += move;
			if sel < 0
				sel = array_length(options_array) - 1;
		}
		if sel >= i
			section = i;
	}
}

// change values
var move2 = key_left2 + key_right2;
if move2 != 0
{
	xo = 10;
	
	simuplayer.changed = true;
	var opt = options_array[sel];
	
	var valueold = opt.value;
	opt.value = clamp(opt.value + move2, 0, array_length(opt.opts) - 1);
	
	if valueold != opt.value
		sound_play_oneshot(sfx_step);
}
if key_jump
{
	xo = 10;
	
	sound_play_oneshot(sfx_select);
	var opt = options_array[sel];
	opt.value = wrap(opt.value + 1, 0, array_length(opt.opts) - 1);
}
