hp = 2;
depth = 1;
content = obj_null;

particlespr = spr_bigpizzablockdead;
if check_char("SP")
{
	sprite_index = spr_candybigbreakable;
	particlespr = spr_bigcandyblockdead;
}
else if check_char("PP")
{
	sprite_index = spr_bigbreakablePP;
	particlespr = spr_bigpizzablockdeadPP;
}