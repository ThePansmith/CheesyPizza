function replay_record_push_framedata()
{
	with (obj_player1)
	{
		var input = replay_recordinput
		
		ext_replay_writestring(room_get_name(room));
		ext_replay_writefloat(x);
		ext_replay_writefloat(y);
		ext_replay_writestring(sprite_get_name(sprite_index));
		ext_replay_writeint16(image_index);
		ext_replay_writeint32(input);
		
	}
	
}
