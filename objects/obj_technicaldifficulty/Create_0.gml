depth = -100;
image_speed = 0.35;
sprite = -4;
static_index = 0;
static_max = 15;
static_dir = 1;
use_static = true;
alarm[0] = 80;
fmod_event_one_shot("event:/sfx/ui/tvswitch");
with (obj_player)
	state = states.actor;

chara = obj_player1.character;
if obj_player1.isgustavo
	chara = "G";

switch chara
{
	default:
		sprite = choose(spr_technicaldifficulty1, spr_technicaldifficulty2, spr_technicaldifficulty3);
		break;
	case "PP":
		sprite = choose(spr_technicaldifficulty1PP, spr_technicaldifficulty2PP, spr_technicaldifficulty3PP);
		break;
	case "BN":
		sprite = choose(spr_technicaldifficulty1BN, spr_technicaldifficulty2BN, spr_technicaldifficulty3BN, spr_technicaldifficulty4BN);
		break;
	case "N":
		sprite = choose(spr_technicaldifficulty1N, spr_technicaldifficulty2N, spr_technicaldifficulty3N);
		break;
	case "G":
		sprite = spr_technicaldifficulty4;
		break;
}
