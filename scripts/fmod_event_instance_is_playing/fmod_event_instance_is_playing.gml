function fmod_event_instance_is_playing(eventID)
{
	return fmod_event_instance_get_playback_state(eventID) == PLAYBACK_STATE.PLAYING;
}
