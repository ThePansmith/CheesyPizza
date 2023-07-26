/// @desc	Request a UserID
function online_server_request_id()
{
	show_debug_message("Requesting an ID from the server");
	var buffer_id = buffer_create(1, buffer_grow, 1);
	buffer_write(buffer_id, buffer_u8, network_event_types.Server_Request_ID);
	
	var name = "RadixComet";
	
	buffer_write(buffer_id, buffer_string, name);
	
	network_send_udp(obj_onlineclient.network_socket, obj_onlineclient.network_ip, obj_onlineclient.network_port, buffer_id, buffer_get_size(buffer_id));
	buffer_delete(buffer_id);
}