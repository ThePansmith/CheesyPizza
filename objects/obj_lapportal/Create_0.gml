image_speed = 0.35;
playerid = -4;
targetRoom = room;

spr_idle = spr_pizzaportal;
spr_enter = spr_pizzaportalend;
if check_sugary()
{
	spr_idle = spr_lappingportal_idle;
	spr_enter = spr_lappingportal_enter;
}
sprite_index = spr_idle;
