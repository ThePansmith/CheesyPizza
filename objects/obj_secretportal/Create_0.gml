targetRoom = room;
active = true;
trigger = 0;
touched = false;
playerid = -4;
secret = room_is_secret(room);
depth = 107;
soundtest = false;

spr_open = spr_secretportal_open;
spr_idle = spr_secretportal_idle;
spr_close = spr_secretportal_close;

/*
use these with event triggers for sugary portals.

secret_close_portalID
secret_open_portalID
*/

sugary = SUGARY;
if sugary
{
	spr_open = spr_secretportal_open_ss;
	spr_idle = spr_secretportal_idle_ss;
	spr_close = spr_secretportal_close_ss;
	sprite_index = spr_idle;
	mask_index = spr_idle;
	if secret
		depth = 10;
}

if MIDWAY
{
	spr_open = spr_secretportal_open_bo;
	spr_idle = spr_secretportal_idle_bo;
	spr_close = spr_secretportal_close_bo;
	sprite_index = spr_idle;
	mask_index = spr_idle;
}
ID = id;

if check_modifier(MOD.DeathMode)
	instance_destroy();
