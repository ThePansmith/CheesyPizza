targetRoom = room;
active = true;
trigger = 0;
touched = false;
playerid = -4;
secret = false;
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

if check_sugary()
{
	spr_open = spr_secretportal_open_ss;
	spr_idle = spr_secretportal_idle_ss;
	spr_close = spr_secretportal_close_ss;
	sprite_index = spr_idle;
	mask_index = spr_idle;
}
