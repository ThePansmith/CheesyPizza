if (vsp < 20)
	vsp += grav;
if (buffer > 0)
	buffer--;
if (d > 150)
	d -= 20;
make_colour_hsv(255, 255, d);
x += hsp;
y += floor(vsp);
