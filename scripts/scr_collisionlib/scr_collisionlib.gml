function lines_collide(l1x1, l1y1, l1x2, l1y2,  l2x1, l2y1, l2x2, l2y2)
{
	var pre = sign(((l1x1 - l2x1) * (l2y2 - l2y1)) - ((l1y1 - l2y1) * (l2x2 - l2x1)));
	var post = sign(((l1x2 - l2x1) * (l2y2 - l2y1)) - ((l1y2 - l2y1) * (l2x2 - l2x1)));
	
	return (pre != post)
}

function slope_get_collision_lines(_slope)
{
	var x1 = bbox_left - 1;
	var y1 = bbox_bottom;
		
	var x2 = bbox_right;
	var y2 = bbox_top - 1;
		
	var x3 = bbox_right;
	var y3 = bbox_bottom;
		
	if image_xscale < 0
	{
		x1 = bbox_right;
		x2 = bbox_left - 1;
		x3 = bbox_left - 1;
	}
		
	if image_yscale < 0
	{
		y1 = bbox_bottom;
		y2 = bbox_top - 1;
		y3 = bbox_top - 1;
	}
	return [ 
			x1, y1, x2, y2, 
			x2, y2, x3, y3,
			x3, y3, x1, y1
		   ];
}

function solid_get_collision_lines(_solid)
{
	var x1 = bbox_left;
	var y1 = bbox_top;
	
	var x2 = bbox_right;
	var y2 = bbox_top;
	
	var x3 = bbox_right;
	var y3 = bbox_bottom;
	
	var x4 = bbox_left;
	var y4 = bbox_bottom;
	
	return [ 
			x1, y1, x2, y2,
			x2, y2, x3, y3,
			x3, y3, x4, y4, 
			x4, x4, x1, x1
		   ];
}

function rectangle_triangle_collision(_rect_points, _tri_points)
{
	for (var r = 0; r < 4; r++)
	{
		var rect_index = r * 4;
		
		for (var t = 0; t < 3; t++)
		{
			var tri_index = r * 3;
			
			if lines_collide(
					_rect_points[rect_index + 0], _rect_points[rect_index + 1], _rect_points[rect_index + 2], _rect_points[rect_index + 3],
					_tri_points[tri_index + 0], _tri_points[tri_index + 1], _tri_points[tri_index + 2], _tri_points[tri_index + 3])
			{
				return true;
			}
		}
	}
	return false;
}