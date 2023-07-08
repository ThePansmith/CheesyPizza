function replay_record_push_framedata()
{
	with (obj_player)
	{
		if (x != -1000 && y != -1000)
		{
			show_debug_message($"X: {x} Y: {y} Sprite: {sprite_index} Index: {image_index}");
			ext_replay_writenumber(x);
			ext_replay_writenumber(y);
			ext_replay_writenumber(sprite_index);
			ext_replay_writenumber(image_index);
		}
	}
}