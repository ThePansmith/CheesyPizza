live_auto_call;

// prep
sound_play("event:/modded/sfx/diagopen");

menu = 1;
state = 0;
fadealpha = 0;

anim_t = 0;
outback = animcurve_get_channel(curve_menu, "outback");
surface = -1;
clip_surface = -1;

event_inherited();
sel = 0;

var boss = false;
with obj_bossdoor
{
	if place_meeting(x, y, obj_player)
		boss = true;
}

function add_modifier(name, variable, desc = "", drawfunc = noone)
{
	var struct = {
		type: modconfig.modifier,
		value: 0,
		vari: variable,
		name: name,
		desc: desc,
		opts: [["OFF", false], ["ON", true]],
		drawfunc: drawfunc
	}
	array_push(options_array, struct);
	return struct;
}

options_array = [];
add_button("OK", "Start the level.", function()
{
	reset_modifier();
	for(var i = 0; i < array_length(options_array); i++)
	{
		var opt = options_array[i];
		if opt.type == modconfig.modifier
		{
			if opt.opts[opt.value][1]
				variable_struct_set(MOD, opt.vari, true);
		}
	}
	
	state = states.door;
	with obj_startgate
	{
		if place_meeting(x, y, obj_player1)
		{
			obj_player1.image_index = obj_player1.image_number - 1;
			obj_player1.state = states.victory;
		}
	}
});

#region MODIFIERS

add_section("Modifiers");
//add_modifier("Encore", MOD.Encore, "Remixes the level to make it harder.");

var deathmode_allow = ["entrance", "medieval", "ruin", "dungeon"];
if array_contains(deathmode_allow, level) or DEBUG
	add_modifier("Death Mode", "DeathMode", "You like Scoutdigo? We did it better.", [seq_deathmode_off, seq_deathmode_on]);

if !boss && level != "tutorial" && global.experimental
	add_modifier("No Toppings", "NoToppings", "Spawns Pizzaface when collecting a topping.\nCurrently impossible, so it's part of EXPERIMENTAL.", [seq_notoppings_off, seq_notoppings_on]);
if !boss && level != "tutorial"
	add_modifier("Pacifist", "Pacifist", "Avoid murdering anyone while going through the stage. The escape time will be extended.", [seq_pacifist_off, seq_pacifist_on]);

add_modifier("Hard Mode", "HardMode", "A placeholder entity will rain enemies upon you!", [seq_hardmode_off, seq_hardmode_on]);
add_modifier("Mirrored", "Mirror", "Flips the screen horizontally without messing up your controls, effectively mirroring the level.", [seq_mirrored_off, seq_mirrored_on]);

if !boss && level != "grinch" && level != "dragonlair" && level != "exit" && level != "snickchallenge" && level != "tutorial"
	add_modifier("Lap Hell", "Lap3", "Spawns Pizzaface on the third lap, and on the fourth lap... more.", [seq_lap3_off, seq_lap3_on]);

// Level specific
if level == "grinch"
{
	add_section("Level");
	add_modifier("Easy Mode", "EasyMode", "Gets rid of the snowman blocks.");
}
if level == "golf"
{
	add_section("Level");
	add_modifier("Easy Mode", "EasyMode", "Gets rid of the golf blocks.");
}
if level == "snickchallenge"
{
	add_section("Level");
	add_modifier("Old Levels", "OldLevels", "A more accurate Snick's Challenge, using level design closer to the SAGE 2019 demo.", [seq_oldlevels_off, seq_oldlevels_on]);
	add_modifier("No Snick", "EasyMode", "More of a World 1 timed challenge without that bastard following you around.");
}

#endregion
