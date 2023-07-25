enum network_event_types
{
	// Events for the Server to process
    Server_Request_ID, // The user has requested an ID
    Server_Request_End, // The user has requested that the server kills itself (respectfully)
    Server_Client_Disconnect, // A Client has disconnected
    Server_Client_Position_Update, // A client has updated it's position


    // Events for the Client to process
	Client_ID_Grant, // Server has granted us an ID
    Client_Request_Server_End,  // Request the server to kill itself (respectfully)
    Client_OtherPlayer_Message_Send,    // Another Player has sent a message
    Client_OtherPlayer_Disconnect,  // Another player has disconnected
}

global.network_socket = network_create_socket(network_socket_udp);
connected = false;
player_guid = 0;