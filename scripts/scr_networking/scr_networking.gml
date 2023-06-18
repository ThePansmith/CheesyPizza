function sendString(string_or_struct)
{
	if !Online exit;
	var arg1 = string_or_struct;
	
	// turn it into a string if it's not
	if is_struct(arg1)
		arg1 = json_stringify(arg1);
	
	// format it properly
	//arg1 = string_replace_all(arg1, " ", ""); 
	// ^ Dont do this bcuz it ruins messages
	arg1 = string_replace_all(arg1, ".0,", ","); // convert float to integer
	arg1 = string_replace_all(arg1, ".0}", "}");
	arg1 += "\n"
	
	// SEND IT
	var buffer = buffer_create(string_byte_length(arg1), buffer_fixed, 1)
	buffer_write(buffer, buffer_text, arg1)
		
	network_send_raw(global.Net_Client, buffer, buffer_get_size(buffer))	
	buffer_delete(buffer)
}
function serverConnect(ip = global.Net_Ip, port = global.Net_Port)
{
	show_debug_message(ip + " " + string(port))
	global.Net_Ip = ip;
	global.Net_Port = port;
	global.Net_Mode = 1;
	
	if !global.Net_Online
	{
		global.Net_Client = network_create_socket(network_socket_tcp)
		global.Net_Server = network_connect_raw_async(global.Net_Client, global.Net_Ip, global.Net_Port)
	}
}
