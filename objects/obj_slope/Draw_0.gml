if sprite_index != spr_slope
{
	draw_self();
	exit;
}

var x1 = bbox_left - 1;
var y1 = bbox_bottom + 1;

var x2 = bbox_right + 1;
var y2 = bbox_top - 1;

var x3 = bbox_right;
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

draw_set_color(c_red);
draw_set_alpha(163 / 255);
draw_triangle(x1, y1, x2, y2, x3, y3, false);

draw_set_color(c_white);
draw_set_alpha(1);