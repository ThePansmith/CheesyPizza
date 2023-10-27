function scr_pauseicon_draw(index, x, y)
{
	var icon = pause_icons[index];
	draw_sprite_ext(icon.sprite_index, icon.image_index, x + icon.sprite_xoffset + icon.shake_x, y + icon.sprite_yoffset + icon.shake_y, 1, 1, 0, c_white, icon.image_alpha);
}
function scr_create_pause_image()
{
	draw_set_alpha(1);
	screenscale = min(SCREEN_WIDTH / surface_get_width(application_surface), SCREEN_HEIGHT / surface_get_height(application_surface));
	if !surface_exists(obj_screensizer.gui_surf)
		exit;
	
	// surface drawing
	var wd = max(surface_get_width(application_surface), surface_get_width(obj_screensizer.gui_surf));
	var ht = max(surface_get_height(application_surface), surface_get_height(obj_screensizer.gui_surf));
	
	var surface = surface_create(wd, ht);
	if !surface_exists(surface)
		exit;
	
	surface_set_target(surface);
	
	draw_clear(c_black);
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha); // FIXES THE WEIRD DARKENING ISSUE!
	
	scr_draw_screen(0, 0, 1, 1, 1, true);
	if !SUGARY or object_index != obj_pause
		draw_surface(obj_screensizer.gui_surf, 0, 0);
	
	shader_reset();
	
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	// convert to a sprite because surfaces are unstable
	if surface_exists(surface)
	{
		screensprite = sprite_create_from_surface(surface, 0, 0, wd, ht, false, false, 0, 0);
		screensprite2 = noone;
		
		// second surface, to fade in the blur
		if REMIX
		{
			var surface2 = surface_create(wd, ht);
			surface_set_target(surface2);
			
			shader_set(shd_blur);
			shader_set_uniform_f(shader_get_uniform(shd_blur, "size"), 960 / 3, 540 / 3, 2);
			
			draw_surface(surface, 0, 0);
			surface_reset_target();
			
			// make sprite
			screensprite2 = sprite_create_from_surface(surface2, 0, 0, wd, ht, false, false, 0, 0);
			surface_free(surface2);
		}
		surface_free(surface);
	}
}
function scr_draw_pause_image()
{
	if REMIX && sprite_exists(screensprite2)
	{
		if fade < 1 && sprite_exists(screensprite)
			draw_sprite_ext(screensprite, 0, 0, 0, screenscale, screenscale, 0, c_white, 1);
		if fade != 0
			draw_sprite_ext(screensprite2, 0, 0, 0, screenscale, screenscale, 0, c_white, fade);
	}
	else if sprite_exists(screensprite)
		draw_sprite_ext(screensprite, 0, 0, 0, screenscale, screenscale, 0, c_white, 1);
}
function scr_pause_stop_sounds()
{
	fmod_event_instance_stop(global.snd_alarm, true);
	fmod_event_instance_stop(global.snd_bossbeaten, true);
	fmod_event_instance_stop(global.snd_spaceship, true);
	fmod_event_instance_stop(global.snd_escaperumble, true);
	fmod_event_instance_stop(global.snd_johndead, true);
}
function scr_delete_pause_image()
{
	if sprite_exists(screensprite)
		sprite_delete(screensprite);
	if sprite_exists(screensprite2)
		sprite_delete(screensprite2);
}
function scr_pauseicon_add(sprite, index, xoffset = 0, yoffset = 0, array = pause_icons)
{
	array_push(array, 
	{
		sprite_index: sprite,
		image_index: index,
		image_alpha: 0,
		sprite_xoffset: xoffset,
		sprite_yoffset: yoffset,
		shake_x: 0,
		shake_y: 0
	});
}
function scr_pauseicons_update(selected)
{
	for (var i = 0; i < array_length(pause_icons); i++)
	{
		with (pause_icons[i])
		{
			if (i == selected)
			{
				shake_x = random_range(-1, 1);
				shake_y = random_range(-1, 1);
				image_alpha = Approach(image_alpha, 1, 0.2);
			}
			else
			{
				shake_x = 0;
				shake_y = 0;
				image_alpha = Approach(image_alpha, 0, 0.2);
			}
		}
	}
}
function scr_pause_activate_objects(unpause_sounds = true)
{
	for (var i = 0; i < ds_list_size(instance_list); i++)
		instance_activate_object(ds_list_find_value(instance_list, i));
	if (unpause_sounds)
	{
		for (i = 0; i < ds_list_size(sound_list); i++)
			fmod_event_instance_set_paused(ds_list_find_value(sound_list, i), false);
		sound_pause_all(false, global.jukebox == noone ? -1 : global.jukebox.instance);
		fmod_set_parameter("musicmuffle", savedmusicmuffle, true);
	}
	ds_list_clear(instance_list);
	ds_list_clear(sound_list);
	fadein = false;
	pause = false;
	alarm[2] = 1;
}
function scr_pause_deactivate_objects(pause_sounds = true)
{
	if pause_sounds
	{
		savedmusicmuffle = fmod_get_parameter("musicmuffle");
		sound_pause_all(true, global.jukebox == noone ? -1 : global.jukebox.instance);
		if global.jukebox != noone
			fmod_set_parameter("musicmuffle", true, true);
		
	}
	
	ds_list_clear(instance_list);
	for (var i = 0; i < instance_count; i++)
	{
		var obj = instance_find(all, i);
		if (instance_exists(obj) && obj.object_index != obj_pause && obj.object_index != obj_inputAssigner && obj.object_index != obj_screensizer)
			ds_list_add(instance_list, obj);
	}

	instance_deactivate_all(true);
	instance_activate_object(obj_fmod);
	instance_activate_object(obj_inputAssigner);
	instance_activate_object(obj_savesystem);
	instance_activate_object(obj_pause);
	instance_activate_object(obj_screensizer);
	instance_activate_object(obj_music);
	instance_activate_object(obj_persistent);
	instance_activate_object(obj_shell);
	instance_activate_object(obj_richpresence);
	instance_activate_object(obj_inputdisplay);
	instance_activate_object(obj_gmlive);
	instance_activate_object(obj_globaltimer);
}
function pause_spawn_priests()
{
	var p = 
	{
		x: 0,
		y: SCREEN_HEIGHT + 200,
		speed: random_range(0.8, 1.4),
		image_index: 0,
		image_speed: 0.35,
		image_xscale: choose(-1, 1),
		image_alpha: 0,
		sprite_index: choose(spr_angelpriest, spr_angelpriest2, spr_angelpriest3)
	};
	if (is_holiday(holiday.halloween))
		p.sprite_index = choose(spr_pepbat_move, spr_ghostshroom, spr_ghoul_idle);
	var q = irandom(100);
	if (q >= 50)
		p.x = irandom_range(SCREEN_WIDTH * 0.78, SCREEN_WIDTH * 0.65);
	else
		p.x = irandom_range(SCREEN_WIDTH * 0.2, 0.42);
	ds_list_add(priest_list, p);
}
function pause_unpause_music()
{
	with (obj_music)
	{
		if (music != noone)
		{
			fmod_event_instance_set_paused(music.event, other.savedmusicpause);
			fmod_event_instance_set_paused(music.event_secret, other.savedsecretpause);
		}
		fmod_event_instance_set_paused(pillarmusicID, other.savedpillarpause);
		fmod_event_instance_set_paused(panicmusicID, other.savedpanicpause);
		fmod_event_instance_set_paused(kidspartychaseID, other.savedkidspartypause);
		
		for(var i = 0; i < array_length(custom_music); i++)
		{
			if custom_music[i].fmod
				fmod_event_instance_set_paused(custom_music[i].instance, custom_music[i].paused);
		}
	}
	fmod_event_instance_stop(SUGARY ? obj_pause.pausemusicIDss : obj_pause.pausemusicID, true);
}
function pause_update_priests()
{
	for (var i = 0; i < ds_list_size(priest_list); i++)
	{
		var b = ds_list_find_value(priest_list, i);
		var destroy = false;
		with (b)
		{
			y -= speed;
			image_index += image_speed;
			if (!other.pause)
				x += (x > (SCREEN_WIDTH / 2)) ? 10 : -10;
			if (y < -200)
				destroy = true;
			var a = 0.02;
			if (y > 250)
			{
				if (y < (SCREEN_HEIGHT - 100))
					image_alpha += a;
			}
			else
				image_alpha -= a;
		}
		if (destroy)
		{
			b = undefined;
			ds_list_delete(priest_list, i--);
		}
	}
}
function pause_draw_priests()
{
	for (var i = 0; i < ds_list_size(priest_list); i++)
	{
		var b = ds_list_find_value(priest_list, i);
		with (b)
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, c_white, image_alpha);
	}
}
