var vertical_stretch = room_height - y;

var prev_color = draw_get_color();
var prev_alpha = draw_get_alpha();
var prev_bm = gpu_get_blendmode();

gpu_set_blendmode(bm_normal);
draw_set_color(spotlight_color);
draw_set_align(spotlight_opacity);

var half_width = (spotlight_base_width + spotlight_divergence) / 2;
var half_track = spotlight_track_size / 2;

var TL_x = (x - half_width) + offset - half_track;
var TL_y = vertical_stretch;

var TR_x = (x + half_width) + offset - half_track;
var TR_y = vertical_stretch;

var BL_x = x - spotlight_base_width / 2;
var BL_y = y;

var BR_x = x + spotlight_base_width / 2;
var BR_y = y;

draw_triangle(TL_x, TL_y, TR_x, TR_y, BL_x, BL_y, false);
draw_triangle(TR_x, TR_y, BR_x, BR_y, BL_x, BL_y, false);


gpu_set_blendmode(prev_bm);
draw_set_color(prev_color);
draw_set_alpha(prev_alpha);

