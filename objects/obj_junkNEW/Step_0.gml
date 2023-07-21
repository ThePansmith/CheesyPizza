switch state
{
	case states.idle:
		scr_enemy_idle();
		break;
	case states.turn:
		scr_enemy_turn();
		break;
	case states.walk:
		scr_enemy_walk();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		break;
	case states.grabbed:
		scr_enemy_grabbed();
		break;
}

scr_boundbox();
image_index = img;
if linethrown
{
	linethrown = false;
	hsp /= 2;
}
