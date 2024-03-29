global.coop = false;
global.currentsavefile = 9;
var achievement_arr = ["sranks1", "sranks2", "sranks3", "sranks4", "sranks5"];
var data_arr = [get_save_folder() + "/saveData1.ini", get_save_folder() + "/saveData2.ini", get_save_folder() + "/saveData3.ini"];
global.stickreq[0] = 100;
global.stickreq[1] = 150;
global.stickreq[2] = 200;
global.stickreq[3] = 200;
global.stickreq[4] = 210;
global.levelattempts = 0;
global.palette_arr = [false, false, false, false, false];
for (var i = 0; i < array_length(data_arr); i++)
{
	ini_open(data_arr[i]);
	if (i == 0)
		global.percentage_1 = ini_read_real("Game", "percent", 0);
	else if (i == 1)
		global.percentage_2 = ini_read_real("Game", "percent", 0);
	else if (i == 2)
		global.percentage_3 = ini_read_real("Game", "percent", 0);
	global.game_started[i] = ini_read_real("Tutorial", "finished", false) or ini_read_real("Game", "sandbox", false);
	global.game_judgement[i] = ini_read_string("Game", "finalrank", "none");
	global.game_john[i] = ini_read_real("Game", "john", false);
	global.game_snotty[i] = ini_read_real("Game", "finalsnotty", false);
	global.game_palette[i] = ini_read_real("Game", "palette", 1);
	global.game_character[i] = ini_read_string("Game", "character", "P");
	var _texture = ini_read_string("Game", "palettetexture", "none");
	global.game_palettetexture[i] = scr_get_texture_palette(_texture);
	for (var j = 0; j < array_length(achievement_arr); j++)
	{
		if (ini_read_real("achievements", achievement_arr[j], false))
			global.palette_arr[j] = true;
	}
	ini_close();
}
global.newtoppin[0] = false;
global.newtoppin[1] = false;
global.newtoppin[2] = false;
global.newtoppin[3] = false;
global.newtoppin[4] = false;
global.mach_color1 = make_colour_rgb(96, 208, 72);
global.mach_color2 = make_colour_rgb(248, 0, 0);
global.afterimage_color1 = make_colour_rgb(255, 0, 0);
global.afterimage_color2 = make_colour_rgb(0, 255, 0);
global.smallnumber_color1 = make_colour_rgb(255, 255, 255);
global.smallnumber_color2 = make_colour_rgb(248, 0, 0);
global.optimize = 0;
global.autotile = true;
global.pigreduction = 0;
global.pigtotal = 0;
global.levelcomplete = false;
global.levelcompletename = noone;
global.entrancetreasure = false;
global.medievaltreasure = false;
global.ruintreasure = false;
global.dungeontreasure = false;
global.deserttreasure = false;
global.graveyardtreasure = false;
global.farmtreasure = false;
global.spacetreasure = false;
global.beachtreasure = false;
global.foresttreasure = false;
global.pinballtreasure = false;
global.golftreasure = false;
global.streettreasure = false;
global.sewertreasure = false;
global.factorytreasure = false;
global.freezertreasure = false;
global.chateautreasure = false;
global.mansiontreasure = false;
global.kidspartytreasure = false;
global.wartreasure = false;
global.entrancecutscene = noone;
global.medievalcutscene = noone;
global.ruincutscene = noone;
global.ruincutscene2 = noone;
global.ruincutscene3 = noone;
global.dungeoncutscene = noone;
global.peppermancutscene1 = noone;
global.peppermancutscene2 = noone;
global.chieftaincutscene = noone;
global.chieftaincutscene2 = noone;
global.desertcutscene = noone;
global.graveyardcutscene = noone;
global.spacecutscene = noone;
global.vigilantecutscene1 = noone;
global.vigilantecutscene2 = noone;
global.vigilantecutscene3 = noone;
global.farmcutscene = noone;
global.superpinballcutscene = noone;
global.pubcutscene = noone;
global.pinballcutscene = noone;
global.beercutscene = noone;
global.exitfeecutscene = noone;
global.forestcutscene = noone;
global.bottlecutscene = noone;
global.papercutscene = noone;
global.beachboatcutscene = noone;
global.beachcutscene = noone;
global.sewercutscene = noone;
global.burgercutscene = noone;
global.golfcutscene = noone;
global.anarchistcutscene1 = noone;
global.anarchistcutscene2 = noone;
global.factoryblock = noone;
global.streetcutscene = noone;
global.graffiticutscene = noone;
global.factorygraffiti = noone;
global.factorycutscene = noone;
global.hatcutscene1 = noone;
global.hatcutscene2 = noone;
global.hatcutscene3 = noone;
global.jetpackcutscene = noone;
global.noisecutscene1 = noone;
global.noisecutscene2 = noone;
global.freezercutscene = noone;
global.kidspartycutscene = noone;
global.gasolinecutscene = noone;
global.mansioncutscene = noone;
global.chateaucutscene = noone;
global.ghostsoldiercutscene = noone;
global.mrstickcutscene1 = noone;
global.mrstickcutscene2 = noone;
global.mrstickcutscene3 = noone;
global.chateauswap = noone;
global.warcutscene = noone;
with (obj_player1)
	state = states.normal;
global.loadeditor = false;
if (global.longintro)
{
	global.longintro = false;
	room_goto(Longintro);
}
else
	room_goto(Mainmenu);
instance_destroy(obj_cutscene_handler);
