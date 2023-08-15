globalvar MOD;
global.modifier_failed = false;

function reset_modifier()
{
	MOD = 
	{
		// Global modifiers
		Encore: false,
		Pacifist: false,
		NoToppings: false,
		HardMode: false,
		Mirror: false,
		Lap3: false,
		DeathMode: false,
		
		// Snickchallenge
		OldLevels: false,
		
		// Grinch - Remove restart cube
		// GOLF - Remove pizzaball blocks
		EasyMode: false
	}
}
reset_modifier();

function fail_modifier(flags)
{
	if flags
	{
		global.modifier_failed = true;
		instance_create_unique(obj_player1.x, obj_player1.y, obj_pizzaface);
	}
}
