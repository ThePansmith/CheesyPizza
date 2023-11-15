/// @description Connect
if state == SocketState.Dead
{
	if os_is_network_connected(true)
	{
		socket = network_create_socket(network_socket_tcp);
		network_connect_raw_async(socket, ip, real(port));
		state = SocketState.Connecting;
	}
	else
		trace("[CLIENT] Offline");
}
else
	trace("[CLIENT] User Event 0: Already connected/connecting.");
