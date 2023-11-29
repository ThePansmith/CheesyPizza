live_auto_call;

if state == 0
{
	with obj_player
	{
		state = states.titlescreen;
		x = -1000;
	}
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
		{
			controls.text = "";
			break;
		}
		
		var curr = towers[sel.y];
		if state == 0
		{
			// move selection
			var changed = false;
			if moveY != 0
			{
				textscroll = 0;
				sel.y += moveY;
				sel.y = wrap(sel.y, 0, array_length(array) - 1);
	
				sound_play(sfx_step);
				changed = true;
			}
			if moveX != 0
			{
				textscroll = 0;
				
				var prev = sel.y;
				sel.y += moveX * min(floor(array_length(array) / 2), 10);
				sel.y = clamp(sel.y, 0, array_length(array) - 1);
				
				if sel.y != prev
				{
					sound_play(sfx_step);
					changed = true;
				}
			}
			curr = towers[sel.y];
			
			// fuck
			controls.text = "[G] Delete";
			if !curr.corrupt
				controls.text = concat("[J] Play ", controls.text);
			if curr.type != 0
				controls.text = concat(controls.text, " [T] Modifiers");
			controls.text += "/";
			
			// camera
			if smooth_buffer > 0
				smooth_buffer--;
			
			// level score
			if changed
			{
				instance_destroy(obj_startgate_pizza);
				instance_destroy(obj_startgate_secreteye);
				instance_destroy(obj_startgate);
				
				var camy_real = max(sel.y * 36 - 260, -120) / 1.5;
				if curr.type == 1 && curr.rank != ""
				{
					var xx = 800, yy = 280;
					
					for (i = 1; i <= 3; i++)
					{
						var b = true;
						if (i > curr.secrets)
							b = false;
						with (instance_create(xx, camy_real + yy, obj_startgate_secreteye))
						{
							last_current_time = current_time + (600000 * i * 2);
							timer = last_current_time;
							//trace(other.level, " secret eye ", i, timer);
							time_x += (i - 1);
							time_y += ((i - 1) * 2);
							if (b)
								sprite_index = spr_gatesecreteyeopen;
							else
								sprite_index = spr_gatesecreteyeclosed;
						}
					}
					
					with instance_create(xx, camy_real - SCREEN_HEIGHT, obj_startgate_pizza)
					{
						depth = -2;
						
						y_to = camy_real + yy;
						highscore = [];
						highscorepos = 0;
					
						var s = string(curr.collect);
						for (var i = 1; i <= string_length(s); i++)
						{
							var c = string_char_at(s, i);
							array_push(highscore, [c, 0, 0]);
						}
						switch (curr.rank)
						{
							case "p":
								rank_index = 5;
								sprite_index = spr_gatepizza_5;
								break;
							case "s":
								rank_index = 4;
								sprite_index = spr_gatepizza_5;
								break;
							case "a":
								rank_index = 3;
								sprite_index = spr_gatepizza_4;
								break;
							case "b":
								rank_index = 2;
								sprite_index = spr_gatepizza_3;
								break;
							case "c":
								rank_index = 1;
								sprite_index = spr_gatepizza_2;
								break;
							default:
								rank_index = 0;
								sprite_index = spr_gatepizza_1;
								break;
						}
					}
				}
			}
	
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
				{
					if --sel.y <= 0
					{
						sel.y = 0;
						break;
					}
				}
				shake = 3;
			}
		}
		
		var camx = 0;
		var camy = max(sel.y * 36 - 260, -120);
	
		cam.x = lerp(camx, cam.x, (smooth_buffer == 0) * 0.75);
		cam.y = lerp(camy, cam.y, (smooth_buffer == 0) * 0.75);
		break;
	
	case 1:
		if state == 1
		{
			
		}
		break;
}

shake = Approach(shake, 0, 0.1);
camera_set_view_pos(view_camera[0], cam.x / 1.5 + random_range(-shake * 2, shake * 2), cam.y / 1.5 + random_range(-shake * 2, shake * 2));
