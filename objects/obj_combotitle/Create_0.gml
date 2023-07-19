title_index = 0;
title = 0;
vsp = 0;
alarm[1] = 120;
depth = -300;
alarm[0] = 3;
image_speed = 0;
depth = -100;
x = 832;
y = 290;
ystart = y;
very = false;
afterimages = array_create(0);
sound_play_oneshot("event:/sfx/ui/comboup");

sugary = (obj_player1.character == "SP");
if sugary
	sprite_index = spr_comboend_titleSP;
else if obj_player1.character == "BN"
	sprite_index = spr_comboend_titleBN;
