maxspeed = 8;
image_speed = 0.35;
depth = -5;
savedcx = camera_get_view_x(view_camera[0]);
savedcy = camera_get_view_y(view_camera[0]);
savedx = x;
savedy = y;
x = obj_player1.x;
y = obj_player1.y;
alarm[1] = 10;
image_alpha = 0;
treasure = false;
snd = fmod_event_create_instance("event:/sfx/pizzaface/moving");

if MOD.Lap3
	slow_snd = fmod_event_create_instance("event:/sfx/pizzahead/haywire");

tracker = noone;
frozen = false;

spr_idle = spr_pizzaface;
spr_docile = spr_pizzaface_docile;
spr_toangry = spr_pizzaface_attackend;
spr_todocile = spr_pizzaface_recovering;
spr_haywire = spr_pizzahead_haywire;

if SUGARY
	spr_idle = spr_coneball;
if MIDWAY
	spr_idle = spr_pizzaface_bo;

sprite_index = spr_idle;
if MOD.DeathMode
{
    sprite_index = spr_docile;
    destroyable = 0;
	
	mode = 0;
	end_turn = 0;
}
hsp = 0;
vsp = 0;
state = states.chase;
flash = false;

if REMIX
	depth = obj_drawcontroller.depth + 1;
