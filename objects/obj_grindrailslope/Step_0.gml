// RX: Support for multiple players because why not
var player_arr = array_create(0, noone);

var slope_points = object_get_slope_line(id);

with obj_player
{
	// RX: Are we even in bounds?
	 if !rectangle_in_rectangle_fast(other.bbox_top, other.bbox_left, other.bbox_bottom, other.bbox_right, bbox_top, bbox_left, bbox_bottom, bbox_right)
		continue;
	
	var obj = collision_line(slope_points[0], slope_points[1], slope_points[2], slope_points[3], obj_player, false, false);
	if obj == noone || obj.id != id
		continue;
	
	//if y < yprevious
	//Z	continue;

	/* 
	var arr = object_get_slope_triangle(other.id);
	
	var bbox_width = bbox_right - bbox_left;
	var bbox_height = bbox_bottom - bbox_top;
	
	var bbox_x_offset = x - bbox_left;
	var bbox_y_offset = y - bbox_top;
	
	var previous_bbox_left = xprevious + bbox_x_offset;
	var previous_bbox_top = yprevious + bbox_y_offset;
	
	// RX: Where we in the slope last frame?
	if rectangle_in_triangle(previous_bbox_left, previous_bbox_top, previous_bbox_left + bbox_width, previous_bbox_top + bbox_height, arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
		continue; // Yes, don't collide
		
	// RX: Is our bounding box colliding with the slope itself?
	if !rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom, arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
		continue;
	
	*/
	array_push(player_arr, id);
	
	
}


if !array_length(player_arr)
	exit;

for (var i = 0; i < array_length(player_arr); i++)
{
	var player = player_arr[i];
	
	with (player)
	{
		if (!scr_transformationcheck())
			exit;
		while (inside_slope(obj_grindrailslope))
			y--;
			
		movespeed = clamp(movespeed, 0, 10);
		state = states.grind;
	}

	/* if ((player.y > player.yprevious || (player.xscale == sign(image_xscale) && player.y < bbox_bottom)) && player.state != states.backbreaker && player.state != states.bump)
	{
		with (player)
		{
			if (!scr_transformationcheck())
				exit;
			while (inside_slope(obj_grindrailslope))
				y--;
		}
		if (!player.isgustavo)
		{
			if (player.movespeed < 10)
				player.movespeed = 10;
			player.state = states.grind;
		}
		else
		{
			player.y = y + 8;
			player.state = states.ratmountgrind;
		}
	}*/

}




