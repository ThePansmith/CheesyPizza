image_speed = 0.35;
hsp = 0;
vsp = 0;
grav = 0.5;
grounded = false;
platformid = -4;
hsp_carry = 0;
vsp_carry = 0;
grabindex = 0;

if check_char("V") or obj_player1.isgustavo
	instance_destroy(id, false);
