function scr_pizzaface_laugh()
{
	if check_sugary()
		sound_play("event:/modded/sfx/coneballlaugh");
	else if MIDWAY
		sound_play("event:/modded/sfx/bonoiselaugh");
	else
		sound_play("event:/sfx/pizzaface/laugh");
}