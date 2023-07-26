spr_open = spr_secretportal_spawnopen;
spr_idle = spr_secretportal_spawnidle;
spr_close = spr_secretportal_spawnclose;

sugary = check_sugary();
if sugary
{
	spr_open = spr_secretportal_spawnopen_ss;
	spr_idle = spr_secretportal_spawnidle_ss;
	spr_close = spr_secretportal_spawnclose_ss;
	sprite_index = spr_open;
}

if check_midway()
{
	spr_open = spr_secretportal_spawnopen_bo;
	spr_idle = spr_secretportal_spawnidle_bo;
	spr_close = spr_secretportal_spawnclose_bo;
	sprite_index = spr_open;
}

// If we aren't coming or going from a secret, we don't need to exist.
if !room_is_secret(obj_player.lastroom) && !room_is_secret(obj_player.targetRoom) && !instance_exists(obj_ghostcollectibles)
	instance_destroy();
