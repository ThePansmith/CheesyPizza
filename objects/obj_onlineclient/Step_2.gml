if state != SocketState.Connected
	exit;

if handle == noone
	exit;

if --timer <= 0
{
	timer = 2;
	
	pto_update();
	with instance_find(obj_player1, 0) // only one
		pto_update_player();
}
