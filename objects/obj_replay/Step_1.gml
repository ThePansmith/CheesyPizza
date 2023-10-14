/// @description Record/Push Data

if (!active || replay_file == STRING_UNDEFINED)
	exit;



if record
{
	var input = serialize_input();
	with (obj_player1)
	{
		pto_replay_writestring(room_get_name(room));
		//pto_replay_writefloat(x);
		//pto_replay_writefloat(y);
		//pto_replay_writestring(sprite_get_name(sprite_index));
		//pto_replay_writefloat(image_index);
		pto_replay_writeint32(input);
	}
}


if playback
{
	var room_name = pto_replay_readstring();
	//trace($"[REPLAY] - room_name: {room_name} pos: {pto_replay_tell()}");
	//var xx = pto_replay_readfloat();
	//var yy = pto_replay_readfloat();
	//trace($"[REPLAY] xx: {xx} yy: {yy} pos: {pto_replay_tell()}");
	//trace($"[REPLAY] - Reading sprite name pos: {pto_replay_tell()}");
	//var sprite_index_name = pto_replay_readstring();
	//var player_image_index = pto_replay_readfloat();
	var input = pto_replay_readint32();
	
	deserialize_input(input);
}










