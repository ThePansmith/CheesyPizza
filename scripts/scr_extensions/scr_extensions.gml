/// ==== LISTEN UP FUCK STICKS ====
/// I know this is going to be leaked eventually 
/// all of this code is copyright of RadixComet
/// Don't steal my fucking code
/// and if you are, at least fucking credit me.

function object_get_slope_triangle(_instance)
{
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
			
		
		if image_angle != 0
		{
			var angle = (360 - image_angle) * (pi / 180);
			
			var center_x = bbox_left + ((bbox_right - bbox_left) / 2);
			var center_y = bbox_top + ((bbox_bottom - bbox_top) / 2);
				
			var point_a = point_rotate(x1, y1, angle, center_x, center_y);
			var point_b = point_rotate(x2, y2, angle, center_x, center_y);
			var point_c = point_rotate(x3, y3, angle, center_x, center_y);
			
			x1 = clamp(point_a[0], bbox_left, bbox_right);
			y1 = clamp(point_a[1], bbox_top, bbox_bottom);
			
			x2 = clamp(point_b[0], bbox_left, bbox_right);
			y2 = clamp(point_b[1], bbox_top, bbox_bottom);
			
			x3 = clamp(point_c[0], bbox_left, bbox_right);
			y3 = clamp(point_c[1], bbox_top, bbox_bottom);
		}
		
		return [ x1, y1, x2, y2, x3, y3 ];
	}
	
	return noone;
}