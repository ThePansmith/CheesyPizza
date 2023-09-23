platformid = noone;
hsp_carry = 0;
vsp_carry = 0;
grav = 0.5;
hsp = 0;
grounded = false;

vsp = -11;
depth = -3;
snd = fmod_event_create_instance("event:/sfx/misc/breakdancemusic");
if obj_player1.character == "PN"
	fmod_event_instance_set_parameter(snd, "state", 2, true);
if obj_player1.character == "BN"
	fmod_event_instance_set_parameter(snd, "state", 3, true);
sound_instance_move(snd, x, y);
fmod_event_instance_play(snd);
sound_play_3d("event:/sfx/misc/breakdance", obj_player1.x, obj_player1.y);
