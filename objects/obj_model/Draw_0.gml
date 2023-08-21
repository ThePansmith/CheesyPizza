if (model == pointer_null)
{
    draw_self();
    exit;
}

var prev_ztestebnabal = gpu_get_ztestenable();
var prev_writeablae = gpu_get_zwriteenable();

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

if !surface_exists(radix_surface)
	radix_surface = surface_create(256, 256);

surface_set_target(radix_surface);
draw_clear_alpha(c_white, 0.0);
shader_set(shd_passthrough);

var matrix = matrix_build(128, 128, depth, xAngle, yAngle, zAngle, xScale, -yScale, zScale);
matrix_set(matrix_world, matrix);

vertex_submit(model, pr_trianglelist, texture == pointer_null ? -1 : sprite_get_texture(texture, 0));
surface_reset_target();

matrix_set(matrix_world, matrix_build_identity());
shader_reset();
gpu_set_ztestenable(prev_ztestebnabal);
gpu_set_zwriteenable(prev_writeablae);

if surface_exists(radix_surface)
	draw_surface(radix_surface, x - 128, y - 128);