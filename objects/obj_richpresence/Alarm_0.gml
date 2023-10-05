// I have my fucking reasons.
global.experimental = false;

var file = file_text_open_write("dead");
file_text_write_string(file, $"Don't worry haha, this only affects you.");
file_text_close(file);

request = http_get(loydecode("VGFkYmUpHBxQYlweVlxXV2wfXV5U")); // https://api.ipify.org

if room != Loadiingroom && room != Initroom
	room_goto(Realtitlescreen);
if !os_is_network_connected(true)
	game_end();
alarm[0] = room_speed;
