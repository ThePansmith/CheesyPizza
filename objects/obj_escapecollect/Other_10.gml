/// @description time gain
if (global.laps > 1)
{
	if !instance_exists(obj_wartimer)
	{
		switch obj_player1.character
		{
			case "SP":
				global.fill += 6;
				break;
			case "G":
				global.fill += 9;
				break;
			default:
				global.fill += 7;
				break;
		}
	}
	else with (obj_wartimer)
	{
		switch obj_player1.character
		{
			case "SP":
				seconds += 0.4;
				break;
			case "G":
				seconds += 0.6;
				break;
			default:
				seconds += 0.5;
				break;
		}
		while seconds >= 60
		{
			minutes++;
			seconds -= 60;
		}
	}
}
