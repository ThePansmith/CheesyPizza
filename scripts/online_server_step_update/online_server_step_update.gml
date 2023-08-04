function online_server_step_update()
{
	var buffer_id = buffer_create(12, buffer_grow, 1);
	buffer_write(buffer_id, buffer_u8, network_event_types.Server_Client_Step_Update);
	
	for (var i = 0; i < 16; i++)
			buffer_write(buffer_id, buffer_u8, obj_onlineclient.player_guid[i])
			
	buffer_write(buffer_id, buffer_f32, obj_player1.x);
	buffer_write(buffer_id, buffer_f32, obj_player1.y);
	buffer_write(buffer_id, buffer_f32, obj_player1.image_index);
	buffer_write(buffer_id, buffer_string, sprite_get_name(obj_player1.sprite_index));
	buffer_write(buffer_id, buffer_f32, obj_player1.image_xscale);
	buffer_write(buffer_id, buffer_f32, obj_player1.image_yscale);
	network_send_udp(obj_onlineclient.network_socket, obj_onlineclient.network_ip, obj_onlineclient.network_port, buffer_id, buffer_get_size(buffer_id));
	buffer_delete(buffer_id);
}