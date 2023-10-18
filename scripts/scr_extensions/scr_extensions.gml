/// ==== LISTEN UP FUCK STICKS ====
/// I know this is going to be leaked eventually 
/// all of this code is copyright of RadixComet
/// Don't steal my fucking code
/// and if you are, at least fucking credit me.

function object_get_slope_line(_instance, _left_offset = 0, _top_offset = 0, _right_offset = 0, _bottom_offset = 0)
{
	var ret_array = [0, 0, 0, 0];
	
	if !_instance
		return ret_array;
	with _instance
	{
		ret_array[0] = bbox_left + _left_offset;
		ret_array[1] = bbox_bottom + _bottom_offset;
		
		ret_array[2] = bbox_right + _right_offset;
		ret_array[3] = bbox_top + _top_offset;
		
		if image_xscale < 0
		{
			ret_array[1] = bbox_top + _top_offset;
			ret_array[3] = bbox_bottom + _bottom_offset;
		}
		
		if image_yscale < 0
		{
			ret_array[0] = bbox_right + _right_offset;
			ret_array[2] = bbox_left + _left_offset;
		}
		
		return ret_array;
	}
}

function object_get_slope_triangle(_instance)
{
	static ret_array = [0, 0, 0, 0, 0, 0];
	
	if !_instance
		return noone;
	
	with _instance
	{
		var x1 = bbox_left - 1;
		var y1 = bbox_bottom + 1;
		
		var x2 = bbox_right + 1;
		var y2 = bbox_top - 1;
		
		var x3 = bbox_right + 1;
		var y3 = bbox_bottom + 1;
		
		if image_xscale < 0
		{
			x1 = bbox_right + 1;
			x2 = bbox_left - 1;
			x3 = bbox_left - 1;
		}
		
		if image_yscale < 0
		{
			y1 = bbox_top - 1;
			y2 = bbox_bottom + 1;
			y3 = bbox_top - 1;
		}
			
		ret_array[0] = x1;
		ret_array[1] = y1;
		
		ret_array[2] = x2;
		ret_array[3] = y2;
		
		ret_array[4] = x3;
		ret_array[5] = y3;
		
		if image_angle != 0
		{
			var angle = (360 - image_angle) * (pi / 180);
			
			var center_x = bbox_left + ((bbox_right - bbox_left) / 2);
			var center_y = bbox_top + ((bbox_bottom - bbox_top) / 2);
				
			var point_a = point_rotate(x1, y1, angle, center_x, center_y);
			var point_b = point_rotate(x2, y2, angle, center_x, center_y);
			var point_c = point_rotate(x3, y3, angle, center_x, center_y);
			
			ret_array[0] = clamp(point_a[0], bbox_left, bbox_right);
			ret_array[1] = clamp(point_a[1], bbox_top, bbox_bottom);
			
			ret_array[2] = clamp(point_b[0], bbox_left, bbox_right);
			ret_array[3] = clamp(point_b[1], bbox_top, bbox_bottom);
			
			ret_array[4] = clamp(point_c[0], bbox_left, bbox_right);
			ret_array[5] = clamp(point_c[1], bbox_top, bbox_bottom);
		}
		
		return ret_array;
	}
	
	return noone;
}