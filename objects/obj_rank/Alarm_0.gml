if sugary
{
	fmod_event_instance_stop(sugaryrank, true);
	fmod_event_instance_release(sugaryrank);
}

alarm[1] = 1;
textures_offload(["hubgroup"]); // im pretty sure this is counterproductive
