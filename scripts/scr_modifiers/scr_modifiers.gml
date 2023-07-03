enum MOD
{
	Encore = (1 << 1), // 2
	Pacifist = (1 << 1), // 4
	NoToppings = (1 << 2), // 8
	HardMode = (1 << 3), // 16
	Mirror = (1 << 4), // 32
	Lap3 = (1 << 5), // 64
}
global.modifier = 0;
global.modifier_failed = false;

function check_modifier(flags)
{
	return global.modifier & flags;
}
function fail_modifier(flags)
{
	if check_modifier(flags)
	{
		global.modifier_failed = true;
		instance_create_unique(obj_player1.x, obj_player1.y, obj_pizzaface);
	}
}

// SET - a | b
// UNSET - a & ~b
// CHECK - a & b
// TOGGLE - a ^ b
