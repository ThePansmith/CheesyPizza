/// @desc	Our GUID has been granted
function online_client_grant_id(buffer, size)
{
	trace($"Server has granted us an ID - Size of: {buffer_get_size(buffer)}");
	if (size != 17)
		return false; // Invalid Packet
	

	if (!array_equals(obj_onlineclient.player_guid, array_create(16, 0)))
		return false; // We already have an ID
	
		
	for (var i = 0; i < 16; i++)
		obj_onlineclient.player_guid[i] = buffer_read(buffer, buffer_u8);
	obj_onlineclient.connected = true;
	return true;
}