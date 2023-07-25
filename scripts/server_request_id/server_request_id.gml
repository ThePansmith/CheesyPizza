/// @desc	Request a UserID
function server_request_id()
{
	var buffer_id = buffer_create(4, buffer_grow, 4);
	buffer_write(buffer_id, buffer_u32, network_event_types.server_request_id);
	buffer_delete(buffer_id);
}