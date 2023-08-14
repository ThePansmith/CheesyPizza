/// @description Record/Push Data

if (!active || replay_file == STRING_UNDEFINED)
	exit;



if record
{
	var input = serialize_input();
	with (obj_player1)
	{
		ptcu_replay_writestring(room_get_name(room));
		ptcu_replay_writefloat(x);
		ptcu_replay_writefloat(y);
		ptcu_replay_writestring(sprite_get_name(sprite_index));
		ptcu_replay_writeint16(image_index);
		ptcu_replay_writeint32(input);
	}
}
if playback
{
	var room_name = ptcu_replay_readstring();
	var xx = ptcu_replay_readfloat();
	var yy = ptcu_replay_readfloat();
	var sprite_index_name = ptcu_replay_readstring();
	var player_image_index = ptcu_replay_readint16();
	var input = ptcu_replay_readint32();
	
	deserialize_input(input);
}










