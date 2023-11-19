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

root_folder = environment_get_variable("APPDATA") + "\\PizzaTower_GM2";
towers_folder = root_folder + "\\towers";

refresh_list = function()
{
	towers = [];
	has_pizzatower = find_files_recursive(towers_folder, function(file)
	{
		ini_open(file);
	
		var type = ini_read_real("properties", "type", 0);
		if type == 0 or type == 1
		{
			var name = ini_read_string("properties", "name", type ? "Unnamed Level" : "Unnamed Tower");
			var struct = {type: type, name: name, file: file};
			array_push(towers, struct);
		}
	
		ini_close();
		return true; // stop recursion on this folder
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

download_index = 0;
download_progress = 0;
download_file = noone;

fetch_remote_towers = function(page = 1)
{
	scroll = 0;
	image_cleanup();
	remote_towers = [];
	
	menu = 1;
	state = 0;
	
	var url = "https://gamebanana.com/apiv11/Mod/Index?_nPerpage=20&_aFilters[Generic_Category]=22962";
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
	if state != 1
		exit;
	
	download_index = index;
	state = 2;
	
	var this = remote_towers[index];
	var url = $"https://gamebanana.com/apiv11/Mod/{this.modid}/Files";
	
	request = http_get(url);
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
