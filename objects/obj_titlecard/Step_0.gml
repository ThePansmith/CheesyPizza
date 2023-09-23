if (!fadein)
{
	fadealpha = Approach(fadealpha, 1, 0.1);
	if (fadealpha >= 1)
	{
		fadein = true;
		start = true;
		music = false;
		alarm[0] = 180;
	}
}
else
{
	fadealpha = Approach(fadealpha, 0, 0.1);
	if (fadealpha <= 0 && !music && title_music != noone)
	{
		music = true;
		
		if global.jukebox == noone
			sound_play(title_music);
	}
}
