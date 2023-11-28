init_collision();
cow = true;
state = 0; // not an enum
alarm[0] = 50;
alertmax = 5;
alertvisible = true;
alarm[1] = alertmax;
create_red_afterimage(x, y, sprite_index, image_index - 1, image_xscale);
alarm[3] = 10;
