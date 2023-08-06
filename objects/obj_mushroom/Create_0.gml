image_speed = 0.35;
depth = 5;
spr_idle = spr_bigmushroom;
spr_bounce = spr_bigmushroom_bounce;

sugary = check_sugary();
if sugary
{
	spr_idle = spr_marshmallowspring;
	spr_bounce = spr_marshmallowspring_active;
}
