/// @description Disconnect
if state != SocketState.Dead
{
	if socket != noone
		network_destroy(socket);
	socket = noone;
	state = SocketState.Dead;
}
else
	trace("[CLIENT] User Event 1: Already dead.");

pto_reset();
with obj_otherplayer
	instance_destroy();
