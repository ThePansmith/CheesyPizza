image_speed = 0.35;
active = false;

spr_appear = spr_pizzaportal_appear;
spr_spit = spr_pizzaportalentrancestart;
spr_disappear = spr_pizzaportal_disappear;

sugary = check_sugary();
if sugary
{
	spr_appear = spr_lappingportal_create;
	spr_spit = spr_lappingportal_exit;
	spr_disappear = spr_lappingportal_disappear;
}

sprite_index = spr_appear;
