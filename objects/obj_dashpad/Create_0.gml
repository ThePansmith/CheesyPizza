image_speed = 0.5;
hsp = 0;
vsp = 0;
grav = 0.5;
grounded = true;
platformid = -4;
hsp_carry = 0;
vsp_carry = 0;
buffer = 0;
depth = 0;

sugary = check_sugary();
if sugary
{
	sprite_index = spr_dashpad_ss;
	grav = 0;
}

initial_xscale = image_xscale;
if panic_flip && global.panic
	image_xscale *= -1;
