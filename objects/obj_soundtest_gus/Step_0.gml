if instance_exists(obj_levelLoader) && !instance_exists(obj_soundtest)
	exit;

if safe_get(obj_soundtest, "play") or global.jukebox != noone
	other.sprite_index = other.gus ? spr_pepdance : spr_gusdance;
else
	other.sprite_index = other.gus ? spr_player_idle : obj_player1.spr_lonegustavoidle;
