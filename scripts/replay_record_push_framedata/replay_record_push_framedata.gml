function replay_record_push_framedata()
{
	with (obj_player1)
	{
		show_debug_message($"X: {x} Y: {y} Sprite: {sprite_index} Index: {image_index}");
		ext_replay_writefloat(x);
		ext_replay_writefloat(y);
		ext_replay_writeint16(sprite_index);
		ext_replay_writeint8(image_index);
		
	}
}