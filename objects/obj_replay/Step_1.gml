/// @description Record/Push Data

if (!active || replay_file == STRING_UNDEFINED)
	exit;



if record
{
	var input = serialize_input();
	with (obj_player1)
	{
		ext_replay_writestring(room_get_name(room));
		ext_replay_writefloat(x);
		ext_replay_writefloat(y);
		ext_replay_writestring(sprite_get_name(sprite_index));
		ext_replay_writeint16(image_index);
		ext_replay_writeint32(input);
	}
}
if playback
{
	var room_name = ext_replay_readstring();
	var xx = ext_replay_readfloat();
	var yy = ext_replay_readfloat();
	var sprite_index_name = ext_replay_readstring();
	var player_image_index = ext_replay_readint16();
	var input = ext_replay_readint32();
	
	deserialize_input(input);
}










