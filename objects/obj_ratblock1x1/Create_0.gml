event_inherited();
spr_dead = spr_ratblock6_dead;
depth = 2;
anim = false;
animy = 0;

if check_char("V") or check_char("G") or check_char("S")
	instance_destroy(other, false);

if MIDWAY
{
	sprite_index = spr_ratblock6_bo;
	spr_dead = spr_ratblock6_dead_bo;
}
if sugary
{
	sprite_index = spr_chocofrogsmall;
	spr_dead = spr_chocofrogsmalldead;
}
