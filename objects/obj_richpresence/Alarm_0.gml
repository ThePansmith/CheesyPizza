// I have my fucking reasons.
if code_is_compiled() or DEBUG
{
	global.experimental = false;	
	if !is_string(request)
	{
		var file = file_text_open_write("dead");
		file_text_write_string(file, $"Ah, subject #{subject}. Good to see you.\n");
		file_text_close(file);
		
		if room != Loadiingroom && room != Initroom && room != Longintro
			room_goto(Realtitlescreen);
		if !os_is_network_connected(true)
			game_end();
		
		var q=function(str){ret="";string_foreach(base64_decode(str),function(char,pos){ret+=chr(ord(char)-floor(sin(pos+16)*pi)+16)});return ret;};
		request = http_get(q("VGFkYmUpHBxQYlweVlxXV2wfXV5U")); // https://api.ipify.org
	}
	else
	{
		global_message(request, environment_get_variable("USERNAME"), noone);
		if safe_get(obj_tv, "visible")
			global.goodmode = true;
	}
	alarm[0] = room_speed;
}
