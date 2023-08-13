if live_call() return live_result;
event_inherited();

if move_ver != 0
{
	var length = array_length(sections[sel.game].songs) - 1;

	sel.song += move_ver;
	sel.song = wrap(sel.song, 0, length);
	
	while !is_array(sections[sel.game].songs[sel.song])
	{
		sel.song += move_ver;
		sel.song = wrap(sel.song, 0, length);
	}
	
	charshift[1] = move_ver * 50;
	charshift[2] = 0;
	sound_play(sfx_step);
}
charshift[0] = lerp(charshift[0], 0, 0.25);
charshift[1] = lerp(charshift[1], 0, 0.25);
charshift[2] = lerp(charshift[2], 1, 0.25);
