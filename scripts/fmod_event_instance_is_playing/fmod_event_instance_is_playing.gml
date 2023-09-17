function fmod_event_instance_is_playing(eventID)
{
	return fmod_event_instance_get_playback_state(eventID) == FMOD_STUDIO_PLAYBACK_STATE.PLAYING;
}