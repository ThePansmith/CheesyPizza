function sound_stop_all(force = true)
{
	audio_stop_all();
	if ds_exists(obj_fmod.sound_cache, ds_type_map)
	{
		var sound = ds_map_find_first(obj_fmod.sound_cache);
		while sound != undefined
		{
			fmod_event_instance_stop(obj_fmod.sound_cache[? sound], force);
			sound = ds_map_find_next(obj_fmod.sound_cache, sound);
		}
	}
	if ds_exists(obj_fmod.instance_cache, ds_type_list)
	{
		for(var i = 0; i < ds_list_size(obj_fmod.instance_cache); i++)
			fmod_event_instance_stop(obj_fmod.instance_cache[| i]);
	}
}
function sound_create_instance(event)
{
	if is_real(event) && audio_exists(event)
	{
		var snd = audio_play_sound(event, 0, false, 0);
		audio_stop_sound(snd);
		return snd;
	}
	else
	{
		var inst = fmod_event_create_instance(event);
		if ds_exists(obj_fmod.instance_cache, ds_type_list)
			ds_list_add(obj_fmod.instance_cache, inst);
		return inst;
	}
}
function sound_destroy_instance(inst)
{
	if is_real(inst) && audio_exists(inst)
		audio_stop_sound(inst);
	else
	{
		if ds_exists(obj_fmod.instance_cache, ds_type_list)
			ds_list_delete(obj_fmod.instance_cache, ds_list_find_index(obj_fmod.instance_cache, inst));
		fmod_event_instance_release(inst);
	}
}
function sound_pause_all(enable)
{
	if enable
		audio_pause_all();
	else
		audio_resume_all();
	
	fmod_event_instance_set_paused_all(enable);
}
function sound_stop(event, force = true)
{
	if is_string(event)
	{
		var sound = ds_map_find_value(obj_fmod.sound_cache, event);
		if sound != undefined
			fmod_event_instance_stop(sound, force);
	}
	else if audio_exists(event)
		audio_stop_sound(event);
	else
		fmod_event_instance_stop(event, force);
}
function sound_is_playing(event)
{
	if is_string(event)
	{
		var sound = ds_map_find_value(obj_fmod.sound_cache, event);
		if sound != undefined
			return fmod_event_instance_is_playing(sound);
	}
	else if audio_exists(event)
		return audio_is_playing(event);
	else
		return fmod_event_instance_is_playing(event);
}
function sound_play(event) {
	sound_play_3d(event);
}
function sound_play_3d(event, xx = undefined, yy = undefined)
{
	if is_real(event) && audio_exists(event)
	{
		audio_play_sound(event, 0, false, global.option_sfx_volume * global.option_master_volume);
		exit;
	}
	
	if is_string(event)
	{
		var sound = ds_map_find_value(obj_fmod.sound_cache, event);
		if sound == undefined
		{
			sound = fmod_event_create_instance(event);
			ds_map_add(obj_fmod.sound_cache, event, sound);
		}
	}
	else
		var sound = event;
	
	fmod_event_instance_set_paused(sound, false);
	if xx != undefined && yy != undefined
		sound_instance_move(sound, xx, yy);
	fmod_event_instance_play(sound);
}
function sound_play_centered(event) {
	sound_play_3d(event, camera_get_view_x(view_camera[0]) + 960 / 2, camera_get_view_y(view_camera[0]) + 540 / 2);
}
function sound_play_centered_oneshot(event)
{
	if is_real(event) && audio_exists(event)
	{
		audio_play_sound(event, 0, false, global.option_sfx_volume * global.option_master_volume);
		exit;
	}
	fmod_event_one_shot_3d(event, camera_get_view_x(view_camera[0]) + 960 / 2, camera_get_view_y(view_camera[0]) + 540 / 2);
}
function sound_play_oneshot(event)
{
	if is_real(event) && audio_exists(event)
	{
		audio_play_sound(event, 0, false, global.option_sfx_volume * global.option_master_volume);
		exit;
	}
	fmod_event_one_shot(event);
}
function sound_play_oneshot_3d(event, xx, yy)
{
	if is_real(event) && audio_exists(event)
	{
		audio_play_sound(event, 0, false, global.option_sfx_volume * global.option_master_volume);
		exit;
	}
	if check_modifier(MOD.Mirror)
		xx = room_width - xx;
	
	fmod_event_one_shot_3d(event, xx, yy);
}
function sound_instance_move(event, xx, yy)
{
	if is_real(event) && audio_exists(event)
		exit;
	if check_modifier(MOD.Mirror)
		xx = room_width - xx;
	
	if is_string(event)
	{
		var sound = ds_map_find_value(obj_fmod.sound_cache, event);
		if sound != undefined
			fmod_event_instance_set_3d_attributes(sound, xx, yy);
	}
	else
		fmod_event_instance_set_3d_attributes(event, xx, yy);
}
