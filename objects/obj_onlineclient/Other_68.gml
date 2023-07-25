function network_data_parse(buffer, size)
{
	var type = buffer_read(buffer, buffer_u32);
	
	switch (type)
	{
		case network_event_types.Server_Request_ID:
			break;
		case network_event_types.Server_Request_End:
			break;
		case network_event_types.Server_Client_Disconnect:
			break;
		case network_event_types.Server_Request_End:
			break;
		case network_event_types.Server_Client_Position_Update:
		
			break;
			
		default:
			show_debug_message($"Received Unknown Event type: {type}");
			break;
	}
	
	buffer_delete(buffer);
}
    // Events for the Client to process

    Client_Request_Server_End,  // Request the server to kill itself (respectfully)
    Client_OtherPlayer_Message_Send,    // Another Player has sent a message
    Client_OtherPlayer_Disconnect,  // Another player has disconnected
switch (async_load[?"type"])
{
	case network_type_connect:
		break;
	case network_type_disconnect:
		break;
	case network_type_data:
		network_data_parse(async_load[?"buffer"], async_load[?"size"]);
		break;
	case network_type_non_blocking_connect:
		break;
}
