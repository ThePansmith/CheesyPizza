state = states.fall;
image_speed = 0.35;
cooldown = 120;
depth = obj_noiseboss.depth - 10;
hsp = 0;
vsp = 0;
grav = 0.5;
hsp_carry = 0;
vsp_carry = 0;
platformid = 0;
grounded = false;

paletteselect = 0;
if obj_player1.character == "N" && obj_player1.paletteselect != 20
	paletteselect = 20;
