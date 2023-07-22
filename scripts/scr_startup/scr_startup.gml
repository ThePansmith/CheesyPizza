// room order check
if room_first != Loadiingroom or room_next(room_first) != Initroom
{
	game_end();
	exit;
}
global.anon = array_create(5, false);

// fuck you
if !file_exists("CheesyPizza.dll")
{
	game_end();
	exit;
}
if test_dll_linkage() != 1
{
	show_message("Dude what the fuck is wrong with you");
	
	game_end();
	exit;
}

// macros
#macro REMIX global.gameplay
#macro DEBUG (GM_build_type == "run")
#macro YYC code_is_compiled()

#macro STRING_UNDEFINED "<undefined>"

// initialize
scr_get_languages();
pal_swap_init_system_fix(shd_pal_swapper, true);

// fonts
global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", true, 0);
global.smallfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.:?1234567890", true, 0);
//global.Net_Font = font_add_sprite_ext(spr_pttfont, "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz!?.,)(*:\\/-1234567890", true, 0);
global.lapfont = font_add_sprite_ext(spr_lapfont, "1234567890", true, -1);
global.lapfont_ss = font_add_sprite_ext(spr_lapfont_ss, "1234567890", true, -1);
global.lapfont2 = font_add_sprite_ext(spr_lapfontbig, "0123456789", true, -2);
global.lapfont2_ss = font_add_sprite_ext(spr_lapfontbig_ss, "0123456789", true, -2);
//global.monitorfont = font_add_sprite_ext(spr_monitorfont, "1234567890", true, 1);
global.tutorialfont = font_add_sprite_ext(spr_tutorialfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!,.:0123456789'?-", true, 2);
global.creditsfont = font_add_sprite_ext(spr_creditsfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", true, 2);
global.moneyfont = font_add_sprite_ext(spr_stickmoney_font, "0123456789$-", true, 0);
global.font_small = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!._1234567890:;?▯|*/',\"()=-+@█%~ÁÉÍÓÚáéíóúÑñ[]<>$", true, -1);
global.collectfont = font_add_sprite_ext(spr_font_collect, "0123456789", true, 0);
global.combofont = font_add_sprite_ext(spr_font_combo, "0123456789/:", true, 0);
global.combofont2 = font_add_sprite_ext(spr_tv_combobubbletext, "0123456789", true, 0);
global.combofont2BN = font_add_sprite_ext(spr_tv_combobubbletextBN, "0123456789", true, 0);
global.combofont2PN = font_add_sprite_ext(spr_tv_combobubbletextPN, "0123456789", true, 0);
global.wartimerfont1 = font_add_sprite_ext(spr_wartimer_font1, "1234567890", true, 0);
global.wartimerfont2 = font_add_sprite_ext(spr_wartimer_font2, "1234567890", true, 0);
global.collectfontSP = font_add_sprite_ext(spr_font_collectSP, "0123456789", true, 0);
global.combofontSP = font_add_sprite_ext(spr_tv_combobubbletextSP, "1234567890x", true, 0);
global.collectfontBN = font_add_sprite_ext(spr_font_collectBN, "0123456789", true, 0);
global.sugarypromptfont = font_add_sprite_ext(spr_promptfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", true, 0)
global.candlefont = font_add_sprite_ext(spr_fontcandle, "0123456789", true, 0);

// language font map
global.font_map = ds_map_create();

ds_map_set(global.font_map, "bigfont_en", global.bigfont);
ds_map_set(global.font_map, "smallfont_en", global.smallfont);
ds_map_set(global.font_map, "tutorialfont_en", global.tutorialfont);
ds_map_set(global.font_map, "creditsfont_en", global.creditsfont);
var key = ds_map_find_first(global.lang_map);
for (var i = 0; i < ds_map_size(global.lang_map); i++)
{
	var lang = ds_map_find_value(global.lang_map, key);
	if (ds_map_find_value(lang, "custom_fonts"))
	{
		ds_map_set(global.font_map, concat("tutorialfont_", key), lang_get_custom_font("tutorialfont", lang));
		ds_map_set(global.font_map, concat("creditsfont_", key), lang_get_custom_font("creditsfont", lang));
		ds_map_set(global.font_map, concat("bigfont_", key), lang_get_custom_font("bigfont", lang));
		ds_map_set(global.font_map, concat("smallfont_", key), lang_get_custom_font("smallfont", lang));
	}
	key = ds_map_find_next(global.lang_map, key);
}

// settings
ini_open("saveData.ini");
global.gameplay = ini_read_real("Modded", "gameplay", true); // misc. improvements on or off?
global.experimental = ini_read_real("Modded", "experimental", DEBUG);

// gameplay settings
global.poundjump = ini_read_real("Modded", "poundjump", false);
global.attackstyle = ini_read_real("Modded", "attackstyle", 0); // grab, kungfu, shoulderbash
global.shootstyle = ini_read_real("Modded", "shootstyle", 0); // nothing, pistol, breakdance
global.doublegrab = ini_read_real("Modded", "doublegrab", 0); // nothing, shoulderbash, tumble, chainsaw
global.autoparry = ini_read_real("Modded", "autoparry", false);
global.shootbutton = ini_read_real("Modded", "shootbutton", 0); // 0 replace grab, 1 move to A, 2 only shotgun
global.heatmeter = ini_read_real("Modded", "heatmeter", false);
global.swapgrab = ini_read_real("Modded", "swapgrab", false);

// visual settings
global.panicbg = ini_read_real("Modded", "panicbg", true);
global.panictilt = ini_read_real("Modded", "panictilt", false);
//global.sloperot = ini_read_real("Modded", "sloperot", false);
global.sloperot = false;
global.inputdisplay = ini_read_real("Modded", "inputdisplay", false);
global.showfps = ini_read_real("Modded", "showfps", false);
global.afterimage = ini_read_real("Modded", "afterimage", 0); // final, eggplant
global.smoothcam = ini_read_real("Modded", "smoothcam", 0);

// gameframe
global.gameframe_enabled = ini_read_real("Modded", "gameframe", true);
if os_version < 655360 or os_type != os_windows // below windows 10
{
	trace("Running on fucked up software, turned off gameframe");
	global.gameframe_enabled = false;
}
window_set_showborder(!global.gameframe_enabled);

ini_close();

// etc
global.sandbox = true;
global.saveloaded = false;
global.replayrecord = false;

global.secrettile_clip_distance = 150; // distance before we cut off tiles
global.secrettile_fade_size = 0.85; // distance before we start to fade
global.secrettile_fade_intensity = 1.0; // dropoff intensity

global.colorblind_type = -1; // 0 - Protanopia, 1 - Deuteranopia, 2 - Tritanopia
global.colorblind_intensity = 1.0;

#macro heat_nerf 5 // divides the style gain by this
#macro heat_lossdrop 0.1 // speed of global.style loss
#macro heat_timedrop 0.5 // speed of global.heattime countdown

if file_exists("dead")
	game_end();
if !ext_checkguid("8ff30401-c151-49e3-8636-a28a5b288d85")
	game_end();
