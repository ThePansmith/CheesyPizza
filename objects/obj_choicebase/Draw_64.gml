live_auto_call;

if !init
	exit;

draw_set_align();
draw_set_colour(c_white);
gpu_set_blendmode(bm_normal);

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

// background
bg_pos = (bg_pos + 0.5) % 64;
if curve < 1 // circular clipping shader
	shader_set_circleclip(960 / 2, 540 / 2, 560 * curve);

draw_set_alpha(0.75)
draw_set_color(make_color_rgb(121, 103, 151));
draw_rectangle(0, 0, CAMERA_WIDTH, CAMERA_HEIGHT, false);
draw_set_alpha(1);
draw_set_color(c_white);

var origin_pos = shader_get_uniform(shd_circleclip, "u_origin");

// The Pizza Matrix™
var prev_matrix = matrix_get(matrix_world);
shader_set_uniform_f(origin_pos, (960 / 2) - bg_pos, (540 / 2) - bg_pos);
matrix_set(matrix_world, matrix_build(bg_pos, bg_pos, 0, 0, 0, 0, 1, 1, 1));
gpu_set_blendmode(bm_normal);
vertex_submit(pizza_vbuffer, pr_trianglelist, sprite_get_texture(spr_skinmenupizza, bg_image));
matrix_set(matrix_world, prev_matrix);

// draw content
if is_method(draw)
	draw(curve);

shader_reset();

// post draw content
if is_method(postdraw)
	postdraw(curve);
