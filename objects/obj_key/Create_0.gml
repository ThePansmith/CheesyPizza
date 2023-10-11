if room == rm_editor
	exit;

if global.key_inv == 1
{
	vsp = -15;
	hsp = random_range(-4, 4);
}
hsp = 0;
vsp = 0;
inv_frame = false;
grav = 0.4;
image_speed = 0.35;
platformid = noone;
hsp_carry = 0;
vsp_carry = 0;

sugary = SUGARY;
if sugary
	sprite_index = spr_spookey_idle;
