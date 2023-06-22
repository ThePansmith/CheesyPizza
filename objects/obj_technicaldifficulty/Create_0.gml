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
var chara = obj_player1.character
var isgustavo = obj_player1.isgustavo

switch chara
{
	default:
		if !isgustavo
			sprite = choose(spr_technicaldifficulty1, spr_technicaldifficulty2, spr_technicaldifficulty3)
		else
			sprite = spr_technicaldifficulty4
		break;
	case "PP":
		sprite = choose(spr_technicaldifficulty1PP, spr_technicaldifficulty2PP, spr_technicaldifficulty3PP)
		break;
}