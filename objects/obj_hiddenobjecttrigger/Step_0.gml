var _sound = false;
if (place_meeting(x, y, obj_player))
{
	with (obj_hiddenobject)
	{
		if (!activated && trigger == other.trigger)
		{
			_sound = true;
			event_user(0);
		}
	}
}
if (_sound)
{
	if REMIX
	{
		sound_stop(sfx_collectpizza);
		
		with obj_player1
		{
			if character == "SP"
				fmod_event_instance_set_parameter(other.sound, "state", 1, false);
			if character == "P" && !ispeppino && paletteselect == 8
				fmod_event_instance_set_parameter(other.sound, "state", 2, false);
		}
		fmod_event_instance_play(sound);
	}
}
