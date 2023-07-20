hp = 2;
depth = 1;
content = obj_null;

particlespr = spr_bigpizzablockdead;
if check_char("SP")
{
	sprite_index = spr_candybigbreakable;
	particlespr = spr_bigcandyblockdead;
}
else if check_char("BN")
{
	sprite_index = spr_bigbreakable_bo;
	particlespr = spr_bigpizzablockdead_bo;
}
else if check_char("PN")
{
	sprite_index = spr_bigbreakablePN;
	particlespr = spr_bigpizzablockdeadPN;
}
