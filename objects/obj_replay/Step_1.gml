latest_input = 0;

if (!active || replay_file == STRING_UNDEFINED)
	exit;

if record
{
	var input = obj_replay.serialize_input();
	pto_replay_writestring(room_get_name(room));
	//pto_replay_writefloat(x);
	//pto_replay_writefloat(y);
	//pto_replay_writestring(sprite_get_name(sprite_index));
	//pto_replay_writefloat(image_index);
	pto_replay_writeint32(input);
}

if playback
{
	trace($"============= FRAME START =============");
	if pto_replay_tell() >= obj_replay.replay_dictionary_pos 
		event_user(3);
	trace($"pos: {pto_replay_tell()} / {obj_replay.replay_dictionary_pos}");
	//trace($"room ID: {pto_replay_readint8()}");
	//pto_replay_seek(pto_replay_tell() - 1);
	var room_name = pto_replay_readstring();
	//trace($"[REPLAY] - room_name: {room_name} pos: {pto_replay_tell()}");
	//var xx = pto_replay_readfloat();
	//var yy = pto_replay_readfloat();
	//trace($"[REPLAY] xx: {xx} yy: {yy} pos: {pto_replay_tell()}");
	//trace($"[REPLAY] - Reading sprite name pos: {pto_replay_tell()}");
	//var sprite_index_name = pto_replay_readstring();
	//var player_image_index = pto_replay_readfloat();
	latest_input = pto_replay_readint32();
	trace($"input: {latest_input} type: {typeof(latest_input)}");

	
	trace($"============= FRAME END =============");
}