//if live_call() return live_result;
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
if move_hor != 0
{
	var selprev = sel.game;
	sel.game = clamp(sel.game + move_hor, 0, array_length(sections) - 1);
	
	if sel.game != selprev
	{
		if global.jukebox != noone && global.jukebox.sel.game == sel.game
			sel.song = global.jukebox.sel.song;
		else
			sel.song = 0;
		
		charshift[0] = move_hor * 25;
		charshift[2] = 0;
		sound_play(sfx_angelmove);
	}
}
charshift[0] = lerp(charshift[0], 0, 0.25);
charshift[1] = lerp(charshift[1], 0, 0.25);
charshift[2] = lerp(charshift[2], 1, 0.25);

var song = sections[sel.game].songs[sel.song];
if key_jump
{
	image_index = 8;
	xo = 10;
	
	if global.jukebox != noone
	{
		fmod_event_instance_stop(global.jukebox.instance, true);
		fmod_event_instance_release(global.jukebox.instance);
		
		if song[0] != global.jukebox.name
			global.jukebox = noone;
	}
	if global.jukebox == noone
	{
		var inst = fmod_event_create_instance(song[0]);
		fmod_event_instance_play(inst);
		
		global.jukebox = {
			instance: inst,
			name: song[0],
			sel: {song: sel.song, game: sel.game}
		};
	}
	else
		global.jukebox = noone;
}
xo = lerp(xo, 0, 0.25);
