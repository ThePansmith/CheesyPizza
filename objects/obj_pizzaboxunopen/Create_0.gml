image_speed = 0.35;
content = obj_pizzakinshroom;
depth = 0;
subimg = 0;
image_speed = 0.35;
start = false;
image_xscale = 1;
snd = fmod_event_create_instance("event:/sfx/misc/toppinhelp");
scr_fmod_soundeffect(snd, x, y);

sugary = check_sugary();
if sugary
	sprite_index = spr_confecticage;
