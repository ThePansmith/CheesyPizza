hsp = 0;
vsp = 0;
hsp_carry = 0;
vsp_carry = 0;
grav = 0.5;
platformid = -4;
grounded = false;
usepalette = false;
start = false;
stunspr = -4;
angryspr = -4;
use_collision = true;

particle_set_scale(part.jumpdust, -1, 1);
create_particle(x, y + 10, part.jumpdust);
