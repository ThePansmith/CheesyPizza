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
		}
		fmod_event_instance_play(sound);
	}
	else if !check_sugary()
		sound_play_oneshot("event:/sfx/misc/collectpizza");
}
