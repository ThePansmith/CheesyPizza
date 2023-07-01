enum MOD
{
	Pacifist = (1 << 1), // unimplemented
	NoToppings = (1 << 2), // unimplemented
	HardMode = (1 << 3), // unimplemented
	Mirror = (1 << 4), // unimplemented
	Lap3 = (1 << 5), // unimplemented
}
global.mod = 0;
global.mod_failed = false;

function check_modifier(flags)
{
	return (global.mod & flags == flags);
}
function fail_modifier(flags)
{
	if check_modifier(flags)
	{
		global.mod_failed = true;
		instance_create_unique(obj_player1.x, obj_player1.y, obj_pizzaface);
	}
}

// SET - a | b
// UNSET - a & ~b
// CHECK - a & b == b
// TOGGLE - a ^ b
