override_state = noone;
override_sprite = noone;


spr_open = spr_secretportal_spawnopen;
spr_idle = spr_secretportal_spawnidle;
spr_close = spr_secretportal_spawnclose;

sugary = SUGARY;
if sugary
{
	spr_open = spr_secretportal_spawnopen_ss;
	spr_idle = spr_secretportal_spawnidle_ss;
	spr_close = spr_secretportal_spawnclose_ss;
	sprite_index = spr_open;
}

if MIDWAY
{
	spr_open = spr_secretportal_spawnopen_bo;
	spr_idle = spr_secretportal_spawnidle_bo;
	spr_close = spr_secretportal_spawnclose_bo;
	sprite_index = spr_open;
}

// If we aren't coming or going from a secret, we don't need to exist.
if !room_is_secret(obj_player1.lastroom) && !room_is_secret(obj_player1.targetRoom) && !instance_exists(obj_ghostcollectibles) && !instance_exists(obj_levelLoader)
	instance_destroy();
