if sprite_index != spr_slope
{
	draw_self();
	exit;
}

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
	y1 = bbox_top - 1;
	y2 = bbox_bottom;
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



draw_set_color(c_red);
draw_set_alpha(163 / 255);
draw_triangle(x1, y1, x2, y2, x3, y3, false);

draw_set_color(c_white);


draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_white, c_white, c_white, c_white, true);
draw_set_alpha(1);