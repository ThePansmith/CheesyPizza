if live_call() return live_result;

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
scr_getinput();
key_back = safe_get(obj_option, "key_back") or key_slap2;

// save and go back
if (key_back or keyboard_check_pressed(vk_escape)) && object_index != obj_levelsettings
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
		sel = 0;
	if sel < 0
		sel = array_length(options_array) - 1;
	
	yo = 10 * -move;
	
	if layer_exists(sequence_layer)
		layer_destroy(sequence_layer);
}

xo = lerp(xo, 0, 0.25);
yo = lerp(yo, 0, 0.25);
alpha = lerp(alpha, 1, 0.25);

// figure section
while options_array[sel].type == modconfig.section
{
	sel += move;
	if sel < 0
		sel = array_length(options_array) - 1;
}

// change values
var opt = options_array[sel];
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
				sound_play_oneshot(sfx_step);
		}
	
		if layer_exists(sequence_layer)
			layer_destroy(sequence_layer);
	}
	if key_jump
	{
		image_index = 8;
		xo = 10;
	
		sound_play_oneshot(sfx_select);
	
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

// figure out scroll
var yy = -260;
for(var i = 0; i < array_length(options_array); i++)
{
	var opt = options_array[i];
	switch opt.type
	{
		default: // normal
			yy += 20;
			break;
		
		case modconfig.section: // SECTION
			yy += 30;
			yy += 40;
			break;
	}
	
	if i == sel
		break;
}
scroll = lerp(scroll, max(yy, 0), 0.15);
