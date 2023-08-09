var step_time = fmod_event_instance_get_timeline_pos(obj_music.music_map[?steamy_1].event);

__time_between_beats = 60000/bpm*tempo;

var delta = step_time - last_time_step;
__delta_accumulator += delta;
if (__delta_accumulator >= __time_between_beats)
{
	if (output != noone)
		output(delta);
	__delta_accumulator = __delta_accumulator % __time_between_beats;
	//last_time_step = step_time % ;
	//trace($"last_time_step: {last_time_step}");
}
last_time_step = step_time;


