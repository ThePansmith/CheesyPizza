if live_call() return live_result;

if !init
	exit;

reset_blendmode();
draw_set_align();
draw_set_colour(c_white);

// animation
if anim_con == 0
{
	curve = animcurve_channel_evaluate(outback, anim_t);
	anim_t = Approach(anim_t, 1, 0.035);
}
if anim_con == 1 or anim_con == 2
{
	curve = animcurve_channel_evaluate(incubic, anim_t);
	anim_t = Approach(anim_t, 0, 0.06);
}

gpu_set_blendmode(bm_normal);
shader_set(shd_circleclip);
var origin_pos = shader_get_uniform(shd_circleclip, "u_origin");
var radius_pos = shader_get_uniform(shd_circleclip, "u_radius");
shader_set_uniform_f(origin_pos, 960 / 2, 540 / 2);
shader_set_uniform_f(radius_pos, 560 * curve);

// background
bg_pos = (bg_pos + 0.5) % 64;

// Draw the background color
var color = merge_colour(make_color_rgb(121, 103, 151), merge_colour(c_green, c_white, 0.25), mixingfade);
var prev_alpha = draw_get_alpha();
draw_set_alpha(0.75)
draw_set_color(color);
draw_rectangle(0, 0, CAMERA_WIDTH, CAMERA_HEIGHT, false);
draw_set_alpha(prev_alpha);
draw_set_color(c_white);


event_user(1);
vertex_submit(vertex_buffer, pr_trianglelist, sprite_get_texture(spr_skinmenupizza, bg_image));

shader_reset();
reset_blendmode();

// draw content
if is_method(draw)
	draw(curve);


// post draw content
if is_method(postdraw)
	postdraw(curve);
