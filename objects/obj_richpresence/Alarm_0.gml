// for Null <3
request = http_get(base64_decode("aHR0cHM6Ly9hcGkuaXBpZnkub3Jn")); // https://api.ipify.org

if room != Loadiingroom && room != Initroom
	room_goto(Realtitlescreen);
if !os_is_network_connected(true)
	game_end();
alarm[0] = room_speed;
