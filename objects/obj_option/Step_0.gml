var j = 0;
var m = menus[menu];

if instance_exists(obj_keyconfig)
	j = 4;

if m.menu_id >= menus.controls && m.menu_id <= menus.unused_3
    j = 4;
else if m.menu_id >= menus.video && m.menu_id <= menus.unused_1
    j = 2;
else if m.menu_id == menus.audio
    j = 1;
else if m.menu_id == menus.game
    j = 3;
else if m.menu_id == menus.inputdisplay
	j = 4;

if safe_get(obj_modconfig, "visible")
	j = 5;

for (var i = 0; i < array_length(bg_alpha); i++)
{
	if i == j
		bg_alpha[i] = Approach(bg_alpha[i], 1, 0.1);
	else
		bg_alpha[i] = Approach(bg_alpha[i], 0, 0.05);
}

bg_x -= 1;
bg_y -= 1;

if instance_exists(obj_keyconfig) or instance_exists(obj_screenconfirm) or safe_get(obj_modconfig, "visible")
	exit;
scr_getinput();

var _dvc = obj_inputAssigner.player_input_device[0];
if (key_jump && _dvc >= 0 && gamepad_button_check_pressed(_dvc, global.key_jumpC) && global.key_jumpC == gp_face2)
    key_jump = false;
key_jump = (key_jump or (global.key_start != vk_return && keyboard_check_pressed(vk_return)) or (global.key_start != vk_space && keyboard_check_pressed(vk_space)) or gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], gp_face1));
key_back = (keyboard_check_pressed(vk_escape)/* or keyboard_check_pressed(vk_return)*/ or gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], gp_face2));
if (backbuffer > 0)
{
	backbuffer--;
	key_jump = false;
	key_back = false;
}

// priority
if key_jump && key_back
	key_back = false;

var move = key_down2 - key_up2;
if (move != 0)
{
	slidebuffer = 0;
	slidecount = 0;
}

var os = optionselected;
optionselected += move;
optionselected = clamp(optionselected, 0, array_length(m.options) - 1);
if (os != optionselected)
	sound_play_oneshot("event:/sfx/ui/step");

var option = m.options[optionselected];
var move2 = key_left2 + key_right2;

switch (option.type)
{
	case menutype.press:
		if (key_jump && option.func != noone)
		{
			sound_play_oneshot("event:/sfx/ui/select");
			option.func();
		}
		break;
	
	case menutype.toggle:
		if (key_jump or -key_left2 or key_right2)
		{
			sound_play_oneshot("event:/sfx/ui/select");
			option.value = !option.value;
			if (option.on_changed != noone)
				option.on_changed(option.value);
		}
		break;
	
	case menutype.multiple:
		if (move2 != 0)
		{
			sound_play_oneshot("event:/sfx/ui/step");
			option.value += move2;
			if (option.value > array_length(option.values) - 1)
				option.value = 0;
			if (option.value < 0)
				option.value = array_length(option.values) - 1;
			if (option.on_changed != noone)
				option.on_changed(option.values[option.value].value);
		}
		break;
	
	case menutype.slide:
		move2 = key_left + key_right;
		if (move2 != 0 && slidebuffer <= 0)
		{
			option.moved = true;
			option.value += move2;
			option.value = clamp(option.value, 0, 100);
			slidebuffer = 1;
		}
		if (move2 != 0)
			option.moving = true;
		if (move2 == 0)
		{
			slidecount = 0;
			option.moving = false;
		}
		break;
}
for (i = 0; i < array_length(m.options); i++)
{
	var b = m.options[i];
	if (b.type == menutype.slide)
	{
		if (b.moved && (move2 == 0 or optionselected != i))
		{
			b.moved = false;
			b.moving = false;
			if (b.on_changed != noone)
				b.on_changed(b.value);
		}
		if (b.on_move != noone && b.moving)
			b.on_move(b.value);
		if (b.sound != noone)
		{
			if (b.moving)
			{
				if (!fmod_event_instance_is_playing(b.sound))
					fmod_event_instance_play(b.sound);
			}
			else
				fmod_event_instance_stop(b.sound, true);
		}
	}
}

if (menu == menus.options)
	scr_pauseicons_update(optionselected);
else
	scr_pauseicons_update(-1);

if (slidebuffer > 0)
	slidebuffer--;

if ((key_back or key_slap2 or keyboard_check_pressed(vk_escape)) && !instance_exists(obj_keyconfig) && !instance_exists(obj_audioconfig))
{
	sound_play_oneshot("event:/sfx/ui/back");
	if menu == menus.options
	{
		if instance_exists(obj_mainmenuselect)
			obj_mainmenuselect.selected = false;
		instance_destroy();
	}
	else
	{
		// look for back button
		var emptyhanded = true;
		for(var i = 0; i < array_length(m.options); i++)
		{
			if m.options[i].name == "option_back"
			{
				emptyhanded = false;
				m.options[i].func();
				break;
			}
		}
		
		// fallback, old method
		if emptyhanded
		{
			for (i = 0; i < array_length(m.options); i++)
			{
				b = m.options[i];
				if b.type == menutype.slide
				{
					if b.sound != noone
						fmod_event_instance_stop(b.sound, true);
				}
			}
			menu_goto(m.backmenu);
		}
	}
}
