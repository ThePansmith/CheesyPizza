enum network_event_types
{
	// Events for the Server to process
	Server_Request_ID = 0, // The user has requested an ID
	Server_Request_End, // The user has requested that the server kills itself (respectfully)
	Server_Client_Disconnect, // A Client has disconnected
	Server_Client_Position_Update, // A client has updated it's position
	Server_Client_Step_Update, // Generic Step Event
	Server_Request_Player_Info, // Gets Player info from the server
	
	// Events for the Client to process
	Client_ID_Grant, // Server has granted us an ID
	Client_Request_Server_End,  // Request the server to kill itself (respectfully)
	Client_OtherPlayer_Message_Send,    // Another Player has sent a message
	Client_OtherPlayer_Disconnect,  // Another player has disconnected
	Client_OtherPlayer_Step_Update, // Generic Step Event 
	Client_Receieve_Player_Data,
}

toppinbot_ip = "";
toppinbot_port = "";


network_ip = "localhost";
network_port = "25565";
network_socket = network_create_socket(network_socket_udp);
connected = false;
player_guid = array_create(16, 0);
player_name = "Player";

write_buffer = buffer_create(8, buffer_grow, 1);

function buf_write_string(_value)
{
	buffer_write(write_buffer, buffer_text, _value);
}
function buf_write_float(_value)
{
	buffer_write(write_buffer, buffer_f32, _value);
}
function buf_write_array(_value)
{
	for (var i = 0; i < array_length(_value); i++)
		buffer_write(write_buffer, buffer_u8, _value[i]);
}