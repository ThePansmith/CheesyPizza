function scr_solid(_x, _y)
{
	var old_x = x;
	var old_y = y;
	x = _x;
	y = _y;
	
	// wall
	if (check_solid(x, y))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	
	// platform
	var num = instance_place_list(x, y, obj_platform, global.instancelist, false);
	if (num > 0)
	{
		var _collided = false;
		for (var i = 0; i < num; i++)
		{
			var b = ds_list_find_value(global.instancelist, i);
			if (b.image_yscale > 0 && y > old_y) or (b.image_yscale < 0 && y < old_y)
			{
				if (!place_meeting(x, old_y, b) && place_meeting(x, y, b))
					_collided = true;
			}
		}
		ds_list_clear(global.instancelist);
		
		if (_collided)
		{
			x = old_x;
			y = old_y;
			return true;
		}
	}
	
	// platform slopes
	if variable_instance_exists(id, "vsp")
	{
		if vsp >= 0 && place_meeting(x, y, obj_slope_platform)
		{
			var num = instance_place_list(x, y, obj_slope_platform, global.instancelist, false);
			var _collided = false;
	
			for (i = 0; i < num; i++)
			{
				b = ds_list_find_value(global.instancelist, i);
				if check_slope_platform(b, old_y)
					_collided = true;
			}
			ds_list_clear(global.instancelist);
		
			if (_collided)
			{
				x = old_x;
				y = old_y;
				return true;
			}
		}
	}
	
	// slope
	if (inside_slope(obj_slope))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	
	
	x = old_x;
	y = old_y;
	return false;
}
function check_solid(_x, _y)
{
	return instance_place(_x, _y, obj_solid);
}
function check_slope(_x, _y)
{
	return instance_place(_x, _y, obj_slope_parent);
}



function inside_slope(slope_object)
{
	//var slope = instance_place(x, y, slope_object);
	var slope = noone;
	with slope_object
	{

			
		if rectangle_in_rectangle_fast(
			other.bbox_left, other.bbox_top, other.bbox_right, other.bbox_bottom, 
			bbox_left, bbox_top, bbox_right, bbox_bottom)
		{
			slope = self;
			break;
		}
		else
			continue;
	}
	
	
	if slope == noone
	{
		return false;
	}
		
	var object_side_x = bbox_right;
	var object_side_y = bbox_bottom;
	
	if !slope
		return false;
	
	with slope
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
		
		return rectangle_in_triangle(
					other.bbox_left, other.bbox_top,
					other.bbox_right, other.bbox_bottom,
					x1, y1, x2, y2, x3, y3
					);
	}
	return false;
}
function check_slope_platform(slope_object, old_y)
{
	var _y = y;
	
	var slope = instance_place(x, y, slope_object);
	if (slope)
	{
		with (slope)
		{
			var object_side = 0;
			var slope_start = 0;
			var slope_end = 0;
			if (image_xscale > 0)
			{
				object_side = other.bbox_right;
				slope_start = bbox_bottom;
				slope_end = bbox_top;
			}
			else
			{
				object_side = other.bbox_left;
				slope_start = bbox_top;
				slope_end = bbox_bottom;
			}
			
			var m = (sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left);
			slope = slope_start - round(m * (object_side - bbox_left));
			
			if (other.bbox_bottom >= slope)
			{
				other.y = old_y;
				if other.bbox_bottom <= slope + 2 / abs(m)
				{
					other.y = _y;
					return true;
				}
			}
		}
	}
	
	other.y = _y;
	return false;
}
function check_convex_slope(convex_slope_object)
{
	
}
function check_concave_slope(concave_slope_object)
{
	/*var slope = instance_place(x, y, concave_slope_object);
	if (slope)
	{
		with (slope)
		{
			
			var slope_start = 0;
			var slope_end = 0;
			
			
			var object_side = 0; // Object side to compare to
			var slope_max_side = 0; // Side where the max is
			var slope_min_side = 0; // Side where the min is
			
			if (image_xscale > 0)
			{
				object_side = other.bbox_right;
				slope_max_side = bbox_right;
				slope_min_side = bbox_left;
				//slope_start = bbox_bottom;
				//slope_end = bbox_top;
			}
			else
			{
				object_side = other.bbox_left;
				slope_max_side = bbox_left;
				slope_min_side = bbox_right;
			}
			//var m = (sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left);
			//slope = slope_start - round(m * (object_side - bbox_left));
			
			//RX: Gonna have to use some trig here to build a height map
			var radius_x = 32 * image_xscale;
			var radius_y = 32 * image_yscale;
			
			var stride = object_side - bbox_left; // where are we in the slope
			
			if (stride > slope_max_side)
				slope = bbox_top;
			else if (stride < slope_min_side)
				slope = bbox_bottom;
			else
			{
				
				
				slope = 
			}
			if (other.bbox_bottom >= slope)
				return true;
		}
	}
	*/
}
function scr_solid_slope(_x, _y)
{
	var old_x = x;
	var old_y = y;
	x = _x;
	y = _y;
	// TODO: change this to actually account for rotated slopes lol
	if (inside_slope(obj_slope))
	{
		var inst = instance_place(x, y, obj_slope);
		if (sign(inst.image_xscale) != xscale)
		{
			x = old_x;
			y = old_y;
			return true;
		}
	}
	x = old_x;
	y = old_y;
	return false;
}
