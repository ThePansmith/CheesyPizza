live_auto_call;

enum MENUS
{
	main,
	audio,
	video,
	window,
	resolution,
	unused_1, // 5, related to video.
	game,
	controls,
	controller,
	keyboard,
	deadzone,
	unused_3, // 11, related to controls.
	
	// pto
	inputdisplay,
	lapping
}
enum anchor
{
	center,
	left
}

depth = -99;
scr_init_input();
slidecount = 0;
slidebuffer = 0;
bg_alpha = [1, 0, 0, 0, 0, 0];
bg_x = 0;
bg_y = 0;
menus = [];
lastmenu = 0;
menu = 0;
optionselected = 0;
backbuffer = 0;

tooltip = "";
tooltip_alpha = 0;
scroll = 0;

pause_icons = array_create(0);
scr_pauseicon_add(spr_pauseicons, 4);
scr_pauseicon_add(spr_pauseicons, 5);
scr_pauseicon_add(spr_pauseicons, 6);
scr_pauseicon_add(spr_pauseicons, 7, 8, 8);
scr_pauseicon_add(spr_pauseicons, 9, 0, 16);

#region categories

var categories = create_menu_fixed(MENUS.main, anchor.center, 0, 48, -4);
add_option_press(categories, 0, "option_audio", function()
{
	menu_goto(MENUS.audio);
});
add_option_press(categories, 1, "option_video", function()
{
	menu_goto(MENUS.video);
});
add_option_press(categories, 2, "option_game", function()
{
	menu_goto(MENUS.game);
});
add_option_press(categories, 3, "option_controls", function()
{
	/*
	obj_option.key_jump = false;
	instance_create_unique(0, 0, obj_keyconfig);
	*/
	menu_goto(MENUS.controls);
});

if !global.goodmode
add_option_press(categories, 4, "option_modded", function()
{
	obj_option.key_jump = false;
	instance_create_unique(0, 0, obj_modconfig);
});
array_push(menus, categories);

#endregion
#region audio menu

var audio_menu = create_menu_fixed(MENUS.audio, anchor.left, 150, 40);
add_option_press(audio_menu, 0, "option_back", function()
{
	menu_goto(MENUS.main);
	fmod_event_instance_stop(global.snd_slidermaster, true);
	fmod_event_instance_stop(global.snd_slidermusic, true);
	fmod_event_instance_stop(global.snd_slidersfx, true);
});

add_option_slide(audio_menu, 1, "option_master", function(val)
{
	global.option_master_volume = val / 100;
	set_audio_config(false);
}, function(val)
{
	global.option_master_volume = val / 100;
	set_audio_config();
}, "event:/sfx/ui/slidersfxmaster").value = global.option_master_volume * 100;

add_option_slide(audio_menu, 2, "option_music", function(val)
{
	global.option_music_volume = val / 100;
	set_audio_config(false);
}, function(val)
{
	global.option_music_volume = val / 100;
	set_audio_config();
}, "event:/sfx/ui/slidermusic").value = global.option_music_volume * 100;

add_option_slide(audio_menu, 3, "option_sfx", function(val)
{
	global.option_sfx_volume = val / 100;
	set_audio_config(false);
}, function(val)
{
	global.option_sfx_volume = val / 100;
	set_audio_config();
}, "event:/sfx/ui/slidersfx").value = global.option_sfx_volume * 100;

add_option_toggle(audio_menu, 4, "option_unfocus", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "unfocus_mute", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_unfocus_mute = val;
}).value = global.option_unfocus_mute;

array_push(menus, audio_menu);

#endregion
#region video menu

var video_menu = create_menu_fixed(MENUS.video, anchor.left, 150, 40);
add_option_press(video_menu, 0, "option_back", function()
{
	menu_goto(MENUS.main);
});
add_option_press(video_menu, 1, "option_window_mode", function()
{
	menu_goto(MENUS.window);
});

var res = [];
for (var i = 0; i < array_length(global.resolutions[obj_screensizer.aspect_ratio]); i++)
{
	var b = global.resolutions[obj_screensizer.aspect_ratio][i];
	array_push(res, create_option_value(concat(b[0], "X", b[1]), i, false));
}

add_option_multiple(video_menu, 2, "option_resolution", res, function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "resolution", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_resolution = val;
	screen_apply_size();
}).value = global.option_resolution;

add_option_toggle(video_menu, 3, "option_vsync", function(val)
{
    ini_open_from_string(obj_savesystem.ini_str_options);
    ini_write_real("Option", "vsync", val);
    obj_savesystem.ini_str_options = ini_close();
    global.option_vsync = val;
    screen_apply_vsync();
}).value = global.option_vsync;

add_option_toggle(video_menu, 4, "option_texfilter", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "texfilter", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_texfilter = val;
}
).value = global.option_texfilter;

add_option_toggle(video_menu, 5, "option_hud", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "hud", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_hud = val;
}).value = global.option_hud;

array_push(menus, video_menu);

#endregion
#region window menu

var window_menu = create_menu_fixed(MENUS.window, anchor.left, 150, 40, MENUS.video);
add_option_press(window_menu, 0, "option_back", function() {
    menu_goto(MENUS.video);
});
add_option_press(window_menu, 1, "option_windowed", function() {
    screen_option_apply_fullscreen(0);
	screen_apply_size_delayed();
});
add_option_press(window_menu, 2, "option_fullscreen", function() {
    screen_option_apply_fullscreen(1);
	screen_apply_size_delayed();
});

if global.gameframe_enabled
{
	add_option_press(window_menu, 3, "option_borderless", function() {
	    screen_option_apply_fullscreen(2);
		screen_apply_size_delayed();
	});
}

var sca = [
	create_option_value("FIT", 0, false),
	create_option_value("PIXEL PERFECT", 1, false)
];
if global.experimental
	array_push(sca, create_option_value("ULTRAWIDE", 2, false));

add_option_multiple(window_menu, 4, "SCALING", sca, function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "scale_mode", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_scale_mode = val;
	screen_apply_size();
	
	if val == 2
		tooltip = "Very buggy!";
	else
		tooltip = "";
}).value = min(global.option_scale_mode, array_length(sca) - 1);

add_option_toggle(window_menu, 5, "GAMEFRAME", function(val)
{
	if val != global.gameframe_enabled
	{
		with instance_create(0, 0, obj_screenconfirm)
	    {
	        savedoption = global.gameframe_enabled;
	        section = "Modded";
	        key = "gameframe";
	        varname = "gameframe";
	        depth = obj_option.depth - 1;
		
			restart = true;
			saveto = val;
	    }
	}
	else
	{
		ini_open_from_string(obj_savesystem.ini_str_options);
	    ini_write_real("Modded", "gameframe", val);
	    obj_savesystem.ini_str_options = ini_close();
	}
}).value = global.gameframe_enabled;

array_push(menus, window_menu);

#endregion
#region resolutions menu

var resolution_menu = create_menu_fixed(MENUS.resolution, anchor.left, 150, 40, MENUS.video);
add_option_press(resolution_menu, 0, "option_back", function()
{
    menu_goto(MENUS.video);
});

for (i = 0; i < array_length(global.resolutions[obj_screensizer.aspect_ratio]); i++)
{
    b = global.resolutions[obj_screensizer.aspect_ratio][i];
    add_option_press(resolution_menu, i + 1, concat(b[0], "X", b[1]), function()
    {
        var opt = global.option_resolution;
        global.option_resolution = menus[menu].options[optionselected].option_id - 1;
        screen_apply_size();
		
        with instance_create(0, 0, obj_screenconfirm)
        {
            savedoption = opt;
            section = "Option";
            key = "resolution";
            varname = "option_resolution";
            depth = obj_option.depth - 1;
        }
    }).localization = false;
}
array_push(menus, resolution_menu);

#endregion
#region game menu

var game_menu = create_menu_fixed(MENUS.game, anchor.left, 150, 40);
add_option_press(game_menu, 0, "option_back", function()
{
	menu_goto(MENUS.main);
});

add_option_toggle(game_menu, 1, "option_vibration", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "vibration", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_vibration = val;
}).value = global.option_vibration;

add_option_toggle(game_menu, 1, "option_screenshake", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "screenshake", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_screenshake = val;
}).value = global.option_screenshake;

var lang = [];
var key = ds_map_find_first(global.lang_map);
for (i = 0; i < ds_map_size(global.lang_map); i++)
{
	var l = ds_map_find_value(global.lang_map, key);
	array_push(lang, create_option_value(ds_map_find_value(l, "display_name"), key, false));
	key = ds_map_find_next(global.lang_map, key);
}

var lang_option = add_option_multiple(game_menu, 2, "option_lang", lang, function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_string("Option", "lang", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_lang = val;
	global.lang = global.option_lang;
});

var r = 0;
for (i = 0; i < array_length(lang); i++)
{
	if (lang[i].value == global.option_lang)
	{
		r = i;
		break;
	}
}
lang_option.value = r;

add_option_toggle(game_menu, 3, "option_timer", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "timer", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_timer = val;
}).value = global.option_timer;

add_option_multiple(game_menu, 4, "option_timer_type", [create_option_value("option_timer_level", 0), create_option_value("option_timer_save", 1)], function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "timer_type", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_timer_type = val;
}).value = global.option_timer_type;

add_option_toggle(game_menu, 5, "option_timer_speedrun", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "speedrun_timer", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_speedrun_timer = val;
}).value = global.option_speedrun_timer;

add_option_toggle(game_menu, 6, "UNFOCUSED PAUSE", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Modded", "unfocus_pause", val);
	obj_savesystem.ini_str_options = ini_close();
	global.unfocus_pause = val;
}).value = global.unfocus_pause;

array_push(menus, game_menu);
 
#endregion
#region controls menu

var controls_menu = create_menu_fixed(MENUS.controls, anchor.left, 150, 40);
add_option_press(controls_menu, 0, "option_back", function() {
	menu_goto(MENUS.main);
});
add_option_press(controls_menu, 1, "option_keyboard", function()
{
	menu_goto(MENUS.keyboard);
});
add_option_press(controls_menu, 2, "option_controller", function() {
	menu_goto(MENUS.controller);
});
add_option_press(controls_menu, 3, "option_reset_config", function()
{
	ini_open_from_string(obj_savesystem.ini_str_options)
	ini_section_delete("Input");
	ini_section_delete("InputConfig");
	scr_initinput(false)
	obj_savesystem.ini_str_options = ini_close()
	with (obj_option)
	{
		for (i = 0; i < array_length(menus); i++)
		{
			b = menus[i]
			if (b.menu_id == MENUS.controller || b.menu_id == MENUS.deadzone || b.menu_id == MENUS.keyboard)
			{
				for (var j = 0; j < array_length(b.options); j++)
				{
					var q = b.options[j]
					if (q.name == "option_deadzone")
						q.value = global.input_controller_deadzone * 100;
					else if (q.name == "option_deadzone_h")
						q.value = global.input_controller_deadzone_horizontal * 100;
					else if (q.name == "option_deadzone_v")
						q.value = global.input_controller_deadzone_vertical * 100;	
					else if (q.name == "option_deadzone_press")
						q.value = global.input_controller_deadzone_press * 100;
					else if (q.name == "option_deadzone_superjump")
						q.value = global.gamepad_deadzone_superjump * 100;
					else if (q.name == "option_deadzone_crouch")
                        q.value = global.gamepad_deadzone_crouch * 100;
					else if (q.name == "option_controller_superjump")
						q.value = global.gamepad_superjump;
					else if (q.name == "option_controller_groundpound")
						q.value = global.gamepad_groundpound;
					else if (q.name == "option_keyboard_superjump")
						q.value = global.keyboard_superjump;
					else if (q.name == "option_keyboard_groundpound")
						q.value = global.keyboard_groundpound;
				}
			}
		}
	}
	with (create_transformation_tip(lang_get_value("option_controls_resetted")))
	{
		depth = -700;
		alarm[1] = 100;
	}
});
array_push(menus, controls_menu);

#endregion
#region keyboard menu

var keyboard_menu = create_menu_fixed(MENUS.keyboard, anchor.left, 150, 40, MENUS.controls);
add_option_press(keyboard_menu, 0, "option_back", function()
{
	menu_goto(MENUS.controls);
});

add_option_press(keyboard_menu, 1, "option_controller_binds", function()
{
	obj_option.key_jump = false;
	instance_create_unique(0, 0, obj_keyconfig);
});

add_option_toggle(keyboard_menu, 2, "option_keyboard_superjump", function(val)
{
	global.keyboard_superjump = val;
	set_controller_config();
}).value = global.keyboard_superjump;

add_option_toggle(keyboard_menu, 3, "option_keyboard_groundpound", function(val)
{
	global.keyboard_groundpound = val;
	set_controller_config();
}).value = global.keyboard_groundpound;

array_push(menus, keyboard_menu);

#endregion
#region controller menu

var controller_menu = create_menu_fixed(MENUS.controller, anchor.left, 150, 40, MENUS.controls);

add_option_press(controller_menu, 0, "option_back", function() {
	menu_goto(MENUS.controls);
});

add_option_press(controller_menu, 1, "option_controller_binds", function(val)
{
	obj_option.key_jump = false;
	with (instance_create_unique(0, 0, obj_keyconfig))
		controller = true;
});

add_option_press(controller_menu, 2, "option_deadzone_title", function(val) {
	menu_goto(MENUS.deadzone);
});

add_option_toggle(controller_menu, 3, "option_controller_superjump", function(val)
{
	global.gamepad_superjump = val;
	set_controller_config();
}).value = global.gamepad_superjump;

add_option_toggle(controller_menu, 4, "option_controller_groundpound", function(val)
{
	global.gamepad_groundpound = val;
	set_controller_config();
}).value = global.gamepad_groundpound;

array_push(menus, controller_menu);

#endregion
#region deadzones menu

var back = MENUS.controller;
var deadzones_menu = create_menu_fixed(MENUS.deadzone, anchor.left, 150, 40, back);

add_option_press(deadzones_menu, 0, "option_back", function() {
	menu_goto(MENUS.controller)
});
add_option_slide(deadzones_menu, 1, "option_deadzone", function(val)
{
	if (val > 90)
		val = 90;
	global.input_controller_deadzone = val / 100;
	trace(val / 100);
	set_controller_config();
}).value = (global.input_controller_deadzone * 100);

add_option_slide(deadzones_menu, 2, "option_deadzone_h", function(val)
{
	if val > 90
		val = 90;
	global.input_controller_deadzone_horizontal = val / 100;
	trace(val / 100);
	set_controller_config();
}).value = (global.input_controller_deadzone_horizontal * 100);

add_option_slide(deadzones_menu, 3, "option_deadzone_v", function(val)
{
	if (val > 90)
		val = 90;
	global.input_controller_deadzone_vertical = val / 100;
	trace(val / 100);
	set_controller_config();
}).value = (global.input_controller_deadzone_vertical * 100);

add_option_slide(deadzones_menu, 4, "option_deadzone_press", function(val)
{
	if (val > 90)
		val = 90;
	global.input_controller_deadzone_press = val / 100;
	trace(val / 100);
	set_controller_config();
}).value = (global.input_controller_deadzone_press * 100);

add_option_slide(deadzones_menu, 5, "option_deadzone_superjump", function(val)
{
	global.gamepad_deadzone_superjump = val / 100;
	set_controller_config();
	trace(val / 100);
}).value = (global.gamepad_deadzone_superjump * 100);

add_option_slide(deadzones_menu, 5, "option_deadzone_crouch", function(val)
{
    global.gamepad_deadzone_crouch = val / 100;
    set_controller_config();
	trace(val / 100);
}).value = (global.gamepad_deadzone_crouch * 100);

array_push(menus, deadzones_menu);

#endregion
#region inputdisplay menu

var inputdisplay_menu = create_menu_fixed(MENUS.inputdisplay, anchor.left, 150, 40, MENUS.main);
add_option_press(inputdisplay_menu, 0, "option_back", function()
{
	with obj_inputdisplay
		savekeys();
	with obj_modconfig
		visible = true;
	
	menu_goto(MENUS.main);
});

if instance_exists(obj_inputdisplay)
{
	add_option_toggle(inputdisplay_menu, 1, "ACTIVE", function(val)
	{
		global.inputdisplay = val;
	}).value = global.inputdisplay;

	add_option_slide(inputdisplay_menu, 2, "OPACITY", function(val)
	{
		obj_inputdisplay.keyalpha = val / 100;
	}).value = obj_inputdisplay.keyalpha * 100;
}

array_push(menus, inputdisplay_menu);

#endregion
#region lapping menu

var lapping_menu = create_menu_fixed(MENUS.lapping, anchor.left, 120, 40, MENUS.main);
add_option_press(lapping_menu, 0, "option_back", function()
{
	with obj_modconfig
		visible = true;
	menu_goto(MENUS.main);
});

// lapping mode
var o = add_option_multiple(lapping_menu, 1, "LAPPING MODE", [create_option_value("NORMAL", 0, false), create_option_value("INFINITE", 1, false), create_option_value("LAP HELL", 2, false)], function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Modded", "lapmode", val);
	obj_savesystem.ini_str_options = ini_close();
	
	global.lapmode = val;
	set_tooltip(val);
});
o.value = global.lapmode;
o.set_tooltip = live_method(o, function(val)
{
	switch val
	{
		case 0: tooltip = "Base game lapping."; break;
		case 1: tooltip = "Clocks and bells start giving you time after the third lap."; break;
		case 2: tooltip = "A challenge awaits you on the third lap!"; break;
	}
});
o.set_tooltip(o.value);

// parry pizzaface
var o = add_option_toggle(lapping_menu, 2, SUGARY ? "PARRY CONEBALL" : "PARRY PIZZAFACE", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Modded", "parrypizzaface", val);
	obj_savesystem.ini_str_options = ini_close();
	
	global.parrypizzaface = val;
});
o.value = global.parrypizzaface;

// checkpoints
var o = add_option_multiple(lapping_menu, 3, "CHECKPOINTS", [create_option_value("OFF", 0, false), create_option_value("LAP 3", 1, false), create_option_value("LAP 4", 2, false), create_option_value("BOTH", 3, false)], function(val)
{
	global.lap3checkpoint = val % 2;
	global.lap4checkpoint = val > 1;
	
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Modded", "lap3checkpoint", global.lap3checkpoint);
	ini_write_real("Modded", "lap4checkpoint", global.lap4checkpoint);
	obj_savesystem.ini_str_options = ini_close();
	
	tooltip = "Only in Lap Hell.";
	if val == 3
		tooltip += "\n(Both Lap 3 and 4)";
});
o.value = global.lap3checkpoint + (global.lap4checkpoint * 2);
o.tooltip = "Only in Lap Hell.";

// chase mode
var o = add_option_multiple(lapping_menu, 4, "LEVEL CHANGES", [create_option_value("OFF", 0, false), create_option_value("LAP BLOCKS", 1, false), create_option_value("SLOW DOWN", 2, false)], function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Modded", "chasekind", val);
	obj_savesystem.ini_str_options = ini_close();
	
	global.chasekind = val;
	set_tooltip(val);
});
o.value = global.chasekind;
o.set_tooltip = live_method(o, function(val)
{
	switch val
	{
		case 0: tooltip = "Good luck."; break;
		case 1: tooltip = "Changes the layout on certain rooms after Lap 3, like ELM."; break;
		case 2: tooltip = $"Slows down {(SUGARY ? "Coneball" : "Pizzaface")} on certain rooms after Lap 3, like Lap Hell."; break;
	}
});
o.set_tooltip(o.value);

array_push(menus, lapping_menu);

#endregion
