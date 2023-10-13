hsp = 0;
vsp = 0;
hsp_carry = 0;
vsp_carry = 0;
grav = 0.5;
platformid = noone;
steppy = false;
depth = -4;
snd = fmod_event_create_instance("event:/sfx/hub/gusrun");
sniffsnd = fmod_event_create_instance("event:/sfx/rat/ratsniff");
sound_instance_move(sniffsnd, x, y);

if check_char("G")
	instance_destroy(id, false);
