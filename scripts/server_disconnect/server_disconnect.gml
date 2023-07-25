/// @desc	Disconnect from the Online Server
function server_disconnect()
{
	var buffer_id = buffer_create(4, buffer_grow, 4);
	buffer_write(buffer_id, buffer_u32, network_event_types.Server_Client_Disconnect);
	buffer_delete(buffer_id);
}