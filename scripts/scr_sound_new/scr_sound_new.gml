function sound_stop_all(force = true)
{
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
	var inst = fmod_event_create_instance(event);
	if ds_exists(obj_fmod.instance_cache, ds_type_list)
		ds_list_add(obj_fmod.instance_cache, inst);
	return inst;
}
function sound_destroy_instance(inst)
{
	if ds_exists(obj_fmod.instance_cache, ds_type_list)
		ds_list_delete(obj_fmod.instance_cache, ds_list_find_index(obj_fmod.instance_cache, inst));
	fmod_event_instance_release(inst);
}
function sound_pause_all(enable) {
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
	else
		return fmod_event_instance_is_playing(event);
}
function sound_play(event) {
	sound_play_3d(event);
}
function sound_play_3d(event, x = undefined, y = undefined)
{
	var sound = ds_map_find_value(obj_fmod.sound_cache, event);
	if sound == undefined
	{
		sound = fmod_event_create_instance(event);
		ds_map_add(obj_fmod.sound_cache, event, sound);
	}
	fmod_event_instance_set_paused(sound, false);
	if x != undefined && y != undefined
		fmod_event_instance_set_3d_attributes(sound, x, y);
	fmod_event_instance_play(sound);
}
function sound_play_centered(event) {
	sound_play_3d(event, camera_get_view_x(view_camera[0]) + 960 / 2, camera_get_view_y(view_camera[0]) + 540 / 2);
}
function sound_play_centered_oneshot(event) {
	fmod_event_one_shot_3d(event, camera_get_view_x(view_camera[0]) + 960 / 2, camera_get_view_y(view_camera[0]) + 540 / 2);
}
function sound_play_oneshot(event) {
	fmod_event_one_shot(event);
}
function sound_play_multiple(event, x = undefined, y = undefined)
{
	if x != undefined && y != undefined
		fmod_event_one_shot_3d(event, x, y);
	else
		fmod_event_one_shot(event);
}
