if (place_meeting(x, y, obj_player))
	visited = true;
if in_saveroom()
	image_index = image_number - 1;
if (visited)
	image_index = image_number - 1;
if global.snickchallenge
	instance_destroy(id, false);
