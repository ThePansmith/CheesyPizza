live_auto_call;

if state == 0
{
	with obj_player
		state = states.titlescreen;
}
if keyboard_check_pressed(ord("R")) && DEBUG
	room_restart();

// control
var array = towers;

scr_getinput(true);
var moveY = -key_up2 + key_down2;
var moveX = key_left2 + key_right2;

if movehold > 0
	movehold--;

if movehold == 0
{
	moveY = -key_up + key_down;
	movehold = 5;
}
else if moveY != 0
	movehold = 20;

if !(key_up or key_down)
	movehold = -1;

// level select
switch menu
{
	case 0:
		if array_length(towers) == 0
			break;

		var curr = towers[sel.y];
		if state == 0
		{
			controls.text = "[G] Delete";
			if !curr.corrupt
				controls.text = "[J] Play " + controls.text;
			if curr.type != 0
				controls.text += " [T] Modifiers";
			controls.text += "/";
			
			// move selection
			if moveY != 0
			{
				textscroll = 0;
				sel.y += moveY;
				sel.y = wrap(sel.y, 0, array_length(array) - 1);
	
				sound_play(sfx_step);
			}
			if moveX != 0
			{
				textscroll = 0;
				
				var prev = sel.y;
				sel.y += moveX * min(floor(array_length(array) / 2), 10);
				sel.y = clamp(sel.y, 0, array_length(array) - 1);
				
				if sel.y != prev
					sound_play(sfx_step);
			}
	
			// camera
			if smooth_buffer > 0
				smooth_buffer--;
	
			var camx = 0;
			var camy = max(sel.y * 36 - 260, -120);
	
			cam.x = lerp(camx, cam.x, (smooth_buffer == 0) * 0.75);
			cam.y = lerp(camy, cam.y, (smooth_buffer == 0) * 0.75);
	
			// select
			if key_jump
			{
				if !file_exists(curr.file)
					curr.corrupt = true;
				
				if curr.corrupt
				{
					
				}
				else
				{
					stop_music();
					sound_play(sfx_collectpizza);
					state = 1;
				}
			}
			if key_taunt2
			{
				if !file_exists(curr.file)
					curr.corrupt = true;
				
				if curr.corrupt
				{
					
				}
				else
				{
					stop_music();
					state = 3;
				}
			}
			if key_slap2
			{
				state = -1;
				break;
			}
			fader = Approach(fader, 1, 0.1);
		}
		if state == 1
		{
			controls.text = "";
	
			fader = Approach(fader, -1, 0.1);
			if fader == -1
			{
				var load = curr.file;
				with instance_create(0, 0, obj_levelLoader)
				{
					var result = cyop_load(load);
					if is_string(result)
					{
						show_message(result);
						other.state = 0;
						instance_destroy();
						exit;
					}
					loaded = true;
				}
				state = 2;
			}
		}
		if state == 3
		{
			controls.text = "";
			if !instance_exists(obj_levelsettings)
				instance_create(0, 0, obj_levelsettings, {level: "custom", levelname: curr.name});
	
			if obj_levelsettings.state == states.door
			{
				fader = -1;
				state = 1;
			}
		}
		if state == -1
		{
			controls.text = "{u}[J][T] Delete [G] Cancel/";
			fader = Approach(fader, 0, 0.1);
			
			if key_slap2
				state = 0;
			if key_jump2 && key_taunt
			{
				state = 0;
				if curr.file != "" && file_exists(curr.file)
					trace(folder_destroy(filename_dir(curr.file)));
				sound_play_centered("event:/sfx/misc/explosion");
				sound_play_centered(sfx_breakblock);
				fader = 1;
				
				refresh_list();
				while sel.y >= array_length(towers)
					sel.y --;
				shake = 3;
			}
		}
		break;
	
	case 1:
		if state == 1
		{
			
		}
		break;
}

shake = Approach(shake, 0, 0.1);
camera_set_view_pos(view_camera[0], cam.x / 1.5 + random_range(-shake * 2, shake * 2), cam.y / 1.5 + random_range(-shake * 2, shake * 2));
