scr_initenemy();
vsp = -11;
depth = -3;
snd = fmod_event_create_instance("event:/sfx/misc/breakdancemusic");
if obj_player1.character == "P" && !obj_player1.ispeppino
	fmod_event_instance_set_parameter(snd, "state", 1, true);
fmod_event_instance_set_3d_attributes(snd, x, y);
fmod_event_instance_play(snd);
fmod_event_one_shot_3d("event:/sfx/misc/breakdance", obj_player1.x, obj_player1.y);
