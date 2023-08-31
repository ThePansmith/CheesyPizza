function scr_pizzaface_laugh()
{
	if SUGARY
		sound_play_oneshot("event:/modded/sfx/coneballlaugh");
	else if MIDWAY
		sound_play_oneshot("event:/modded/sfx/bonoiselaugh");
	else
		sound_play_oneshot("event:/sfx/pizzaface/laugh");
}