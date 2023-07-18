global.experimental = false;

fmod_destroy();
with all
{
	if object_index != obj_screensizer && object_index != obj_gmlive
	&& (object_index != obj_shell or !DEBUG)
		instance_destroy(id, false);
}
with instance_create(0, 0, obj_genericfade)
	deccel = 0.01;
global.gameframe_caption_text = "";
