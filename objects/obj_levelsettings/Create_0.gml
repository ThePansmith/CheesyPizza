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
		drawfunc: drawfunc,
		condition: noone
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
			variable_struct_set(MOD, opt.vari, opt.opts[opt.value][1]);
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

var deathmode_allow = 
[ 
	"entryway", // Sugary
	"entrance", "medieval", //"ruin", "dungeon", // W1
	//"badland", "graveyard", "saloon", "farm", // W2
	//"plage", "space", "minigolf", "forest", // W3
	//"freezer", "street", "industrial", "sewer", // W4
	//"chateau", "kidsparty", //"war", // W5
	"etb", "midway", // Extra
];
if array_contains(deathmode_allow, level, 0, infinity)// or DEBUG
	add_modifier("Death Mode", "DeathMode", "Avoid Pizzaface within a very tight timer!", [seq_deathmode_off, seq_deathmode_on]);

if level == "medieval" or level == "ruin" or level == "dungeon"
	add_modifier("Old Levels", "OldLevels", "TEMPORARY! THIS WILL BE MOVED TO SAGE.", [seq_oldlevels_off, seq_oldlevels_on]);

if !boss && level != "tutorial" && global.experimental
	add_modifier("No Toppings", "NoToppings", "Summons Pizzaface when collecting a topping.", [seq_notoppings_off, seq_notoppings_on]);
if !boss && level != "tutorial"
	add_modifier("Pacifist", "Pacifist", "Avoid murdering anyone while going through the stage. The escape time will be extended.", [seq_pacifist_off, seq_pacifist_on]);

add_modifier("Hard Mode", "HardMode", "A placeholder entity will rain enemies upon you!", [seq_hardmode_off, seq_hardmode_on]);
add_modifier("Mirrored", "Mirror", "Experience the horrors of graphics that weren't supposed to be flipped.", [seq_mirrored_off, seq_mirrored_on]);

/*
if !boss && level != "grinch" && level != "dragonlair" && level != "snickchallenge" && level != "tutorial" && level != "secretworld"
{
	var opt = add_modifier("Lap Hell", "Lap3", "A challenge awaits you on the third lap!", [seq_lap3_off, seq_lap3_on, seq_lap3_on]);
	opt.opts = [
		["OFF", false],
		["ON", true],
		["HARD", 2] // No parrying pizzaface, restart the whole level if failed
	]
}
*/

add_modifier("John Ghost", "JohnGhost", "Once you pass the first room, the John ghost from Wasteyard will spawn everywhere!");

circle_size = 250;
add_modifier("Lights Out", "Spotlight", "The size of the spotlight is tied to your combo time. Grab collectibles and kill enemies to reset it.", function(val)
{
	// draw circle first to crop out
	toggle_alphafix(false);
	
	draw_clear(c_black);
	circle_size = lerp(circle_size, val ? 70 : 250, 0.25);
	
	gpu_set_blendmode(bm_subtract);
	draw_circle(384/2 + random_range(-1, 1), 216/2 + random_range(-1, 1), circle_size, false);
	draw_set_alpha(0.35);
	draw_circle(384/2 + random_range(-1, 1), 216/2 + random_range(-1, 1), circle_size + 30, false);
	
	draw_set_alpha(1);
	toggle_alphafix(true);
	
	// player
	var p = simuplayer;
	draw_sprite(spr_playerN_move, p.image, 384 / 2, 216 / 2);
});

if level != "custom" && level != ""
{
	//add_modifier("Anti-Panic", "EscapeInvert", "Escape enemies and John blocks are flipped!");
	//add_modifier("Block Land", "PurpleBlockLand", "Removes every asset from a level, leaving only collision visible.");
	
	if global.experimental
		add_modifier("From The Top", "FromTheTop", "John and the exit gate are swapped.\nVery WIP, so it won't work with every level.");
}
add_modifier("VVVVVV", "GravityJump", "Flip gravity with the jump button.");

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
	
	if DEBUG
		add_modifier("Snick Rematch", "Snickrematch", "yeah");
}
if level == "exit"
{
	add_section("Level");
	add_modifier("Lappable", "Lappable", "Adds a lap portal to CTOP. Lap 2 will give you 2 extra minutes.", [seq_lappable_off, seq_lappable_on]);
}
if level == "secretworld"
{
	add_section("Level");
	add_modifier("In Order", "Ordered", "Introduces every secret in proper level order, instead of being randomized.");
	add_modifier("Extra Secrets", "SecretInclude", $"Includes the Scrap Basement's secrets.\nCurrent version: {GM_version}, adds 7");
}

#endregion

refresh_options();
