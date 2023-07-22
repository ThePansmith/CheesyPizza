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
		if check_char("SP")
			fmod_event_instance_set_parameter(global.snd_secretwall, "state", 1, false);
		fmod_event_instance_play(global.snd_secretwall);
	}
	else if !check_sugary()
		sound_play_oneshot("event:/sfx/misc/collectpizza");
}
