live_auto_call;

if !active or room == timesuproom or room == rank_room
	exit;

var timeinsecs = floor(time / 60);
var mins = floor(timeinsecs / 60);
var secs = timeinsecs % 60;
if secs < 10
    secs = concat("0", secs);

draw_set_font(global.bigfont)
draw_set_align(fa_center, fa_middle);
	
var a = floor(show_time / 20)
var b = (a % 2) == 1
if show_time == 0
    b = 1;

var xx = 960 / 2;
if timeinsecs <= 5
	xx += random_range(-1, 1);

var yy = round(50 + 440 - surfy);
draw_set_alpha(b)
draw_text_transformed(xx, yy, concat(mins, ":", secs), 1 + surfscale, 1 + surfscale, 0)
var wd = string_width(concat(mins, ":", secs)) / 1.5;

draw_set_alpha(1);
if time_fx_y > 0
{
	draw_set_font(global.smallfont)
	draw_text(xx + wd + 14, yy, ceil(time_fx))
	draw_set_font(global.font_small)
	draw_text(xx + wd, yy + 4, "+")
}
