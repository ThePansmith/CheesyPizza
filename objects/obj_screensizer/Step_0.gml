gameframe_update();
if (global.option_unfocus_mute)
{
	if (window_has_focus())
		fmod_set_parameter("focus", 1, false);
	else
		fmod_set_parameter("focus", 0, false);
}
else
	fmod_set_parameter("focus", 1, false);

if REMIX
{
	gameframe_spr_border = spr_null;
	gameframe_border_width = 0;
}
else
{
	gameframe_spr_border = spr_gameframe_border;
	gameframe_border_width = 2;
}
