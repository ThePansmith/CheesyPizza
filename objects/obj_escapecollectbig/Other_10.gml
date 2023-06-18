/// @description time gain
if global.laps > 1
{
	if !instance_exists(obj_wartimer)
	{
		switch obj_player1.character
		{
			case "SP":
				global.fill += 30;
				break;
			case "G":
				global.fill += 36;
				break;
			default:
				global.fill += 32;
				break;
		}
	}
	else
	{
		fmod_event_one_shot("event:/sfx/ui/wartimerup")
		with (obj_wartimer)
		{
			switch obj_player1.character
			{
				case "SP":
					addseconds += 4;
					break;
				case "G":
					addseconds += 6;
					break;
				default:
					addseconds += 5;
					break;
			}
			alarm[0] = -1
			alarm[2] = 1
		}
	}
}
