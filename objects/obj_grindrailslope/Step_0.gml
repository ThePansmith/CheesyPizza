// RX: Support for multiple players because why not
var player_arr = array_create(0, noone);

var slope_points = object_get_slope_line(id, -1, -1, 1, 1);

with obj_player
{
	var bbox_height = (bbox_bottom - bbox_top) + 2;
	if state == states.ratmountgrind
			y -= bbox_height;
	// RX: Are we even in bounds?
	if !rectangle_in_rectangle_fast(other.bbox_top - 2, other.bbox_left - 2, other.bbox_bottom + 2, other.bbox_right + 2, bbox_top, bbox_left, bbox_bottom, bbox_right)
	{
		if state == states.ratmountgrind
			y += bbox_height;
		continue;
	}
	
	var obj = noone;

	var obj = collision_line(slope_points[0], slope_points[1], slope_points[2], slope_points[3], obj_player, false, false);
	
	if obj == noone || obj.id != id
	{
		if state == states.ratmountgrind
			y += bbox_height;
		continue;
	}
	if state == states.ratmountgrind
		y += bbox_height;
	array_push(player_arr, id);
}


if !array_length(player_arr)
	exit;

for (var i = 0; i < array_length(player_arr); i++)
{
	var player = player_arr[i];

	with (player)
	{
		var bbox_height = (bbox_bottom - bbox_top) + 2;
		if (!scr_transformationcheck())
			exit;
			
		
		while (inside_slope(obj_grindrailslope))
			y--;
		

		if !isgustavo
		{
			if movespeed < 10
				movespeed = 10;
			movespeed = clamp(movespeed, 0, 10);
			state = states.grind;	
		}
		else
		{
			y += bbox_height;
			state = states.ratmountgrind;
		}
	}
}




