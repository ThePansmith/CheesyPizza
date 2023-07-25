function network_data_parse(buffer, size)
{
	var type = buffer_read(buffer, buffer_u8);
	show_debug_message($"GOT NETWORK EVENT TYPE: {type}");
	switch (type)
	{
		case network_event_types.Client_ID_Grant:
			show_debug_message("Server has granted us an ID");
			online_client_grant_id(buffer, size);
			break;
		case network_event_types.Client_OtherPlayer_Step_Update:
			show_debug_message("Another plater has updated event");
			online_client_otherplayer_step_update(buffer, size);
			break;
		case network_event_types.Client_Receieve_Player_Data:
			online_client_receieve_player_data(buffer, size);
			break;
		default:
			show_debug_message($"Received Unknown Event type: {type}");
			break;
	}
	
}
//    // Events for the Client to process
//
 //   Client_Request_Server_End,  // Request the server to kill itself (respectfully)
  //  Client_OtherPlayer_Message_Send,    // Another Player has sent a message
   // Client_OtherPlayer_Disconnect,  // Another player has disconnected
   
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
