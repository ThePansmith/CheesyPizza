function scr_fmod_soundeffect(sound_instance, x, y, caller = id)
{
	sound_instance_move(sound_instance, x, y, caller);
	fmod_event_instance_play(sound_instance);
}
