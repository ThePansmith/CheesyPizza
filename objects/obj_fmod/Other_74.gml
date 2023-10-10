switch(async_load[?"event_type"])
{
	case FMOD_PLAYBACK_END_CALLBACK:
		//trace($"GML: FMOD AUDIO END: {async_load[?"id"]}\"{async_load[?"path"]}\"");
		break;
}
