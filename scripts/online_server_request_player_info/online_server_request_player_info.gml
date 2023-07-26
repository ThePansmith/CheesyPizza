function online_server_request_player_info()
{
	var buffer_id = buffer_create(17, buffer_fixed, 1);
	buffer_write(buffer_id, buffer_u8, network_event_types.Server_Request_Player_Info);
	
	for (var i = 0; i < 16; i++)
			buffer_write(buffer_id, buffer_u8, obj_onlineclient.player_guid[i])
	
	network_send_udp(obj_onlineclient.network_socket, obj_onlineclient.network_ip, obj_onlineclient.network_port, buffer_id, buffer_get_size(buffer_id));
	buffer_delete(buffer_id);
}