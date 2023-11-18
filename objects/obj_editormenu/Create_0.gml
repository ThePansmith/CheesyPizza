live_auto_call;

// prep
with obj_player
{
	if cyop_backtohubroom == noone
	{
		cyop_backtohubroom = backtohubroom;
		cyop_backtohubx = backtohubstartx;
		cyop_backtohuby = backtohubstarty;
	}
	else
	{
		gamesave_async_load();
		
		backtohubroom = cyop_backtohubroom;
		backtohubstartx = cyop_backtohubx;
		backtohubstarty = cyop_backtohuby;
	}
	state = states.titlescreen;
}
global.leveltorestart = noone;

// lists
towers = [];

recursive_func = function(folder, prefix = "")
{
	if directory_exists(folder)
	{
		// files
		var recursion = [];
			
		var file = file_find_first(concat(folder, "\\*"), fa_directory);
		while file != ""
		{
			var filepath = concat(folder, "\\", file);
			if directory_exists(filepath)
				array_push(recursion, file);
			else
			{
				if string_ends_with(file, ".tower.ini")
				{
					ini_open(filepath);
					
					var type = ini_read_real("properties", "type", 0);
					if type == 0 or type == 1
					{
						var name = ini_read_string("properties", "name", type ? "Unnamed Level" : "Unnamed Tower");
						var struct = {type: type, name: name, file: filepath};
						array_push(towers, struct);
					}
					
					ini_close();
					recursion = [];
					break;
				}
			}
			file = file_find_next();
		}
			
		// look through subfolders
		while array_length(recursion) > 0
		{
			var bwah = array_pop(recursion);
			recursive_func(concat(folder, "\\", bwah), concat(bwah, "\\"));
		}
		return true;
	}
	return false;
}

towers_folder = environment_get_variable("APPDATA") + "\\PizzaTower_GM2";
has_pizzatower = recursive_func(environment_get_variable("APPDATA") + "\\PizzaTower_GM2");
//recursive_func(filename_dir(game_save_id));

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

controls = {
	text: "",
	text_prev: "",
	compiled: noone
}
fader = 1;

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
download_progress = 0;

fetch_remote_towers = function(page = 1)
{
	remote_towers = [];
	
	menu = 1;
	state = 0;
	
	var url = "https://gamebanana.com/apiv11/Mod/Index?_nPerpage=10&_aFilters[Generic_Category]=25679";
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
	trace(url);
	
	if !sprite_exists(remote_towers[index].image)
		remote_towers[index].image = sprite_add(url, 0, false, false, 0, 0);
}
fetch_tower_download = function(index)
{
	if state != 1
		exit;
	
	state = 2;
	var this = remote_towers[index];
	var url = $"https://gamebanana.com/apiv11/Mod/{this.modid}/Files";
	
	request = http_get(url);
}
