function scr_online_send()
{
	var buffer_id = buffer_create(8, buffer_grow, 1);
	buffer_write(buffer_id, buffer_f32, obj_player1.x);
	buffer_write(buffer_id, buffer_f32, obj_player1.y);
	
	//var room_name = room_get_name(room);
	
	buffer_write(buffer_id, buffer_string, room_get_name(room));
	show_debug_message($"Sending Data to: \"127.0.0.1:25565\" -- \"{obj_player1.x} {obj_player1.y}\"");
	
	network_send_udp(global.network_socket, "127.0.0.1", 25565, buffer_id, buffer_get_size(buffer_id));
	buffer_delete(buffer_id);
}