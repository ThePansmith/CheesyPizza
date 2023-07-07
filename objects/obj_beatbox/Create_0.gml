scr_initenemy();
vsp = -11;
depth = -3;
snd = fmod_event_create_instance("event:/sfx/misc/breakdancemusic");
if obj_player1.character == "N"
	fmod_event_instance_set_parameter(snd, "state", 1, true);
sound_instance_move(snd, x, y);
fmod_event_instance_play(snd);
sound_play_oneshot_3d("event:/sfx/misc/breakdance", obj_player1.x, obj_player1.y);
