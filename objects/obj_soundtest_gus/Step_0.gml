with (obj_soundtest)
{
	if (play)
		other.sprite_index = other.gus ? spr_pepdance : spr_gusdance;
	else
		other.sprite_index = other.gus ? spr_player_idle : spr_lonegustavo_idle;
}
