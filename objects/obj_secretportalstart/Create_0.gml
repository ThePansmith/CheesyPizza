spr_open = spr_secretportal_spawnopen;
spr_idle = spr_secretportal_spawnidle;
spr_close = spr_secretportal_spawnclose;

if check_sugary()
{
	spr_open = spr_secretportal_spawnopen_ss;
	spr_idle = spr_secretportal_spawnidle_ss;
	spr_close = spr_secretportal_spawnclose_ss;
	sprite_index = spr_open;
}
