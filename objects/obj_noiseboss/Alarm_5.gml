flash = true;
if (state != states.fightball && state != states.phase1hurt && state != states.finale && !ballooncrash && !instance_exists(obj_noiseballooncrash))
	sound_play_3d("event:/sfx/misc/bossvulnerable", x, y);
