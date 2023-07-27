image_speed = 0.35;
mask_index = spr_priest_idle;
collect = true;
escape = false;
depth = 1;

spr_idle = spr_priest_idle;
spr_pray = spr_priest_pray;

sugary = check_sugary();
if sugary
{
	spr_idle = spr_cultist;
	spr_pray = spr_cultist_pray;
}
sprite_index = spr_idle;
