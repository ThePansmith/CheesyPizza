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

#region MODIFIERS

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
		type: 3,
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
	global.modifier = 0;
	
	for(var i = 0; i < array_length(options_array); i++)
	{
		var opt = options_array[i];
		if opt.type == 3
		{
			if opt.opts[opt.value][1]
				global.modifier |= opt.vari;
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

add_section("Modifiers");
/*
add_modifier("Encore", MOD.Encore, "Remixes the level to make it harder.", function(val)
{
	
});
*/

if !boss
	add_modifier("No Toppings", MOD.NoToppings, "Go through the level without collecting any toppings.\n\nMay tweak level design to make this possible.", [seq_notoppings_off, seq_notoppings_on]);
if !boss
	add_modifier("Pacifist", MOD.Pacifist, "Go through the level without killing any enemies.", [seq_pacifist_off, seq_pacifist_on]);

add_modifier("Hard Mode", MOD.HardMode, "The level will spawn a ghost that drops random enemies.", [seq_hardmode_off, seq_hardmode_on]);
add_modifier("Mirrored", MOD.Mirror, "Flips the screen horizontally, effectively mirroring the level.", [seq_mirrored_off, seq_mirrored_on]);

if !boss && level != "grinch" && level != "dragonlair" && level != "exit"
	add_modifier("Lap 3", MOD.Lap3, "Spawns Pizzaface on the third lap.", [seq_lap3_off, seq_lap3_on]);

#endregion
