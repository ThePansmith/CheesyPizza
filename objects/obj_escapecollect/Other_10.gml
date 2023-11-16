/// @description time gain
if (instance_exists(obj_pizzaface) or global.laps < 2) or global.lapmode == lapmode.laphell
	exit;

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
else with obj_wartimer
{
	seconds += 0.5;
	while seconds >= 60
	{
		minutes++;
		seconds -= 60;
	}
}
