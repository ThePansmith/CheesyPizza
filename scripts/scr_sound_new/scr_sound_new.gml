function sound_stop_all(force = true)
{
	audio_stop_all();
	
	/*
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
	*/
}
function sound_create_instance(event)
{
	if is_handle(event) && audio_exists(event)
	{
		var snd = audio_play_sound(event, 0, false, 0);
		audio_stop_sound(snd);
		return snd;
	}
	else
	{
		var inst = fmod_event_create_instance(event);
		//if ds_exists(obj_fmod.instance_cache, ds_type_list)
		//	ds_list_add(obj_fmod.instance_cache, inst);
		return inst;
	}
}
function sound_destroy_instance(inst)
{
	if is_handle(inst) && audio_exists(inst)
		audio_stop_sound(inst);
	else
	{
		//if ds_exists(obj_fmod.instance_cache, ds_type_list)
		//	ds_list_delete(obj_fmod.instance_cache, ds_list_find_index(obj_fmod.instance_cache, inst));
		fmod_event_instance_release(inst);
	}
}
function sound_pause_all(enable, excludeEventID = -1)
{
	if enable
		audio_pause_all();
	else
		audio_resume_all();
	
	if excludeEventID == -1
		fmod_event_instance_set_paused_all(enable);
	else
		fmod_event_instance_set_paused_all_exclude(enable, excludeEventID);
}
function sound_stop(event, force = true)
{
	if is_string(event)
	{
		/*
		var sound = ds_map_find_value(obj_fmod.sound_cache, event);
		if sound != undefined
			fmod_event_instance_stop(sound, force);
		*/
		
		// radice method goes here
	}
	else if is_handle(event) && audio_exists(event)
		audio_stop_sound(event);
	else
		fmod_event_instance_stop(event, force);
}
function sound_is_playing(event)
{
	if is_string(event)
	{
		//var sound = ds_map_find_value(obj_fmod.sound_cache, event);
		//if sound != undefined
		//	return fmod_event_instance_is_playing(sound);
		
		// radice method goes here
	}
	else if is_handle(event) && audio_exists(event)
		return audio_is_playing(event);
	else
		return fmod_event_instance_is_playing(event);
}
function sound_play(event) {
	sound_play_3d(event);
}
function sound_play_3d(event, xx = undefined, yy = undefined)
{
	if is_handle(event) && audio_exists(event)
	{
		audio_play_sound(event, 0, false, global.option_sfx_volume * global.option_master_volume);
		exit;
	}
	if MOD.Mirror && xx != undefined
		xx = room_width - xx;
	
	/*
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
	*/
	
	if is_string(event)
		fmod_event_one_shot_3d(event, xx, yy);
	else
	{
		fmod_event_instance_set_paused(event, false);
		if xx != undefined && yy != undefined
			sound_instance_move(event, xx, yy);
		fmod_event_instance_play(event);
	}
}
function sound_play_centered(event) {
	sound_play_3d(event, CAMX + SCREEN_WIDTH / 2, CAMY + SCREEN_HEIGHT / 2);
}
function sound_instance_move(event, xx, yy)
{
	if is_handle(event) && audio_exists(event)
		exit;
	if MOD.Mirror
		xx = room_width - xx;
	
	if is_string(event)
	{
		/*
		var sound = ds_map_find_value(obj_fmod.sound_cache, event);
		if sound != undefined
			fmod_event_instance_set_3d_attributes(sound, xx, yy);
		*/
		
		// radice method here
	}
	else
		fmod_event_instance_set_3d_attributes(event, xx, yy);
}
