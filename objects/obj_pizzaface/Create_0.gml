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

tracker = noone;
frozen = false;
