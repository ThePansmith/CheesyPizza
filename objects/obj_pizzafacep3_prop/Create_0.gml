init_collision();
usepalette = false;
start = false;
stunspr = noone;
angryspr = noone;
use_collision = true;

particle_set_scale(part.jumpdust, -1, 1);
create_particle(x, y + 10, part.jumpdust);
