/// @description Record/Push Data
if record
{
	if replay_file == STRING_UNDEFINED
		exit; // RX: probably waiting for room transition
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
	deserialize_input();











