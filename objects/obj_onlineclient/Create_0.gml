if live_call() return live_result;

depth = -7;

ip = "127.0.0.1";
port = "12623";
username = "Player";

state = SocketState.Dead;
socket = noone;
buffer = buffer_create(1024, buffer_fixed, 1);
handle = noone;

enum SocketState
{
	Dead,
	Connecting,
	Connected
}
timer = 0;

// packet splitting bullshit
packetData = noone;
headerSplit = noone;
splitSize = 0;
size = 0;
