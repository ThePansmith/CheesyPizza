function cyop_music()
{
	music = noone;
	if current_custom != noone
	{
		var song = custom_music[current_custom];
		if song.fmod
		{
			if song.instance == noone
			{
				song.instance = fmod_event_create_instance(song.event);
				fmod_event_instance_set_parameter(song.instance, "state", song.state, false);
				fmod_event_instance_play(song.instance);
			}
			else
			{
				fmod_event_instance_set_paused(song.instance, false);
				song.paused = false;
			}
		}
		else
		{
			if song.instance == noone
				song.instance = audio_play_sound(song.event, 0, true, global.option_master_volume * global.option_music_volume);
			else if audio_is_paused(song.instance)
				audio_resume_sound(song.instance);
		}
	}
}
function cyop_stopall()
{
	current_custom = noone;
	for(var i = 0; i < array_length(custom_music); i++)
	{
		var song = custom_music[i];
		sound_stop(song.instance);
	}
}
