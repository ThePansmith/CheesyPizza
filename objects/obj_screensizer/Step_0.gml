if global.gameframe_enabled
	gameframe_update();
else
	window_set_caption(global.gameframe_caption_text);

var focus = window_has_focus() or !global.option_unfocus_mute;
audio_master_gain(focus * global.option_master_volume * 0.5);
fmod_set_parameter("focus", focus, false);

/*
if REMIX
{
	gameframe_spr_border = spr_null;
	gameframe_border_width = 0;
}
else
*/
{
	gameframe_spr_border = spr_gameframe_border;
	gameframe_border_width = 2;
}
global.Pattern_Index += 0.1;
