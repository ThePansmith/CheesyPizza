// Loy don't move this
// I did this intentionally because
// gamemaker sets the hitbox to the default sprite index
// so this is a cheeky way to cheat the hitbox fix
spr_dead = spr_ratblock6_dead;

if MIDWAY
{
	sprite_index = spr_ratblock6_bo;
	spr_dead = spr_ratblock6_dead_bo;
}
if SUGARY
{
	sprite_index = spr_chocofrogsmall;
	spr_dead = spr_chocofrogsmalldead;
}

event_inherited();

depth = 2;
anim = false;
animy = 0;

if check_char("V") or check_char("G") or check_char("S")
	instance_destroy(other, false);
