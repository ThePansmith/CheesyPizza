/// @desc	Disconnect from the Online Server
function server_disconnect()
{
	var buffer_id = buffer_create(4, buffer_grow, 4);
	buffer_write(buffer_id, buffer_u32, network_event_types.server_disconnect);
	buffer_delete(buffer_id);
}