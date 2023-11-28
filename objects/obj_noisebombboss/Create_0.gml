state = states.fall;
image_speed = 0.35;
cooldown = 120;
depth = obj_noiseboss.depth - 10;
init_collision();

paletteselect = 0;
if obj_player1.character == "N" && obj_player1.paletteselect != 20
	paletteselect = 20;
