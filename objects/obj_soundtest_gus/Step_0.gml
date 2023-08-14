if safe_get(obj_soundtest, "play") or global.jukebox != noone
	other.sprite_index = other.gus ? spr_pepdance : spr_gusdance;
else
	other.sprite_index = other.gus ? spr_player_idle : spr_lonegustavo_idle;
