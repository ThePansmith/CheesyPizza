// surface bullshit
if !surface_exists(surf)
	surf = surface_create(960, 540);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

// roundrect
draw_set_colour(c_black);

var xx = 50 * size;
var yy = 50 * size;
var xsiz = (960 / 2) * (1 - size);
var ysiz = (540 / 2) * (1 - size);
var rectsize = 5;

draw_set_alpha(0.75);
draw_roundrect_ext(xx + xsiz, yy + ysiz, 960 - xx - xsiz, 540 - yy - ysiz, 12, 12, false);
gpu_set_blendmode(bm_subtract);
draw_set_alpha(0.25);
draw_roundrect_ext(xx + xsiz + rectsize, yy + ysiz + rectsize, 960 - xx - xsiz - rectsize, 540 - yy - ysiz - rectsize, 12, 12, false);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);

// draw it
surface_reset_target();
draw_surface(surf, 0, 0);

// disclaimer
if state == 0
{
	draw_set_align(fa_center, fa_middle);
	draw_set_font(global.font_small);
	draw_set_colour(c_white);
	draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, "Checking availability...");
}
if state == 1 && t >= 1
{
	// disclaimer
	draw_set_halign(fa_center);

	/*
	draw_set_colour(merge_colour(c_red, c_white, 0.25));
	draw_set_font(global.bigfont);
	draw_text((960 / 2) + random_range(-1, 1), 100, "DISCLAIMER");
	*/

	// actual text
	draw_set_valign(fa_middle);
	draw_set_colour(c_white);
	draw_set_font(font1);
	draw_text(960 / 2, 540 / 2 - 16, str);

	/*
	if cancon or !drm
	{
		draw_set_font(global.font_small);
		draw_text(960 / 2, 420, lang_string("disclaimer.continue"));
	}
	*/
}

// fade in
draw_set_alpha(fade_alpha);
draw_set_colour(c_black);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);
