#macro PTT_Version "1.2.1"
#macro Debug (GM_build_type == "run")
#macro Online (global.Net_Mode == 1)
#macro OfflineBuild false

// Load configuration
global.Net_Ip = "play.pizzatowertogether.com"
global.Net_Port = 6666
global.Net_Name = "Player"
global.Net_ID = -1
global.Net_Paletted = false
global.Net_ChatHint = false


global.Net_Online = false
global.Net_Logged = false
global.Net_Clients = ds_map_create()

global.Net_PlayerCount = 0
global.Net_Admin = false
global.Net_LastMsg = 0
global.Net_Mode = 0 // 0 - offline, 1 - online


global.colors = ds_map_create()
global.colors[? "aqua"] = c_aqua
global.colors[? "black"] = c_black
global.colors[? "blue"] = c_blue
global.colors[? "darkgray"] = c_dkgray
global.colors[? "fuscia"] = c_fuchsia
global.colors[? "gray"] = c_gray
global.colors[? "green"] = c_green
global.colors[? "lime"] = c_lime
global.colors[? "lightgray"] = c_ltgray
global.colors[? "maroon"] = c_maroon
global.colors[? "navy"] = c_navy
global.colors[? "olive"] = c_olive
global.colors[? "orange"] = c_orange
global.colors[? "purple"] = c_purple
global.colors[? "red"] = c_red
global.colors[? "silver"] = c_silver
global.colors[? "teal"] = c_teal
global.colors[? "white"] = c_white
global.colors[? "yellow"] = c_yellow

ini_open("cfg.ini")
global.Net_Color_Me = global.colors[? ini_read_string("config", "mycolor", "yellow")]
global.Net_Color_Others = global.colors[? ini_read_string("config", "othercolor", "white")]
global.Net_Key = ini_read_string("config", "key", "")
ini_close();

// failsafe, if the color wasn't in the list
if global.Net_Color_Me == undefined
    global.Net_Color_Me = c_yellow;

if global.Net_Color_Others == undefined
    global.Net_Color_Me = c_white;
	
reconnect = 5;