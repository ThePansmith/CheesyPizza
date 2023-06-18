// Code by RadixComet

var distance = distance_to_object(obj_player1);

if (distance > 32)
	image_index = 31;
else if (distance < 0)
	image_index = 0;
else
	image_index = distance;

draw_self();