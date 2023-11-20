live_auto_call;

// prep
with obj_player
{
	if cyop_backtohubroom == noone
	{
		if is_string(backtohubroom)
			backtohubroom = tower_entrancehall;
		
		cyop_backtohubroom = backtohubroom;
		cyop_backtohubx = backtohubstartx;
		cyop_backtohuby = backtohubstarty;
	}
	else
	{
		do {} until obj_savesystem.state == 0 && !obj_savesystem.dirty; // wait? idk if this works
		gamesave_async_load();
		trace("Switched savefiles: ", get_savefile_ini());
		
		backtohubroom = cyop_backtohubroom;
		backtohubstartx = cyop_backtohubx;
		backtohubstarty = cyop_backtohuby;
	}
	state = states.titlescreen;
}
global.leveltorestart = noone;

// lists
towers = [];

root_folder = environment_get_variable("APPDATA") + "\\PizzaTower_GM2";
towers_folder = root_folder + "\\towers";

add_tower = function(ini, fresh = false)
{
	ini_open(ini);
	
	var type = ini_read_real("properties", "type", 0);
	var mainlevel = ini_read_string("properties", "mainlevel", "");
	var name = ini_read_string("properties", "name", type ? "Unnamed Level" : "Unnamed Tower");
	
	var struct = {
		type: type, name: name, file: ini,
		collect: 0, secrets: 0, treasure: false, rank: "", toppin: [0, 0, 0, 0, 0],
		corrupt: false, fresh: fresh
	};
	
	if !file_exists($"{filename_dir(ini)}\\levels\\{mainlevel}\\level.ini")
		struct.corrupt = true;
	if !(type == 0 or type == 1)
		struct.corrupt = true;
	
	ini_close();
	
	// read savefile for single levels
	if type == 1
	{
		ini_open($"{get_save_folder()}\\custom{global.currentsavefile}\\{filename_name(filename_dir(ini))}.ini");
		struct.collect = ini_read_real("Highscore", mainlevel, 0);
		struct.treasure = ini_read_real("Treasure", mainlevel, false);
		struct.toppin = [
			ini_read_real("Toppin", mainlevel + "1", false),
			ini_read_real("Toppin", mainlevel + "2", false),
			ini_read_real("Toppin", mainlevel + "3", false),
			ini_read_real("Toppin", mainlevel + "4", false),
			ini_read_real("Toppin", mainlevel + "5", false)
		];
		struct.secrets = ini_read_real("Secret", mainlevel, 0);
		struct.rank = ini_read_string("Ranks", mainlevel, "");
		ini_close();
	}
	
	// add to towers
	array_push(towers, struct);
}
refresh_list = function()
{
	towers = [];
	has_pizzatower = find_files_recursive(towers_folder, function(file)
	{
		add_tower(file);
		return true;
	}, ".tower.ini");
}
refresh_list();
//array_push(towers, {type: 0, name: "BALLSACK CITY", file: ""});

sel = {
	x: 0,
	y: 0
}
cam = {
	x: 0,
	y: 0
}
textscroll = 0;
movehold = -1;
state = 0;
menu = 0;

smooth_buffer = 2;
scr_init_input();
pto_textbox_init();

controls = {
	text: "",
	text_prev: "",
	compiled: noone
}
fader = 1;

shake = 0;

// remote
enum gb_filter
{
	None,
	MostDownloaded,
	MostLiked,
	MostViewed
}

remote_towers = [];
page = 1;
filter = 0;
last_page = false;
request = noone;
scroll = 0;

downloads = [];
download_count = 0;

fetch_remote_towers = function(page = 1)
{
	if download_count > 0
	{
		message_show("There are pending downloads!");
		exit;
	}
	
	scroll = 0;
	image_cleanup();
	
	var count = 18;
	remote_towers = [];
	downloads = array_create(count, noone);
	
	menu = 1;
	state = 0;
	
	var url = $"https://gamebanana.com/apiv11/Mod/Index?_nPerpage={count}&_aFilters[Generic_Category]=22962";
	url += $"&_nPage={page}";
	
	switch filter
	{
		case gb_filter.MostDownloaded:
			url += "&_sSort=Generic_MostDownloaded";
			break;
		case gb_filter.MostLiked:
			url += "&_sSort=Generic_MostLiked";
			break;
		case gb_filter.MostViewed:
			url += "&_sSort=Generic_MostViewed";
			break;
	}
	
	request = http_get(url);
}
fetch_tower_image = function(index)
{
	var url = remote_towers[index].imagelink;
	if !sprite_exists(remote_towers[index].image)
		remote_towers[index].image = sprite_add(url, 0, false, false, 0, 0);
}
fetch_tower_download = function(index)
{
	if downloads[index] == noone
	{
		var this = remote_towers[index];
		var url = $"https://gamebanana.com/apiv11/Mod/{this.modid}/Files";
		
		download_count++;
		downloads[index] = {
			state: 0,
			request: http_get(url),
			file: noone,
			progress: 0
		}
	}
}
image_cleanup = function()
{
	for(var i = 0; i < array_length(remote_towers); i++)
	{
		if remote_towers[i].image != noone
		{
			trace($"Deleted image for tower {remote_towers[i].modid}");
			sprite_delete(remote_towers[i].image);
		}
	}
}
with obj_shell
	WC_bindsenabled = false;
