#region Base game

function Approach(a, b, amount)
{
	amount = abs(amount);
	if a < b
	{
		a += amount;
		if a >= b
			return b;
	}
	else
	{
		a -= amount;
		if a <= b
			return b;
	}
	return a;
}
function get_milliseconds()
{
	return get_timer() / 1000;
}
function camera_zoom(zoom, speed)
{
	with (obj_camera)
	{
		targetzoom = zoom;
		targetzoom = clamp(targetzoom, 0, max_zoom);
		if (speed != undefined)
			zoomspd = abs(speed);
	}
}
function camera_set_zoom(target_zoom)
{
	with (obj_camera)
		zoom = target_zoom;
}
function try_solid(xoffset, yoffset, object, iterations)
{
	if live_call(xoffset, yoffset, object, iterations) return live_result;
	
	var old_x = x;
	var old_y = y;
	var n = -1;
	for (var i = 0; i < iterations; i++)
	{
		x += xoffset;
		y += yoffset;
		if (!scr_solid(x, y))
		{
			n = i + 1;
			break;
		}
	}
	x = old_x;
	y = old_y;
	return n;
}
function ledge_bump_vertical()
{
	var old_x = x;
	var old_y = y;
	y += (argument1 * 4);
	var dirs = [-1, 1];
	for (var i = 0; i < array_length(dirs); i++)
	{
		var ledge_dir = dirs[i];
		var tx = try_solid(ledge_dir, 0, obj_solid, argument0);
		y = old_y;
		if (tx != -1)
		{
			x -= (tx * ledge_dir);
			y += argument1;
			if (scr_solid(x, y))
			{
				x = old_x;
				y = old_y;
				return true;
			}
			return false;
		}
	}
	return true;
}
function ledge_bump(iterations)
{
	if live_call(iterations) return live_result;
	
	var old_x = x;
	var old_y = y;
	x += (xscale * 4);
	
	var ty = try_solid(0, -flip, obj_solid, iterations);
	x = old_x;
	
	if (ty != -1)
	{
		y -= ty * flip;
		x += xscale;
		if (scr_solid(x, y))
		{
			x = old_x;
			y = old_y;
			return true;
		}
		return false;
	}
	return true;
}
function instance_create_unique(x, y, object)
{
	if (instance_exists(object))
		return noone;
	var b = instance_create(x, y, object);
	return b;
}
function get_solid_difference(xoffset, yoffset, distance)
{
	var old_x = x;
	var old_y = y;
	var n = 0;
	for (var i = 0; i < distance; i++)
	{
		x += xoffset;
		y += yoffset;
		if (!scr_solid(x, y))
			n++;
	}
	x = old_x;
	y = old_y;
	return n;
}
function trace()
{
	if !DEBUG
		exit;
	
	var _string = "";
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i]);
	show_debug_message(_string);
}
function concat()
{
	var _string = buffer_create(64, buffer_grow, 1);
	for (var i = 0; i < argument_count; ++i)
		buffer_write(_string, buffer_text, string(argument[i]));
	
	buffer_seek(_string, buffer_seek_start, 0);
	var s = buffer_read(_string, buffer_string);
	
	buffer_delete(_string);
	return s;
}
function embed_value_string(str, array)
{
	var str_copy = string_copy(str, 1, string_length(str));
	for (var i = 0; i < array_length(array); i++)
	{
		var b = string(array[i]);
		str_copy = string_replace(str_copy, "%", b);
	}
	return str_copy;
}
function ds_list_add_unique(list)
{
	for (var i = 1; i < argument_count; i++)
	{
		var b = argument[i];
		if (ds_list_find_index(list, b) == -1)
			ds_list_add(list, b);
	}
}
function point_in_camera(x, y, cam = -1)
{
	if cam == -1 cam = view_camera[view_current];
	
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);
	
	return point_in_rectangle(x, y, cam_x, cam_y, cam_x + cam_w, cam_y + cam_h);
}
function point_in_camera_ext(x, y, cam = -1, extra_width = 0, extra_height = 0)
{
	if cam == -1 cam = view_camera[view_current];
	
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);
	
	return point_in_rectangle(x, y, cam_x - extra_width, cam_y - extra_height, cam_x + cam_w + extra_width, cam_y + cam_h + extra_height);
}
function bbox_in_camera(camera = -1, threshold = 0)
{
	if camera == -1 camera = view_camera[view_current];
	
	var cam_x = camera_get_view_x(camera);
	var cam_y = camera_get_view_y(camera);
	var cam_w = camera_get_view_width(camera);
	var cam_h = camera_get_view_height(camera);
	
	return bbox_left < (cam_x + cam_w + threshold) && bbox_right > (cam_x - threshold) && bbox_top < (cam_y + cam_h + threshold) && bbox_bottom > (cam_y - threshold);
}
function instance_nearest_random(object, range)
{
	var l = instance_furthest(x, y, object);
	var list = ds_list_create();
	for (var i = 0; i < instance_number(object); i++)
	{
		var b = instance_find(object, i);
		var t = distance_to_object(b);
		if (t <= l)
			ds_list_add(list, b);
	}
	b = undefined;
	if (ds_list_size(list) > 0)
	{
		var n = irandom(range);
		if (ds_list_size(list) < n)
			n = ds_list_size(list) - 1;
		b = ds_list_find_value(list, ds_list_size(list) - n);
	}
	ds_list_destroy(list);
	return b;
}
function instance_random(object)
{
	return instance_find(object, irandom(instance_number(object) - 1));
}
function heat_calculate(heat)
{
	if global.heatmeter or MOD.DeathMode
		heat += round(heat * global.stylemultiplier);
	return heat;
}

#endregion

#macro copy_player_scale {image_xscale = other.xscale; image_yscale = other.yscale}
function draw_set_align(halign = fa_left, valign = fa_top)
{
	draw_set_halign(halign);
	draw_set_valign(valign);
}
function array_unfold(array, delim = ", ")
{
	var _string = buffer_create(64, buffer_grow, 1);
	for (var i = 0, n = array_length(array); i < n; ++i)
	{
		buffer_write(_string, buffer_text, string(array[i]));
		if i < n - 1
			buffer_write(_string, buffer_text, delim);
	}
	
	buffer_seek(_string, buffer_seek_start, 0);
	var s = buffer_read(_string, buffer_string);
	
	buffer_delete(_string);
	return s;
}
