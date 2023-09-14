if (abs(x - obj_player1.x) > 30)
	image_xscale = sign(obj_player1.x - x);
	
	if instance_exists(obj_levelLoader) && !instance_exists(obj_soundtest)
	exit;

if safe_get(obj_soundtest, "play") or global.jukebox != noone
	other.sprite_index = spr_scrimbsoundtest_dance;
else
	other.sprite_index = spr_scrimbsoundtest;
