globalvar MOD;
global.modifier_failed = false;

function reset_modifier()
{
	global.hardmode = false;
	with obj_deathmode
		active = false;
	
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
		JohnGhost: false,
		Spotlight: false,
		CosmicClones: false,
		
		// Entrance
		NoiseGutter: false,
		
		// CTOP
		Lappable: false,
		
		// Snick Challenge
		OldLevels: false,
		
		// Grinch - Remove restart cube
		// GOLF - Remove pizzaball blocks
		// Snick Challenge - Remove snick
		EasyMode: false,
		
		// Secrets Of The World
		Ordered: false,
		SecretInclude: 0, // 0 = Vanilla, 1 = Cheesed Up
	}
}
reset_modifier();

function fail_modifier(flags, value = true)
{
	if flags == value
	{
		global.modifier_failed = true;
		instance_create_unique(obj_player1.x, obj_player1.y, obj_pizzaface);
	}
}
