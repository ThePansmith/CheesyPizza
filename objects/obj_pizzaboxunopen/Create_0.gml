image_speed = 0.35;
depth = 0;
subimg = 0;
image_speed = 0.35;
start = false;
image_xscale = 1;
snd = fmod_event_create_instance("event:/sfx/misc/toppinhelp");
scr_fmod_soundeffect(snd, x, y);

sugary = SUGARY;
if sugary
	sprite_index = spr_confecticage;

bo = MIDWAY;
if bo
	sprite_index = spr_pizzaboxunopen_bo;
